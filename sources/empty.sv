/******************************************************************************
***                                                                         ***
*** Ece 527L Experiment #4                      German Zepeda, Spring 2019  ***
*** Experiment #4, FIFO                                                     ***
*******************************************************************************
*** Filename: Empty.sv                                                      ***
***                                                                         ***
*** This file does the empty flag check/comparator   			            ***
*******************************************************************************
*/
`timescale 1 ps/1ps
module empty #( SIZE=4 )(
    input [SIZE-1:0] read_pointer,
    input [SIZE-1:0] write_pointer,

    output logic     empty_flag
);

//always block
always_comb begin
    empty_flag = 0;
	if (read_pointer == write_pointer) begin
        empty_flag = 1;
	end 
end
endmodule
