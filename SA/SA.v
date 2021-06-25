module SA
(
//input
i011,i012,i013,i014,i015,i016,i017,i018,i021,i022,i023,i024,i025,i026,i027,i028,i031,i032,i033,i034,i035,i036,i037,i038,i041,i042,i043,i044,i045,i046,i047,i048
,i111,i112,i113,i114,i115,i116,i117,i118,i121,i122,i123,i124,i125,i126,i127,i128,i131,i132,i133,i134,i135,i136,i137,i138,i141,i142,i143,i144,i145,i146,i147,i148
//weight
,w011,w012,w013,w014,w015,w016,w017,w018,w021,w022,w023,w024,w025,w026,w027,w028,w031,w032,w033,w034,w035,w036,w037,w038,w041,w042,w043,w044,w045,w046,w047,w048
,w111,w112,w113,w114,w115,w116,w117,w118,w121,w122,w123,w124,w125,w126,w127,w128,w131,w132,w133,w134,w135,w136,w137,w138,w141,w142,w143,w144,w145,w146,w147,w148
,w211,w212,w213,w214,w215,w216,w217,w218,w221,w222,w223,w224,w225,w226,w227,w228,w231,w232,w233,w234,w235,w236,w237,w238,w241,w242,w243,w244,w245,w246,w247,w248
//output
,out011,out111,out211,out012,out112,out212,out013,out113,out213,out014,out114,out214,out015,out115,out215,out016,out116,out216,out017,out117,out217,out018,out118
,out218,out021,out121,out221,out022,out122,out222,out023,out123,out223,out024,out124,out224,out025,out125,out225,out026,out126,out226,out027,out127,out227,out028
,out128,out228,out031,out131,out231,out032,out132,out232,out033,out133,out233,out034,out134,out234,out035,out135,out235,out036,out136,out236,out037,out137,out237
,out038,out138,out238,out041,out141,out241,out042,out142,out242,out043,out143,out243,out044,out144,out244,out045,out145,out245,out046,out146,out246,out047,out147
,out247,out048,out148,out248
//Select and reset,clk
,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk
);

parameter N=8;
//Port
input [N-1:0]
//input
i011,i012,i013,i014,i015,i016,i017,i018,i021,i022,i023,i024,i025,i026,i027,i028,i031,i032,i033,i034,i035,i036,i037,i038,i041,i042,i043,i044,i045,i046,i047,i048
,i111,i112,i113,i114,i115,i116,i117,i118,i121,i122,i123,i124,i125,i126,i127,i128,i131,i132,i133,i134,i135,i136,i137,i138,i141,i142,i143,i144,i145,i146,i147,i148
//weight
,w011,w012,w013,w014,w015,w016,w017,w018,w021,w022,w023,w024,w025,w026,w027,w028,w031,w032,w033,w034,w035,w036,w037,w038,w041,w042,w043,w044,w045,w046,w047,w048
,w111,w112,w113,w114,w115,w116,w117,w118,w121,w122,w123,w124,w125,w126,w127,w128,w131,w132,w133,w134,w135,w136,w137,w138,w141,w142,w143,w144,w145,w146,w147,w148
,w211,w212,w213,w214,w215,w216,w217,w218,w221,w222,w223,w224,w225,w226,w227,w228,w231,w232,w233,w234,w235,w236,w237,w238,w241,w242,w243,w244,w245,w246,w247,w248;
//
//Select and reset,clk
input select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk;

output [2*N-1:0] 
out011,out111,out211,out012,out112,out212,out013,out113,out213,out014,out114,out214,out015,out115,out215,out016,out116,out216,out017,out117,out217,out018,out118
,out218,out021,out121,out221,out022,out122,out222,out023,out123,out223,out024,out124,out224,out025,out125,out225,out026,out126,out226,out027,out127,out227,out028
,out128,out228,out031,out131,out231,out032,out132,out232,out033,out133,out233,out034,out134,out234,out035,out135,out235,out036,out136,out236,out037,out137,out237
,out038,out138,out238,out041,out141,out241,out042,out142,out242,out043,out143,out243,out044,out144,out244,out045,out145,out245,out046,out146,out246,out047,out147
,out247,out048,out148,out248;

//Call PE module
/*
PE PE11 (i011,i111,w011,w111,w211,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out11);                                                              
PE PE12 (i012,i112,w012,w112,w212,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out12);                                                              
PE PE13 (i013,i113,w013,w113,w213,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out13);                                                              
PE PE14 (i014,i114,w014,w114,w214,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out14);                                                              
PE PE15 (i015,i115,w015,w115,w215,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out15);                                                              
PE PE16 (i016,i116,w016,w116,w216,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out16);                                                              
PE PE17 (i017,i117,w017,w117,w217,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out17);                                                              
PE PE18 (i018,i118,w018,w118,w218,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out18);                                                              
PE PE21 (i021,i121,w021,w121,w221,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out21);                                                              
PE PE22 (i022,i122,w022,w122,w222,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out22);                                                              
PE PE23 (i023,i123,w023,w123,w223,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out23);                                                              
PE PE24 (i024,i124,w024,w124,w224,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out24);                                                              
PE PE25 (i025,i125,w025,w125,w225,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out25);                                                              
PE PE26 (i026,i126,w026,w126,w226,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out26);                                                              
PE PE27 (i027,i127,w027,w127,w227,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out27);                                                              
PE PE28 (i028,i128,w028,w128,w228,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out28);                                                              
PE PE31 (i031,i131,w031,w131,w231,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out31);                                                              
PE PE32 (i032,i132,w032,w132,w232,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out32);                                                              
PE PE33 (i033,i133,w033,w133,w233,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out33);                                                              
PE PE34 (i034,i134,w034,w134,w234,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out34);                                                              
PE PE35 (i035,i135,w035,w135,w235,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out35);                                                              
PE PE36 (i036,i136,w036,w136,w236,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out36);                                                              
PE PE37 (i037,i137,w037,w137,w237,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out37);                                                              
PE PE38 (i038,i138,w038,w138,w238,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out38);                                                              
PE PE41 (i041,i141,w041,w141,w241,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out41);                                                              
PE PE42 (i042,i142,w042,w142,w242,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out42);                                                              
PE PE43 (i043,i143,w043,w143,w243,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out43);                                                              
PE PE44 (i044,i144,w044,w144,w244,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out44);                                                              
PE PE45 (i045,i145,w045,w145,w245,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out45);                                                              
PE PE46 (i046,i146,w046,w146,w246,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out46);                                                              
PE PE47 (i047,i147,w047,w147,w247,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out47);                                                              
PE PE48 (i048,i148,w048,w148,w248,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out48);   
*/
PE PE11 (i011,i111,w011,w111,w211,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out011,out111,out211);                                                              
PE PE12 (i012,i112,w012,w112,w212,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out012,out112,out212);                                                              
PE PE13 (i013,i113,w013,w113,w213,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out013,out113,out213);                                                              
PE PE14 (i014,i114,w014,w114,w214,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out014,out114,out214);                                                              
PE PE15 (i015,i115,w015,w115,w215,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out015,out115,out215);                                                              
PE PE16 (i016,i116,w016,w116,w216,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out016,out116,out216);                                                              
PE PE17 (i017,i117,w017,w117,w217,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out017,out117,out217);                                                              
PE PE18 (i018,i118,w018,w118,w218,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out018,out118,out218);                                                              
PE PE21 (i021,i121,w021,w121,w221,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out021,out121,out221);                                                              
PE PE22 (i022,i122,w022,w122,w222,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out022,out122,out222);                                                              
PE PE23 (i023,i123,w023,w123,w223,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out023,out123,out223);                                                              
PE PE24 (i024,i124,w024,w124,w224,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out024,out124,out224);                                                              
PE PE25 (i025,i125,w025,w125,w225,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out025,out125,out225);                                                              
PE PE26 (i026,i126,w026,w126,w226,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out026,out126,out226);                                                              
PE PE27 (i027,i127,w027,w127,w227,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out027,out127,out227);                                                              
PE PE28 (i028,i128,w028,w128,w228,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out028,out128,out228);  
PE PE31 (i031,i131,w031,w131,w231,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out031,out131,out231);                                                              
PE PE32 (i032,i132,w032,w132,w232,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out032,out132,out232);                                                              
PE PE33 (i033,i133,w033,w133,w233,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out033,out133,out233);                                                              
PE PE34 (i034,i134,w034,w134,w234,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out034,out134,out234);                                                              
PE PE35 (i035,i135,w035,w135,w235,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out035,out135,out235);                                                              
PE PE36 (i036,i136,w036,w136,w236,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out036,out136,out236);                                                              
PE PE37 (i037,i137,w037,w137,w237,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out037,out137,out237);                                                              
PE PE38 (i038,i138,w038,w138,w238,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out038,out138,out238);                                                              
PE PE41 (i041,i141,w041,w141,w241,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out041,out141,out241);                                                              
PE PE42 (i042,i142,w042,w142,w242,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out042,out142,out242);                                                              
PE PE43 (i043,i143,w043,w143,w243,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out043,out143,out243);                                                              
PE PE44 (i044,i144,w044,w144,w244,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out044,out144,out244);                                                              
PE PE45 (i045,i145,w045,w145,w245,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out045,out145,out245);                                                              
PE PE46 (i046,i146,w046,w146,w246,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out046,out146,out246);                                                              
PE PE47 (i047,i147,w047,w147,w247,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out047,out147,out247);                                                              
PE PE48 (i048,i148,w048,w148,w248,select_m0,select_m1,select_m2,select_m3,select0,select1,reset_n,clk,out048,out148,out248);
endmodule
