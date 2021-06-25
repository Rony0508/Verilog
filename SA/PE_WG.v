module PE_WG(i0,i1,w0,w1,w2,select0,select1,reset_n,clk,out0,out1,out2);

parameter N = 8; 

input [N-1:0]i0,i1,w0,w1,w2;
input select0,select1,reset_n,clk;
output [2*N:0]out0,out1,out2;
wire [N-1:0]i0_blk,i0_dff_out,i1_blk,w0_blk,w1_blk,w2_blk,mux0_out,mux1_out;
wire sel0_blk,sel1_blk;
wire [2*N:0]psum0,psum1,psum2;	//17bit
wire [2*N-1:0]multi_out0,multi_out1,multi_out2;	//16bit

DFF i0_block(clk,reset_n,i0,i0_blk);
DFF i1_block(clk,reset_n,i1,i1_blk);
DFF w0_block(clk,reset_n,w0,w0_blk);
DFF w1_block(clk,reset_n,w1,w1_blk);
DFF w2_block(clk,reset_n,w2,w2_blk);
DFF sel0_block(clk,reset_n,select0,sel0_blk);
DFF sel1_block(clk,reset_n,select1,sel1_blk);
DFF_17bit psum_reg0(clk,reset_n,psum0,out0);
DFF_17bit psum_reg1(clk,reset_n,psum1,out1);
DFF_17bit psum_reg2(clk,reset_n,psum2,out2);
DFF i0_dff(clk,reset_n,i0_blk,i0_dff_out);

MUX2to1 MUX0(i0_blk,i1_blk,sel0_blk,mux0_out);
MUX2to1 MUX1(i0_blk,i0_dff_out,sel1_blk,mux1_out);

multi multi0(i0_blk,w0_blk,clk,reset_n,multi_out0);
multi multi1(mux0_out,w1_blk,clk,reset_n,multi_out1);
multi multi2(mux1_out,w2_blk,clk,reset_n,multi_out2);

adder adder0(multi_out0,out0,clk,reset_n,psum0);
adder adder1(multi_out1,out1,clk,reset_n,psum1);
adder adder2(multi_out2,out2,clk,reset_n,psum2);

endmodule