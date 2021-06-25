module ACC(sw_in,sw_out,reset_n,clk,led);

parameter N=8;

input [2:0]sw_in;
input [1:0]sw_out;
//Select and reset,clk
input reset_n,clk;

output [7:0]led; 

wire [2*N-1:0]
//fp input
lunda,gama,beta;
//Port
wire [N-1:0]
//input
i011,i012,i013,i014,i015,i016,i017,i018,i021,i022,i023,i024,i025,i026,i027,i028,i031,i032,i033,i034,i035,i036,i037,i038,i041,i042,i043,i044,i045,i046,i047,i048
,i111,i112,i113,i114,i115,i116,i117,i118,i121,i122,i123,i124,i125,i126,i127,i128,i131,i132,i133,i134,i135,i136,i137,i138,i141,i142,i143,i144,i145,i146,i147,i148
//weight
,w011,w012,w013,w014,w015,w016,w017,w018,w021,w022,w023,w024,w025,w026,w027,w028,w031,w032,w033,w034,w035,w036,w037,w038,w041,w042,w043,w044,w045,w046,w047,w048
,w111,w112,w113,w114,w115,w116,w117,w118,w121,w122,w123,w124,w125,w126,w127,w128,w131,w132,w133,w134,w135,w136,w137,w138,w141,w142,w143,w144,w145,w146,w147,w148
,w211,w212,w213,w214,w215,w216,w217,w218,w221,w222,w223,w224,w225,w226,w227,w228,w231,w232,w233,w234,w235,w236,w237,w238,w241,w242,w243,w244,w245,w246,w247,w248;

wire [2*N-1:0]
//bn_state
x_bp11,x_bp12,x_bp13,x_bp14,x_bp15
,x_bp16,x_bp17,x_bp18,x_bp21,x_bp22,x_bp23,x_bp24,x_bp25,x_bp26,x_bp27,x_bp28,x_bp31,x_bp32,x_bp33,x_bp34,x_bp35,x_bp36,x_bp37,x_bp38,x_bp41,x_bp42,x_bp43,x_bp44
,x_bp45,x_bp46,x_bp47,x_bp48
//SA
,out11,out12,out13,out14,out15,out16,out17,out18,out21,out22,out23,out24,out25,out26,out27,out28,out31,out32,out33,out34,out35,out36,out37,out38,out41,out42
,out43,out44,out45,out46,out47,out48;

//final output
wire [4*N-1:0] output11,output12,output13,output21,output22,output23,output31,output32,output33,output41,output42,output43;
//counter
/*
reg [15:0]q;
reg [4*N-1:0]temp_out;

always@(posedge clk or negedge reset_n)
begin
case(reset_n)

1'b1:
begin
if(!temp_out)
q<=q+1'b1;
else
q <=0;
end

default:q<=0;

endcase
end

always@(posedge clk or negedge reset_n)
begin
case(reset_n)

1'b1:
begin
if(q==10)
    temp_out<=output13;
  else
    temp_out<=temp_out;
end

default:
begin

temp_out<=0;

end
endcase
end

always@(posedge clk or negedge reset_n)
begin
  if (!reset_n)
  begin
    temp_out<=0;
  end

  else
    begin
        if(!temp_out)
            q <= q+1'b1;
        else
   	    q <=0;
    end
end
always@(output13)
begin
  if(q==10)
    temp_out=output13;
  else
    temp_out=temp_out;
end
*/

GC_IN gc_in (sw_in,i011,i012,i013,i014,i015,i016,i017,i018,i021,i022,i023,i024,i025,i026,i027,i028,i031,i032,i033,i034,i035,i036,i037,i038,i041,i042,i043,i044,i045,i046,i047,i048
,i111,i112,i113,i114,i115,i116,i117,i118,i121,i122,i123,i124,i125,i126,i127,i128,i131,i132,i133,i134,i135,i136,i137,i138,i141,i142,i143,i144,i145,i146,i147,i148
,w011,w012,w013,w014,w015,w016,w017,w018,w021,w022,w023,w024,w025,w026,w027,w028,w031,w032,w033,w034,w035,w036,w037,w038,w041,w042,w043,w044,w045,w046,w047,w048
,w111,w112,w113,w114,w115,w116,w117,w118,w121,w122,w123,w124,w125,w126,w127,w128,w131,w132,w133,w134,w135,w136,w137,w138,w141,w142,w143,w144,w145,w146,w147,w148
,w211,w212,w213,w214,w215,w216,w217,w218,w221,w222,w223,w224,w225,w226,w227,w228,w231,w232,w233,w234,w235,w236,w237,w238,w241,w242,w243,w244,w245,w246,w247,w248
,lunda,gama,beta,select_m0,select_m1,select_m2,select_m3,select0,select1);

SA SA1 (
//input
i011,i012,i013,i014,i015,i016,i017,i018,i021,i022,i023,i024,i025,i026,i027,i028,i031,i032,i033,i034,i035,i036,i037,i038,i041,i042,i043,i044,i045,i046,i047,i048
,i111,i112,i113,i114,i115,i116,i117,i118,i121,i122,i123,i124,i125,i126,i127,i128,i131,i132,i133,i134,i135,i136,i137,i138,i141,i142,i143,i144,i145,i146,i147,i148
//weight
,w011,w012,w013,w014,w015,w016,w017,w018,w021,w022,w023,w024,w025,w026,w027,w028,w031,w032,w033,w034,w035,w036,w037,w038,w041,w042,w043,w044,w045,w046,w047,w048
,w111,w112,w113,w114,w115,w116,w117,w118,w121,w122,w123,w124,w125,w126,w127,w128,w131,w132,w133,w134,w135,w136,w137,w138,w141,w142,w143,w144,w145,w146,w147,w148
,w211,w212,w213,w214,w215,w216,w217,w218,w221,w222,w223,w224,w225,w226,w227,w228,w231,w232,w233,w234,w235,w236,w237,w238,w241,w242,w243,w244,w245,w246,w247,w248
//output
,out11,out12,out13,out14,out15,out16,out17,out18,out21,out22,out23,out24,out25,out26,out27,out28,out31,out32,out33,out34,out35,out36,out37,out38,out41,out42
,out43,out44,out45,out46,out47,out48
//Select and reset,clk
,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk);


BN bn (
//SA ouput to BN input
out11,out12,out13,out14,out15,out16,out17,out18,out21,out22,out23,out24,out25,out26,out27,out28,out31,out32,out33,out34,out35,out36,out37,out38,out41,out42
,out43,out44,out45,out46,out47,out48
//bp (unknow)
,x_bp11,x_bp12,x_bp13,x_bp14,x_bp15,x_bp16,x_bp17,x_bp18,x_bp21,x_bp22,x_bp23,x_bp24,x_bp25,x_bp26,x_bp27,x_bp28,x_bp31,x_bp32,x_bp33,x_bp34,x_bp35,x_bp36
,x_bp37,x_bp38,x_bp41,x_bp42,x_bp43,x_bp44,x_bp45,x_bp46,x_bp47,x_bp48
,clk,reset_n,select1,output11,output12,output13,output21,output22,output23,output31,output32,output33,output41,output42,output43,lunda,gama,beta);

GC_OUT gc_out (output13,sw_out,led);



endmodule 