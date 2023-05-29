/*******************************************************************************
*** Filename: AlmostEmptyGen.sv                                              ***
***                                                                          ***
*** this file generate the almost empty flag                                  ***
********************************************************************************
*/

`timescale 1ps/1ps

module AlmostEmptyGen
#(
SIZE=4
)
(
input	[SIZE-1:0]	w_gray_pointer,
input	[SIZE-1:0]	r_bin_pointer,
output				ae_flag
);

//wires
wire [SIZE-1:0] w_bin_pointer;
//modules

//convert gray to binary
GrayToBin #(.SIZE(SIZE)) read_bin 
(
.gray_in(w_gray_pointer),
.bin_out(w_bin_pointer)
);

//gets binary values n-1 and converts sets almost emptyflag 
AlmostEmpty #(.SIZE(SIZE)) ae_ful
(
.r_pointer(r_bin_pointer[SIZE-1:0]),//bin
.w_pointer(w_bin_pointer[SIZE-1:0]),//bin
.ae_flag(ae_flag)
); 

endmodule