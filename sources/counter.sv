/******************************************************************************
***                                                                         ***
*** Ece 527L Experiment #4                      German Zepeda, Spring 2019  ***
*** Experiment #4, FIFO							                            ***
*******************************************************************************
*** Filename: Counter.sv	                                                ***
***                                                                         ***
*** This file describes an up counter					                    ***
*******************************************************************************
*/
`timescale 1ns/10ps
module counter #( SIZE=4 )(
    input					clock,
    input					reset_n,
    input					flag,//this should be a negative flag
    input					valid,

    output logic [SIZE-1:0]	count
);

logic [SIZE-1:0] _count;
always_comb begin
    _count = count;
    if(!flag && valid) begin
        _count = count + 1;
    end
end

always@(posedge clock or negedge reset_n)
begin
	if(!reset_n)
	begin
		count <= 0;
	end
    else begin
        count <= _count;
    end
end
endmodule 
