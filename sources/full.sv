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
module full #( SIZE=4 )(
    input [SIZE-1:0] write_pointer,
    input [SIZE-1:0] read_pointer,

    output logic     full_flag
);

//reg
logic [SIZE-1:0] mod_read_pointer;
logic [SIZE-1:0] mod_write_pointer;

//always block
always_comb begin //TODO This looks like it should be a for loop of some kind ?
    mod_write_pointer = {write_pointer[SIZE-1], (write_pointer[SIZE-1]^write_pointer[SIZE-2]),write_pointer[SIZE-3:0]};
	mod_read_pointer  = {read_pointer[SIZE-1], (read_pointer[SIZE-1]^read_pointer[SIZE-2]),read_pointer[SIZE-3:0]};
end

always_comb begin 
    full_flag = 0;
    if (mod_write_pointer[SIZE-1] != mod_read_pointer[SIZE-1] && mod_write_pointer[SIZE-2:0] ==	mod_read_pointer[SIZE-2:0]) begin	
        full_flag = 1;
    end 
end
endmodule	
