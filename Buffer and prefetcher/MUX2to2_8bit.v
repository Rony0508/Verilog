module MUX2to2_8bit(
    select,in1,in2,out1,out2
);

parameter n = 8;

input [n-1:0] in1,in2;
input [1:0] select;
output reg [n-1:0] out1,out2;

always @ (in1 or in2 or select)
case (select)
2'b00 : 
begin
out1 = in1 ;
out2 = 8'b00000000;
end
2'b01 : 
begin
out1 = 8'b00000000 ;
out2 = in1;
end
2'b10 : 
begin
out1 = in2 ;
out2 = 8'b00000000;
end
2'b11 : 
begin
out1 = 8'b00000000;
out2 = in2;
end
endcase

endmodule

module MUX2to2_8bit_tb;
parameter n = 8;
reg [n-1:0] in1,in2;
reg [1:0] select;
wire [n-1:0] out1,out2;

MUX2to2_8bit MUX2to2_8bit_tb(
    select,in1,in2,out1,out2
);

initial
begin
select=0;
in1=200;
in2=100;
end

always #5
begin
select=select+1;
end

initial #100 $finish;

endmodule