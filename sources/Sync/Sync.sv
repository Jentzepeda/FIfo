/******************************************************************************
***527L Experiment #4                      German Zepeda, Spring 2019  ***
*** Experiment #4, FIFO                                                     ***
*******************************************************************************
*** Filename: Synch.sv                                                      ***
***                                                                         ***
** This describes a two stage synchronizer                                  ***
 *******************************************************************************
*/
module Sync(
	clk,
	d_in,
	d_out
	);

//parameter
parameter SIZE = 4;

//input 
input clk;
input [(SIZE-1):0] d_in;

//output
output [(SIZE-1):0] d_out;

//reg
reg [(SIZE-1):0] d_out;
reg [(SIZE-1):0] temp;

//always block
	always@(posedge clk ) begin
		temp	<= d_in;
		d_out	<= temp;
	end
endmodule
