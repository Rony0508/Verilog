module FSM_tb;

reg in,clk,rst_n,stride;

wire select_m0,select_m1,select_m2,select_m3,select0,select1;

FSM fsm(clk,rst_n,in,stride,select_m0,select_m1,select_m2,select_m3,select0,select1);
initial
begin
rst_n=1'b1;
stride=0;
@(posedge clk)
rst_n<=1'b0;
in<=1'b0;

@(posedge clk)
rst_n<=1'b1;
in<=1'b1;
repeat(10)@(posedge clk)
in<=0;
#100 $finish;
end


initial
begin
clk=1'b0;
end

always
#1 clk=~clk;

endmodule
