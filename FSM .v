module FSM(clk,fsm_rst_n,in,stride,select_m0,select_m1,select_m2,select_m3,select0,select1,in_en,pe_rst);

input clk,fsm_rst_n,in,stride;
output reg select_m0,select_m1,select_m2,select_m3,select0,select1;
parameter IDLE=2'b00;
parameter FP=2'b01;
parameter BP=2'b10;
parameter WG=2'b11;

parameter count_num=6;  //clk of in_en counter parameter
parameter rst_count_num=1; //clk of reset counter parameter
reg complete;
reg rst_complete;
output in_en,pe_rst;
reg in_en;
reg pe_rst;
reg [3:0]count;
reg [1:0]rst_count;
reg [2:0]curr_state;
reg [2:0]next_state;


//Fsm next_state  set
/*---------------------------------------------------------*/
always@(posedge clk or negedge fsm_rst_n)
  if (~fsm_rst_n) 
    begin 
	curr_state <= IDLE;

    end
  else     
    begin

        curr_state <= next_state;
    end   

/*---------------------------------------------------------*/

//Fsm state change 
/*---------------------------------------------------------*/

always@(*)
  case (curr_state)
    IDLE    : if (in) begin next_state = FP;
end
              else     next_state = IDLE;
    FP      : if (rst_complete) begin 
		next_state = BP;
end
              else     next_state = FP;
    BP      : if (rst_complete) begin 
		next_state = WG;
end
              else     next_state = BP;
    WG      : if (rst_complete) begin
		next_state = IDLE;
end
	      else     next_state = WG;
        

    default :          next_state = IDLE;
  endcase
/*---------------------------------------------------------*/

//Fsm output:PE's mux select
/*---------------------------------------------------------*/

always@(*)
  case (curr_state)
    IDLE    : begin 
    select_m2=0;select_m3=0;select0=0;select1=0;in_en=0;complete=0;rst_complete=0;pe_rst=1;
end
/*--------------------------FP Mode-------------------------------*/
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
/* 
if(count==count_num)
begin
    in_en=0;complete=1;
end

else
begin
    in_en=1;complete=0;
end
*/
//calculate finish
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
    begin
        rst_complete=0;
    end
end
/*--------------------------BP Mode-------------------------------*/
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
/*     
if(count==count_num)
    begin
        in_en=0;complete=1;
    end

else
    begin
        in_en=1;complete=0;
    end
*/
//calculate finish
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
    begin
        rst_complete=0;
    end
end
/*--------------------------WG Mode-------------------------------*/
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

/*     
if(count==count_num)
    begin
        in_en=0;complete=1;
    end

else
    begin
        in_en=1;complete=0;
    end
*/
//calculate finish
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
    begin
        rst_complete=0;
    end

end

    default : begin
    select_m2=0;select_m3=0;select0=0;select1=0;in_en=0;complete=0;pe_rst=1;
    end
endcase




//in_en counter
/*---------------------------------------------------------*/

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
//PE_RST counter
/*---------------------------------------------------------*/

always@(posedge clk) begin
    if(complete)  
       begin
	    if (rst_count==rst_count_num)
		rst_count <= 0;

        else
	     begin
       		rst_count <= rst_count+1;
	     end
       end
    else  rst_count <= 0;
    
end

    


    
endmodule