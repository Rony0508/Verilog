module relu(din_relu,dout_relu);
input [31:0] din_relu;
output reg [31:0] dout_relu;
    assign dout_relu = (din_relu[31] == 0)? din_relu : 0;   //if the sign bit is high, send zero on the output else send the input
endmodule