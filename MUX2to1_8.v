module MUX2to1_8(in0,in1,select,out);
parameter N = 32;
input select;
input [N-1:0] in1, in0;
output reg [N-1:0] out;
always @(select,in0,in1)
begin
out = (select ?in1 : in0);
end
endmodule