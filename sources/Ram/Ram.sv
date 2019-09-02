/******************************************************************************
***                                                                         ***
*** Ece 527L Experiment #4                      German Zepeda, Spring 2019  ***
*** Experiment #4, FIFO 						    ***
*******************************************************************************
*** Filename: RAM.sv                                                        ***
***                                                                         ***
*******************************************************************************
*/
`timescale 1ps/1ps
module Ram(
	clk,
	wr_ena,
	valid_write,
	rd_ena,
	rd_adb,
	wr_adb,
	wr_data,
	rd_data
	);

//parameter
parameter DEPTH =8;// need to calculate this
parameter WIDTH =5;

//input
input clk;
input wr_ena,rd_ena,valid_write;
input [(WIDTH-1):0] wr_data;
input [(DEPTH-1):0] rd_adb;
input [(DEPTH-1):0] wr_adb;

 //output
output [(WIDTH-1):0] rd_data;

//reg
reg [(WIDTH-1):0] rd_data;
reg [(WIDTH-1):0] RAM [0:(2**DEPTH)-1];

//always block

	always@(posedge clk)begin
		if(!wr_ena && valid_write)begin
			RAM[wr_adb]	<= wr_data;
		end else begin
			RAM[wr_adb]	<= RAM[wr_adb];
		end
	end

	always_comb begin//make this output high z when its failled
		rd_data	=(!rd_ena) ? RAM[rd_adb]:'bz;
	end

endmodule	
