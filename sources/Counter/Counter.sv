/******************************************************************************
***                                                                         ***
*** Ece 527L Experiment #4                      German Zepeda, Spring 2019  ***
*** Experiment #4, FIFO							    ***
*******************************************************************************
*** Filename: Counter.sv	                                            ***
***                                                                         ***
*** This file describes an up counter					    ***
*******************************************************************************
*/
`timescale 1ns/10ps
module Counter
#(
SIZE=4
)
(
input					clk,
input					n_rst,
input					flag,//this should be a negative flag
input					valid,
output reg [SIZE-1:0]	count
);

always@(posedge clk or negedge n_rst)
begin
	if(!n_rst)
	begin
		count<=0;
	end
	else if(!flag &&valid )
	begin
		count<=count+1;
	end 
	else 
	begin
		count<=count;
	end
end
endmodule 