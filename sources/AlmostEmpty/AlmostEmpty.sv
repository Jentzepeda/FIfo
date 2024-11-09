/***********************************************************
*** Filename: AlmostEmpty.sv    						 ***
***                                                      ***
*** this file generats the almost empty flag 		     ***
************************************************************
*/
`timescale 1ps/1ps
module AlmostEmpty
#(
SIZE=4
)
(
//inputs
input	[SIZE-1:0]	r_pointer,
input	[SIZE-1:0]	w_pointer,
//outputs
output				ae_flag
);

// logic
logic ae_flag;
	
//always block
always_comb 
begin
	ae_flag =0;
	if(w_pointer-r_pointer<10)//TODO fix this if statment to be a parameter
	begin
		ae_flag =1;
	end 
end
endmodule	
	
