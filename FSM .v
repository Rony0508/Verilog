module FSM(clk,fsm_rst_n,in,stride,select_m0,select_m1,select_m2,select_m3,select0,select1,in_en,pe_rst,
en_cutting0,en_cutting1,inpref_mode_selector,inpref_mode_selector_output,buf_input_select,buf_output_select,curr_state,next_state,parity_counter);

input clk,fsm_rst_n,in,stride;
output reg select_m0,select_m1,select_m2,select_m3,select0,select1;
parameter IDLE=2'b00;
parameter FP=2'b01;
parameter BP=2'b10;
parameter WG=2'b11;

parameter parity_counter_num=1;
parameter count_num=8;  //clk of in_en counter parameter
parameter fp_count_num=9; // clk of in_en counter when stride=2 
parameter bp_count_num = 6;
parameter wg_count_num = 8;
parameter rst_count_num=1; //clk of reset counter parameter
reg complete;
reg rst_complete;
output reg in_en,pe_rst,parity_counter;
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
reg [4:0]fp_count;
reg [3:0]bp_count;
reg [3:0]wg_count;
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
    select_m0=1;select_m1=0;select_m2=0;select_m3=0;select0=0;select1=0;
    in_en=0;complete=0;rst_complete=0;pe_rst=0;en_cutting0=0;en_cutting1=0;
    buf_input_select=0;buf_output_select=0;
    inpref_mode_selector=2'b01;inpref_mode_selector_output=3'b000;
    
        
end
/*--------------------------FP Mode-------------------------------*/
    FP      : begin
    select_m2=0;select_m3=0;select0=1;select1=0;en_cutting0=1;pe_rst=1;
if(stride==0)
    begin
	select_m0=1;select_m1=0;inpref_mode_selector=2'b01;inpref_mode_selector_output=3'b000;
    end
else
     begin
	select_m0=0;select_m1=1;inpref_mode_selector=2'b00;inpref_mode_selector_output=3'b010;
     end

//calculate finish
if(stride)
    if(fp_count==fp_count_num)
        begin
            in_en=0;complete=1;pe_rst = 0;
        end
    else
        begin
            in_en=1;complete=0;
        end
else
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
        //pe_rst = 1;
        rst_complete=1;
    end

    else
    begin
        rst_complete=0;
    end
end
/*--------------------------BP Mode-------------------------------*/
    BP	    : begin 
    select_m0=1;select_m1=0;select_m2=0;select_m3=0;pe_rst=1;
if(stride==0)
    begin
	select0=1;select1=0;inpref_mode_selector=2'b11;inpref_mode_selector_output=3'b000;
    end
else
     begin
	select0=0;select1=0;en_cutting1=1;inpref_mode_selector=2'b11;inpref_mode_selector_output=3'b100;
     end

//calculate finish
/*
if(count==count_num-1)
        in_en=0;
else
        in_en=1;
if(count==count_num)
    begin
        complete=1;pe_rst = 0;
    end

else
        complete=0;*/

if(bp_count==bp_count_num)
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
        //pe_rst = 1;
        rst_complete=1;
    end

    else
    begin
        rst_complete=0;
    end
end
/*--------------------------WG Mode-------------------------------*/
    WG      : begin 
    select_m2=1;select_m3=1;select0=1;select1=1;pe_rst=1;
if(stride==0)
    begin
	select_m0=1;select_m1=0;inpref_mode_selector=2'b01;inpref_mode_selector_output=3'b001;
    end
else
    begin
    select_m0=0;select_m1=1;inpref_mode_selector=2'b00;inpref_mode_selector_output=3'b010;        
    end

//calculate finish
/*
if(count==count_num-1)
        in_en=0;
else
        in_en=1;
if(count==count_num)
    begin
        complete=1;pe_rst = 0;
    end

else
        complete=0;*/

if(wg_count==wg_count_num)
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
        //pe_rst = 1;
        rst_complete=1;
    end

    else
    begin
        rst_complete=0;
    end

end

    default : begin
    select_m2=1;select_m3=0;select0=0;select1=0;in_en=0;complete=0;pe_rst=1;
    inpref_mode_selector=2'b00;inpref_mode_selector_output=3'b000;
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
    	end
        else
	     begin
       		count <= count+1;
	     end
       end
    else  count <= 0;
    
end
//in_en counter for FP mode when stride=2 
/*---------------------------------------------------------*/

always@(posedge clk) begin
    if(curr_state)  
    begin
	    if (fp_count==fp_count_num)
	        fp_count <= 0;
    	else
       		fp_count <= fp_count+1;
    end
    else  fp_count <= 0;
    
end

//in_en counter for BP mode 
/*---------------------------------------------------------*/

always@(posedge clk) begin
    if(curr_state==BP)  
    begin
	    if (bp_count==bp_count_num)
	        bp_count <= 0;
    	else
       		bp_count <= bp_count+1;
    end
    else  bp_count <= 0;
    
end

//in_en counter for WG mode 
/*---------------------------------------------------------*/

always@(posedge clk) begin
    if(curr_state==WG)  
    begin
	    if (wg_count==wg_count_num)
	        wg_count <= 0;
    	else
       		wg_count <= wg_count+1;
    end
    else  wg_count <= 0;
    
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
//Parity counter
/*---------------------------------------------------------*/

always@(posedge clk) begin
    if (fsm_rst_n)
        if(stride)
            if(parity_counter==parity_counter_num)
                parity_counter = 0;
            else
                parity_counter = 1;
        else
            parity_counter = 0;
    else
        parity_counter = 0;
end
    


    
endmodule