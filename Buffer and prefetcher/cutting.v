module cutting (
    input en
    input [n-1:0] in
    output [m-1:0] out
);
    
parameter n = 16;
parameter m = 8;

reg [m-1:0] out;



endmodule



module cutting_tb ();
    


always 
#1 clk=~clk;

initial 
begin
clk=1;
end

initial 
begin
@(posedge clk) 
@(posedge clk) 
@(posedge clk) 





end

endmodule