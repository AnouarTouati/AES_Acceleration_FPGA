
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include "socal/alt_gpio.h"
#include "stdlib.h"

#include <time.h> 


#define HW_REGS_BASE ( ALT_STM_OFST )
#define HW_REGS_SPAN ( 0x04000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

#include "tables.h"


void generate_partial_keys(uint8_t partial_keys[11][16]);

void shift_rows(uint8_t B[16]);
void mix_columns(uint8_t* Carray, uint8_t* Barray);
void inv_shift_rows(uint8_t B[16]);
void inv_mix_columns(uint8_t* Carray, uint8_t* Barray);

void encrypt(uint8_t key[16], uint8_t data[16],uint8_t buff[16]);
void decrypt(uint8_t key[16], uint8_t data[16],uint8_t buff[16]);

uint8_t partial_keys[11][16];

int main() {
	
//	uint8_t key[16] = { 0x00 ,0x01 ,0x02 ,0x03 ,0x04 ,0x05 ,0x06 ,0x07 ,0x08 ,0x09 ,0x0a ,0x0b ,0x0c ,0x0d ,0x0e ,0x0f };
//	uint8_t data[16] = { 0x00 ,0x11 ,0x22 ,0x33 ,0x44 ,0x55 ,0x66 ,0x77 ,0x88 ,0x99 ,0xaa ,0xbb ,0xcc ,0xdd ,0xee ,0xff };
//	uint8_t cipher[16] = { 0x69 ,0xc4 ,0xe0 ,0xd8 ,0x6a ,0x7b ,0x04 ,0x30 ,0xd8 ,0xcd ,0xb7 ,0x80 ,0x70 ,0xb4 ,0xc5 ,0x5a };
	
	uint8_t key[16];
	//uint8_t data[16];

    FILE* fPointer;
	fPointer = fopen("key.hex", "r");
	fread(key, 1, 16, fPointer);
	fclose(fPointer);

	FILE* fPointer2;
	fPointer2 = fopen("azz.mp4", "rb");
	fseek(fPointer2, 0, SEEK_END);
	int size = ftell(fPointer2);
	fseek(fPointer2, 0, SEEK_SET);

	
    uint8_t* whole_in_file = malloc(size);
	uint8_t* whole_out_file = malloc(size);

	int i=0;
	i=fread(whole_in_file,size,1,fPointer2);
	printf("%d bytes read\n",size*i);//just in case it cant read then  it will be size * 0

	FILE* fPointer3;
	fPointer3 = fopen("azz_enc.mp4", "wb");

    time_t begin = time(NULL);
	{
		int i=0;
		for (i = 0; i < 16; i++) {
			partial_keys[0][i] = key[i];
		}
		generate_partial_keys(partial_keys);
	}
        
	i=0;
	while (i<size) { 
		 encrypt(key, &whole_in_file[i],&whole_out_file[i]); 
		//decrypt(key, buff, buff2);
		//fwrite(buff2, 1, 16, fPointer3);//this writes decrypted
		i=i+16;
	}
	//time_t end = time(NULL);
	//printf("Time elpased is %d seconds\n", (end - begin));
	printf("%d bytes processed\n", i);
	printf("processing time : %d s", time(NULL)-begin);
	fwrite(whole_out_file, size, 1, fPointer3);
	
	return(0 );
}

void generate_partial_keys(uint8_t partial_keys[11][16]) {
	int i=0;
	for (i = 0; i < 10; i++) {
		uint8_t column[4];
		column[0] = partial_keys[i][12];
		column[1] = partial_keys[i][13];
		column[2] = partial_keys[i][14];
		column[3] = partial_keys[i][15];
		uint8_t temp = column[0];
		column[0] = column[1];
		column[1] = column[2];
		column[2] = column[3];
		column[3] = temp;

		column[0] = sbox[column[0]];
		column[1] = sbox[column[1]];
		column[2] = sbox[column[2]];
		column[3] = sbox[column[3]];

		partial_keys[i+1][0] = partial_keys[i][0] ^ column[0] ^ Rcon[i+1];
		partial_keys[i+1][1] = partial_keys[i][1] ^ column[1] ^ 0x0;
		partial_keys[i+1][2] = partial_keys[i][2] ^ column[2] ^ 0x0;
		partial_keys[i+1][3] = partial_keys[i][3] ^ column[3] ^ 0x0;
         int j=4;
		for (j = 4; j < 13; j=j+4) {
			partial_keys[i+1][0+j] = partial_keys[i+1][0+j-4] ^ partial_keys[i][j];
			partial_keys[i+1][1+j ] = partial_keys[i+1][1+j-4] ^ partial_keys[i][j+1];
			partial_keys[i+1][2+j] = partial_keys[i+1][2+j-4] ^ partial_keys[i][j+2];
			partial_keys[i+1][3+j] = partial_keys[i+1][3+j-4] ^ partial_keys[i][j+3];
		}
	}
	
}
void shift_rows(uint8_t B[16]) {

	uint8_t temp;
	temp = B[1];
	B[1] = B[5];
	B[5] = B[9];
	B[9] = B[13];
	B[13] = temp;

	temp = B[2];
	B[2] = B[10];
	B[10] = temp;
	temp = B[6];
	B[6] = B[14];
	B[14] = temp;

	temp = B[3];
	B[3] = B[15];
	B[15] = B[11];
	B[11] = B[7];
	B[7] = temp;
}
void mix_columns(uint8_t* Carray, uint8_t* Barray) {
    int i=0;
	for (i = 0; i < 13; i = i + 4) {
		Carray[0 + i] = table_2[Barray[0 + i]] ^ table_3[Barray[1 + i]] ^ Barray[2 + i] ^ Barray[3 + i];
		Carray[1 + i] = Barray[0 + i] ^ table_2[Barray[1 + i]] ^ table_3[Barray[2 + i]] ^ Barray[3 + i];
		Carray[2 + i] = Barray[0 + i] ^ Barray[1 + i] ^ table_2[Barray[2 + i]] ^ table_3[Barray[3 + i]];
		Carray[3 + i] = table_3[Barray[0 + i]] ^ Barray[1 + i] ^ Barray[2 + i] ^ table_2[Barray[3 + i]];
	}

}
void inv_mix_columns(uint8_t* Carray, uint8_t* Barray) {
    int i=0;
	for (i = 0; i < 13; i = i + 4) {
		Carray[0 + i] = table_E[Barray[0 + i]] ^ table_B[Barray[1 + i]] ^ table_D[Barray[2 + i]] ^ table_9[Barray[3 + i]];
		Carray[1 + i] = table_9[Barray[0 + i]] ^ table_E[Barray[1 + i]] ^ table_B[Barray[2 + i]] ^ table_D[Barray[3 + i]];
		Carray[2 + i] = table_D[Barray[0 + i]] ^ table_9[Barray[1 + i]] ^ table_E[Barray[2 + i]] ^ table_B[Barray[3 + i]];
		Carray[3 + i] = table_B[Barray[0 + i]] ^ table_D[Barray[1 + i]] ^ table_9[Barray[2 + i]] ^ table_E[Barray[3 + i]];
	}
}
void inv_shift_rows(uint8_t B[16]) {

	uint8_t temp;
	temp = B[13];
	B[13] = B[9];
	B[9] = B[5];
	B[5] = B[1];
	B[1] = temp;

	temp = B[10];
	B[10] = B[2];
	B[2] = temp;
	temp = B[14];
	B[14] = B[6];
	B[6] = temp;

	temp = B[15];
	B[15] = B[3];
	B[3] = B[7];
	B[7] = B[11];
	B[11] = temp;

}

void encrypt(uint8_t key[16], uint8_t data[16],uint8_t buff[16]) {
    int i=0;
	//adding first round key to data(state)
	for (i = 0; i < 16; i++) {
		data[i] = data[i] ^ partial_keys[0][i];
	}

	uint8_t B[16];
	uint8_t C[16];
	//copy data to array C
	for (i = 0; i < 16; i++) {
		C[i] = data[i];
	}
	// the 9 rounds
	int round=1;
	for (round = 1; round < 10; round++) {
		//sub_byte
		for (i = 0; i < 16; i++) {
			B[i] = sbox[C[i]];
		}
		shift_rows(B);
		mix_columns(C, B);
		for (i = 0; i < 16; i++) {
			C[i] = C[i] ^ partial_keys[round][i];
		}
	}
	//final round
	for (i = 0; i < 16; i++) {
		B[i] = sbox[C[i]];
	}
	shift_rows(B);

	for (i = 0; i < 16; i++) {
		B[i] = B[i] ^ partial_keys[10][i];
	}
	for (i = 0; i < 16; i++) {
		buff[i] = B[i];
	}
	//printing the cipher text
/*	printf("printing the cipher\n");
	for (i = 0; i < 16; i++) {
		printf("%X", B[i]);
	}
	printf("\n");*/
	
}
void decrypt(uint8_t key[16], uint8_t data[16],uint8_t buff[16]) {

    int i=0;
	//adding last round key to cipher
	for (i = 0; i < 16; i++) {
		data[i] = data[i] ^ partial_keys[10][i];
	}

	uint8_t B[16];
	uint8_t C[16];
	//copy data to array C
	for (i = 0; i < 16; i++) {
		B[i] = data[i];
	}
	// the 9 rounds
	int round=9;
	for (round = 9; round > 0; round--) {
		inv_shift_rows(B);
		//sub_byte
		for (i = 0; i < 16; i++) {
			C[i] = rsbox[B[i]];
		}
		for (i = 0; i < 16; i++) {
			C[i] = C[i] ^ partial_keys[round][i];
		}
		inv_mix_columns(B, C);
	}
	//final round
	inv_shift_rows(B);
	for (i = 0; i < 16; i++) {
		C[i] = rsbox[B[i]];
	}

	for (i = 0; i < 16; i++) {
		C[i] = C[i] ^ partial_keys[0][i];
	}
	for (i = 0; i < 16; i++) {
		buff[i] = C[i];
	}
	//printing the plain text
	//printf("printing the plain text\n");
	//for (i = 0; i < 16; i++) {
	//	printf("%X", C[i]);
	//}
	//printf("\n");
}
