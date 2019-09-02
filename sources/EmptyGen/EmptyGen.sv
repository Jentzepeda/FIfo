/******************************************************************************
***                                                                         ***
*** Ece 527L Experiment #4                      German Zepeda, Spring 2019  ***
*** Experiment #4, FIFO                                                     ***
*******************************************************************************
*** Filename: EmptyGen.sv                                                   ***
***                                                                         ***
*** This file generats the empty flag and does synchornization              ***
*******************************************************************************
*/

`timescale 1ps/1ps

module EmptyGen(
		r_clk,//input
		n_rst,//input
		w_gray_pointer,//input
		r_count,//output to ram
		r_gray,//this goes to other clock domain
		e_flag//this goes to ram and other things?
		);

//parameter
parameter SIZE =4;

//inputs 
input r_clk,n_rst;

input [SIZE-1:0] w_gray_pointer;

//output
output e_flag;
output [SIZE-1:0] r_count,r_gray;

//wire
wire [SIZE-1:0] w_sync_pointer;


//module

//this does the binary counter
Counter #(.SIZE(SIZE)) count (.clk(r_clk),.n_rst(n_rst),.flag(e_flag),
	.valid(1'b1),.count(r_count));

//this should convert gray read clock side
BinToGray #(.SIZE(SIZE)) gray (.bin_in(r_count),.gray_out(r_gray));

//this hsould syn gray from write side
Sync #(.SIZE(SIZE)) w_syn (.clk(r_clk),.d_in(w_gray_pointer),.d_out(w_sync_pointer));

//does the comparison
Empty #(.SIZE(SIZE)) read_e (.r_pointer(r_gray),.w_pointer(w_sync_pointer),.e_flag(e_flag));

endmodule
