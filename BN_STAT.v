module BN_STAT(x0,x1,x2,x3,x4,x5,x6,x7,x_bp0,x_bp1,x_bp2,x_bp3,x_bp4,x_bp5,x_bp6,x_bp7,clk,select,reset,mean1,mean2);
parameter N=16,mini_batch_size=8;
input [N-1:0]x0,x1,x2,x3,x4,x5,x6,x7,x_bp0,x_bp1,x_bp2,x_bp3,x_bp4,x_bp5,x_bp6,x_bp7;
wire [N-1:0]X0,X1,X2,X3,X4,X5,X6,X7,X_bp0,X_bp1,X_bp2,X_bp3,X_bp4,X_bp5,X_bp6,X_bp7;
input clk,select,reset;
output [5:0]mean1; //17bit/3bit
output [10:0]mean2;//33bit/3bit
wire select1;
wire [N-1:0]m0,m1,m2,m3,m4,m5,m6,m7;	//wire of mux
wire [N:0]m1_w0,m1_w1,m1_w2,m1_w3,m1_w4,m1_w5,m1_sum;	//wire for cal mean1
wire [N:0]r1_in;	//wire for regsiter1
wire [N:0]r1_out;
wire [2*N-1:0]m2_w0,m2_w1,m2_w2,m2_w3,m2_w4,m2_w5,m2_w6,m2_w7;
wire [2*N:0]m2_w8,m2_w9,m2_w10,m2_w11,m2_w12,m2_w13,m2_sum,r2_in,r2_out;	//wire for cal mean2

DFF B0(clk,reset,x0,X0);
DFF B1(clk,reset,x1,X1);
DFF B2(clk,reset,x2,X2);
DFF B3(clk,reset,x3,X3);
DFF B4(clk,reset,x4,X4);
DFF B5(clk,reset,x5,X5);
DFF B6(clk,reset,x6,X6);
DFF B7(clk,reset,x7,X7);

DFF B_0(clk,reset,x_bp0,X_bp0);
DFF B_1(clk,reset,x_bp1,X_bp1);
DFF B_2(clk,reset,x_bp2,X_bp2);
DFF B_3(clk,reset,x_bp3,X_bp3);
DFF B_4(clk,reset,x_bp4,X_bp4);
DFF B_5(clk,reset,x_bp5,X_bp5);
DFF B_6(clk,reset,x_bp6,X_bp6);
DFF B_7(clk,reset,x_bp7,X_bp7);
DFF B_M(clk,reset,select,select1);

MUX2to1 M1(X0,X_bp0,select1,m0);
MUX2to1 M2(X1,X_bp1,select1,m1);
MUX2to1 M3(X2,X_bp2,select1,m2);
MUX2to1 M4(X3,X_bp3,select1,m3);
MUX2to1 M5(X4,X_bp4,select1,m4);
MUX2to1 M6(X5,X_bp5,select1,m5);
MUX2to1 M7(X6,X_bp6,select1,m6);
MUX2to1 M8(X7,X_bp7,select1,m7);
DFF_17bit DFF0(clk,reset,r1_in,r1_out);
DFF_33bit DFF1(clk,reset,r2_in,r2_out);

//cal mean1
assign m1_w0=X0+X1;
assign m1_w1=X2+X3;
assign m1_w2=X4+X5;
assign m1_w3=X6+X7;
assign m1_w4=m1_w0+m1_w1;
assign m1_w5=m1_w2+m1_w3;
assign m1_sum=m1_w4+m1_w5;	//x0+x1+...+xN

assign r1_in=m1_sum+r1_out;
assign mean1=r1_out/mini_batch_size;

//cal mean2
assign m2_w0=m0*X0;	//xi^2 or dyi*(^xi)
assign m2_w1=m1*X1;
assign m2_w2=m2*X2;
assign m2_w3=m3*X3;
assign m2_w4=m4*X4;
assign m2_w5=m5*X5;
assign m2_w6=m6*X6;
assign m2_w7=m7*X7;
assign m2_w8=m2_w0+m2_w1;
assign m2_w9=m2_w2+m2_w3;
assign m2_w10=m2_w4+m2_w5;
assign m2_w11=m2_w6+m2_w7;
assign m2_w12=m2_w8+m2_w9;
assign m2_w13=m2_w10+m2_w11;
assign m2_sum=m2_w12+m2_w13;	//x0^2+x1^2+...+xN^2

assign r2_in=m2_sum+r2_out;
assign mean2=r2_out/mini_batch_size;

endmodule
 
