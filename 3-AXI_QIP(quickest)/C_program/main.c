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

	FILE* fPointer2;
	#ifdef decryption
	fPointer2 = fopen("azz_enc.mp4", "rb");
    #endif
    #ifdef encryption
	fPointer2 = fopen("azz.mp4", "rb");
    #endif
	fseek(fPointer2, 0, SEEK_END);
	int size = ftell(fPointer2);
	fseek(fPointer2, 0, SEEK_SET);
	
	uint8_t* whole_in_file = malloc(size);
	uint8_t* whole_out_file = malloc(size);
	
	uint8_t data;
	int i=0;
	i=fread(whole_in_file,size,1,fPointer2);
		
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
	while (i<size-1) {//Encrypting data 
		
		*(uint64_t *)data_64_0_addr=*(uint64_t *)(&whole_in_file[i+8]);
		*(uint64_t *)data_64_1_addr=*(uint64_t *)(&whole_in_file[i]);
		

     #ifdef decryption
	 *(uint8_t *)control_addr=0b00000001;//first bit is start second is mode third is done flag
     #endif
	  #ifdef encryption
	 *(uint8_t *)control_addr=0b00000011;//first bit is start second is mode third is done flag
     #endif
			while(!((*(uint8_t *)control_addr) & 0x04)){
				//wait for AES core to finish
		
			} 

	 *(uint64_t *)(&whole_out_file[i])=*(uint64_t *)(result_64_0_addr+8);
	 *(uint64_t *)(&whole_out_file[i+8])=*(uint64_t *)result_64_0_addr;
	 i=i+16;
	}
	printf("%d bytes proccessed\n",i);
	printf("processing time is :%d\n",time(NULL)-begin);
    fwrite(whole_out_file,size,1,fPointer3);
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
