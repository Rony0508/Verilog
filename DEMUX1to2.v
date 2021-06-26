module DEMUX1to2(in,select,out1,out2);

parameter N = 16;
input select;
input [N-1:0] in;
output reg [N-1:0] out1,out2;

always @(in or select)
begin
case (select)  
1'b0 : 
begin
out1 = in;
out2 = 0;
end
1'b1 : 
begin
out1 = 0;
out2 = in;
end
endcase
end

endmodule