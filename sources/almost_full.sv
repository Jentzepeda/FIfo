/*******************************************************************************
*** 527L Experiment #4                      German Zepeda, Spring 2019       ***
*** Experiment #4, FIFO                                                      ***
********************************************************************************
*** Filename: almost_full.sv    						                     ***
***                                                                          ***
*** this file generats the almost full flag 				                 ***
********************************************************************************
*/

`timescale 1ps/1ps
module almost_full #( 
    SIZE              = 4,
    ALMOST_FULL_VALUE = 9)
(
    input [SIZE-1:0] write_pointer,
    input [SIZE-1:0] read_pointer,

    output logic     almost_full_flag
);
	
always_comb begin
    almost_full_flag = 0;
    if ( write_pointer-read_pointer > ALMOST_FULL_VALUE ) begin
        almost_full_flag = 1;
	end 
end

endmodule	
