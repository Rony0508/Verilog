module DFF_33bit(clk, reset_n, d, q);
input clk,reset_n;
parameter N=33;
input [N-1:0] d;
output reg [N-1:0] q;
always @(posedge clk)
begin
if (!reset_n)
q <= {N{1'b0}};
else
q <= d;
end
endmodule
