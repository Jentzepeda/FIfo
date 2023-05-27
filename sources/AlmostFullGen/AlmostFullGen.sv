/*******************************************************************************
*** 527L Experiment #4                      German Zepeda, Spring 2019       ***
*** Experiment #4, FIFO                                                      ***
********************************************************************************
*** Filename: AlmostFullGen.sv                                               ***
***                                                                          ***
*** this file generats the almost full flag                                  ***
********************************************************************************
*/

`timescale 1ps/1ps

module AlmostFullGen
#(
SIZE=4
)
(
input	[SIZE-1:0]	r_gray_pointer,
input	[SIZE-1:0]	w_bin_pointer,
output				a_flag
);

//wires
wire [SIZE-1:0] r_bin_pointer;
//modules

//convert gray to binary
GrayToBin #(.SIZE(SIZE)) read_bin 
(
.gray_in(r_gray_pointer),
.bin_out(r_bin_pointer)
);

//gets binary values n-1 and converts sets almost flag 
AlmostFull #(.SIZE(SIZE)) a_ful
(
.w_pointer(w_bin_pointer[SIZE-1:0]),
.r_pointer(r_bin_pointer[SIZE-1:0]),
.a_flag(a_flag)
); 

endmodule
