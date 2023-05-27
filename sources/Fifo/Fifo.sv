/******************************************************************************
***                                                                         ***
*** Ece 527L Experiment #4                      German Zepeda, Spring 2019  ***
*** Experiment #4, FIFO                                                     ***
*******************************************************************************
*** Filename: Fifo.sv                                                       ***
***                                                                         ***
*** This file is the fifo...ya 						           				***
*******************************************************************************
*/

`timescale 1ps/1ps

module Fifo
#(
	SIZE=8,//length of the data 
	DEPTH=4	//length of the address
)
(
input				w_clk,//write clock input
input				r_clk,//read clock input
input				n_rst,//rest
input				valid_write,//valid write data
input	[SIZE-1:0]	data_in,//data in from write clock
output	[SIZE-1:0]	data_out,//output from Ram
output				f_flag,//full flag output
output				e_flag,//empty flag output
output				almost_full_flag//almost full flag
);

//wires
wire r_rst, w_rst;
wire [(DEPTH+1)-1:0] rd_adb,wr_adb;
wire [(DEPTH+1)-1:0] w_gray,r_gray;

//modules
FullGen #(.SIZE(DEPTH+1)) full 
(
.w_clk(w_clk),
.n_rst(w_rst),
.r_gray_pointer(r_gray),
.w_count(wr_adb),
.w_gray(w_gray),
.valid_write(valid_write),
.f_flag(f_flag),
.a_flag(almost_full_flag)
);

EmptyGen #(.SIZE(DEPTH+1)) empty 
(
.r_clk(r_clk),
.n_rst(r_rst),
.w_gray_pointer(w_gray),
.r_count(rd_adb),
.r_gray(r_gray),
.e_flag(e_flag)
);


Ram #(.WIDTH(SIZE),.DEPTH(DEPTH)) ram 
(
.clk(w_clk),
.wr_ena(f_flag),
.valid_write(valid_write),
.rd_ena(e_flag),
.rd_adb(rd_adb[DEPTH-1:0]),
.wr_adb(wr_adb[DEPTH-1:0]),
.wr_data(data_in),
.rd_data(data_out)
);

AASD w_AASD 
(
.CLK(w_clk),
.RST(n_rst),
.AASDR(w_rst)
);

AASD r_AASD 
(
.CLK(r_clk),
.RST(n_rst),
.AASDR(r_rst)
);

endmodule