/******************************************************************************
***                                                                         ***
*** Ece 527L Experiment #4                      German Zepeda, Spring 2019  ***
*** Experiment #4, FIFO 						    ***
*******************************************************************************
*** Filename: ram_block.sv                                                        ***
***                                                                         ***
*******************************************************************************
*/
`timescale 1ps/1ps
module ram#(
    DEPTH =8,
    WIDTH  =4)(
    input                    clock,
    input                    write_enable,
    input                    read_enable,
    input                    valid_write,
    input [WIDTH-1:0]        write_data,
    input [DEPTH-1:0]        read_address,
    input [DEPTH-1:0]        write_address,

    output logic [WIDTH-1:0] read_data
);

//reg
reg [(WIDTH-1):0] ram_block [0:(2**DEPTH)-1];

//always block
always@(posedge clock)begin
	if (!write_enable && valid_write) begin
        ram_block[write_address] <= write_data;
	end 
end

always_comb begin//make this output high z when its failled
    read_data = (!read_enable) ? ram_block[read_address] :'bz;
end
endmodule	
