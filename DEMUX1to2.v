module DEMUX_1_to_2(in,select,out1,out2);
parameter N = 16;
input select;
input [N-1:0] in;
output reg [N-1:0] out1,out2;
wire [N-1:0] select_n;

not(select_n,select);
and(out1,select_n,in);
and(out2,select,in);

endmodule
