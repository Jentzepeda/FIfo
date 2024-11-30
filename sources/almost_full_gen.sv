/*******************************************************************************
*** 527L Experiment #4                      German Zepeda, Spring 2019       ***
*** Experiment #4, FIFO                                                      ***
********************************************************************************
*** Filename: almost_full_gen.sv                                             ***
***                                                                          ***
*** this file generats the almost full flag                                  ***
********************************************************************************
*/

`timescale 1ps/1ps

module almost_full_gen#( SIZE=4 )
(
    input [SIZE-1:0] read_gray_pointer,
    input [SIZE-1:0] write_binary_pointer,

    output           almost_full_flag
);

logic [SIZE-1:0] read_binary_pointer;

//convert gray to binary
gray_to_binary #(.SIZE(SIZE)) gray_to_bin_inst (
    .gray_in    (read_gray_pointer),
    .binary_out (read_binary_pointer)
);

//gets binary values n-1 and converts sets almost flag 
almost_full #(.SIZE(SIZE)) almost_full_inst (
    .write_pointer    (write_binary_pointer),
    .read_pointer     (read_binary_pointer),
    .almost_full_flag (almost_full_flag)
); 

endmodule
