/*
This program demonstrate how to use hps communicate with FPGA through light AXI Bridge.
uses should program the FPGA by GHRD project before executing the program
refer to user manual chapter 7 for details about the demo
*/


#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include "socal/alt_gpio.h"
#include "hps_0.h"
#include <stdlib.h>
#include <time.h> 


#define H2F_SLAVES_ADDR 0xC0000000
#define HW_REGS_SPAN ( 0x04000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

#define decryption
#define BILLION  1000000000.0
int main() {
 
	void *virtual_base;
	int fd;

	void *key_64_0_addr,*key_64_1_addr;
	void *data_64_0_addr,*data_64_1_addr;
    void *result_64_0_addr,*result_64_1_addr;
	void *control_addr;
    
	// map the address space for the LED registers into user space so we can interact with them.
	// we'll actually map in the entire CSR span of the HPS since we want to access various registers within that span
	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}

	virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, H2F_SLAVES_ADDR );

	if( virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap() failed...\n" );
		close( fd );
		return( 1 );
	}
	
    data_64_0_addr=virtual_base +( ( unsigned long  )( H2F_SLAVES_ADDR + AES_CORE_0_BASE +16) & ( unsigned long)( HW_REGS_MASK ) );
	data_64_1_addr=virtual_base +( ( unsigned long  )( H2F_SLAVES_ADDR + AES_CORE_0_BASE +24) & ( unsigned long)( HW_REGS_MASK ) );
	

	key_64_0_addr=virtual_base +( ( unsigned long  )( H2F_SLAVES_ADDR + AES_CORE_0_BASE +0) & ( unsigned long)( HW_REGS_MASK ) );
    key_64_1_addr=virtual_base +( ( unsigned long  )( H2F_SLAVES_ADDR + AES_CORE_0_BASE +8) & ( unsigned long)( HW_REGS_MASK ) );
	

    result_64_0_addr=virtual_base +( ( unsigned long  )( H2F_SLAVES_ADDR + AES_CORE_0_BASE +32) & ( unsigned long)( HW_REGS_MASK ) );
    result_64_1_addr=virtual_base +( ( unsigned long  )( H2F_SLAVES_ADDR + AES_CORE_0_BASE +40) & ( unsigned long)( HW_REGS_MASK ) );
	
	control_addr=virtual_base +( ( unsigned long  )( H2F_SLAVES_ADDR + AES_CORE_0_BASE +48) & ( unsigned long)( HW_REGS_MASK ) );
  
	//printf("KEY: 00010203 04050607 08090A0B 0C0D0E0F\n");
	//printf("TEXT: 00112233 44556677 8899AABB CCDDEEFF\n");
	//printf("CIPHER: 69C4E0D8 6A7B0430 D8CDB780 70B4C55A\n");
	

	uint8_t key[16];
    FILE* fPointer;
	#ifdef encryption
	fPointer = fopen("key.hex", "r");
	#endif
	#ifdef decryption
	fPointer = fopen("key_dec.hex", "r");
	#endif
	fread(key, 1, 16, fPointer);
	fclose(fPointer);

	*(uint64_t *)key_64_0_addr =*(uint64_t *) (key +8);
	*(uint64_t *)key_64_1_addr =*(uint64_t *) key;

	// printf("%016llx %016llx\n",*(uint64_t *)key,*(uint64_t *)(key+8));
	// printf("%016llx %016llx\n",*(uint64_t *)key_64_1_addr,*(uint64_t *)key_64_0_addr);
	    
	/*	uint8_t *key_ptr=key_64_0_addr;
		for(i=15; i>=0;i--){
		*key_ptr=key[i];
		key_ptr++;

		}	*/

	FILE* fPointer2;
	#ifdef decryption
	fPointer2 = fopen("azz_enc.mp4", "rb");
    #endif
    #ifdef encryption
	fPointer2 = fopen("azz.mp4", "rb");
    #endif
	fseek(fPointer2, 0, SEEK_END);
	int size = ftell(fPointer2);
	size--;
	fseek(fPointer2, 0, SEEK_SET);
	
	uint8_t* memory = malloc(size);

    uint8_t header_size=0;
	fread(&header_size,1,1,fPointer2);
	printf("header size : %d\n",header_size);

	int i=0;
	i=fread(memory,size,1,fPointer2);
		
	printf("%d bytes read\n",size*i);//just in case it cant read then  it will be size * 0
  
	FILE* fPointer3;
	#ifdef decryption
	fPointer3 = fopen("azz_dec.mp4", "wb");
    #endif
 
	#ifdef encryption
	fPointer3 = fopen("azz_enc.mp4", "wb");
    #endif
     i=0;
	time_t begin=time(NULL);
	struct timespec start, end;
    clock_gettime(CLOCK_REALTIME, &start);
	while (i<size) {//Encrypting data 
		
		*(uint64_t *)data_64_0_addr=*(uint64_t *)(&memory[i+8]);
		*(uint64_t *)data_64_1_addr=*(uint64_t *)(&memory[i]);
		
	/*	
     uint8_t *data_ptr=data_64_0_addr;
	 for(i=15; i>=0;i--){
      *data_ptr=data[i];
	   data_ptr++;
      }	
	*/

/*
 //bit2: load -- bit1: mode -- bit0: start
	*(uint8_t *)control_addr=0b00000000;

	 *(uint8_t *)control_addr=0b00000100;

	 *(uint8_t *)control_addr=0b00000000;
	
	 *(uint8_t *)control_addr=0b00000001;//start

	 *(uint8_t *)control_addr=0b00000000;*/

     #ifdef decryption
	 *(uint8_t *)control_addr=0b00000001;//first bit is start second is mode third is done flag
     #endif
	  #ifdef encryption
	 *(uint8_t *)control_addr=0b00000011;//first bit is start second is mode third is done flag
     #endif
			while(!((*(uint8_t *)control_addr) & 0x04)){
			//	printf("waiting for aes %x",(*(uint8_t *)control_addr) & 0x04);
				//wait for AES core to finish
		
			} 
	// printf("result : %llx %llx\n",*(uint64_t *)result_64_1_addr,*(uint64_t *)result_64_0_addr);
	 /* uint8_t *result_ptr=result_64_0_addr;
	 for(i=15; i>=0;i--){
		 buff[i]=*result_ptr;
	    result_ptr++;
     }	*/
	 *(uint64_t *)(&memory[i])=*(uint64_t *)(result_64_0_addr+8);
	 *(uint64_t *)(&memory[i+8])=*(uint64_t *)result_64_0_addr;
	 i=i+16;
	}
	printf("%d bytes proccessed\n",i);
	printf("hardware decryption time is :%ds\n",time(NULL)-begin);
	clock_gettime(CLOCK_REALTIME, &end);
    // time_spent = end - start
    double time_spent = (end.tv_sec - start.tv_sec) +
                        (end.tv_nsec - start.tv_nsec) / BILLION;
 
    printf("The elapsed time is %f seconds\n", time_spent);
	if(header_size!=0){
       size=(size - 16) + header_size;
	}
   
    fwrite(memory,size,1,fPointer3);
    fflush(fPointer3);
	fclose(fPointer2);
	fclose(fPointer3);

	// clean up our memory mapping and exit
	
	if( munmap( virtual_base, HW_REGS_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n");
		close( fd );
		return( 1 );
	}

	close( fd );

	return( 0 );
}
