module PE_tb();

parameter N = 8;

reg [N-1:0] i0,i1,w0,w1,w2;
reg select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk;
wire [2*N-1:0] out0,out1,out2;

PE pe(i0,i1,w0,w1,w2,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out0,out1,out2);
//clk reset
initial 
begin
clk=1;
end

initial 
begin

//reset PSUM and DFF
reset_n=0;



@(posedge clk) 

reset_n=1;
//Set FP/BP stride=1 mode
select_m0=0;select_m1=0;select_m2=0;select_m3=0;select0=1;select1=0;
//give initial input value 
i0=1;i1=2;w0=1;w1=2;w2=3;

//give input value
@(posedge clk)
i0=1;i1=3;w0=1;w1=2;w2=3;
@(posedge clk)
i0=1;i1=4;w0=1;w1=2;w2=3;
end

initial
begin
$monitor($time,"i0=%d,i1=%d,w0=%d,w1=%d,w2=%d,select_m0=%b,select_m1=%b,select_m2=%b,select_m3=%b,select0=%b,select1=%b,out=%d",
i0,i1,w0,w1,w2,select_m0,select_m1,select_m2,select_m3,select0,select1,out2);
#50 $stop;
end

always
#1 clk=~clk;

endmodule
