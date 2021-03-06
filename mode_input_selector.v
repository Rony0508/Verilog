module mode_input_selector (
    select,in1,in2,in3,in4,out1,out2
);
parameter n = 8;

input [n-1:0] in1,in2,in3,in4;
input [2:0] select;
output reg [n-1:0] out1,out2;

always @ (in1 or in2 or in3 or in4 or select)
case (select)
3'b000 : 
begin
out1 = in3;
out2 = 8'b00000000;
end
3'b001 : 
begin
out1 = in3;
out2 = 8'b00000000;
end
3'b010 : 
begin
out1 = in2;
out2 = in1;
end
3'b011 : 
begin
out1 = in3;
out2 = in4;
end
3'b100 : 
begin
out1 = in3;
out2 = 8'b00000000;
end
3'b101 : 
begin
out1 = in3;
out2 = 8'b00000000;
end
default:
begin
out1 = 8'b00000000;
out2 = 8'b00000000;
end
endcase

endmodule


module mode_input_selector_tb;
parameter n = 8;
reg [n-1:0] in1,in2,in3,in4;
reg [2:0] select;
wire [n-1:0] out1,out2;

mode_input_selector mode_input_selector_tb(
    select,in1,in2,in3,in4,out1,out2
);

initial
begin
select=0;
in1=00;
in2=01;
in3=10;
in4=11;
end

always #5
begin
select=select+1;
end

initial #100 $finish;


endmodule