module DEMUX1to2_16(in,select,out1,out2);

parameter N = 16; // default width
input select;
input [N-1:0] in;
output reg [N-1:0] out1, out2;
always @(select or in) 
begin
 if (select == 1) out2 = in; else out2 = {N{1'b0}};
 if (select == 0) out1 = in; else out1 = {N{1'b0}};
end

endmodule