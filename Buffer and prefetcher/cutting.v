module cutting (clk,en,in,out);
    
parameter n = 16;
parameter m = 8;

input clk,en;
input [n-1:0] in;
output [m-1:0] out;
reg [m-1:0] out;

always @(*)
begin
if(en)
    out[m-1:0]=in[m-1:0];
else
    out=0;
end

endmodule

module cutting_tb ();

parameter n = 16;
parameter m = 8;

reg clk,en;
reg [n-1:0] in;

wire [m-1:0] out;

always 
#1 clk=~clk;

initial 
begin
clk=1;
end

initial 
begin
@(posedge clk) 
en=1;in=16'b1111_0000_1111_0000;
@(posedge clk) 
en=0;in=16'b1100_0011_1100_0011;
@(posedge clk) 
en=1;in=16'b0011_1100_0011_1100;
@(posedge clk) 
en=0;in=16'b1111_0000_1111_0000;
@(posedge clk) 
en=1;in=16'b1100_0011_1100_0011;
@(posedge clk) 
en=0;in=16'b0011_1100_0011_1100;
end

initial 
begin
$monitor($time,"in=%d,out=%d",in,out);
#20 $stop;
end



endmodule