/*******************************************************************************
*** 527L Experiment #4                      German Zepeda, Spring 2019       ***
*** Experiment #4, FIFO                                                      ***
********************************************************************************
*** Filename: AlmostFull.sv    						     ***
***                                                                          ***
*** this file generats the almost full flag 				     ***
********************************************************************************
*/

`timescale 1ps/1ps
module AlmostFull(
		w_pointer,
		r_pointer,
		a_flag
		);

//paramter
parameter SIZE =4;

//inputs 
input [SIZE-1:0] w_pointer;
input [SIZE-1:0] r_pointer;

//output
output a_flag;

// reg
reg a_flag;
	
//always block
	always_comb begin
		if(w_pointer-r_pointer>9)begin
			a_flag<=1;
		end else begin
			a_flag<=0;
		end
	end

endmodule	
	
