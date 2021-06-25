module DFF(clk, reset_n, d, q);
input clk,reset_n;
parameter N=16;
input [N-1:0] d;
output reg [N-1:0] q;
always @(posedge clk,negedge reset_n)
begin
if (!reset_n)
q <= {N{1'b0}};
else
q <= d;
end
endmodule
