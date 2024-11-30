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

module empty_gen #( SIZE=4 )(
    input             read_clock,
    input			  reset_n,
    input  [SIZE-1:0] write_gray_pointer,

    output [SIZE-1:0] read_count,//output to ram
    output [SIZE-1:0] read_gray,//this goes to other clock domain
    output            almost_empty_flag,//output of almost empty flag
    output            empty_flag//this goes to ram and other things?
);

logic [SIZE-1:0] write_sync_pointer;

//this does the binary counter
counter #(.SIZE(SIZE)) counter_inst(
    .clock   (read_clock),
    .reset_n (reset_n),
    .flag    (empty_flag),
    .valid   (1'b1),

    .count   (read_count)
);

//this should convert gray read clock side
binary_to_gray #(.SIZE(SIZE)) gray_inst (
    .binary_in (read_count),

    .gray_out  (read_gray)
);

//this should syn gray from write side
sync #(.SIZE(SIZE)) write_sync_inst (
    .clock    (read_clock),
    .data_in  (write_gray_pointer),

    .data_out (write_sync_pointer)
);

//does the comparison
empty #(.SIZE(SIZE)) read_empty_inst (
    .read_pointer  (read_gray),//gray
    .write_pointer (write_sync_pointer),//gray

    .empty_flag    (empty_flag)
);


almost_empty_gen#(.SIZE(SIZE)) almost_empty_inst(
    .write_gray_pointer (write_sync_pointer),//should be w_sync
    .read_bin_pointer   (read_count),
    .almost_empty_flag  (almost_empty_flag)
);

endmodule
