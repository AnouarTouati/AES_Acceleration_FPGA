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


#define HW_REGS_BASE ( ALT_STM_OFST )
#define HW_REGS_SPAN ( 0x04000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

#define encryption
#define BILLION  1000000000.0
int main() {
 
	void *virtual_base;
	int fd;

	void *key_32_0_addr,*key_32_1_addr,*key_32_2_addr,*key_32_3_addr;
	void *data_32_0_addr,*data_32_1_addr,*data_32_2_addr,*data_32_3_addr;
    void *result_32_0_addr,*result_32_1_addr,*result_32_2_addr,*result_32_3_addr;
	void *fpga_control_addr;
    void *hps_control_addr;
	// map the address space for the LED registers into user space so we can interact with them.
	// we'll actually map in the entire CSR span of the HPS since we want to access various registers within that span
	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}

	virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );

	if( virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap() failed...\n" );
		close( fd );
		return( 1 );
	}
	
	key_32_0_addr=virtual_base +( ( unsigned long  )( ALT_LWFPGASLVS_OFST + HPS_KEY_0_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
    key_32_1_addr=virtual_base +( ( unsigned long  )( ALT_LWFPGASLVS_OFST + HPS_KEY_1_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	key_32_2_addr=virtual_base +( ( unsigned long  )( ALT_LWFPGASLVS_OFST + HPS_KEY_2_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
    key_32_3_addr=virtual_base +( ( unsigned long  )( ALT_LWFPGASLVS_OFST + HPS_KEY_3_BASE ) & ( unsigned long)( HW_REGS_MASK ) );

	data_32_0_addr=virtual_base +( ( unsigned long  )( ALT_LWFPGASLVS_OFST + HPS_DATA_0_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	data_32_1_addr=virtual_base +( ( unsigned long  )( ALT_LWFPGASLVS_OFST + HPS_DATA_1_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	data_32_2_addr=virtual_base +( ( unsigned long  )( ALT_LWFPGASLVS_OFST + HPS_DATA_2_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	data_32_3_addr=virtual_base +( ( unsigned long  )( ALT_LWFPGASLVS_OFST + HPS_DATA_3_BASE ) & ( unsigned long)( HW_REGS_MASK ) );

    result_32_0_addr=virtual_base +( ( unsigned long  )( ALT_LWFPGASLVS_OFST + FPGA_DATA_0_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
    result_32_1_addr=virtual_base +( ( unsigned long  )( ALT_LWFPGASLVS_OFST + FPGA_DATA_1_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	result_32_2_addr=virtual_base +( ( unsigned long  )( ALT_LWFPGASLVS_OFST + FPGA_DATA_2_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	result_32_3_addr=virtual_base +( ( unsigned long  )( ALT_LWFPGASLVS_OFST + FPGA_DATA_3_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
    fpga_control_addr=virtual_base +( ( unsigned long  )( ALT_LWFPGASLVS_OFST + FPGA_CONTROL_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
    hps_control_addr=virtual_base +( ( unsigned long  )( ALT_LWFPGASLVS_OFST + HPS_CONTROL_BASE ) & ( unsigned long)( HW_REGS_MASK ) );

	
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

	*(uint32_t *)key_32_0_addr =*(uint32_t *) (key+12);
	*(uint32_t *)key_32_1_addr =*(uint32_t *) (key+8);
	*(uint32_t *)key_32_2_addr =*(uint32_t *) (key+4);
	*(uint32_t *)key_32_3_addr =*(uint32_t *) key;
	// printf("%016llx %016llx\n",*(uint64_t *)key,*(uint64_t *)(key+8));
	// printf("%08x %08x %08x %08x\n",*(uint32_t *)key_32_3_addr,*(uint32_t *)key_32_2_addr,*(uint32_t *)key_32_1_addr,*(uint32_t *)key_32_0_addr);
	    
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
	#ifdef decryption 
	size--;
	#endif
	fseek(fPointer2, 0, SEEK_SET);
    #ifdef encryption
	uint8_t* memory = malloc((size+1)*sizeof(uint8_t)); //+1 for the header
    #endif
	#ifdef decryption
	uint8_t* memory = malloc(size);
	#endif
	 uint8_t header_size=0;
	 #ifdef encryption
	 header_size = size%16;
	 memory[0]= header_size;
	 #endif
	#ifdef decryption
	fread(&header_size,1,1,fPointer2);
    #endif
    printf("header size : %d\n",header_size);
	int i=0;
	#ifdef encryption
	i=fread(memory+1,size,1,fPointer2);
	#endif
	#ifdef decryption
	i=fread(memory,size,1,fPointer2);
	#endif
	printf("%d bytes read\n",size*i);//just in case it cant read then  it will be size * 0
  
	FILE* fPointer3;
	#ifdef decryption
	fPointer3 = fopen("azz_dec.mp4", "wb");
    #endif
 
	#ifdef encryption
	fPointer3 = fopen("azz_enc.mp4", "wb");
    #endif

	time_t begin = time(NULL);
	 struct timespec start, end;
 
    clock_gettime(CLOCK_REALTIME, &start);
	#ifdef encryption
	i=1;
	#endif
	#ifdef decryption
	i=0;
	#endif
    while (i<size) {
	
     *(uint32_t *)data_32_0_addr=*(uint32_t *)(&memory[i+12]);
     *(uint32_t *)data_32_1_addr=*(uint32_t *)(&memory[i+8]);
	 *(uint32_t *)data_32_2_addr=*(uint32_t *)(&memory[i+4]);
     *(uint32_t *)data_32_3_addr=*(uint32_t *)(&memory[i]);
	 
		 #ifdef encryption
	 *(uint8_t *)hps_control_addr=0b00000001;//reset aes block

     *(uint8_t *)hps_control_addr=0b00001100;// load data and key
	 *(uint8_t *)hps_control_addr=0b00000100;// load data and key

	 *(uint8_t *)hps_control_addr=0b00000110;//start
	 *(uint8_t *)hps_control_addr=0b00000100;//start
	  #endif
	  	 #ifdef decryption
	 *(uint8_t *)hps_control_addr=0b00000001;//reset aes block

     *(uint8_t *)hps_control_addr=0b00001000;// load data and key
	 *(uint8_t *)hps_control_addr=0b00000000;// load data and key

	 *(uint8_t *)hps_control_addr=0b00000010;//start
	 *(uint8_t *)hps_control_addr=0b00000000;//start
	  #endif
     while(!((*(uint8_t *)fpga_control_addr) & 0x01)){
		 
		 //wait for AES core to finish
    
	 }
	 
     *(uint32_t *)(&memory[i])=*(uint32_t *)(result_32_3_addr);
	 *(uint32_t *)(&memory[i+4])=*(uint32_t *)(result_32_2_addr);
	 *(uint32_t *)(&memory[i+8])=*(uint32_t *)(result_32_1_addr);
	 *(uint32_t *)(&memory[i+12])=*(uint32_t *)(result_32_0_addr);
	 i=i+16;
	}
    printf("%d bytes proccessed\n",i);
	printf("hardware encryption time is :%ds\n",time(NULL)-begin);
	 clock_gettime(CLOCK_REALTIME, &end);
 
    // time_spent = end - start
    double time_spent = (end.tv_sec - start.tv_sec) +
                        (end.tv_nsec - start.tv_nsec) / BILLION;
 
    printf("The elapsed time is %f seconds\n", time_spent);
	#ifdef decryption
	if(header_size!=0){
       size=(size - 16) + header_size;
	}
	 fwrite(memory,size,1,fPointer3);
   #endif
   #ifdef encryption
    fwrite(memory,i,1,fPointer3);
   #endif 
    fflush(fPointer3);
	fclose(fPointer2);
	fclose(fPointer3);

	// clean up our memory mapping and exit
	
	if( munmap( virtual_base, HW_REGS_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n" );
		close( fd );
		return( 1 );
	}

	close( fd );

	return( 0 );
}
