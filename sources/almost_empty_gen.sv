/*******************************************************************************
*** Filename: AlmostEmptyGen.sv                                              ***
***                                                                          ***
*** this file generate the almost empty flag                                  ***
********************************************************************************
*/

`timescale 1ps/1ps

module almost_empty_gen#(SIZE=4)(
    input [SIZE-1:0] write_gray_pointer,
    input [SIZE-1:0] read_bin_pointer,

    output           almost_empty_flag
);

logic [SIZE-1:0] write_binary_pointer;
//modules

//convert gray to binary
gray_to_binary #(.SIZE(SIZE)) gray_to_binary_inst (
    .gray_in    (write_gray_pointer),
    .binary_out (write_binary_pointer)
);

almost_empty #(.SIZE(SIZE)) almost_empty_inst 
(
    .read_pointer      (read_bin_pointer),
    .write_pointer     (write_binary_pointer),
    .almost_empty_flag (almost_empty_flag)
); 

endmodule
