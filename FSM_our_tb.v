module FSM_our_tb;

reg clk,rst_n,in,stride;
wire  select0,select1;

wire FP_C_complete,BP_FC_complete;
wire [1:0]CONV_curr_state,CONV_next_state,FC_curr_state,FC_next_state;

FSM_FPBP fsm_c(clk,rst_n,in,stride,select0,select1,FP_C_complete,BP_FC_complete,CONV_curr_state,CONV_next_state);
FSM_WG fsm_fc(clk,rst_n,in,stride,select0,select1,FP_C_complete,BP_FC_complete,FC_curr_state,FC_next_state);



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

initial
begin
$monitor($time,", rst_n=%d,in=%d,stride=%d ,select0=%d,select1=%d ,FP_C_complete=%d,BP_FC_complete=%d, CONV_curr_state=%d,CONV_next_state=%d,FC_curr_state=%d,FC_next_state=%d"
,rst_n,in,stride,select0,select1,FP_C_complete,BP_FC_complete,CONV_curr_state,CONV_next_state,FC_curr_state,FC_next_state);
end

always
#1 clk=~clk;

endmodule
