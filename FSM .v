module FSM(clk,fsm_rst_n,in,stride,select_m0,select_m1,select_m2,select_m3,select0,select1,in_en);

input clk,fsm_rst_n,in,stride;
output reg select_m0,select_m1,select_m2,select_m3,select0,select1;
parameter IDLE=2'b00;
parameter FP=2'b01;
parameter BP=2'b10;
parameter WG=2'b11;
parameter count_num=3;
reg complete;
output in_en;
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
    IDLE    : if (in) begin next_state = FP;
end
              else     next_state = IDLE;
    FP      : if (complete) begin 
		next_state = BP;
end
              else     next_state = FP;
    BP      : if (complete) begin 
		next_state = WG;
end
              else     next_state = BP;
    WG      : if (complete) begin
		next_state = IDLE;
end
	      else     next_state = WG;

    default :          next_state = IDLE;
  endcase
//OL
always@(*)
  case (curr_state)
    IDLE    : begin 
select_m2=0;select_m3=0;select0=0;select1=0;in_en=0;complete=0;
end

    FP      : begin
select_m2=0;select_m3=0;select0=0;select1=1;
if(stride==0)
    begin
	select_m0=0;select_m1=0;
    end
else
     begin
	select_m0=1;select_m1=1;
     end
if(count==count_num)
begin
    in_en=0;complete=1;
end

else
begin
    in_en=1;complete=0;
end
end

    BP	    : begin 
select_m0=0;select_m1=0;select_m2=0;select_m3=0;
if(stride==0)
    begin
	select0=0;select1=1;
    end
else
     begin
	select0=0;select1=0;
     end
if(count==count_num)
begin
    in_en=0;complete=1;
end

else
begin
    in_en=1;complete=0;
end
end

    WG      : begin 
select_m2=1;select_m3=1;select0=1;select1=0;
if(stride==0)
    begin
	select_m0=0;select_m1=0;
    end
else
     begin
	select_m0=1;select_m1=1;
     end
if(count==count_num)
begin
    in_en=0;complete=1;
end

else
begin
    in_en=1;complete=0;
end

end
    default : begin
select_m2=0;select_m3=0;select0=0;select1=0;in_en=0;complete=0;
end
  endcase

/*always@(posedge clk) begin
    if(in_en)  
       begin
	  if (count==10)
   	     begin
		count <= 0;
		complete <= 1;
    	     end
    	  else
	     begin
       		count <= count+1;
	     end
       end
    else  complete <= 0;
    
end*/

always@(posedge clk) begin
    if(curr_state)  
       begin
	  if (count==count_num)
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