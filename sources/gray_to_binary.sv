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

logic [SIZE-1:0] binary_temp;
assign binary_out = {gray_in[SIZE-1], binary_temp[SIZE-2:0]};

//this does gray to binary conversion what ws this even doing lmao
always_comb begin : proc_conver
    binary_temp = 0;
	for (int i = SIZE-1; i >= 0; i--)
	 begin
         if( i == SIZE-1) begin
             binary_temp[i] = gray_in[i];
         end
         else begin
             binary_temp[i] = binary_temp[i+1] ^ gray_in[i];
         end
	end
end
endmodule
