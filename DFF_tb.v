module DFF_tb;
parameter N=16;
reg [N-1:0]I;
wire [N-1:0]O;
reg clk;
reg reset_n;

DFF REG(clk, reset_n,I,O);

initial
begin
clk=1'b0;
reset_n=1'b1;
I=16'b0000_0000_0000_0000;
@(posedge clk);
I=16'b0000_0000_0000_0001;
@(posedge clk);
I=16'b0000_0000_0000_0010;
@(posedge clk);
I=16'b0000_0000_0000_0100;
@(posedge clk);
I=16'b0000_0000_0000_1000;
reset_n=1'b0;
@(posedge clk);
I=16'b0000_0000_0001_0000;
reset_n=1'b1;
@(posedge clk);
I=16'b0000_0000_0010_0000;
@(posedge clk);
I=16'b0000_0000_0100_0000;
@(posedge clk);
I=16'b0000_0000_1000_0000;
@(posedge clk);
I=16'b0000_0001_0000_0000;
#2  $stop;
end
 
initial
$monitor($time, " I = %b, O = %b",I,O);  

always #1
begin
clk=~clk;
end

endmodule