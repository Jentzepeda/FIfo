/******************************************************************************
***                                                                         ***
*** Ece 527L Experiment #4                      German Zepeda, Spring 2019  ***
*** Experiment #4, FIFO							                            ***
*******************************************************************************
*** Filename: binar_to_gray.sv	                                            ***
***                                                                         ***
*** This file describes a binary to gray converter                          ***
*******************************************************************************
*/
`timescale 1ns/10ps
module binary_to_gray#( SIZE=4 )(
    input        [SIZE-1:0]	binary_in,

    output logic [SIZE-1:0] gray_out
);

// combinationaly converts binary to gray code
always_comb begin : proc_convert
	gray_out = 0;
	for (int i = 0; i < SIZE-1; i++) 
	begin
		gray_out[i] = binary_in[i]^binary_in[i+1];
	end
		gray_out[SIZE-1] = binary_in[SIZE-1];
end
endmodule
