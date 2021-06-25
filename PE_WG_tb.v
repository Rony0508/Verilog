module PE_WG_tb;

reg clk,reset_n,select0,select1;
reg [7:0]i0,i1,w0,w1,w2;
wire [16:0]out0,out1,out2;

PE_WG PE1(i0,i1,w0,w1,w2,select0,select1,reset_n,clk,out0,out1,out2);

initial
begin
    clk=1;
end
initial
begin
reset_n=0;
@(negedge clk)
reset_n=1;i0=1;i1=2;w0=3;w1=4;w2=5;
select0=0;select1=0;
@(negedge clk)
i0=2;i1=3;w0=4;w1=5;w2=6;
#50 $stop;

end

always
    #5 clk=~clk;

endmodule