module MUX2to1_tb;

parameter N = 16;

reg [N-1:0] IN0, IN1;
reg S;
wire [N-1:0] OUT;

MUX2to1 mux (IN0,IN1,S,OUT);

initial 
begin
IN0 = 16'b0000_1111_0000_1111; IN1 = 16'b1111_0000_1111_0000;
#1 $display("IN0= %b, IN1= %b",IN0,IN1);
S = 0;
#1 $display(" S = %b, OUT = %b \n", S, OUT);
S = 1;
#1 $display(" S = %b, OUT = %b \n", S, OUT);
end

endmodule
