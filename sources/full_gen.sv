/******************************************************************************
***                                                                         ***
*** Ece 527L Experiment #4                      German Zepeda, Spring 2019  ***
*** Experiment #4, FIFO                                                     ***
*******************************************************************************
*** Filename: FullGen.sv                                                    ***
***                                                                         ***
*** This files generates the full flag and does synchornization 	        ***
*** this file also gneerats the almost full flag   			                ***
*******************************************************************************
*/

`timescale 1ps/1ps//done by write side

module full_gen#( SIZE=4)(
    input             write_clock,//input
    input             reset_n,//input
    input             valid_write,//saying this is a valid write
    input  [SIZE-1:0] read_gray_pointer,//input

    output [SIZE-1:0] write_count,//output to ram 
    output [SIZE-1:0] write_gray,//output tat goes to other clock
    output            full_flag,//this goes to ram 
    output            almost_full_flag//this it an output that is sent out
);

logic [SIZE-1:0] read_sync_pointer;

//modules
//this does the binary counter
counter #(.SIZE(SIZE)) counter_inst (
    .clock   (write_clock),
    .reset_n (reset_n),
    .flag    (full_flag),
    .valid   (valid_write),

    .count   (write_count)
);

//this should convert to gray write cloc side 
binary_to_gray #(.SIZE(SIZE)) binary_to_gray_inst (
    .binary_in (write_count),

    .gray_out  (write_gray)
);

//this should this should sync from read side 
sync #(.SIZE(SIZE)) read_sync_inst (
	.clock    (write_clock),
	.data_in  (read_gray_pointer),

	.data_out (read_sync_pointer)
);

//this should get tine synced gray values and does the compaison
full #(.SIZE(SIZE)) write_full_inst(
    .write_pointer (write_gray),
    .read_pointer  (read_sync_pointer),

    .full_flag     (full_flag)
);

//this should get the 2 gray and convert to binary then do the comaprisons 
almost_full_gen #(.SIZE(SIZE)) almost_full_inst (
    .read_gray_pointer    (read_sync_pointer),
    .write_binary_pointer (write_count),

    .almost_full_flag     (almost_full_flag)
);


endmodule
