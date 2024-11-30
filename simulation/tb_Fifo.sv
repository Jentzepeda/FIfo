`timescale 1ps/1ps

//`include "../../sources/Fifo/Fifo.sv"
//`include "../../../syn/netlist/Fifo_syn.v"

module tb_Fifo();

parameter SIZE =8;
parameter DEPTH=4;
parameter CLK1=4000;//write clock
parameter CLK2=20000;//read clock

logic            w_clk;
logic            r_clk;
logic            n_rst;
logic            f_flag;
logic            e_flag;
logic            ae_flag;
logic            a_flag;
logic            valid_write;
logic [SIZE-1:0] data_in;
logic [SIZE-1:0] data_out;


Fifo #(
    .SIZE(SIZE),
    .DEPTH(DEPTH))uut (
    .w_clk             (w_clk),
    .r_clk             (r_clk),
    .n_rst             (n_rst),
    .data_in           (data_in),
    .data_out          (data_out),
    .valid_write       (valid_write),
    .f_flag            (f_flag),
    .e_flag            (e_flag),
    .almost_empty_flag (ae_flag),
    .almost_full_flag  (a_flag)
);



	initial begin
	//$sdf_annotate("../../../syn/sdf/Fifo.sdf",UUT);
	r_clk	= 1'b0;
	forever #(CLK2/2) r_clk =~r_clk ;
	end
	
	initial begin
	w_clk = 1'b0;
	forever #(CLK1/2) w_clk =~w_clk;
	end

	initial begin
 $monitor(" data in= %d, data out=%d full =%b, empty =%b, almost_f=%b almost_e=%b,rst=%b "
	,data_in,data_out,f_flag,e_flag,a_flag,ae_flag,n_rst);
	end

	initial begin
	//$vcdpluson;
	n_rst=1'b1;
	valid_write =1'b0;
	#10 n_rst=1'b0;
	#60 n_rst=1'b1;
	data_in = 0;
	#(20*CLK1) data_in= 21;	
	valid_write =1'b1;
	#(CLK1) data_in= 503;	
	#(CLK1) data_in= 90;	
	#(CLK1) data_in= 10;	
	#(CLK1) data_in= 20;	
	#(CLK1) data_in= 820;	
	#(CLK1) data_in=30;
	#(CLK1) data_in= 1;
	#(CLK1) data_in= 55;
	#(CLK1) data_in =23;
	#(CLK1) data_in =9; valid_write =1'b0;
	#(27*(CLK2/10)) valid_write =1'b1;
	#(CLK1) data_in= 0;	
	#(CLK1) data_in= 1;	
	#(CLK1) data_in= 2;	
	#(CLK1) data_in= 3;	
	#(CLK1) data_in= 4;	
	#(CLK1) data_in= 5;
	#(CLK1) data_in= 6;
	#(CLK1) data_in= 7;
	#(CLK1) data_in= 8; 
	#(CLK1) data_in= 0;valid_write=1'b0;
	#(36*(CLK2/5)) valid_write =1'b1;
	#(CLK1) data_in= 10;	
	#(CLK1) data_in= 11;	
	#(CLK1) data_in= 12;	
	#(CLK1) data_in= 13;	
	#(CLK1) data_in= 14;	
	#(CLK1) data_in= 15;
	#(CLK1) data_in= 16;
	#(CLK1) data_in= 17;
	#(CLK1) data_in= 18; valid_write=1'b0;
	#(36*(CLK2/5)) valid_write =1'b1;
	#(CLK1) data_in= 19;	
	#(CLK1) data_in= 20;	
	#(CLK1) data_in= 21;	
	#(CLK1) data_in= 22;	
	#(CLK1) data_in= 23;	
	#(CLK1) data_in= 24;
	#(CLK1) data_in= 25;
	#(CLK1) data_in= 26;
	#(CLK1) data_in= 27; valid_write=1'b0;
	#(19*CLK2);
	#(CLK2/5) data_in = 28;
	#(CLK2/5) valid_write= 1'b1;
	#(CLK1) data_in =29;
	#(CLK1) data_in =30;
	#(CLK1) data_in =31;
	#(CLK1) data_in =32; 
	#(6*CLK1) valid_write=1'b0;
	//#(19*CLK2) $finish;
	end

endmodule
