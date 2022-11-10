#include <stdio.h>
#include "xparameters.h"
#include "xil_io.h"
#include "sleep.h"

#define axi_reg_baseaddr 0x44A00000
#define uart_baseaddr    0x40000000

int main()
{
	u32 frame_speed = 0;
		u32 reg_value = 0;
		u32 frame_mode = 0;
		while(1)
		{
			frame_speed = Xil_In32(axi_reg_baseaddr);
			while((reg_value & 0x4)==0)
			//while((reg_value & 0x1)==0)
			{
				reg_value = Xil_In32(uart_baseaddr+0x8);
			}
			  Xil_Out32(uart_baseaddr+0x4,frame_speed);
			  reg_value = Xil_In32(uart_baseaddr+0x8);
			  sleep(1);
			  if((reg_value & 0x1)==1)
			  {
				  reg_value = Xil_In32(uart_baseaddr+0x8);
				  frame_mode = Xil_In32(uart_baseaddr);
				  Xil_Out32(uart_baseaddr+0xC,0x2);
				  Xil_Out32(axi_reg_baseaddr+0x8,frame_mode);
				  Xil_Out32(axi_reg_baseaddr+0x4,0x1);
				  Xil_Out32(axi_reg_baseaddr+0x4,0x0);
			  }
			  else
			  {}



		}

	return 0;
}
