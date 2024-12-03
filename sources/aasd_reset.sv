/******************************************************************************
***                                                                         ***
*** Ece 527L Experiment #4                        German Zepeda, Spring 2019***
*** Experiment#4, FIFO							                            ***
*******************************************************************************
*** Filename: aasd_reset.sv                                                 ***
***                                                                         ***
*******************************************************************************
*** This modles the asynchronous assert, and synchronus de-assert function  ***
*******************************************************************************
*/
`timescale 1 ps / 1 ps
module aasd_reset(

input        clock,
input        reset_n,

output logic aasd_reset
);

logic aasdr_flop;

always@(posedge clock or negedge reset_n) 
begin
	if(!reset_n) 
	begin
		aasdr_flop <= 0;
		aasd_reset <= 0;
	end 
	else 
	begin
		aasdr_flop <= 1;
		aasd_reset <= aasdr_flop;
	end
end

endmodule
