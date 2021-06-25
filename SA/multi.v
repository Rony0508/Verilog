module multi(in0,in1,clk,rst_n,out);
parameter N=8;
input [N-1:0]in0,in1;
input clk,rst_n;
output[2*N-1:0]out;
//wire [2*N-1:0]out_blk;
//wire [N-1:0]in0_block,in1_block;
//DFF block1(clk,rst_n,in0,in0_block);
//DFF block2(clk,rst_n,in1,in1_block);
//DFF out_block(clk,rst_n,out_blk,out);
assign out=in0*in1;
//assign out_blk=in0_block*in1_block;

endmodule

