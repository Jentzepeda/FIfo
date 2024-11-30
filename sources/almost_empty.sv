/***********************************************************
*** Filename: AlmostEmpty.sv    						 ***
***                                                      ***
*** this file generats the almost empty flag 		     ***
************************************************************
*/
`timescale 1ps/1ps
module almost_empty #(
    SIZE               = 4,
    ALMOST_EMPTY_VALUE = 10)
(
    input [SIZE-1:0] read_pointer,
    input [SIZE-1:0] write_pointer,

    output logic     almost_empty_flag
);
	
//always block
always_comb begin
	almost_empty_flag = 0;
	if ( write_pointer-read_pointer < ALMOST_EMPTY_VALUE - 1 ) begin
        almost_empty_flag = 1;
	end 
end
endmodule	
	
