/******************************************************************************
***                                                                         ***
*** Ece 527L Experiment #4                      German Zepeda, Spring 2019  ***
*** Experiment #4, FIFO                                                     ***
*******************************************************************************
*** Filename: Empty.sv                                                      ***
***                                                                         ***
*** This file does the empty flag check/comparator   			    ***
*******************************************************************************
*/
`timescale 1 ps/1ps
module Empty
#(
	SIZE=4
)
(
input	[SIZE-1:0]	r_pointer,
input	[SIZE-1:0]	w_pointer,
output				e_flag
);

//logic 
logic e_flag;

//always block
always_comb 
begin
    e_flag = 0;
	if(r_pointer==w_pointer)
	begin
		e_flag	= 1;
	end 
end
endmodule
