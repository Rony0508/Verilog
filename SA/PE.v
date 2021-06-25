module PE (i0,i1,w0,w1,w2,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out);

parameter N = 8;   

input [N-1:0] i0,i1,w0,w1,w2;
input select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk;

output reg [2*N-1:0] out;

reg [2*N-1:0] PSUM;

wire [N-1:0] m0,m1 ;//wire for mux output (8bit)
wire [2*N-1:0] m2,m3,m4; //wire for mux output (16bit)
wire [N-1:0] dff0; //wire for DFF output (8bit)
wire [2*N-1:0] dff1,dff2,dff3; //wire for DFF output (16bit)
wire [2*N-1:0] multi0,multi1,multi2; //wire for multiplication output (16bit)
wire [2*N-1:0] add0,add1,add2; //wire for add output (16bit)
wire [2*N-1:0] psum; //wire for PSUM output (16bit)
//wire for ''input buffer to ALU''
wire [N-1:0] i0_w,i1_w,w0_w,w1_w,w2_w;
wire select_m0_w,select_m1_w,select_m2_w,select_m3_w,select0_w,select1_w;


//input buffer
DFF DFF_i0 (clk, reset_n,i0,i0_w);
DFF DFF_i1 (clk, reset_n,i1,i1_w);
DFF DFF_w0 (clk, reset_n,w0,w0_w);
DFF DFF_w1 (clk, reset_n,w1,w1_w);
DFF DFF_w2 (clk, reset_n,w2,w2_w);
//select buffer (1bit)
DFF DFF_select_m0 (clk, reset_n, select_m0, select_m0_w);
DFF DFF_select_m1 (clk, reset_n, select_m1, select_m1_w);
DFF DFF_select_m2 (clk, reset_n, select_m2, select_m2_w);
DFF DFF_select_m3 (clk, reset_n, select_m3, select_m3_w);
//select buffer (2bit)
DFF DFF_select0 (clk, reset_n, select0, select0_w);
DFF DFF_select1 (clk, reset_n, select1, select1_w);
//Mux
MUX2to1 M0 (i0_w,i1_w,select_m0_w,m0);
MUX2to1 M1 (i1_w,dff0,select_m1_w,m1);
MUX2to1 M2 (psum,dff1,select_m2_w,m2);
MUX2to1 M3 (dff1,dff2,select_m3_w,m3);
MUX3to1 M4 (psum,dff2,dff3,select0_w,select1_w,m4);
//data buffer
DFF DFF0 (clk, reset_n, i1_w, dff0);
DFF DFF1 (clk, reset_n, add0, dff1);
DFF DFF2 (clk, reset_n, add1, dff2);
DFF DFF3 (clk, reset_n, add2, dff3);

//multiplicate 
assign multi0=w0_w*i1_w;
assign multi1=m0*w1_w;
assign multi2=w2_w*m1;
//add
assign add0=multi0+m2;
assign add1=multi1+m3;
assign add2=multi2+m4;

//PSUM

always@(reset_n or dff3)
begin
if(reset_n==0)
PSUM<=0;
else
PSUM<=PSUM+dff3;
end

/*
always@(reset_n==0)
begin
PSUM<=0;
end

always@(dff3)
begin
PSUM<=PSUM+dff3;
end
*/

//psum
assign psum=PSUM;
//OUT
always@(psum)
begin
out<=psum;
end

endmodule
