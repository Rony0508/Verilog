module BN_core_tb();

parameter N = 16;

reg [N-1:0] i1_xi;
reg [5:0] i2_mean1;
reg [2*N-1:0] i3,i4,i5;
reg s1,s2,s3,reset_n,clk;
wire [2*N-1:0] output1;
wire [2*N-1:0] output2;
wire [2*N-1:0] output3;
BN_core BN(output1,output2,output3,reset_n,clk,s1,s2,s3,i1_xi,i2_mean1,i3,i4,i5);
//clk reset

initial  
begin
clk=1;
end

initial 
begin

reset_n=0;



@(posedge clk) 
reset_n=1;

s1=0;s2=0;s3=0;
//initial input value 
i1_xi=4;i2_mean1=3;i3=2;i4=3;i5=1;
 
//give input value 
@(posedge clk) 
i1_xi=5;i2_mean1=2;i3=1;i4=3;i5=2;
@(posedge clk) 
i1_xi=6;i2_mean1=4;i3=2;i4=3;i5=1;
end

initial
begin
$monitor($time,"i1_xi=%d,i2_mean1=%d,i3=%d,i4=%d,i5=%d,s1=%b,s2=%b,s3=%b,output1=%d,output2=%d,output3=%d",
i1_xi,i2_mean1,i3,i4,i5,s1,s2,s3,output1,output2,output3);
#50 $stop;
end

always
#1 clk=~clk;

endmodule
