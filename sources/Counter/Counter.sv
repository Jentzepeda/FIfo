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
module Counter(
		clk,
		n_rst,
		flag,//this should be a negative flag
		valid,
		count
		);

//parameter
	parameter SIZE=4; // make pointer 1 bit longer

//inputs
	input clk,n_rst;
	input flag;
	input valid;

//outputs
	output reg [SIZE-1:0] count;

//code
	always@(posedge clk or negedge n_rst)begin
		if(!n_rst)begin
			count<=0;
		end
		else if(!flag &&valid )begin
			count<=count+1;
		end else begin
			count<=count;
		end
	end


endmodule 
