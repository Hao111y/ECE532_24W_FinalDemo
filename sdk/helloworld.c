/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include <stdint.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "microblaze_sleep.h"

#define HSV_H_HIGH 330
#define HSV_H_LOW 30
#define HSV_S 70
#define HSV_V 90
#define HSV_LOOP_NUMBER 20

/*
 *
 * HEADER
 *
 */

void writeHSVThresh();

typedef struct Position {
	int x;
	int y;
	int z;
} Position;

typedef struct RenderingResults {
	int show; // 1 bit
	int sprite_ix; // 3 bits
	int z; // 16 bits
	int x; // 0 to 320
	int y; // 0 to 240
	int pixel_count; // 0 to 240
} RenderingResults;

void readBallPosition(Position*);
void readPlayerPaddlePosition(Position*);
void generateAIPaddlePosition(Position*, Position*);
void calculateRenderingResults(RenderingResults*, Position*, Position*, Position*);
void writeRenderingResults(RenderingResults res[5]);
void testPhys();
void calculateRenderingFromPosition(RenderingResults*, Position*, int, int);

volatile unsigned int* phyBaseAddr = (unsigned int*) XPAR_PHYSICS_CORE_0_S00_AXI_BASEADDR;

/*
 *
 * Code
 *
 */

void writeHSVThresh() {
	volatile unsigned int* hsv_data = (unsigned int*) XPAR_MICROBLAZE_HIER_AXI_GPIO_HSV_DATA_BASEADDR;
	volatile unsigned int* hsv_type = (unsigned int*) XPAR_MICROBLAZE_HIER_AXI_GPIO_HSV_TYPE_BASEADDR;
	volatile unsigned int* hsv_vld = (unsigned int*) XPAR_MICROBLAZE_HIER_AXI_GPIO_HSV_VLD_BASEADDR;

    xil_printf("Start HSV Range configuration\n\r");
    //set HSV H high value
    for(int i = 0; i < HSV_LOOP_NUMBER; i++){
    	*(hsv_data) = HSV_H_HIGH;
		*(hsv_type) = 0;
		*(hsv_vld) = 1;
    }
    for(int i = 0; i < HSV_LOOP_NUMBER; i++){
    	*(hsv_vld) = 0;
    }
    xil_printf("Set HSV H high value = %d \n\r",HSV_H_HIGH);

    //set HSV H low value
    for(int i = 0; i < HSV_LOOP_NUMBER; i++){
    	*(hsv_data) = HSV_H_LOW;
    	*(hsv_type) = 1;
    	*(hsv_vld) = 1;
    }
	for(int i = 0; i < HSV_LOOP_NUMBER; i++){
		*(hsv_vld) = 0;
	}
	xil_printf("Set HSV H low value = %d \n\r",HSV_H_LOW);
	//set HSV S value

	for(int i = 0; i < HSV_LOOP_NUMBER; i++){
			*(hsv_data) = HSV_S;
			*(hsv_type) = 2;
			*(hsv_vld) = 1;
		}
	for(int i = 0; i < HSV_LOOP_NUMBER; i++){
		*(hsv_vld) = 0;
	}
	xil_printf("Set HSV S value = %d \n\r",HSV_S);
	//set HSV V value

	for(int i = 0; i < HSV_LOOP_NUMBER; i++){
			*(hsv_data) = HSV_V;
			*(hsv_type) = 3;
			*(hsv_vld) = 1;
		}
	for(int i = 0; i < HSV_LOOP_NUMBER; i++){
		*(hsv_vld) = 0;
	}

	*(hsv_vld) = 0;
	xil_printf("Set HSV V value = %d \n\r",HSV_V);
    xil_printf("Finish HSV Range configuration\n\r");
}

void setupBallReset() {
	*(phyBaseAddr + 0x2) = 0 << 8;    // X Coord
	*(phyBaseAddr + 0x3) = 1370 << 8; // Y Coord
	*(phyBaseAddr + 0x4) = 840 << 8;  // Z Coord

	*(phyBaseAddr + 0x5) = 4;         // X Velocity
	*(phyBaseAddr + 0x6) = -205;      // Y Velocity
	*(phyBaseAddr + 0x7) = 0;         // Z Velocity
}

void inline readBallPosition(Position* pos) {
	pos->x = *(phyBaseAddr + 0x14);
	pos->x = (pos->x & 0x007FFFFF) - (pos->x & 0x00800000);
	pos->x >>= 8;

	pos->y = *(phyBaseAddr + 0x16);
	pos->y = (pos->y & 0x007FFFFF) - (pos->y & 0x00800000);
	pos->y >>= 8;

	pos->z = *(phyBaseAddr + 0x15);
	pos->z = (pos->z & 0x007FFFFF) - (pos->z & 0x00800000);
	pos->z >>= 8;
}

void inline readPlayerPaddlePosition(Position* pos) {
	pos->x = *(phyBaseAddr + 0x8);
	pos->x = (pos->x & 0x007FFFFF) - (pos->x & 0x00800000);
	pos->x >>= 8;

	pos->y = *(phyBaseAddr + 0xA);
	pos->y = (pos->y & 0x007FFFFF) - (pos->y & 0x00800000);
	pos->y >>= 8;

	pos->z = *(phyBaseAddr + 0x9);
	pos->z = (pos->z & 0x007FFFFF) - (pos->z & 0x00800000);
	pos->z >>= 8;
}

#define MAX_VELOCITY 20
#define AI_Z 2720

void generateAIPaddlePosition(Position* ai, Position* ball) {
	int delta = (ball->x - ai->x) >> 1;
	if(delta > MAX_VELOCITY)
		delta = MAX_VELOCITY;
	if(delta < -MAX_VELOCITY)
		delta = -MAX_VELOCITY;
	ai->x += delta;

	delta = (ball->y - ai->y) >> 1;
	if(delta > MAX_VELOCITY)
		delta = MAX_VELOCITY;
	if(delta < -MAX_VELOCITY)
		delta = -MAX_VELOCITY;
	ai->y += delta;

	ai->z = AI_Z;
}

void inline calculateRenderingFromPosition(RenderingResults* res, Position* pos, int alpha, int beta) {
	float camera_pos[3]; // {x, y, z, 1}
	camera_pos[0] = pos->x;
	camera_pos[1] = pos->y * 0.214 + pos->z * 0.977 - 1113.8;
	camera_pos[2] = pos->y * 0.977 + pos->z * -0.214 + 2394.1;

	int image_pos[2] = {
		(879 * camera_pos[0] / 2) / camera_pos[2] + 160,
		-(879 * camera_pos[1] / 2) / camera_pos[2] + 120
	};

	res->z = ((int) camera_pos[2]) >> 3;

	res->pixel_count = (64 << (beta - 1)) / ((res->z & 0xFFFF) * alpha);

	res->x = image_pos[0] - res->pixel_count / 2;
	res->y = image_pos[1] - res->pixel_count / 2;

}

const RenderingResults table_res = (RenderingResults) {1, 0, 450, 11, 98, 97};
const RenderingResults net_res = (RenderingResults) {0, 1, 450, 11, 98, 97};

void inline calculateRenderingResults(RenderingResults res[5], Position* ball, Position* player, Position* ai) {
	RenderingResults ball_res = (RenderingResults){1, 4, 0, 0, 0, 0};
	calculateRenderingFromPosition(&ball_res, ball, 24, 11);

	RenderingResults player_paddle_res = (RenderingResults){1, 2, 0, 0, 0, 0};
	calculateRenderingFromPosition(&player_paddle_res, player, 26, 13);

	RenderingResults ai_paddle_res = (RenderingResults){1, 3, 0, 0, 0, 0};
	calculateRenderingFromPosition(&ai_paddle_res, ai, 26, 13);

	res[0] = net_res;
	res[1] = ai_paddle_res;
	if(ball->y > 2740) {
		res[2] = ball_res;
		res[3] = table_res;
	} else {
		res[2] = table_res;
		res[3] = ball_res;
	}
	res[4] = player_paddle_res;


}

volatile unsigned int* renderingBaseAddr = (unsigned int*) XPAR_GRAPHICS_PACKAGED_0_BASEADDR;

#define Z_START ((0xB << 16) + 200)
void writeRenderingResults(RenderingResults res[5]) {
//	int x = 0;
//	int z = Z_START;
//	int pixel_count;
//	while(1) {
//		x += 1;
//		z += 1;
//
//		if(x == 280) {
//			x = 0;
//		}
//		if((z & 0xFFFF) > 500) {
//			z = Z_START;
//		}
//
//		pixel_count = (64 << 12) / ((z & 0xFFFF) * 26);
//		xil_printf("pixel_count: %d \n", pixel_count);
//		*(renderingBaseAddr + 0x10) = z; // x[4]
//		*(renderingBaseAddr + 0x11) = x; // x[4]
//
//		*(renderingBaseAddr + 0x13) = pixel_count;
//		MB_Sleep(50);
//	}

	for(int i = 0; i < 5; i++) {
		*(renderingBaseAddr + 0x0 + 4 * i) = res[i].show << 19 | res[i].sprite_ix << 16 | res[i].z;
		*(renderingBaseAddr + 0x1 + 4 * i) = res[i].x;
		*(renderingBaseAddr + 0x2 + 4 * i) = res[i].y;
		*(renderingBaseAddr + 0x3 + 4 * i) = res[i].pixel_count;
	}
 }

void testPhys() {
   //test begin----------------------------------
	volatile unsigned int* xaddr = (unsigned int*) XPAR_PHYSICS_CORE_0_S00_AXI_BASEADDR;
	int data;
	for(int i = 0; i <= 0x1B; i++){
		xil_printf("address value = 0x%x \n\r",(xaddr+i));
		data = *(xaddr+i);
		xil_printf("data default value = %d \n\r",data);
	}
	xil_printf("data default value loop done! \n\r");
	for(int i = 0; i <= 0x8; i++){
		xil_printf("address value = 0x%x \n\r",(xaddr+i));
		*(xaddr+i) = i+2;
		xil_printf("write value = %d in this address\n\r",(i+2));
	}
	xil_printf("data value write loop done! \n\r");
	for(int i = 0; i <= 0x1B; i++){
		xil_printf("address value = 0x%x \n\r",(xaddr+i));
		data = *(xaddr+i);
		xil_printf("data new value = %d \n\r",data);
	}
	xil_printf("data value read loop done! \n\r");
	//test end------------------------------------


//		volatile unsigned int* xaddr = (unsigned int*) XPAR_PHYSICS_CORE_0_S00_AXI_BASEADDR;
//		int data;
//		int addr;
//		addr = 6;
//		xil_printf("address value = 0x%x \n\r",(xaddr+addr));
//		data = *(xaddr+addr);
//		xil_printf("data default value = %d \n\r",data);
//		*(xaddr+addr) = 21;
//		xil_printf("write value = %d in this address\n\r",21);
//		data = *(xaddr+addr);
//		xil_printf("data new value = %d \n\r",data);
//		*(xaddr+addr) = 0;
//		xil_printf("write value = %d in this address\n\r",0);
//		data = *(xaddr+addr);
//		xil_printf("data new value = %d \n\r",data);
}

int main()
{
    init_platform();

#if 0
    xil_printf("Writing\n");
    writeRenderingResults(NULL);
    xil_printf("Done\n");
#else

    writeHSVThresh();

    Position ball, player, ai;
    RenderingResults res[5];

    ai = (Position) {0, 0, 0}; // TODO: Figure out correct initialization
    setupBallReset();

    *(phyBaseAddr + 0x1) = 1;
    *(phyBaseAddr + 0x1) = 0;
    *(phyBaseAddr) = 1;
    int counter = 0;
    while(++counter) {
    	readBallPosition(&ball);
//    	xil_printf("Ball (%d, %d, %d)\n", ball.x, ball.y, ball.z);

    	readPlayerPaddlePosition(&player);
//    	player = (Position) {0, 0, 790};
    	xil_printf("Player (%d, %d, %d)\n", player.x, player.y, player.z);

//    	generateAIPaddlePosition(&ai, &ball);
    	ai = (Position) {0, 2750, 790};
//    	xil_printf("AI (%d, %d, %d)\n", ai.x, ai.y, ai.z);

//    	if(!*(phyBaseAddr + 0x1B)) {
//    		break;
//    	}
    	calculateRenderingResults(res, &ball, &player, &ai);

    	for(int i = 0; i < 5; i++) {
//    		xil_printf(
//    			"show: %d, sprite_ix: %d, x: %d, y: %d, z: %d, pixel_count: %d\n",
//    			res[i].show,
//				res[i].sprite_ix,
//				res[i].x,
//				res[i].y,
//				res[i].z,
//				res[i].pixel_count
//			);
    	}
    	writeRenderingResults(res);

//    	if(counter > 2)
//    		break;
    }
#endif

    cleanup_platform();
    return 0;
}
