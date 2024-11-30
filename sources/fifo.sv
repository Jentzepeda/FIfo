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

module fifo#(
	SIZE=8,//length of the data 
	DEPTH=4	)(
    input			  write_clock,//write clock input
    input			  read_clock,//read clock input
    input			  reset_n,//rest
    input			  valid_write,//valid write data
    input  [SIZE-1:0] data_in,//data in from write clock

    output [SIZE-1:0] data_out,//output from Ram
    output			  full_flag,//full flag output
    output			  empty_flag,//empty flag output
    output			  almost_empty_flag,//almost empty flag output
    output			  almost_full_flag//almost full flag
);

logic                 read_reset_n;
logic                 write_reset_n;
logic [(DEPTH+1)-1:0] read_address;
logic [(DEPTH+1)-1:0] write_address;
logic [(DEPTH+1)-1:0] write_gray;
logic [(DEPTH+1)-1:0] read_gray;

//modules
full_gen #(.SIZE(DEPTH+1)) full_gen_inst (
    .write_clock       (write_clock),
    .reset_n           (write_reset_n),
    .read_gray_pointer (read_gray),
    .valid_write       (valid_write),

    .write_count       (write_address),
    .write_gray        (write_gray),
    .full_flag         (full_flag),
    .almost_full_flag  (almost_full_flag)
);

empty_gen #(.SIZE(DEPTH+1)) empty (
    .read_clock         (read_clock),
    .reset_n            (read_reset_n),
    .write_gray_pointer (write_gray),
    
    .read_count         (read_address),
    .read_gray          (read_gray),
    .almost_empty_flag  (almost_empty_flag),
    .empty_flag         (empty_flag)
);


ram #(.WIDTH(SIZE),.DEPTH(DEPTH)) ram (
    .clock          (write_clock),
    .write_enable   (full_flag),
    .valid_write    (valid_write),
    .read_enable    (empty_flag),
    .read_address   (read_address[DEPTH-1:0]),
    .write_address  (write_address[DEPTH-1:0]),
    .write_data     (data_in),

    .read_data      (data_out)
);

aasd_reset write_aasd_reset_inst (
    .clock      (write_clock),
    .reset_n    (reset_n),

    .aasd_reset (write_reset_n)
);

aasd_reset read_aasd_reset_inst (
    .clock      (read_clock),
    .reset_n    (reset_n),

    .aasd_reset (read_reset_n)
);

endmodule
