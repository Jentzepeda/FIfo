/******************************************************************************
***                                                                         ***
*** Ece 527L Experiment #4                      German Zepeda, Spring 2019  ***
*** Experiment #4, FIFO							    ***
*******************************************************************************
*** Filename: BinToGray.sv	                                            ***
***                                                                         ***
*** This file describes a binary to gray converter                          ***
*******************************************************************************
*/
`timescale 1ns/10ps
module BinToGray(
	bin_in,
	gray_out
	);

//parameter
	parameter SIZE = 4;
//inputs
	input [SIZE-1:0] bin_in;
//outputs
	output [SIZE-1:0] gray_out;
//reg
	reg [SIZE-1:0] gray_out;

//program combinationaly converts binary to gray code

	always_comb begin : proc_convert
		for (int i = SIZE; i > 0; i--) begin
			 gray_out[i-1]=bin_in[i]^bin_in[i-1];
		gray_out[SIZE-1]=bin_in[SIZE-1];
		end
	end
endmodule
