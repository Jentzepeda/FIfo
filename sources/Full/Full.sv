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
module Full
#(
	SIZE=4
)
(
input	[SIZE-1:0]	w_pointer,
input	[SIZE-1:0]	r_pointer,
output				f_flag
);

//reg
reg f_flag;
reg [SIZE-1:0] mod_r_pointer,mod_w_pointer;

//always block
always_comb 
begin
	mod_w_pointer	= {w_pointer[SIZE-1],
		(w_pointer[SIZE-1]^w_pointer[SIZE-2]),
			w_pointer[SIZE-3:0]};

	mod_r_pointer	= {r_pointer[SIZE-1],
			(r_pointer[SIZE-1]^r_pointer[SIZE-2]),
				r_pointer[SIZE-3:0]};
end

always_comb 
begin
	f_flag = 0;
	if(mod_w_pointer[SIZE-1] !=	mod_r_pointer[SIZE-1] &&
		 mod_w_pointer[SIZE-2:0] ==	mod_r_pointer[SIZE-2:0])
		 begin	
			f_flag = 1;
		end 
end
endmodule	
