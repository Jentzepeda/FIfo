/******************************************************************************
***                                                                         ***
*** Ece 527L Experiment #4                      German Zepeda, Spring 2019  ***
*** Experiment #4, FIFO                                                     ***
*******************************************************************************
*** Filename: GrayToBin.sv                                                  ***
***                                                                         ***
*** this files converts gray to binary                                      ***
*******************************************************************************
*/

`timescale 1ps/1ps

module GrayToBin
#(
SIZE=4
)
(
input	[SIZE-1:0]	gray_in,
output	[SIZE-1:0]	bin_out	
);

//reg
logic [SIZE-1:0] bin_out;
logic [SIZE-1:0] temp;

//this does gray to binary conversion what ws this even doing lmao
always_comb begin : proc_conver
	bin_out[SIZE-1]=gray_in[SIZE-1];
	temp[SIZE-1]=gray_in[SIZE-1];
	for (int i = SIZE-2; i >= 0; i--)
	 begin
		temp[i]=temp[i+1]^gray_in[i];
	end
	bin_out[SIZE-2:0]=temp[SIZE-2:0];
end
endmodule
