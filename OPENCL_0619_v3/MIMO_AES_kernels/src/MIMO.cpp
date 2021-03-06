#include <stdint.h>
#include <hls_stream.h>
#include <stdio.h>
#include <stdlib.h>
#include <ap_int.h>
#include <string.h>
#include "ap_fixed.h"


#define DATA_SIZE 16

typedef struct Return_2{
	double o1;
	double o2;
}R2;

# define RAND_SEED 37
# define word_len 16
typedef ap_fixed<word_len,8> FIXED_LEN;
static FIXED_LEN cordic_phase[11]={ 0.78539816339744828000,
									0.46364760900080609000,
									0.24497866312686414000,
									0.12435499454676144000,
									0.06241880999595735000,
									0.03123983343026827700,
									0.01562372862047683100,
									0.00781234106010111110,
									0.00390623013196697180,
									0.00195312251647881880,
									0.00097656218955931946
								  };


// TRIPCOUNT identifier
const int c_size = DATA_SIZE;

static void load_input(ap_uint<8>* in, hls::stream<ap_uint<8>>& inStream) {
mem_rd:
    for (int i = 0; i < 16; i++) {
#pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size
        inStream << in[i];
    }
}

static void load_CHANNEL(FIXED_LEN *in, hls::stream<FIXED_LEN>& in_CHANNEL) {
mem_rd:
    for (int i = 0; i < 16; i++) {
#pragma HLS LOOP_TRIPCOUNT min = 16 max = 16
    	in_CHANNEL << in[i];
    }
}

static void load_NOISE(FIXED_LEN *in, hls::stream<FIXED_LEN>& in_NOISE) {
mem_rd:
    for (int i = 0; i < 128; i++) {
#pragma HLS LOOP_TRIPCOUNT min = 128 max = 128
    	in_NOISE << in[i];
    }
}

static void store_result(ap_uint<8>* out, hls::stream<ap_uint<8>>& out_stream) {
mem_wr:
    for (int i = 0; i < 16; i++) {
#pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size
        out[i] = out_stream.read();
    }
}

extern "C" {


void split(hls::stream<FIXED_LEN> &in, hls::stream<FIXED_LEN> &out_0, hls::stream<FIXED_LEN> &out_1){

	int i;
	FIXED_LEN TEMP;

	SPL:for(i=0; i<16; i++){
	#pragma HLS PIPELINE II=1
		TEMP = in.read();
		out_0 << TEMP;
		out_1 << TEMP;
	}
}


void channel_mult(hls::stream<FIXED_LEN> &H_real, hls::stream<FIXED_LEN> &H_imag,
				  hls::stream<FIXED_LEN> &x_real, hls::stream<FIXED_LEN> &x_imag,
				  hls::stream<FIXED_LEN> &out){
	FIXED_LEN DATA_TEMP[8];
	FIXED_LEN CHANNEL[8][8];
	FIXED_LEN TEMP0, TEMP1;
	FIXED_LEN MULT_TEMP;

	int i, j, data_idx;

#pragma HLS ARRAY_PARTITION variable=CHANNEL type=complete dim=0 /////////////////////////////NEW ADD
	CHANNEL2REAL:for(i=0; i<16; i++){
		TEMP0 = H_real.read();
		TEMP1 = H_imag.read();
		CHANNEL[2*(i/4)][2*(i%4)]       =  TEMP0;
		CHANNEL[2*(i/4)+1][(2*(i%4))+1] =  TEMP0;
		CHANNEL[2*(i/4)][2*(i%4)+1]     = -TEMP1;
		CHANNEL[2*(i/4)+1][2*(i%4)]     =  TEMP1;

	}

	for(data_idx=0; data_idx<16; data_idx++){
		DATA2REAL:
		for(i=0; i<4; i++){
			DATA_TEMP[2*i]   = x_real.read();
			DATA_TEMP[2*i+1] = x_imag.read();
		}

		CHANNEL_MULT_LOOP:
		for(i=0; i<8; i++){
			for(j=0; j<8; j++){
				if(j==0) MULT_TEMP = 0;
				MULT_TEMP = MULT_TEMP + CHANNEL[i][j] * DATA_TEMP[j];
				if(j==7) out << MULT_TEMP;
			}
		}
	}
}


void matrix_mult(hls::stream<FIXED_LEN> &Q, hls::stream<FIXED_LEN> &in_data, hls::stream<FIXED_LEN> &out_data){
	int i, j, k, data_idx;
	FIXED_LEN Q_TEMP[8][8];
	FIXED_LEN DATA_TEMP[8];
	FIXED_LEN MULT_TEMP;
#pragma HLS ARRAY_PARTITION variable=DATA_TEMP type=complete dim=0 /////////////////////////////NEW ADD
	for(i=0; i<64; i++){
		Q_TEMP[i/8][i%8] = Q.read();
	}



	for(data_idx=0; data_idx<16; data_idx++){
		for(i=0; i<8; i++){
			DATA_TEMP[i] = in_data.read();
		}

		for(j=0; j<8; j++){
			MULT_TEMP = 0;
			for(k=0; k<8; k++){
				MULT_TEMP = MULT_TEMP + Q_TEMP[k][j] * DATA_TEMP[k];
			}
			out_data << MULT_TEMP;
		}

	}
}


void Modulation(hls::stream<ap_uint<8>> &in_stream, hls::stream<FIXED_LEN> &xr, hls::stream<FIXED_LEN> &xi){
	int i, data_idx;
	ap_uint<1> temp[8];
	ap_uint<8> data_temp;


	for(data_idx=0; data_idx<16; data_idx++){
		data_temp = in_stream.read();

		for(i=0; i<8; i++){
			temp[i] = data_temp % 2;
			data_temp = data_temp / 2;
		}


		for(i=0; i<4; i++){
			if(temp[i*2] == 1) xr << 0.7071;
			else xr << -0.7071;

			if(temp[i*2+1] == 1) xi << 0.7071;
			else xi << -0.7071;
		}
	}

}

extern "C" void Rayleigh(hls::stream<FIXED_LEN> &H_real, hls::stream<FIXED_LEN> &H_imag,
						 hls::stream<FIXED_LEN> &CHANNEL_R, hls::stream<FIXED_LEN> &CHANNEL_I){
    int i;
    for(i=0; i<16; i++){
    	H_real << CHANNEL_R.read();
    	H_imag << CHANNEL_I.read();
    }
}


R2 CORDIC_R (FIXED_LEN x_in, FIXED_LEN y_in, FIXED_LEN z_in)
{
	FIXED_LEN pi_div = 1.5708;
	FIXED_LEN x, y, z;

	if(z_in < 0){
		x =  y_in;
        y = -x_in;
        z = z_in + pi_div;
	}

    else{
    	x = -y_in;
        y =  x_in;
        z = z_in - pi_div;
	}

    FIXED_LEN An = 0.607253;
    FIXED_LEN temp_x = 0;
    FIXED_LEN temp_y = 0;

    int k, i;
    for(k=0; k<10; k++){
    	temp_x = x;
    	temp_y = y;
    	for(i=0; i < k; i++){
    		temp_x.range(word_len - 2, 0) = temp_x.range() >> 1;
    		temp_y.range(word_len - 2, 0) = temp_y.range() >> 1;
    	}

    	if(z < 0) {
    		x = x + temp_y;
    		y = y - temp_x;
    		z = z + cordic_phase[k];
    	}
        else {
        	x = x - temp_y;
        	y = y + temp_x;
        	z = z - cordic_phase[k];
        }
	}
    R2 output;
	output.o1 = x * An;
	output.o2 = y * An;

    return output;
}


R2 CORDIC_V (FIXED_LEN x_in, FIXED_LEN y_in, FIXED_LEN z_in)
{
	FIXED_LEN pi_div = 1.5708;
	FIXED_LEN pi = 3.1416;
	FIXED_LEN x, y, z;

	if(y_in < 0){
		x = -y_in;
        y =  x_in;
        z =  z_in - pi_div;
	}
    else{
    	x =  y_in;
        y = -x_in;
        z =  z_in + pi_div;
	}

    if(x < 0){
    	x = -x;
        y = -y;
        z =  z - pi;
	}
    else{
    	x = x;
        y = y;
        z = z;
	}


    FIXED_LEN An = 0.607253;
    FIXED_LEN temp_x = 0;
    FIXED_LEN temp_y = 0;

    //FIXED_LEN x_temp;
    int k, i;
    for(k=0; k<10; k++){
    	temp_x = x;
    	temp_y = y;
    	for(i=0; i < k; i++){
    		temp_x.range(word_len - 2, 0) = temp_x.range() >> 1;
    	    temp_y.range(word_len - 2, 0) = temp_y.range() >> 1;
    	}
    	if(y < 0) {
    		x = x - temp_y;
    		y = y + temp_x;
    		z = z - cordic_phase[k];
    	}
        else {
        	x = x + temp_y;
        	y = y - temp_x;
        	z = z + cordic_phase[k];
        }
	}
	R2 output;
	output.o1 = x * An;
	output.o2 = z - z_in;

    return output;
}


void QRD(hls::stream<FIXED_LEN> &H_real, hls::stream<FIXED_LEN> &H_imag, hls::stream<FIXED_LEN> &Q, hls::stream<FIXED_LEN> &R){
	int i, j, k;
	FIXED_LEN TEMP0, TEMP1;
	FIXED_LEN Y[8][8], HH[8][4];
	FIXED_LEN H[8][8];
	R2 temp_c1, temp_c2, temp_c3, temp_c4, temp_c5, temp_c6, temp_c7;

	CHANNEL2REAL:for(i=0; i<16; i++){
		TEMP0 = H_real.read();
		TEMP1 = H_imag.read();
		Y[2*(i/4)][2*(i%4)]       =  TEMP0;
		Y[2*(i/4)+1][(2*(i%4))+1] =  TEMP0;
		Y[2*(i/4)][2*(i%4)+1]     = -TEMP1;
		Y[2*(i/4)+1][2*(i%4)]     =  TEMP1;

		HH[2*(i/4)][i%4]   = TEMP0;
		HH[2*(i/4)+1][i%4] = TEMP1;
	}



	// FOR COLUMN 1
	for(i=0; i<8; i=i+2){

		temp_c1 = CORDIC_V(HH[i][0], HH[i+1][0], 0);
		temp_c2 = CORDIC_R(HH[i][1], HH[i+1][1], -temp_c1.o2);
		temp_c3 = CORDIC_R(HH[i][2], HH[i+1][2], -temp_c1.o2);
		temp_c4 = CORDIC_R(HH[i][3], HH[i+1][3], -temp_c1.o2);
		HH[i][0] = temp_c1.o1; HH[i+1][0] = 0;
		HH[i][1] = temp_c2.o1; HH[i+1][1] = temp_c2.o2;
		HH[i][2] = temp_c3.o1; HH[i+1][2] = temp_c3.o2;
		HH[i][3] = temp_c4.o1; HH[i+1][3] = temp_c4.o2;
	}


	for(i=0; i<2; i++){
		temp_c1 = CORDIC_V(HH[i*4][0], HH[i*4+2][0], 0);
		temp_c2 = CORDIC_R(HH[i*4][1], HH[i*4+2][1], -temp_c1.o2);
		temp_c3 = CORDIC_R(HH[i*4][2], HH[i*4+2][2], -temp_c1.o2);
		temp_c4 = CORDIC_R(HH[i*4][3], HH[i*4+2][3], -temp_c1.o2);
		temp_c5 = CORDIC_R(HH[i*4+1][1], HH[i*4+3][1], -temp_c1.o2);
		temp_c6 = CORDIC_R(HH[i*4+1][2], HH[i*4+3][2], -temp_c1.o2);
		temp_c7 = CORDIC_R(HH[i*4+1][3], HH[i*4+3][3], -temp_c1.o2);
		HH[i*4][0] = temp_c1.o1; HH[i*4+2][0] = 0;
		HH[i*4][1] = temp_c2.o1; HH[i*4+2][1] = temp_c2.o2;
		HH[i*4][2] = temp_c3.o1; HH[i*4+2][2] = temp_c3.o2;
		HH[i*4][3] = temp_c4.o1; HH[i*4+2][3] = temp_c4.o2;
		HH[i*4+1][1] = temp_c5.o1; HH[i*4+3][1] = temp_c5.o2;
		HH[i*4+1][2] = temp_c6.o1; HH[i*4+3][2] = temp_c6.o2;
		HH[i*4+1][3] = temp_c7.o1; HH[i*4+3][3] = temp_c7.o2;
	}

	temp_c1 = CORDIC_V(HH[0][0], HH[4][0], 0);
	temp_c2 = CORDIC_R(HH[0][1], HH[4][1], -temp_c1.o2);
	temp_c3 = CORDIC_R(HH[0][2], HH[4][2], -temp_c1.o2);
	temp_c4 = CORDIC_R(HH[0][3], HH[4][3], -temp_c1.o2);
	temp_c5 = CORDIC_R(HH[1][1], HH[5][1], -temp_c1.o2);
	temp_c6 = CORDIC_R(HH[1][2], HH[5][2], -temp_c1.o2);
	temp_c7 = CORDIC_R(HH[1][3], HH[5][3], -temp_c1.o2);
	HH[0][0] = temp_c1.o1; HH[4][0] = 0;
	HH[0][1] = temp_c2.o1; HH[4][1] = temp_c2.o2;
	HH[0][2] = temp_c3.o1; HH[4][2] = temp_c3.o2;
	HH[0][3] = temp_c4.o1; HH[4][3] = temp_c4.o2;
	HH[1][1] = temp_c5.o1; HH[5][1] = temp_c5.o2;
	HH[1][2] = temp_c6.o1; HH[5][2] = temp_c6.o2;
	HH[1][3] = temp_c7.o1; HH[5][3] = temp_c7.o2;


	// FOR COLUMN 3

	for(i=2; i<8; i=i+2){
		temp_c1 = CORDIC_V(HH[i][1], HH[i+1][1], 0);
		temp_c2 = CORDIC_R(HH[i][2], HH[i+1][2], -temp_c1.o2);
		temp_c3 = CORDIC_R(HH[i][3], HH[i+1][3], -temp_c1.o2);
		HH[i][1] = temp_c1.o1; HH[i+1][1] = 0;
		HH[i][2] = temp_c2.o1; HH[i+1][2] = temp_c2.o2;
		HH[i][3] = temp_c3.o1; HH[i+1][3] = temp_c3.o2;
	}

	temp_c1 = CORDIC_V(HH[2][1], HH[4][1], 0);
	temp_c2 = CORDIC_R(HH[2][2], HH[4][2], -temp_c1.o2);
	temp_c3 = CORDIC_R(HH[2][3], HH[4][3], -temp_c1.o2);
	temp_c4 = CORDIC_R(HH[3][2], HH[5][2], -temp_c1.o2);
	temp_c5 = CORDIC_R(HH[3][3], HH[5][3], -temp_c1.o2);
	HH[2][1] = temp_c1.o1; HH[4][1] = 0;
	HH[2][2] = temp_c2.o1; HH[4][2] = temp_c2.o2;
	HH[2][3] = temp_c3.o1; HH[4][3] = temp_c3.o2;
	HH[3][2] = temp_c4.o1; HH[5][2] = temp_c4.o2;
	HH[3][3] = temp_c5.o1; HH[5][3] = temp_c5.o2;

	temp_c1 = CORDIC_V(HH[2][1], HH[6][1], 0);
	temp_c2 = CORDIC_R(HH[2][2], HH[6][2], -temp_c1.o2);
	temp_c3 = CORDIC_R(HH[2][3], HH[6][3], -temp_c1.o2);
	temp_c4 = CORDIC_R(HH[3][2], HH[7][2], -temp_c1.o2);
	temp_c5 = CORDIC_R(HH[3][3], HH[7][3], -temp_c1.o2);
	HH[2][1] = temp_c1.o1; HH[6][1] = 0;
	HH[2][2] = temp_c2.o1; HH[6][2] = temp_c2.o2;
	HH[2][3] = temp_c3.o1; HH[6][3] = temp_c3.o2;
	HH[3][2] = temp_c4.o1; HH[7][2] = temp_c4.o2;
	HH[3][3] = temp_c5.o1; HH[7][3] = temp_c5.o2;


	// FOR COLUMN 5

	for(i=4; i<8; i=i+2){
		temp_c1 = CORDIC_V(HH[i][2], HH[i+1][2], 0);
		temp_c2 = CORDIC_R(HH[i][3], HH[i+1][3], -temp_c1.o2);
		HH[i][2] = temp_c1.o1; HH[i+1][2] = 0;
		HH[i][3] = temp_c2.o1; HH[i+1][3] = temp_c2.o2;
	}

	temp_c1 = CORDIC_V(HH[4][2], HH[6][2], 0);
	temp_c2 = CORDIC_R(HH[4][3], HH[6][3], -temp_c1.o2);
	temp_c3 = CORDIC_R(HH[5][3], HH[7][3], -temp_c1.o2);
	HH[4][2] = temp_c1.o1; HH[6][2] = 0;
	HH[4][3] = temp_c2.o1; HH[6][3] = temp_c2.o2;
	HH[5][3] = temp_c3.o1; HH[7][3] = temp_c3.o2;


	// FOR COLUMN 7
	temp_c1 = CORDIC_V(HH[6][3], HH[7][3], 0);
	HH[6][3] = temp_c1.o1; HH[7][3] = 0;



	// matrix inverse
#pragma HLS ARRAY_PARTITION variable=HH type=complete dim=0
#pragma HLS ARRAY_PARTITION variable=H type=complete dim=0

LOOP_01:
	for(i=0; i<8; i=i+2){
		for(j=0; j<8; j=j+2){
			H[j][i] = HH[j][i/2];
			H[j+1][i] = HH[j+1][i/2];
			H[j][i+1] = -HH[j+1][i/2];
			H[j+1][i+1] = HH[j][i/2];
		}
	}



LOOP_02:
	for(i=0; i<8; i++){
		for(j=0; j<8; j++){
			R << H[i][j];
		}
	}

	FIXED_LEN R_I[8][8] = { 1, 0, 0, 0, 0, 0, 0, 0,
						    0, 1, 0, 0, 0, 0, 0, 0,
						    0, 0, 1, 0, 0, 0, 0, 0,
						    0, 0, 0, 1, 0, 0, 0, 0,
						    0, 0, 0, 0, 1, 0, 0, 0,
					   	    0, 0, 0, 0, 0, 1, 0, 0,
					   	    0, 0, 0, 0, 0, 0, 1, 0,
						    0, 0, 0, 0, 0, 0, 0, 1 };

#pragma HLS ARRAY_PARTITION variable=R_I type=complete dim=0
	FIXED_LEN temp;
 	for(i=0; i<8; i++){
		for(j=i; j>=0; j--){
			if(j==i){

				R_I[j][0] = R_I[j][0] / H[j][i];
				R_I[j][1] = R_I[j][1] / H[j][i];
				R_I[j][2] = R_I[j][2] / H[j][i];
				R_I[j][3] = R_I[j][3] / H[j][i];
				R_I[j][4] = R_I[j][4] / H[j][i];
				R_I[j][5] = R_I[j][5] / H[j][i];
				R_I[j][6] = R_I[j][6] / H[j][i];
				R_I[j][7] = R_I[j][7] / H[j][i];

				temp = H[j][i];
				H[j][0] = H[j][0] / temp;
				H[j][1] = H[j][1] / temp;
				H[j][2] = H[j][2] / temp;
				H[j][3] = H[j][3] / temp;
				H[j][4] = H[j][4] / temp;
				H[j][5] = H[j][5] / temp;
				H[j][6] = H[j][6] / temp;
				H[j][7] = H[j][7] / temp;
			}
			else{
				R_I[j][0] = R_I[j][0] - R_I[i][0] * H[j][i];
				R_I[j][1] = R_I[j][1] - R_I[i][1] * H[j][i];
				R_I[j][2] = R_I[j][2] - R_I[i][2] * H[j][i];
				R_I[j][3] = R_I[j][3] - R_I[i][3] * H[j][i];
				R_I[j][4] = R_I[j][4] - R_I[i][4] * H[j][i];
				R_I[j][5] = R_I[j][5] - R_I[i][5] * H[j][i];
				R_I[j][6] = R_I[j][6] - R_I[i][6] * H[j][i];
				R_I[j][7] = R_I[j][7] - R_I[i][7] * H[j][i];

				temp = H[j][i];
				H[j][0] = H[j][0] - H[i][0] * temp;
				H[j][1] = H[j][1] - H[i][1] * temp;
				H[j][2] = H[j][2] - H[i][2] * temp;
				H[j][3] = H[j][3] - H[i][3] * temp;
				H[j][4] = H[j][4] - H[i][4] * temp;
				H[j][5] = H[j][5] - H[i][5] * temp;
				H[j][6] = H[j][6] - H[i][6] * temp;
				H[j][7] = H[j][7] - H[i][7] * temp;
			}
		}
	}

	#pragma HLS ARRAY_PARTITION variable = Y dim=1
	// Calculate Q matrix
	for(i=0; i<8; i++){
		for(j=0; j<8; j++){
			for(k=0; k<8; k++){
				if(k==0){
					temp = 0;
				}
				temp = temp + Y[i][k] * R_I[k][j];
				if(k==7){
					Q << temp;
				}
			}
		}
	}
}

extern "C" void AWGN(hls::stream<FIXED_LEN> &din, hls::stream<FIXED_LEN> &dout,
					 hls::stream<FIXED_LEN> &NOISE){
    for(int j=0; j< 128; j++){
    	dout << din.read() + NOISE.read();
    }
}


void KBEST(hls::stream<FIXED_LEN> &R_IN, hls::stream<FIXED_LEN> &in_data, hls::stream<FIXED_LEN> &out_data){
	int i, j, k, data_idx, layer;
	FIXED_LEN sqr_2 = 1.4142;
	FIXED_LEN yy[8]; // in_data * SQRT(2)
	FIXED_LEN PED[4] = {0, 0, 0, 0};

	int x_guess[4][8] = {0, 0, 0, 0};
	int survival_path [2][8];
	FIXED_LEN survival_PED[2] = {0, 0};
	FIXED_LEN dist;
	FIXED_LEN bubble_temp;

	FIXED_LEN R[8][8];
	for(i=0; i<64; i++){
		R[i/8][i%8] = R_IN.read();
	}

#pragma HLS ARRAY_PARTITION variable=x_guess type=complete dim=0

	for(data_idx=0; data_idx<16; data_idx++){



		for(i=0; i<8; i++){
			yy[i] = in_data.read() * sqr_2;
		}


		for(layer=7; layer>=0; layer--){
			PED[0] = 0;
			PED[1] = 0;
			PED[2] = 0;
			PED[3] = 0;

			x_guess[0][layer] =  1;
			x_guess[1][layer] = -1;
			x_guess[2][layer] =  1;
			x_guess[3][layer] = -1;


			for(i = 7; i > layer; i--){
				x_guess[0][i] = survival_path[0][i];
				x_guess[1][i] = survival_path[0][i];
				x_guess[2][i] = survival_path[1][i];
				x_guess[3][i] = survival_path[1][i];
			}

			for(i = 0; i<4; i++){
				dist = 0;
				for(j = layer; j < 8; j++){
					if(x_guess[i][j] == 1) {
						dist = dist + R[layer][j];
					}
					else {
						dist = dist - R[layer][j];
					}
				}
				PED[i] = (yy[layer] - dist) * (yy[layer] - dist);
				if(i <= 1){
					PED[i] = PED[i] + survival_PED[0];
				}
				else{
					PED[i] = PED[i] + survival_PED[1];
				}
			}

			if(layer != 7){
				for(int i = 0; i < 2 ; i++){ //bubble sort
					for(int j = 0; j < 3 ; j++){
						if(PED[j] < PED[j+1]){
							bubble_temp = PED[j];
							PED[j] = PED[j+1];
							PED[j+1] = bubble_temp;

							for(int k = 0; k < 8 ; k++){
								bubble_temp = x_guess[j][k];
								x_guess[j][k] = x_guess[j+1][k];
								x_guess[j+1][k] = bubble_temp;
							}
						}
					}
				}

			}


			for (i = 0; i < 8; i++) //Update survival path
			{
				survival_path[0][i] = x_guess[2][i];
				survival_path[1][i] = x_guess[3][i];
			}

			survival_PED[0] = PED[2];
			survival_PED[1] = PED[3];
		}

		for (i = 0; i <8; i++){
			out_data << survival_path[1][i];
		}

	}
}

void DeModulation(hls::stream<FIXED_LEN> &in_data, hls::stream<ap_uint<8>> &out_data){
	int i, data_idx;
	static ap_uint<8> BIN_TB[8]={1, 2, 4, 8, 16, 32, 64, 128};
	ap_uint<1> temp[8];
	FIXED_LEN in[8];
	ap_uint<8> MULT_TEMP;

	for(data_idx=0; data_idx<16; data_idx++){
		for(i=0; i<8; i++){
			in[i] = in_data.read();
		}


		for (i=0; i<4; i++){
			if(in[i*2] > 0){
				temp[i*2] = 1;
			}
			else {
				temp[i*2] = 0;
			}

			if(in[i*2+1] > 0){
				temp[i*2+1] = 1;
			}
			else {
				temp[i*2+1] = 0;
			}

		}

		MULT_TEMP = 0;
		for(i=0; i<8; i++){
			if(temp[i]==1) MULT_TEMP = MULT_TEMP + BIN_TB[i];
		}
		out_data << MULT_TEMP;


	}
}

///////////////////////////////////////////////////////////
//////////////////////////AES128///////////////////////////
///////////////////////////////////////////////////////////
struct my_stream_type {
	char data[16];
	ap_uint<1> user;	// USER signal
	ap_uint<1> last; 	// TLAST signal
};


static const int S[16][16] = { 0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,
							   0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0,
							   0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15,
							   0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75,
							   0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84,
							   0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf,
							   0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8,
							   0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2,
							   0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73,
							   0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb,
							   0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79,
							   0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08,
							   0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a,
							   0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e,
							   0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,
							   0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16 };


static const int S2[16][16] = { 0x52, 0x09, 0x6a, 0xd5, 0x30, 0x36, 0xa5, 0x38, 0xbf, 0x40, 0xa3, 0x9e, 0x81, 0xf3, 0xd7, 0xfb,
								0x7c, 0xe3, 0x39, 0x82, 0x9b, 0x2f, 0xff, 0x87, 0x34, 0x8e, 0x43, 0x44, 0xc4, 0xde, 0xe9, 0xcb,
								0x54, 0x7b, 0x94, 0x32, 0xa6, 0xc2, 0x23, 0x3d, 0xee, 0x4c, 0x95, 0x0b, 0x42, 0xfa, 0xc3, 0x4e,
								0x08, 0x2e, 0xa1, 0x66, 0x28, 0xd9, 0x24, 0xb2, 0x76, 0x5b, 0xa2, 0x49, 0x6d, 0x8b, 0xd1, 0x25,
								0x72, 0xf8, 0xf6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xd4, 0xa4, 0x5c, 0xcc, 0x5d, 0x65, 0xb6, 0x92,
								0x6c, 0x70, 0x48, 0x50, 0xfd, 0xed, 0xb9, 0xda, 0x5e, 0x15, 0x46, 0x57, 0xa7, 0x8d, 0x9d, 0x84,
								0x90, 0xd8, 0xab, 0x00, 0x8c, 0xbc, 0xd3, 0x0a, 0xf7, 0xe4, 0x58, 0x05, 0xb8, 0xb3, 0x45, 0x06,
								0xd0, 0x2c, 0x1e, 0x8f, 0xca, 0x3f, 0x0f, 0x02, 0xc1, 0xaf, 0xbd, 0x03, 0x01, 0x13, 0x8a, 0x6b,
								0x3a, 0x91, 0x11, 0x41, 0x4f, 0x67, 0xdc, 0xea, 0x97, 0xf2, 0xcf, 0xce, 0xf0, 0xb4, 0xe6, 0x73,
								0x96, 0xac, 0x74, 0x22, 0xe7, 0xad, 0x35, 0x85, 0xe2, 0xf9, 0x37, 0xe8, 0x1c, 0x75, 0xdf, 0x6e,
								0x47, 0xf1, 0x1a, 0x71, 0x1d, 0x29, 0xc5, 0x89, 0x6f, 0xb7, 0x62, 0x0e, 0xaa, 0x18, 0xbe, 0x1b,
								0xfc, 0x56, 0x3e, 0x4b, 0xc6, 0xd2, 0x79, 0x20, 0x9a, 0xdb, 0xc0, 0xfe, 0x78, 0xcd, 0x5a, 0xf4,
								0x1f, 0xdd, 0xa8, 0x33, 0x88, 0x07, 0xc7, 0x31, 0xb1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xec, 0x5f,
								0x60, 0x51, 0x7f, 0xa9, 0x19, 0xb5, 0x4a, 0x0d, 0x2d, 0xe5, 0x7a, 0x9f, 0x93, 0xc9, 0x9c, 0xef,
								0xa0, 0xe0, 0x3b, 0x4d, 0xae, 0x2a, 0xf5, 0xb0, 0xc8, 0xeb, 0xbb, 0x3c, 0x83, 0x53, 0x99, 0x61,
								0x17, 0x2b, 0x04, 0x7e, 0xba, 0x77, 0xd6, 0x26, 0xe1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0c, 0x7d };


static int getNumFromSBox(char index) {
	char row =   (index & 0xf0)>>4; // getLeft4Bit(index);
	char col =  index & 0x0f;  //getRight4Bit(index);
	return S[row][col];
}



static int getIntFromChar(char c) {
	int result = (int) c;
	return result & 0x000000ff;
}


static void convertToIntArray(char *str, int pa[4][4]) {
	int k = 0;
	int i,j;
	convertToIntArray_label0:for(i = 0; i < 4; i++)
		convertToIntArray_label1:for(j = 0; j < 4; j++) {
			pa[j][i] = getIntFromChar(str[k]);
			k++;
		}
}



static int getWordFromStr(char *str) {
	int one, two, three, four;
	one = getIntFromChar(str[0]);
	one = one << 24;
	two = getIntFromChar(str[1]);
	two = two << 16;
	three = getIntFromChar(str[2]);
	three = three << 8;
	four = getIntFromChar(str[3]);
	return one | two | three | four;
}


static void splitIntToArray(int num, int array[4]) {
	int one, two, three;
	one = num >> 24;
	array[0] = one & 0x000000ff;
	two = num >> 16;
	array[1] = two & 0x000000ff;
	three = num >> 8;
	array[2] = three & 0x000000ff;
	array[3] = num & 0x000000ff;
}


static void leftLoop4int(int array[4], int step) {
	int temp[4];
	int i;
	int index;
	leftLoop4int_label3:for(i = 0; i < 4; i++)
		temp[i] = array[i];

	index = step % 4 == 0 ? 0 : step % 4;
	leftLoop4int_label2:for(i = 0; i < 4; i++){
		array[i] = temp[index];
		index++;
		index = index % 4;
	}
}


static int mergeArrayToInt(int array[4]) {
	int one = array[0] << 24;
	int two = array[1] << 16;
	int three = array[2] << 8;
	int four = array[3];
	return one | two | three | four;
}


static const unsigned int Rcon[10] = { 0x01000000, 0x02000000,
	0x04000000, 0x08000000,
	0x10000000, 0x20000000,
	0x40000000, 0x80000000,
	0x1b000000, 0x36000000 };

static int T(int num, int round) {
	int numArray[4];
	int i;
	int result;
	splitIntToArray(num, numArray);
	leftLoop4int(numArray, 1);


	T_label4:for(i = 0; i < 4; i++)
		numArray[i] = getNumFromSBox(numArray[i]);

	result = mergeArrayToInt(numArray);
	return result ^ Rcon[round];
}



static void extendKey(char *key, int *w) {
	int i,j;
	extendKey_label5:for(i = 0; i < 4; i++)
		w[i] = getWordFromStr(key + i * 4);

	extendKey_label0:
	for(i = 4, j = 0; i < 44; i++) {
		if( i % 4 == 0) {
			w[i] = w[i - 4] ^ T(w[i - 1], j);
			j++;
		}else {
			w[i] = w[i - 4] ^ w[i - 1];
		}
	}

}


static void addRoundKey(int array[4][4], int round, int *w) {
	int warray[4];
	int i,j;
	addRoundKey_label0:for(i = 0; i < 4; i++) {

		splitIntToArray(w[round * 4 + i], warray);

		addRoundKey_label6:for(j = 0; j < 4; j++) {
			array[j][i] = array[j][i] ^ warray[j];
		}
	}
}


static void subBytes(int array[4][4]){
	int i,j;
	subBytes_label0:for(i = 0; i < 4; i++)
		subBytes_label7:for(j = 0; j < 4; j++)
			array[i][j] = getNumFromSBox(array[i][j]);
}


static void shiftRows(int array[4][4]) {
	int rowTwo[4], rowThree[4], rowFour[4];
	int i;
	shiftRows_label1:for(i = 0; i < 4; i++) {
		rowTwo[i] = array[1][i];
		rowThree[i] = array[2][i];
		rowFour[i] = array[3][i];
	}

	leftLoop4int(rowTwo, 1);
	leftLoop4int(rowThree, 2);
	leftLoop4int(rowFour, 3);

	shiftRows_label8:for(i = 0; i < 4; i++) {
		array[1][i] = rowTwo[i];
		array[2][i] = rowThree[i];
		array[3][i] = rowFour[i];
	}
}


static const char colM[4][4] = { 2, 3, 1, 1,
	1, 2, 3, 1,
	1, 1, 2, 3,
	3, 1, 1, 2 };

static int GFMul2(int s) {
	int result = s << 1;
	int a7 = result & 0x00000100;

	if(a7 != 0) {
		result = result & 0x000000ff;
		result = result ^ 0x1b;
	}

	return result;
}

static int GFMul3(int s) {
	return GFMul2(s) ^ s;
}

static int GFMul4(int s) {
	return GFMul2(GFMul2(s));
}

static int GFMul8(int s) {
	return GFMul2(GFMul4(s));
}

static int GFMul9(int s) {
	return GFMul8(s) ^ s;
}

static int GFMul11(int s) {
	return GFMul9(s) ^ GFMul2(s);
}

static int GFMul12(int s) {
	return GFMul8(s) ^ GFMul4(s);
}

static int GFMul13(int s) {
	return GFMul12(s) ^ s;
}

static int GFMul14(int s) {
	return GFMul12(s) ^ GFMul2(s);
}


static int GFMul(int n, int s) {
	int result;

	if(n == 1)
		result = s;
	else if(n == 2)
		result = GFMul2(s);
	else if(n == 3)
		result = GFMul3(s);
	else if(n == 0x9)
		result = GFMul9(s);
	else if(n == 0xb)//11
		result = GFMul11(s);
	else if(n == 0xd)//13
		result = GFMul13(s);
	else if(n == 0xe)//14
		result = GFMul14(s);

	return result;
}

static void mixColumns(int array[4][4]) {

	int tempArray[4][4];
	int i,j;
	mixColumns_label4:for(i = 0; i < 4; i++)
		mixColumns_label9:for(j = 0; j < 4; j++)
			tempArray[i][j] = array[i][j];

	mixColumns_label3:for(i = 0; i < 4; i++)
		mixColumns_label10:for(j = 0; j < 4; j++){
			array[i][j] = GFMul(colM[i][0],tempArray[0][j]) ^ GFMul(colM[i][1],tempArray[1][j])
				^ GFMul(colM[i][2],tempArray[2][j]) ^ GFMul(colM[i][3], tempArray[3][j]);
		}
}

static void convertArrayToStr(int array[4][4], char *str) {
	int i,j;
	convertArrayToStr_label2:for(i = 0; i < 4; i++)
		convertArrayToStr_label11:for(j = 0; j < 4; j++)
			*str++ = (char)array[j][i];
}


void aes_return(char *p, int plen, int *w){

	int pArray[4][4];
	int k,i;



	aes_return_label23:for(k = 0; k < plen; k += 16) {
		convertToIntArray(p + k, pArray);

		addRoundKey(pArray, 0, w);

		aes_return_label12:for(i = 1; i < 10; i++){

			subBytes(pArray);

			shiftRows(pArray);

			mixColumns(pArray);

			addRoundKey(pArray, i, w);

		}

		subBytes(pArray);

		shiftRows(pArray);

		addRoundKey(pArray, 10, w);

		convertArrayToStr(pArray, p + k);
	}
//	return info;
}


static int getNumFromS1Box(char index) {
	char row =   (index & 0xf0)>>4; // getLeft4Bit(index);
	char col =  index & 0x0f;  //getRight4Bit(index);
	return S2[row][col];
}


static void deSubBytes(int array[4][4]) {
	int i,j;
	deSubBytes_label1:for(i = 0; i < 4; i++)
		deSubBytes_label13:for(j = 0; j < 4; j++)
			array[i][j] = getNumFromS1Box(array[i][j]);
}

static void rightLoop4int(int array[4], int step) {
	int temp[4];
	int i;
	int index;
	rightLoop4int_label14:for(i = 0; i < 4; i++)
		temp[i] = array[i];

	index = step % 4 == 0 ? 0 : step % 4;
	index = 3 - index;
	rightLoop4int_label15:for(i = 3; i >= 0; i--) {
		array[i] = temp[index];
		index--;
		index = index == -1 ? 3 : index;
	}
}


static void deShiftRows(int array[4][4]) {
	int rowTwo[4], rowThree[4], rowFour[4];
	int i;
	deShiftRows_label16:for(i = 0; i < 4; i++) {
		rowTwo[i] = array[1][i];
		rowThree[i] = array[2][i];
		rowFour[i] = array[3][i];
	}

	rightLoop4int(rowTwo, 1);
	rightLoop4int(rowThree, 2);
	rightLoop4int(rowFour, 3);

	deShiftRows_label17:for(i = 0; i < 4; i++) {
		array[1][i] = rowTwo[i];
		array[2][i] = rowThree[i];
		array[3][i] = rowFour[i];
	}
}

static const char deColM[4][4] = { 0xe, 0xb, 0xd, 0x9,
	0x9, 0xe, 0xb, 0xd,
	0xd, 0x9, 0xe, 0xb,
	0xb, 0xd, 0x9, 0xe };


static void deMixColumns(int array[4][4]) {
	int tempArray[4][4];
	int i,j;
	deMixColumns_label5:for(i = 0; i < 4; i++)
		deMixColumns_label18:for(j = 0; j < 4; j++)
			tempArray[i][j] = array[i][j];

	deMixColumns_label6:
	for(i = 0; i < 4; i++){

		deMixColumns_label3:for(j = 0; j < 4; j++){
			array[i][j] = GFMul(deColM[i][0],tempArray[0][j]) ^ GFMul(deColM[i][1],tempArray[1][j])
				^ GFMul(deColM[i][2],tempArray[2][j]) ^ GFMul(deColM[i][3], tempArray[3][j]);
		}
	}

}


static void addRoundTowArray(int aArray[4][4],int bArray[4][4]) {
	int i,j;
	addRoundTowArray_label2:for(i = 0; i < 4; i++)
		addRoundTowArray_label20:for(j = 0; j < 4; j++)
			aArray[i][j] = aArray[i][j] ^ bArray[i][j];
}

static void getArrayFrom4W(int i, int array[4][4], int *w) {
	int index,j;
	int colOne[4], colTwo[4], colThree[4], colFour[4];
	index = i * 4;
	splitIntToArray(w[index], colOne);
	splitIntToArray(w[index + 1], colTwo);
	splitIntToArray(w[index + 2], colThree);
	splitIntToArray(w[index + 3], colFour);

	getArrayFrom4W_label21:for(j = 0; j < 4; j++) {
		array[j][0] = colOne[j];
		array[j][1] = colTwo[j];
		array[j][2] = colThree[j];
		array[j][3] = colFour[j];
	}

}


void deAes_return(char *c, int clen, int *w) {
	int cArray[4][4];
	int keylen,k;


	deAes_return_label24:for(k = 0; k < clen; k += 16) {
		int i;
		int wArray[4][4];

		convertToIntArray(c + k, cArray);
		addRoundKey(cArray, 10, w);

		deAes_return_label22:for(i = 9; i >= 1; i--) {
			deSubBytes(cArray);

			deShiftRows(cArray);

			deMixColumns(cArray);

			getArrayFrom4W(i, wArray, w);
			deMixColumns(wArray);

			addRoundTowArray(cArray, wArray);
		}

		deSubBytes(cArray);

		deShiftRows(cArray);

		addRoundKey(cArray, 0, w);

		convertArrayToStr(cArray, c + k);

	}

}



void AES_En_De(hls::stream<ap_uint<8>> &in_data, hls::stream<ap_uint<8>> &out_data, ap_uint<1> op, ap_uint<8> *key)
{

	int char_len = 16;
	int En_Decryption = op;
	int i,r;
	char bit128in_buffer[16];
	char temp_key[16];
	my_stream_type input, output;

	int w[44];

#pragma HLS ARRAY_PARTITION variable=bit128in_buffer cyclic factor=16 dim=1

	for(r=0; r<char_len; r++){
#pragma HLS UNROLL
		bit128in_buffer[r] = (char)(in_data.read());
	}


	char key_change_flag = 0;
	char key_char[16];

	for(i = 0;i<16;i++)
	{
#pragma HLS PIPELINE rewind
		key_char[i] = (char)key[i];
		if(temp_key[i]!=(char)key[i])
		{
			temp_key[i]=(char)key[i];
			key_change_flag = 1;
		}
	}

	if(key_change_flag==1)
	{
		extendKey(key_char, w); //////////////////////////HERE NEED ADD W
	}


	if(En_Decryption == 0)
	{
		aes_return(bit128in_buffer, char_len, w); //////////////////////////HERE NEED ADD W
	}
	else
	{
		deAes_return(bit128in_buffer, char_len, w); //////////////////////////HERE NEED ADD W
	}



	for(r = 0; r<char_len; r++){
#pragma HLS UNROLL
		out_data << (int)bit128in_buffer[r];
	}


}




///////////////////////////////////////////////////////////
//////////////////////////AES128///////////////////////////
///////////////////////////////////////////////////////////

void TOP(ap_uint<8> *in1,  ap_uint<8> *out, FIXED_LEN *CHANNEL_R, FIXED_LEN *CHANNEL_I, FIXED_LEN *NOISE) {
#pragma HLS INTERFACE m_axi port = in1 bundle = gmem0
#pragma HLS INTERFACE m_axi port = out bundle = gmem0
#pragma HLS INTERFACE m_axi port = CHANNEL_R bundle = gmem1
#pragma HLS INTERFACE m_axi port = CHANNEL_I bundle = gmem2
#pragma HLS INTERFACE m_axi port = NOISE bundle = gmem3

    static hls::stream<ap_uint<8>> in1_stream("input_stream_1");

    static hls::stream<FIXED_LEN> NOISE_stream("NOISE_stream");
    static hls::stream<FIXED_LEN> CHANNEL_R_stream("CHANNEL_R_stream");
    static hls::stream<FIXED_LEN> CHANNEL_I_stream("CHANNEL_I_stream");


    static hls::stream<ap_uint<8>> AES_EN_out("AES_EN_out");


    static hls::stream<FIXED_LEN> xr("xr");
    static hls::stream<FIXED_LEN> xi("xi");
    static hls::stream<FIXED_LEN> H_real("H_real");
	static hls::stream<FIXED_LEN> H_imag("H_imag");
	static hls::stream<FIXED_LEN> Q("Q");
	static hls::stream<FIXED_LEN> R("R");
	static hls::stream<FIXED_LEN> H_real_spl0("H_real_spl0");
	static hls::stream<FIXED_LEN> H_real_spl1("H_real_spl1");
	static hls::stream<FIXED_LEN> H_imag_spl0("H_imag_spl0");
	static hls::stream<FIXED_LEN> H_imag_spl1("H_imag_spl1");
	static hls::stream<FIXED_LEN> channel_out("channel_out");
	static hls::stream<FIXED_LEN> noise_out("noise_out");
	static hls::stream<FIXED_LEN> MULQ_out("MULQ_out");
	static hls::stream<FIXED_LEN> KB_out("KB_out");
	static hls::stream<ap_uint<8>> demod_out("demod_out");


	static hls::stream<ap_uint<8>> AES_DE_out("AES_DE_out");
	static ap_uint<8> key[16] = { 0x87, 0x13, 0x11, 0x30,
								  0x51, 0x87, 0x09, 0xad,
								  0xcf, 0x1b, 0x66, 0xca,
								  0xaa, 0xc5, 0x15, 0xb0 };



    static hls::stream<ap_uint<8>> out_stream("output_stream");
    static ap_uint<1> op_en = 0;
    static ap_uint<1> op_de = 1;
#pragma HLS dataflow
    // dataflow pragma instruct compiler to run following three APIs in parallel
    load_input(in1, in1_stream);
    load_CHANNEL(CHANNEL_R, CHANNEL_R_stream);
    load_CHANNEL(CHANNEL_I, CHANNEL_I_stream);
    load_NOISE(NOISE, NOISE_stream);
    AES_En_De(in1_stream, AES_EN_out, op_en, key);
    Modulation(AES_EN_out, xr, xi);
    Rayleigh(H_real, H_imag, CHANNEL_R_stream, CHANNEL_I_stream);
    split(H_real, H_real_spl0, H_real_spl1);
    split(H_imag, H_imag_spl0, H_imag_spl1);
    QRD(H_real_spl1, H_imag_spl1, Q, R);
    channel_mult(H_real_spl0, H_imag_spl0, xr, xi, channel_out);
    AWGN(channel_out, noise_out, NOISE_stream);
    matrix_mult(Q, noise_out, MULQ_out);
    KBEST(R, MULQ_out, KB_out);
    DeModulation(KB_out, demod_out);
    AES_En_De(demod_out, AES_DE_out, op_de, key);
    store_result(out, AES_DE_out);

}
}
