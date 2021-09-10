module DEMUX1to2_8bit (in,select,out1,out2);

parameter N = 8; // default width
input select;
//input en,clk,reset_n;
input [N-1:0] in;
output reg [N-1:0] out1, out2;
//wire [N-1:0]odd;
//DFF_en odd_dff(en,clk,reset_n, odd, out1);
always @(select or in) 
begin
 if (select == 1) out1 = in; else out1 = {N{1'b0}};
 if (select == 0) out2 = in; else out2 = {N{1'b0}};
end
/*always @(select or in) 
begin
 if (select == 1) out2 = in; else out2 = {N{1'b0}};
 if (select == 0) odd = in; else odd = {N{1'b0}};
end*/

endmodule