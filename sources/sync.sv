/******************************************************************************
***527L Experiment #4                      German Zepeda, Spring 2019  ***
*** Experiment #4, FIFO                                                     ***
*******************************************************************************
*** Filename: Synch.sv                                                      ***
***                                                                         ***
** This describes a two stage synchronizer                                  ***
 *******************************************************************************
*/
module sync #(SIZE=4)(
    input			        clock,
    input  [SIZE-1:0]       data_in,

    output logic [SIZE-1:0] data_out
);

//logic
logic [(SIZE-1):0] data_temp;

//always block
always@(posedge clock ) begin
	data_temp <= data_in;
	data_out  <= data_temp;
end

endmodule
