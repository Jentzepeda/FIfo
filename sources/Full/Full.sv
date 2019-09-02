/*******************************************************************************
*** 527L Experiment #4                      German Zepeda, Spring 2019       ***
*** Experiment #4, FIFO                                                      ***
********************************************************************************
*** Filename: Full.sv 	                                                     ***
***                                                                          ***
*** This fule does the full flag function                                    ***
********************************************************************************
*/
`timescale 1ps/1ps
module Full(
	w_pointer,
	r_pointer,
	f_flag
	);

//parameter
parameter SIZE =4;

//inputs 
input [SIZE-1:0] w_pointer;
input [SIZE-1:0] r_pointer;

//output
output f_flag;

//reg
reg f_flag;
reg [SIZE-1:0] mod_w_pointer;
reg [SIZE-1:0] mod_r_pointer;

//always block
	always_comb begin
		mod_w_pointer	= {w_pointer[SIZE-1],
					(w_pointer[SIZE-1]^w_pointer[SIZE-2])
					,w_pointer[SIZE-3:0]};
		mod_r_pointer	= {r_pointer[SIZE-1],
					(r_pointer[SIZE-1]^r_pointer[SIZE-2])
					,r_pointer[SIZE-3:0]};
	end

	always_comb begin
		if(mod_w_pointer[SIZE-1] !=	mod_r_pointer[SIZE-1] &&
		 mod_w_pointer[SIZE-2:0] ==	mod_r_pointer[SIZE-2:0])begin	
			f_flag	=1'b1;

		end else begin
			f_flag	=1'b0;
		end
	end

endmodule	
