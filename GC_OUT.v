module GC_OUT(output13,sw_out,led);
input [1:0]sw_out;
input [31:0]output13;
output reg [7:0]led; 

always@(*)
begin
    case(sw_out)
	2'b00:led=output13[7:0];

	2'b01:led=output13[15:8];

	2'b10:led=output13[23:16];

	default:led=output13[31:24];
    endcase
end

endmodule 