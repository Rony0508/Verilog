module MUX3to1(in0,in1,in2,select0,select1,out);
parameter N = 16;
input select1,select0;
input [N-1:0] in2, in1, in0;
output reg [N-1:0] out;
always @(select0,select1,in0,in1,in2)
begin
out = (select0 ?(select1?in2:in1):(select1?in2:in0));
end
endmodule
