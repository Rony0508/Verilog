module MUX2to1(in0,in1,select,out);
parameter N = 16;
input select;
input [N-1:0] in1, in0;
output reg [N-1:0] out;
always @(select,in0,in1)
begin
out = (select ?in1 : in0);
end
endmodule
