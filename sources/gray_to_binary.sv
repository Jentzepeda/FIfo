/******************************************************************************
***                                                                         ***
*** Ece 527L Experiment #4                      German Zepeda, Spring 2019  ***
*** Experiment #4, FIFO                                                     ***
*******************************************************************************
*** Filename: GrayToBin.sv                                                  ***
***                                                                         ***
*** this files converts gray to binary                                      ***
*******************************************************************************
*/

`timescale 1ps/1ps

module gray_to_binary#( SIZE=4) (
    input        [SIZE-1:0] gray_in,
    output logic [SIZE-1:0] binary_out	
);

//this does gray to binary conversion what ws this even doing lmao
always_comb begin  
    binary_out = 0;
	for (int i = 0; i < SIZE; i++) begin
        binary_out[i] = ^(gray_in>>i);
	end
end

endmodule
