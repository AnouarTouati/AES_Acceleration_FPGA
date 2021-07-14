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

#define encryption

int main() {

 printf("REALTIME !!!!!!!!!!!!!!!!!\n");

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
		
	
	uint8_t data;
	uint8_t* memory=malloc(2*sizeof(uint8_t));
     memory[0]=0;
	int size=1;
	//printf("%d bytes read\n",size+1);
  
	FILE* fPointer3;
	#ifdef decryption
	fPointer3 = fopen("azz_dec.mp4", "wb");
    #endif
 
	#ifdef encryption
	fPointer3 = fopen("azz_enc.mp4", "wb");
    #endif
    int i=1;

	bool endOfFile=false;
	while (true) {//Encrypting data 
	     endOfFile=true;
		
		while(fread(&data,1,1,stdin)){
			memory[size]=data;
			size++;
			memory=realloc(memory,size+1);
			if((size-1)%16==0){
			endOfFile=false;
            break;
			}
	    }
		if(endOfFile){
			break;
		}
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
    fwrite(memory,i,1,fPointer3);
    fflush(fPointer3);
	fclose(fPointer3);

	free(memory);

	
	// clean up our memory mapping and exit
	
	if( munmap( virtual_base, HW_REGS_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n");
		close( fd );
		return( 1 );
	}

	close( fd );

	return( 0 );
}
