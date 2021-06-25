module BN_STAT_tb;
parameter N=16;
integer i;
reg [N-1:0]X[7:0];	//input xi or dyi 
reg [N-1:0]X_BP[7:0];	//input ^xi
reg clk,select,reset;

wire [N-1:0]MEAN1;	//output mean1&mean2
wire [2*N-1:0]MEAN2;
BN_STAT BN1(X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X_BP[0],X_BP[1],X_BP[2],X_BP[3],X_BP[4],X_BP[5],X_BP[6],X_BP[7],clk,select,reset,MEAN1,MEAN2);
initial
begin
clk=1'b0;
end
initial
begin

@(posedge clk) select<=1'b0;
reset=1'b0;
for (i=0;i<=7;i=i+1)
  X[i]<=16'b0;
for (i=0;i<=7;i=i+1)
  X_BP[i]<=16'b0;

@(posedge clk)select<=1'b0;reset<=1'b1;
X[0]=1;X[1]=2;X[2]=3;X[3]=4;X[4]=5;X[5]=6;X[6]=7;X[7]=8;
X_BP[0]=1;X_BP[1]=2;X_BP[2]=3;X_BP[3]=4;X_BP[4]=5;X_BP[5]=6;X_BP[6]=7;X_BP[7]=8;
@(posedge clk)select<=1'b0;
X[0]=7;X[1]=6;X[2]=5;X[3]=4;X[4]=3;X[5]=2;X[6]=2;X[7]=2;
X_BP[0]=2;X_BP[1]=3;X_BP[2]=5;X_BP[3]=6;X_BP[4]=7;X_BP[5]=3;X_BP[6]=2;X_BP[7]=1;
#20 $stop;
end

always #2 clk=~clk;
endmodule
