module MUX3to1_tb;

parameter N = 16;

reg [N-1:0] IN0, IN1, IN2;
reg S0,S1;
wire [N-1:0] OUT;

MUX3to1 mux (IN0,IN1, IN2,S0,S1,OUT);

initial 
begin
IN0 = 16'b0000_1111_0000_1111; 
IN1 = 16'b1111_0000_1111_0000;
IN2 = 16'b1111_1111_1111_1111;
#1 $display("IN0= %b, IN1= %b, IN2= %b",IN0,IN1,IN2);
S0 = 0;S1 = 0;
#1 $display(" S0 = %b,S1 = %b, OUT = %b \n", S0,S1, OUT);
S0 = 1;S1 = 0;
#1 $display(" S0 = %b,S1 = %b, OUT = %b \n", S0,S1, OUT);
S0 = 0;S1 = 1;
#1 $display(" S0 = %b,S1 = %b, OUT = %b \n", S0,S1, OUT);
S0 = 1;S1 = 1;
#1 $display(" S0 = %b,S1 = %b, OUT = %b \n", S0,S1, OUT);
end

endmodule