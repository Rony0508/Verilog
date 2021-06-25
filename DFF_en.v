module DFF_en(en,clk,reset_n, d, q);
input clk,reset_n,en;
parameter N=16;
input [N-1:0] d;
output reg [N-1:0] q;
always @(posedge clk,negedge reset_n)
begin
if (!reset_n)
q <= {N{1'b0}};
else
  if(en)
     q <= d;
  else
     q <= q;
end
endmodule