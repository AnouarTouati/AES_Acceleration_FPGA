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

#include <time.h> 
#include <string.h>
#include <stdlib.h>

#define H2F_SLAVES_ADDR 0xC0000000
#define HW_REGS_SPAN ( 0x40000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )



int main(int argc,char *argv[]) {
 
	 void *virtual_base;
	int fd;

	void *video_buffer/*,*frame_addr_ptr*/,*dma_enable;
     int duration=0;
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
	 
    
	video_buffer=virtual_base +( ( unsigned long  )( H2F_SLAVES_ADDR + ONCHIP_MEMORY_VIDEO_BASE +2) & ( unsigned long)( HW_REGS_MASK ) );
   // frame_addr_ptr=virtual_base +( ( unsigned long  )( H2F_SLAVES_ADDR + VIDEO_DMA_CONTROLLER_0_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	dma_enable=virtual_base +( ( unsigned long  )( H2F_SLAVES_ADDR + VIDEO_DMA_CONTROLLER_BASE +12) & ( unsigned long)( HW_REGS_MASK ) );
	/*
	*(uint8_t *)dma_enable=0x00;//turn off dma
	FILE* dump_sdram_ff;
    dump_sdram_ff=fopen("sdram_dump_ff.hex","wb");  

	char *data=video_buffer;
	int i=0;
	for(i=0;i<SDRAM_SPAN;i++){
    *(char *)data=0xFF;//Write the pattern 0xFF to all SDRAM
	data++;
	}
	char *data2=video_buffer;
	for(i=0;i<SDRAM_SPAN;i++){
     fwrite(data2,1,1,dump_sdram_ff);
	 data2++;
	}
	*/

	*(uint8_t *)dma_enable=0x04;//turn on dma
//	sleep(4);//just giving time for sdram to get filled
	FILE* pipeout;
	//pipeout =popen("ffmpeg -y -f rawvideo -use_wallclock_as_timestamps 1 -video_size 640x360 -pix_fmt uyvy422 -i - -filter:v setpts='PTS-STARTPTS' -vcodec libx264 -preset veryfast foo.mp4","w");
	if(argc>2){
		
		if(!strcmp("-hard",argv[1])){
			if(!strcmp("-realtime",argv[3])){
             pipeout =popen("ffmpeg -y -f rawvideo -framerate 60 -use_wallclock_as_timestamps 1 -video_size 640x360 -pix_fmt uyvy422 -i - -filter:v setpts='PTS-STARTPTS' -vcodec libx264 -preset ultrafast -f matroska pipe:1 -blocksize 1 |ENCRYPTER-REALTIME","w");
			}else{
				  pipeout =popen("ffmpeg -y -f rawvideo -framerate 60 -use_wallclock_as_timestamps 1 -video_size 640x360 -pix_fmt uyvy422 -i - -filter:v setpts='PTS-STARTPTS' -vcodec libx264 -preset ultrafast -f matroska pipe:1 -blocksize 1 |ENCRYPTER","w");
			}
      
		}
		else if(!strcmp("-soft",argv[1])){
        if(!strcmp("-realtime",argv[3])){
			 pipeout =popen("ffmpeg -y -f rawvideo -framerate 60 -use_wallclock_as_timestamps 1 -video_size 640x360 -pix_fmt uyvy422 -i - -filter:v setpts='PTS-STARTPTS' -vcodec libx264 -preset ultrafast -f matroska pipe:1 -blocksize 1 |SOFT_ENCRYPTER-REALTIME","w");
		}else{
        pipeout =popen("ffmpeg -y -f rawvideo -framerate 60 -use_wallclock_as_timestamps 1 -video_size 640x360 -pix_fmt uyvy422 -i - -filter:v setpts='PTS-STARTPTS' -vcodec libx264 -preset ultrafast -f matroska pipe:1 -blocksize 1 |SOFT_ENCRYPTER","w");
		}
      
		}
		else {
          printf("Wrong arguments, please use the flag -hard or -soft followed by the number of seconds\n");
		  return -1;
		}
		duration=atoi(argv[2]);
	}
	else {
        printf("Wrong arguments, please use the flag -hard or -soft followed by the number of seconds\n");
		  return -1;
	}
	/*FILE* dump_video;
	 dump_video=fopen("dump_video.hex","wb");  
	char *data3=video_buffer;
	for(i=0;i<SDRAM_SPAN;i++){
     fwrite(data3,1,1,dump_video); 
	 data3++;
	}*/ 
	
	time_t te=time(NULL);
	while(time(NULL)-te<duration){
    //printf("Frame data start position relative to sdram %X\n",*(uint32_t *)frame_addr_ptr);
	//while((*(uint8_t *)dma_enable & 0x04));//while dma is on stop
		//uint8_t *frame_ptr= video_buffer; //+*(uint32_t *)frame_addr_ptr;
		//Skip the additional 2 bytes at the begining
		 
		//frame_ptr++;
	//	frame_ptr++;
		///
		/*
		int i;
		for(i=0;i<691200;i+=1){ 
			fwrite(frame_ptr,1,1,pipeout);
			//fwrite(frame_ptr,1,1,dump_video);
			frame_ptr++; 
		}*/ 
		fwrite(video_buffer,460800,1,pipeout);  // 1 frame = 460800
	//	while(!(*(uint8_t *)dma_enable & 0x04));//while dma is off stop
//	NumberOfFramesToRecord--; 
	}
	
	
 pclose(pipeout);

	
	// clean up our memory mapping and exit
	
	if( munmap( virtual_base, HW_REGS_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n" );
		close( fd );
		return( 1 );
	}

	close( fd );

	return( 0 );
}
