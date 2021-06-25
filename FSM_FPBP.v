module FSM_FPBP(clk,fsm_rst_n,in,stride,select0,select1,FP_C_complete,BP_FC_complete,curr_state,next_state);

input clk,fsm_rst_n,in,stride,BP_FC_complete;
output reg select0,select1,FP_C_complete;
parameter IDLE=2'b00;
parameter FP=2'b01;
parameter BP=2'b10;
parameter WG=2'b11;

output [1:0]curr_state,next_state;
reg complete;
reg in_en;
reg [3:0]count;
reg [1:0]curr_state;
reg [1:0]next_state;

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

    FP      : begin
if(count==10)
begin
    in_en=0;complete=1;FP_C_complete=1;
end

else
begin
    in_en=1;complete=0;
end
if(stride==0)
    begin
	select0=0;select1=0;
    end
else
     begin
	select0=1;select1=1;
     end
end

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
