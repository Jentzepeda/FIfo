/******************************************************************************
***                                                                         ***
*** Ece 527L Experiment #4                      German Zepeda, Spring 2019  ***
*** Experiment #4, FIFO                                                     ***
*******************************************************************************
*** Filename: FullGen.sv                                                    ***
***                                                                         ***
*** This files generates the full flag and does synchornization 	    ***
*** this file also gneerats the almost full flag   			    ***
*******************************************************************************
*/

`timescale 1ps/1ps//done by write side

module FullGen
#(
SIZE=4
)
(
input				w_clk,//input
input				n_rst,//input
input				valid_write,//saying this is a valid write
input	[SIZE-1:0]	r_gray_pointer,//input
output	[SIZE-1:0]	w_count,//output to ram 
output	[SIZE-1:0]	w_gray,//output tat goes to other clock
output				f_flag,//this goes to ram 
output				a_flag//this it an output that is sent out
);

//wire
wire [SIZE-1:0] r_sync_pointer;

//modules
//this does the binary counter
Counter #(.SIZE(SIZE)) count 
(
.clk(w_clk),
.n_rst(n_rst),
.flag(f_flag),
.valid(valid_write),
.count(w_count)
);

//this should convert to gray write cloc side 
BinToGray #(.SIZE(SIZE)) gray 
(
.bin_in(w_count),
.gray_out(w_gray)
);

//this should this should sync from read side 
Sync #(.SIZE(SIZE)) r_Sync 
(
	.clk(w_clk),
	.d_in(r_gray_pointer),
	.d_out(r_sync_pointer)
);

//this should get tine synced gray values and does the compaison
Full #(.SIZE(SIZE)) write_f 
(
.w_pointer(w_gray),
.r_pointer(r_sync_pointer),
.f_flag(f_flag)
);

//this should get the 2 gray and convert to binary then do the comaprisons 
AlmostFullGen #(.SIZE(SIZE)) almost_f 
(
.r_gray_pointer(r_sync_pointer),
.w_bin_pointer(w_count),
.a_flag(a_flag)
);


endmodule
