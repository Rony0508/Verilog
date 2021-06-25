module relu_tb();

reg [31:0] din_relu;
wire [31:0] dout_relu;
reg clk;

relu Relu (din_relu,dout_relu);

initial 
begin
clk=1;
end

initial 
begin
@(posedge clk) 
din_relu=0;
@(posedge clk) 
din_relu=1;
@(posedge clk) 
din_relu=0;
@(posedge clk) 
din_relu=2;
@(posedge clk) 
din_relu=0;
@(posedge clk) 
din_relu=3;
@(posedge clk) 
din_relu=0;
@(posedge clk) 
din_relu=4;
@(posedge clk) 
din_relu=0;
end

always
#1 clk=~clk;

initial
begin
$monitor($time,"din_relu=%d,dout_relu=%b",din_relu,dout_relu);
#20 $stop;
end

endmodule