module BN(x11,x12,x13,x14,x15,x16,x17,x18,x21,x22,x23,x24,x25,x26,x27,x28,x31,x32,x33,x34,x35,x36,x37,x38,x41,x42,x43,x44,x45,x46,x47,x48
,x_bp11,x_bp12,x_bp13,x_bp14,x_bp15,x_bp16,x_bp17,x_bp18,x_bp21,x_bp22,x_bp23,x_bp24,x_bp25,x_bp26,x_bp27,x_bp28,x_bp31,x_bp32,x_bp33,x_bp34,x_bp35,x_bp36,x_bp37,x_bp38,x_bp41,x_bp42,x_bp43,x_bp44,x_bp45,x_bp46,x_bp47,x_bp48
,clk,reset,select,output11,output12,output13,output21,output22,output23,output31,output32,output33,output41,output42,output43,lunda,gama,beta);
parameter N=16;
input clk,reset,select;
input [N-1:0]x11,x12,x13,x14,x15,x16,x17,x18,x21,x22,x23,x24,x25,x26,x27,x28,x31,x32,x33,x34,x35,x36,x37,x38,x41,x42,x43,x44,x45,x46,x47,x48
,x_bp11,x_bp12,x_bp13,x_bp14,x_bp15,x_bp16,x_bp17,x_bp18,x_bp21,x_bp22,x_bp23,x_bp24,x_bp25,x_bp26,x_bp27,x_bp28
,x_bp31,x_bp32,x_bp33,x_bp34,x_bp35,x_bp36,x_bp37,x_bp38,x_bp41,x_bp42,x_bp43,x_bp44,x_bp45,x_bp46,x_bp47,x_bp48
,lunda,gama,beta;
wire[5:0]mean11,mean21,mean31,mean41;
wire[10:0]mean12,mean22,mean32,mean42;
output [2*N-1:0]output11,output12,output13,output21,output22,output23,output31,output32,output33,output41,output42,output43;
//BN_STAT
BN_STAT BN_stat1(x11,x12,x13,x14,x15,x16,x17,x18
,x_bp11,x_bp12,x_bp13,x_bp14,x_bp15,x_bp16,x_bp17,x_bp18
,clk,select,reset,mean11,mean12);

BN_STAT BN_stat2(x21,x22,x23,x24,x25,x26,x27,x28
,x_bp21,x_bp22,x_bp23,x_bp24,x_bp25,x_bp26,x_bp27,x_bp28
,clk,select,reset,mean21,mean22);

BN_STAT BN_stat3(x31,x32,x33,x34,x35,x36,x37,x38
,x_bp31,x_bp32,x_bp33,x_bp34,x_bp35,x_bp36,x_bp37,x_bp38
,clk,select,reset,mean31,mean32);

BN_STAT BN_stat4(x41,x42,x43,x44,x45,x46,x47,x48
,x_bp41,x_bp42,x_bp43,x_bp44,x_bp45,x_bp46,x_bp47,x_bp48
,clk,select,reset,mean41,mean42);

//BN_CORE
BN_core BN_core1(output11,output12,output13,reset,clk,select,select,select,x11,mean11,lunda,gama,beta);
BN_core BN_core2(output21,output22,output23,reset,clk,select,select,select,x21,mean21,lunda,gama,beta);
BN_core BN_core3(output31,output32,output33,reset,clk,select,select,select,x31,mean31,lunda,gama,beta);
BN_core BN_core4(output41,output42,output43,reset,clk,select,select,select,x41,mean41,lunda,gama,beta);

endmodule

