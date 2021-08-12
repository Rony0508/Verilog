module FSM_FPBP(clk,fsm_rst_n,in,stride,select0,select1,FP_C_complete,BP_FC_complete,curr_state,next_state);

input clk,fsm_rst_n,in,stride,BP_FC_complete;
output reg select0,select1,FP_C_complete;
parameter IDLE=2'b00;
parameter FP=2'b01;
parameter BP=2'b10;
//parameter WG=2'b11;

parameter count_num=8;  //clk of in_en counter parameter
parameter rst_count_num=1; //clk of reset counter parameter
reg complete;
reg rst_complete;
output reg in_en,pe_rst;
/*ctrl of output buffer  
buf_input_select = 1 (receive BN's output) =0 (receive SA's output)
buf_output_select = 1 (output to weight_pref) =0 (output to input_pref)
*/
output reg buf_input_select,buf_output_select;
//ctrl of inpref
output reg [1:0]inpref_mode_selector;
/*
inpref_mode_selector=2'b00, first input(no cutting) and stride = 2;
inpref_mode_selector=2'b01, first input(no cutting) and stride = 1;
inpref_mode_selector=2'b10, cutting input and stride = 2;
inpref_mode_selector=2'b11, cutting input and stride = 1;
*/
output reg [2:0]inpref_mode_selector_output;
output reg en_cutting0;
output reg en_cutting1;
output [2:0]curr_state,next_state;
reg [3:0]count;
reg [1:0]rst_count;
reg [2:0]curr_state;
reg [2:0]next_state;

always@(posedge clk or negedge fsm_rst_n)
  if (~fsm_rst_n) 
    begin 
	curr_state <= IDLE;
    end
  else        curr_state <= next_state;

always@(*)
  case (curr_state)
    IDLE    : begin
              
              if (in) next_state = FP;
              else if(BP_FC_complete) begin 
		next_state = BP;
end
              else     next_state = IDLE;
end

    FP      : if (BP_FC_complete) begin 
		next_state = BP;
end
              else if(complete) begin 
		next_state = IDLE;
end
              else     next_state = FP;
    BP      : if (complete) begin 
		next_state = IDLE;
end
              else     next_state = BP;


    default :          next_state = IDLE;
  endcase

always@(*)
  case (curr_state)
    IDLE    : begin 
	select0=0;select1=0;in_en=0;complete=0;FP_C_complete=0;

end
/*--------------------------FP Mode-------------------------------*/
    FP      : begin
if(count==count_num)
    begin
        in_en=0;complete=1;pe_rst = 0;
    end

else
    begin
        in_en=1;complete=0;
    end
//reset finish
    if(rst_count==rst_count_num)
    begin
        pe_rst = 1;
        rst_complete=1;
    end

    else
        rst_complete=0;

if(stride==0)
    begin
	select0=0;select1=0;
    end
else
     begin
	select0=1;select1=1;
     end
end
/*--------------------------BP Mode-------------------------------*/
    BP	    : begin 

if(stride==0)
    begin
	select0=0;select1=0;
    end
else
     begin
	select0=0;select1=1;
     end
if(count==10)
begin
    in_en=0;complete=1;
end

else
begin
    in_en=1;complete=0;
end

end

/*--------------------------WG Mode-------------------------------
    WG      : begin 

if(stride==0)
    begin
	select0=0;select1=0;
    end
else
     begin
	select0=1;select1=1;
     end
if(count==10)
begin
    in_en=0;complete=1;
end

else
begin
    in_en=1;complete=0;
end

end
*/
    default : begin
	select0=0;select1=0;in_en=0;FP_C_complete=0;
end
  endcase
/*
always@(posedge clk)
    if(in_en)  
       begin
	  if (count==10)
   	     begin
		count <= 0;
		complete <=1;
    	     end
    	  else
       		count <= count+1;
       end
    else complete <= 0;
*/
always@(posedge clk) begin
    if(curr_state)  
       begin
	  if (count==10)
   	     begin
		count <= 0;
		//complete <= 1;
    	     end
    	  else
	     begin
       		count <= count+1;
	     end
       end
    else  count <= 0;
    
end



endmodule
