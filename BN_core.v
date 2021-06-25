module BN_core(output1,output2,output3,reset_n,clk,s1,s2,s3,i1_xi,i2_mean1,i3,i4,i5);

parameter N = 16;   

input [N-1:0] i1_xi;
input [5:0] i2_mean1;
input [N-1:0]i3,i4,i5;
input s1,s2,s3,reset_n,clk;
output reg [2*N-1:0] output1;
output reg [2*N-1:0] output2;
output reg [2*N-1:0] output3;

wire [N-1:0] m1; //m1=16
wire [2*N-1:0] m2; //m2=32
wire [N-1:0] m3; //m3=32


wire [N-1:0] add1;
wire [2*N-1:0] add2;
wire [2*N-1:0] multi1;
wire [2*N-1:0] multi2;
wire [N-1:0] dff1;
wire [2*N-1:0] dff2;
wire [2*N-1:0] dff3;
wire [2*N-1:0] dff4;

wire [N-1:0] i1_xi_w;
wire [5:0] i2_mean1_w;
wire [N-1:0] i3_w,i4_w,i5_w;

//input buffer
DFF DFF_i1 (clk, reset_n,i1_xi,i1_xi_w);
DFF DFF_i2 (clk, reset_n,i2_mean1,i2_mean1_w);
DFF DFF_i3 (clk, reset_n,i3,i3_w);
DFF DFF_i4 (clk, reset_n,i4,i4_w);
DFF DFF_i5 (clk, reset_n,i5,i5_w);

DFF DFF1_bn(clk,reset_n,add1,dff1);
DFF_32 DFF2_bn(clk,reset_n,multi1,dff2);
DFF_32 DFF3_bn(clk,reset_n,multi2,dff3);
DFF_32 DFF4_bn(clk,reset_n,add2,dff4);

MUX2to1 M1_bn(dff1,dff4,s1,m1); //m1:16bits          mean1=6bit ,xi(input1)=16bit other:2bits
MUX2to1_32 M2_bn(dff2,i2_mean1_w,s2,m2); //m2:32bits
MUX2to1 M3_bn(i5_w,dff1,s3,m3); //m3:32bits

//add
assign add1=i1_xi_w-i2_mean1_w;
assign add2=m3+dff3;
//multiplicate 
assign multi1=m1*i3_w;
assign multi2=m2*i4_w;

always@(dff2 )
begin
output1<=dff2;
end

always@(dff3 )
begin
output2<=dff3;
end

always@(dff4 )
begin
output3<=dff4;
end


endmodule
