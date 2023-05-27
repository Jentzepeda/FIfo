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
module Ram
#(
	DEPTH =8,
	WIDTH  =4
)
(
input				clk,
input				wr_ena,
input				rd_ena,
input				valid_write,
input	[DEPTH-1:0]	rd_adb,
input	[DEPTH-1:0]	wr_adb,
input	[WIDTH-1:0]	wr_data,
output	[WIDTH-1:0]	rd_data
);

//reg
reg [(WIDTH-1):0] rd_data;
reg [(WIDTH-1):0] RAM [0:(2**DEPTH)-1];

//always block

always@(posedge clk)
begin
	if(!wr_ena && valid_write)
	begin
		RAM[wr_adb]	<= wr_data;
	end 
	else 
	begin
		RAM[wr_adb]	<= RAM[wr_adb];
	end
end

always_comb 
begin//make this output high z when its failled
	rd_data	=(!rd_ena) ? RAM[rd_adb]:'bz;
end
endmodule	