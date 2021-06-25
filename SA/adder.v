module adder(in0,in1,clk,rst_n,out);
parameter N=16;
input [N-1:0]in0,in1;
input clk,rst_n;
output [N:0]out;	//17bit
wire [N-1:0]in0_block,in1_block;
//DFF_16bit block1(clk,rst_n,in0,in0_block);
//DFF_16bit block2(clk,rst_n,in1,in1_block);
assign out=in0+in1;
//assign out=in0_block+in1_block;

endmodule

