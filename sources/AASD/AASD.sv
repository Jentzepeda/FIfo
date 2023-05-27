/******************************************************************************
***                                                                         ***
*** Ece 527L Experiment #4                        German Zepeda, Spring 2019***
*** Experiment#4, FIFO							                            ***
*******************************************************************************
*** Filename: AASD.sv                                                       ***
***                                                                         ***
*******************************************************************************
*** This modles the asynchronous assert, and synchronus de-assert function  ***
*******************************************************************************
*/
`timescale 1 ps / 1 ps
module AASD
(
//input
input	CLK,
input	RST,
//output
output	AASDR
);
//reg
	reg DFF1;
	reg AASDR;

// does the aasd
always@(posedge CLK or negedge RST) 
begin
	if(!RST) 
	begin
		DFF1   <= 0;
		AASDR  <= 0;
	end 
	else 
	begin
		DFF1   <= 1;
		AASDR  <= DFF1;
	end
end
endmodule
