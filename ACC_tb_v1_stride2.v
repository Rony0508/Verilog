module ACC_tb_v1_stride2;

parameter N = 8;
//Select and reset,clk
reg clk,reset_n,in,stride;
wire pe_rst_n;
wire [1:0]curr_state,next_state;

/*-----------------------------Function's ports declare---------------------------------------*/


reg [N-1:0]
//Initial input to input buffer
i011,i012,i013,i014,i015,i016,i017,i018,i021,i022,i023,i024,i025,i026,i027,i028,i031,i032,i033,i034,i035,i036,i037,i038,i041,i042,i043,i044,i045,i046,i047,i048
,i111,i112,i113,i114,i115,i116,i117,i118,i121,i122,i123,i124,i125,i126,i127,i128,i131,i132,i133,i134,i135,i136,i137,i138,i141,i142,i143,i144,i145,i146,i147,i148
//Initial weight to weight buffer
,w011,w012,w013,w014,w015,w016,w017,w018,w021,w022,w023,w024,w025,w026,w027,w028,w031,w032,w033,w034,w035,w036,w037,w038,w041,w042,w043,w044,w045,w046,w047,w048
,w111,w112,w113,w114,w115,w116,w117,w118,w121,w122,w123,w124,w125,w126,w127,w128,w131,w132,w133,w134,w135,w136,w137,w138,w141,w142,w143,w144,w145,w146,w147,w148
,w211,w212,w213,w214,w215,w216,w217,w218,w221,w222,w223,w224,w225,w226,w227,w228,w231,w232,w233,w234,w235,w236,w237,w238,w241,w242,w243,w244,w245,w246,w247,w248;
//SA output
wire [2*N-1:0] 
out011,out111,out211,out012,out112,out212,out013,out113,out213,out014,out114,out214,out015,out115,out215,out016,out116,out216,out017,out117,out217,out018,out118
,out218,out021,out121,out221,out022,out122,out222,out023,out123,out223,out024,out124,out224,out025,out125,out225,out026,out126,out226,out027,out127,out227,out028
,out128,out228,out031,out131,out231,out032,out132,out232,out033,out133,out233,out034,out134,out234,out035,out135,out235,out036,out136,out236,out037,out137,out237
,out038,out138,out238,out041,out141,out241,out042,out142,out242,out043,out143,out243,out044,out144,out244,out045,out145,out245,out046,out146,out246,out047,out147
,out247,out048,out148,out248;

/*-----------------------------Input buffer's ports declare---------------------------------------*/
reg inbuf_en;
wire inputbuf_select;
//input buffer's output to input_pref
wire [N-1:0]
pe11_third_in0,pe12_third_in0,pe13_third_in0,pe14_third_in0, pe15_third_in0,pe16_third_in0,pe17_third_in0
,pe18_third_in0,pe21_third_in0, pe22_third_in0,pe23_third_in0,pe24_third_in0, pe25_third_in0,pe26_third_in0,pe27_third_in0
,pe28_third_in0,pe31_third_in0, pe32_third_in0,pe33_third_in0, pe34_third_in0, pe35_third_in0
,pe36_third_in0,pe37_third_in0,pe38_third_in0,pe41_third_in0,pe42_third_in0,pe43_third_in0
,pe44_third_in0, pe45_third_in0,pe46_third_in0,pe47_third_in0,pe48_third_in0;

/*-----------------------------Weight buffer's ports declare---------------------------------------*/
wire weightbuf_select;
//weight buffer's output
wire [N-1:0]
pe11_third_weight0,pe12_third_weight0,pe13_third_weight0,pe14_third_weight0, pe15_third_weight0,pe16_third_weight0,pe17_third_weight0
,pe18_third_weight0,pe21_third_weight0, pe22_third_weight0,pe23_third_weight0,pe24_third_weight0, pe25_third_weight0,pe26_third_weight0,pe27_third_weight0
,pe28_third_weight0,pe31_third_weight0, pe32_third_weight0,pe33_third_weight0, pe34_third_weight0, pe35_third_weight0
,pe36_third_weight0,pe37_third_weight0,pe38_third_weight0,pe41_third_weight0,pe42_third_weight0,pe43_third_weight0
,pe44_third_weight0, pe45_third_weight0,pe46_third_weight0,pe47_third_weight0,pe48_third_weight0;
wire [N-1:0]
pe11_third_weight1,pe12_third_weight1,pe13_third_weight1,pe14_third_weight1, pe15_third_weight1,pe16_third_weight1,pe17_third_weight1
,pe18_third_weight1,pe21_third_weight1, pe22_third_weight1,pe23_third_weight1,pe24_third_weight1, pe25_third_weight1,pe26_third_weight1,pe27_third_weight1
,pe28_third_weight1,pe31_third_weight1, pe32_third_weight1,pe33_third_weight1, pe34_third_weight1, pe35_third_weight1
,pe36_third_weight1,pe37_third_weight1,pe38_third_weight1,pe41_third_weight1,pe42_third_weight1,pe43_third_weight1
,pe44_third_weight1, pe45_third_weight1,pe46_third_weight1,pe47_third_weight1,pe48_third_weight1;
wire [N-1:0]
pe11_third_weight2,pe12_third_weight2,pe13_third_weight2,pe14_third_weight2, pe15_third_weight2,pe16_third_weight2,pe17_third_weight2
,pe18_third_weight2,pe21_third_weight2, pe22_third_weight2,pe23_third_weight2,pe24_third_weight2, pe25_third_weight2,pe26_third_weight2,pe27_third_weight2
,pe28_third_weight2,pe31_third_weight2, pe32_third_weight2,pe33_third_weight2, pe34_third_weight2, pe35_third_weight2
,pe36_third_weight2,pe37_third_weight2,pe38_third_weight2,pe41_third_weight2,pe42_third_weight2,pe43_third_weight2
,pe44_third_weight2, pe45_third_weight2,pe46_third_weight2,pe47_third_weight2,pe48_third_weight2;
/*-----------------------------BN's ports declare---------------------------------------*/
//BN's output0 & Output buffer0's input
reg [2*N-1:0]
bn11_out0,bn12_out0,bn13_out0,bn14_out0,bn15_out0,bn16_out0,bn17_out0,bn18_out0
,bn21_out0,bn22_out0,bn23_out0,bn24_out0,bn25_out0,bn26_out0,bn27_out0,bn28_out0
,bn31_out0,bn32_out0,bn33_out0,bn34_out0,bn35_out0,bn36_out0,bn37_out0,bn38_out0
,bn41_out0,bn42_out0,bn43_out0,bn44_out0,bn45_out0,bn46_out0,bn47_out0,bn48_out0;
//BN's output0 & Output buffer0's input
reg [2*N-1:0]
bn11_out1,bn12_out1,bn13_out1,bn14_out1,bn15_out1,bn16_out1,bn17_out1,bn18_out1
,bn21_out1,bn22_out1,bn23_out1,bn24_out1,bn25_out1,bn26_out1,bn27_out1,bn28_out1
,bn31_out1,bn32_out1,bn33_out1,bn34_out1,bn35_out1,bn36_out1,bn37_out1,bn38_out1
,bn41_out1,bn42_out1,bn43_out1,bn44_out1,bn45_out1,bn46_out1,bn47_out1,bn48_out1;

/*-----------------------------Output bufferf's ports declare---------------------------------------*/
//Output buffer's ctrl signal from fsm
wire buf_input_select,buf_output_select;

//Output buffer0's output
wire [2*N-1:0]
input_pref_in011,input_pref_in012,input_pref_in013,input_pref_in014,input_pref_in015
,input_pref_in016,input_pref_in017,input_pref_in018,input_pref_in021,input_pref_in022
,input_pref_in023,input_pref_in024,input_pref_in025,input_pref_in026,input_pref_in027
,input_pref_in028,input_pref_in031,input_pref_in032,input_pref_in033,input_pref_in034
,input_pref_in035,input_pref_in036,input_pref_in037,input_pref_in038,input_pref_in041
,input_pref_in042,input_pref_in043,input_pref_in044,input_pref_in045,input_pref_in046
,input_pref_in047,input_pref_in048

,weight_pref011,weight_pref012,weight_pref013,weight_pref014,weight_pref015,weight_pref016
,weight_pref017,weight_pref018,weight_pref021,weight_pref022,weight_pref023,weight_pref024
,weight_pref025,weight_pref026,weight_pref027,weight_pref028,weight_pref031,weight_pref032
,weight_pref033,weight_pref034,weight_pref035,weight_pref036,weight_pref037,weight_pref038
,weight_pref041,weight_pref042,weight_pref043,weight_pref044,weight_pref045,weight_pref046
,weight_pref047,weight_pref048;

//Output buffer1's output (input_pref's input)

wire [2*N-1:0]
input_pref_in111,input_pref_in112,input_pref_in113,input_pref_in114,input_pref_in115
,input_pref_in116,input_pref_in117,input_pref_in118,input_pref_in121,input_pref_in122
,input_pref_in123,input_pref_in124,input_pref_in125,input_pref_in126,input_pref_in127
,input_pref_in128,input_pref_in131,input_pref_in132,input_pref_in133,input_pref_in134
,input_pref_in135,input_pref_in136,input_pref_in137,input_pref_in138,input_pref_in141
,input_pref_in142,input_pref_in143,input_pref_in144,input_pref_in145,input_pref_in146
,input_pref_in147,input_pref_in148

,weight_pref111,weight_pref112,weight_pref113,weight_pref114,weight_pref115,weight_pref116
,weight_pref117,weight_pref118,weight_pref121,weight_pref122,weight_pref123,weight_pref124
,weight_pref125,weight_pref126,weight_pref127,weight_pref128,weight_pref131,weight_pref132
,weight_pref133,weight_pref134,weight_pref135,weight_pref136,weight_pref137,weight_pref138
,weight_pref141,weight_pref142,weight_pref143,weight_pref144,weight_pref145,weight_pref146
,weight_pref147,weight_pref148;

/*-----------------------------Input pref's port declare---------------------------------------*/
//Input pref's ctrl signal from fsm
wire en_cutting0,en_cutting1,inpref_select;
wire [1:0]mode_selector;
wire [2:0]mode_selector_output;
wire [1:0]parity_counter;
reg inpref_en;
reg weight_en;
//Input pref's output (input to SA)
wire[N-1:0] in011,in012,in013,in014,in015,in016,in017,in018,in021,in022,in023,in024,in025,in026,in027,in028
,in031,in032,in033,in034,in035,in036,in037,in038,in041,in042,in043,in044,in045,in046,in047,in048
,in111,in112,in113,in114,in115,in116,in117,in118,in121,in122,in123,in124,in125,in126,in127,in128
,in131,in132,in133,in134,in135,in136,in137,in138,in141,in142,in143,in144,in145,in146,in147,in148;
/*-----------------------------------------------*/

/*---------------------Call Module-------------------------*/
FSM fsm1(clk,reset_n,in,stride,select_m0,select_m1,select_m2,select_m3,select0,select1,en,pe_rst_n
,en_cutting0,en_cutting1,mode_selector,mode_selector_output,buf_input_select,buf_output_select,curr_state,next_state,parity_counter);

SA sa1(//input
in111,in112,in113,in114,in115,in116,in117,in118,in121,in122,in123,in124,in125,in126,in127,in128
,in131,in132,in133,in134,in135,in136,in137,in138,in141,in142,in143,in144,in145,in146,in147,in148
,in011,in012,in013,in014,in015,in016,in017,in018,in021,in022,in023,in024,in025,in026,in027,in028
,in031,in032,in033,in034,in035,in036,in037,in038,in041,in042,in043,in044,in045,in046,in047,in048

//weight
,pe11_third_weight0,pe12_third_weight0,pe13_third_weight0,pe14_third_weight0,pe15_third_weight0,pe16_third_weight0,pe17_third_weight0
,pe18_third_weight0,pe21_third_weight0,pe22_third_weight0,pe23_third_weight0,pe24_third_weight0,pe25_third_weight0,pe26_third_weight0
,pe27_third_weight0,pe28_third_weight0,pe31_third_weight0,pe32_third_weight0,pe33_third_weight0,pe34_third_weight0,pe35_third_weight0
,pe36_third_weight0,pe37_third_weight0,pe38_third_weight0,pe41_third_weight0,pe42_third_weight0,pe43_third_weight0,pe44_third_weight0
,pe45_third_weight0,pe46_third_weight0,pe47_third_weight0,pe48_third_weight0
,pe11_third_weight1,pe12_third_weight1,pe13_third_weight1,pe14_third_weight1,pe15_third_weight1,pe16_third_weight1,pe17_third_weight1
,pe18_third_weight1,pe21_third_weight1,pe22_third_weight1,pe23_third_weight1,pe24_third_weight1,pe25_third_weight1,pe26_third_weight1
,pe27_third_weight1,pe28_third_weight1,pe31_third_weight1,pe32_third_weight1,pe33_third_weight1,pe34_third_weight1,pe35_third_weight1
,pe36_third_weight1,pe37_third_weight1,pe38_third_weight1,pe41_third_weight1,pe42_third_weight1,pe43_third_weight1,pe44_third_weight1
,pe45_third_weight1,pe46_third_weight1,pe47_third_weight1,pe48_third_weight1
,pe11_third_weight2,pe12_third_weight2,pe13_third_weight2,pe14_third_weight2,pe15_third_weight2,pe16_third_weight2,pe17_third_weight2
,pe18_third_weight2,pe21_third_weight2,pe22_third_weight2,pe23_third_weight2,pe24_third_weight2,pe25_third_weight2,pe26_third_weight2
,pe27_third_weight2,pe28_third_weight2,pe31_third_weight2,pe32_third_weight2,pe33_third_weight2,pe34_third_weight2,pe35_third_weight2
,pe36_third_weight2,pe37_third_weight2,pe38_third_weight2,pe41_third_weight2,pe42_third_weight2,pe43_third_weight2,pe44_third_weight2
,pe45_third_weight2,pe46_third_weight2,pe47_third_weight2,pe48_third_weight2
//output
,out011,out111,out211,out012,out112,out212,out013,out113,out213,out014,out114,out214,out015,out115,out215,out016,out116,out216,out017,out117,out217,out018,out118
,out218,out021,out121,out221,out022,out122,out222,out023,out123,out223,out024,out124,out224,out025,out125,out225,out026,out126,out226,out027,out127,out227,out028
,out128,out228,out031,out131,out231,out032,out132,out232,out033,out133,out233,out034,out134,out234,out035,out135,out235,out036,out136,out236,out037,out137,out237
,out038,out138,out238,out041,out141,out241,out042,out142,out242,out043,out143,out243,out044,out144,out244,out045,out145,out245,out046,out146,out246,out047,out147
,out247,out048,out148,out248
//Select and reset,clk
,select_m0,select_m1,select_m2,select_m3,select0,select1,pe_rst_n,clk);


/*-------------------input buffer----------------------------*/
input_buf inbuffer0(inbuf_en,clk,reset_n,inputbuf_select,i011,i012,i013,i014,i015,i016,i017,i018,i021,i022,i023,i024,i025
,i026,i027,i028,i031,i032,i033,i034,i035,i036,i037,i038,i041,i042,i043,i044,i045,i046,i047,i048
,pe11_third_in0,pe12_third_in0,pe13_third_in0,pe14_third_in0, pe15_third_in0,pe16_third_in0,pe17_third_in0
,pe18_third_in0,pe21_third_in0, pe22_third_in0,pe23_third_in0,pe24_third_in0, pe25_third_in0,pe26_third_in0,pe27_third_in0
,pe28_third_in0,pe31_third_in0, pe32_third_in0,pe33_third_in0, pe34_third_in0, pe35_third_in0
,pe36_third_in0,pe37_third_in0,pe38_third_in0,pe41_third_in0,pe42_third_in0,pe43_third_in0
,pe44_third_in0, pe45_third_in0,pe46_third_in0,pe47_third_in0,pe48_third_in0);


/*--------------------weight buffer---------------------------*/
weight_buf weightbuffer0(weight_en,clk,reset_n,weightbuf_select,w011,w012,w013,w014,w015,w016,w017,w018,w021,w022,w023,w024,w025,w026,w027,w028,w031,w032,w033,w034
,w035,w036,w037,w038,w041,w042,w043,w044,w045,w046,w047,w048
,pe11_third_weight0,pe12_third_weight0,pe13_third_weight0,pe14_third_weight0,pe15_third_weight0,pe16_third_weight0,pe17_third_weight0
,pe18_third_weight0,pe21_third_weight0,pe22_third_weight0,pe23_third_weight0,pe24_third_weight0,pe25_third_weight0,pe26_third_weight0
,pe27_third_weight0,pe28_third_weight0,pe31_third_weight0,pe32_third_weight0,pe33_third_weight0,pe34_third_weight0,pe35_third_weight0
,pe36_third_weight0,pe37_third_weight0,pe38_third_weight0,pe41_third_weight0,pe42_third_weight0,pe43_third_weight0,pe44_third_weight0
,pe45_third_weight0,pe46_third_weight0,pe47_third_weight0,pe48_third_weight0);
/*--------------------weight1 buffer---------------------------*/
weight_buf weightbuffer1(weight_en,clk,reset_n,buf_select,w111,w112,w113,w114,w115,w116,w117,w118,w121,w122,w123,w124,w125,w126,w127,w128
,w131,w132,w133,w134,w135,w136,w137,w138,w141,w142,w143,w144,w145,w146,w147,w148
,pe11_third_weight1,pe12_third_weight1,pe13_third_weight1,pe14_third_weight1, pe15_third_weight1,pe16_third_weight1,pe17_third_weight1
,pe18_third_weight1,pe21_third_weight1, pe22_third_weight1,pe23_third_weight1,pe24_third_weight1, pe25_third_weight1,pe26_third_weight1,pe27_third_weight1
,pe28_third_weight1,pe31_third_weight1, pe32_third_weight1,pe33_third_weight1, pe34_third_weight1, pe35_third_weight1
,pe36_third_weight1,pe37_third_weight1,pe38_third_weight1,pe41_third_weight1,pe42_third_weight1,pe43_third_weight1
,pe44_third_weight1, pe45_third_weight1,pe46_third_weight1,pe47_third_weight1,pe48_third_weight1);
/*--------------------weight2 buffer---------------------------*/
weight_buf weightbuffer2(weight_en,clk,reset_n,buf_select,w211,w212,w213,w214,w215,w216,w217,w218,w221,w222,w223,w224,w225,w226,w227,w228
,w231,w232,w233,w234,w235,w236,w237,w238,w241,w242,w243,w244,w245,w246,w247,w248
,pe11_third_weight2,pe12_third_weight2,pe13_third_weight2,pe14_third_weight2, pe15_third_weight2,pe16_third_weight2,pe17_third_weight2
,pe18_third_weight2,pe21_third_weight2, pe22_third_weight2,pe23_third_weight2,pe24_third_weight2, pe25_third_weight2,pe26_third_weight2,pe27_third_weight2
,pe28_third_weight2,pe31_third_weight2, pe32_third_weight2,pe33_third_weight2, pe34_third_weight2, pe35_third_weight2
,pe36_third_weight2,pe37_third_weight2,pe38_third_weight2,pe41_third_weight2,pe42_third_weight2,pe43_third_weight2
,pe44_third_weight2, pe45_third_weight2,pe46_third_weight2,pe47_third_weight2,pe48_third_weight2);


/*--------------------output0 buffer---------------------------*/
output_buf outbuffer0(en,clk,reset_n,buf_input_select,buf_output_select

,out211,bn11_out0,out212,bn12_out0,out213,bn13_out0,out214,bn14_out0,out215,bn15_out0,out216,bn16_out0,out217,bn17_out0
,out218,bn18_out0,out221,bn21_out0,out222,bn22_out0,out223,bn23_out0,out224,bn24_out0,out225,bn25_out0,out226,bn26_out0
,out227,bn27_out0,out228,bn28_out0,out231,bn31_out0,out232,bn32_out0,out233,bn33_out0,out234,bn34_out0,out235,bn35_out0
,out236,bn36_out0,out237,bn37_out0,out238,bn38_out0,out241,bn41_out0,out242,bn42_out0,out243,bn43_out0,out244,bn44_out0
,out245,bn45_out0,out246,bn46_out0,out247,bn47_out0,out248,bn48_out0

,input_pref_in011,input_pref_in012,input_pref_in013,input_pref_in014,input_pref_in015
,input_pref_in016,input_pref_in017,input_pref_in018,input_pref_in021,input_pref_in022
,input_pref_in023,input_pref_in024,input_pref_in025,input_pref_in026,input_pref_in027
,input_pref_in028,input_pref_in031,input_pref_in032,input_pref_in033,input_pref_in034
,input_pref_in035,input_pref_in036,input_pref_in037,input_pref_in038,input_pref_in041
,input_pref_in042,input_pref_in043,input_pref_in044,input_pref_in045,input_pref_in046
,input_pref_in047,input_pref_in048

,weight_pref011,weight_pref012,weight_pref013,weight_pref014,weight_pref015,weight_pref016
,weight_pref017,weight_pref018,weight_pref021,weight_pref022,weight_pref023,weight_pref024
,weight_pref025,weight_pref026,weight_pref027,weight_pref028,weight_pref031,weight_pref032
,weight_pref033,weight_pref034,weight_pref035,weight_pref036,weight_pref037,weight_pref038
,weight_pref041,weight_pref042,weight_pref043,weight_pref044,weight_pref045,weight_pref046
,weight_pref047,weight_pref048);
/*--------------------output1 buffer---------------------------*/
output_buf outbuffer1(en,clk,reset_n,buf_input_select,buf_output_select

,out111,bn11_out1,out112,bn12_out1,out113,bn13_out1,out114,bn14_out1,out115,bn15_out1
,out116,bn16_out1,out117,bn17_out1,out118,bn18_out1,out121,bn21_out1,out122,bn22_out1
,out123,bn23_out1,out124,bn24_out1,out125,bn25_out1,out126,bn26_out1,out127,bn27_out1
,out128,bn28_out1,out131,bn31_out1,out132,bn32_out1,out133,bn33_out1,out134,bn34_out1
,out135,bn35_out1,out136,bn36_out1,out137,bn37_out1,out138,bn38_out1,out141,bn41_out1
,out142,bn42_out1,out143,bn43_out1,out144,bn44_out1,out145,bn45_out1,out146,bn46_out1
,out147,bn47_out1,out148,bn48_out1

,input_pref_in111,input_pref_in112,input_pref_in113,input_pref_in114,input_pref_in115
,input_pref_in116,input_pref_in117,input_pref_in118,input_pref_in121,input_pref_in122
,input_pref_in123,input_pref_in124,input_pref_in125,input_pref_in126,input_pref_in127
,input_pref_in128,input_pref_in131,input_pref_in132,input_pref_in133,input_pref_in134
,input_pref_in135,input_pref_in136,input_pref_in137,input_pref_in138,input_pref_in141
,input_pref_in142,input_pref_in143,input_pref_in144,input_pref_in145,input_pref_in146
,input_pref_in147,input_pref_in148

,weight_pref111,weight_pref112,weight_pref113,weight_pref114,weight_pref115,weight_pref116
,weight_pref117,weight_pref118,weight_pref121,weight_pref122,weight_pref123,weight_pref124
,weight_pref125,weight_pref126,weight_pref127,weight_pref128,weight_pref131,weight_pref132
,weight_pref133,weight_pref134,weight_pref135,weight_pref136,weight_pref137,weight_pref138
,weight_pref141,weight_pref142,weight_pref143,weight_pref144,weight_pref145,weight_pref146
,weight_pref147,weight_pref148);
/*--------------------Input pref---------------------------*/
input_pref inPref(en_cutting0,en_cutting1,mode_selector,mode_selector_output,parity_counter

,en,clk,reset_n,inpref_select

,pe11_third_in0,pe12_third_in0,pe13_third_in0,pe14_third_in0, pe15_third_in0,pe16_third_in0,pe17_third_in0
,pe18_third_in0,pe21_third_in0, pe22_third_in0,pe23_third_in0,pe24_third_in0, pe25_third_in0,pe26_third_in0,pe27_third_in0
,pe28_third_in0,pe31_third_in0, pe32_third_in0,pe33_third_in0, pe34_third_in0, pe35_third_in0
,pe36_third_in0,pe37_third_in0,pe38_third_in0,pe41_third_in0,pe42_third_in0,pe43_third_in0
,pe44_third_in0, pe45_third_in0,pe46_third_in0,pe47_third_in0,pe48_third_in0

,input_pref_in011,input_pref_in012,input_pref_in013,input_pref_in014,input_pref_in015
,input_pref_in016,input_pref_in017,input_pref_in018,input_pref_in021,input_pref_in022
,input_pref_in023,input_pref_in024,input_pref_in025,input_pref_in026,input_pref_in027
,input_pref_in028,input_pref_in031,input_pref_in032,input_pref_in033,input_pref_in034
,input_pref_in035,input_pref_in036,input_pref_in037,input_pref_in038,input_pref_in041
,input_pref_in042,input_pref_in043,input_pref_in044,input_pref_in045,input_pref_in046
,input_pref_in047,input_pref_in048

,input_pref_in111,input_pref_in112,input_pref_in113,input_pref_in114,input_pref_in115
,input_pref_in116,input_pref_in117,input_pref_in118,input_pref_in121,input_pref_in122
,input_pref_in123,input_pref_in124,input_pref_in125,input_pref_in126,input_pref_in127
,input_pref_in128,input_pref_in131,input_pref_in132,input_pref_in133,input_pref_in134
,input_pref_in135,input_pref_in136,input_pref_in137,input_pref_in138,input_pref_in141
,input_pref_in142,input_pref_in143,input_pref_in144,input_pref_in145,input_pref_in146
,input_pref_in147,input_pref_in148

,in011,in012,in013,in014,in015,in016,in017,in018,in021,in022,in023,in024,in025,in026,in027,in028
,in031,in032,in033,in034,in035,in036,in037,in038,in041,in042,in043,in044,in045,in046,in047,in048
,in111,in112,in113,in114,in115,in116,in117,in118,in121,in122,in123,in124,in125,in126,in127,in128
,in131,in132,in133,in134,in135,in136,in137,in138,in141,in142,in143,in144,in145,in146,in147,in148);

/*--------------------Weight pref---------------------------*/
//weight_pref weightPref();
/*--------------------Weight update---------------------------*/
//weight_update weightUpdate();
/*--------------------Loss func---------------------------*/
//loss_func Loss();

/*----------------------------------------------------------------------------------------------------*/

//clk reset
initial 
begin
clk=1;
end

//Give input value
initial 
begin
//reset PSUM and DFF
reset_n=0;
//pe_rst_n=0;
stride =1;
in=0;
i011=0;i012=0;i013=0;i014=0;i015=0;i016=0;i017=0;i018=0;i021=0;i022=0;i023=0;i024=0;i025=0;i026=0;i027=0;i028=0;
i031=0;i032=0;i033=0;i034=0;i035=0;i036=0;i037=0;i038=0;i041=0;i042=0;i043=0;i044=0;i045=0;i046=0;i047=0;i048=0;
i111=0;i112=0;i113=0;i114=0;i115=0;i116=0;i117=0;i118=0;i121=0;i122=0;i123=0;i124=0;i125=0;i126=0;i127=0;i128=0;
i131=0;i132=0;i133=0;i134=0;i135=0;i136=0;i137=0;i138=0;i141=0;i142=0;i143=0;i144=0;i145=0;i146=0;i147=0;i148=0;
w011=0;w012=0;w013=0;w014=0;w015=0;w016=0;w017=0;w018=0;w021=0;w022=0;w023=0;w024=0;w025=0;w026=0;w027=0;w028=0;
w031=0;w032=0;w033=0;w034=0;w035=0;w036=0;w037=0;w038=0;w041=0;w042=0;w043=0;w044=0;w045=0;w046=0;w047=0;w048=0;
w111=0;w112=0;w113=0;w114=0;w115=0;w116=0;w117=0;w118=0;w121=0;w122=0;w123=0;w124=0;w125=0;w126=0;w127=0;w128=0;
w131=0;w132=0;w133=0;w134=0;w135=0;w136=0;w137=0;w138=0;w141=0;w142=0;w143=0;w144=0;w145=0;w146=0;w147=0;w148=0;
w211=0;w212=0;w213=0;w214=0;w215=0;w216=0;w217=0;w218=0;w221=0;w222=0;w223=0;w224=0;w225=0;w226=0;w227=0;w228=0;
w231=0;w232=0;w233=0;w234=0;w235=0;w236=0;w237=0;w238=0;w241=0;w242=0;w243=0;w244=0;w245=0;w246=0;w247=0;w248=0;
bn11_out0<=0;bn12_out0<=0;bn13_out0<=0;bn14_out0<=0;bn15_out0<=0;bn16_out0<=0;bn17_out0<=0;bn18_out0<=0;
bn21_out0<=0;bn22_out0<=0;bn23_out0<=0;bn24_out0<=0;bn25_out0<=0;bn26_out0<=0;bn27_out0<=0;bn28_out0<=0;
bn31_out0<=0;bn32_out0<=0;bn33_out0<=0;bn34_out0<=0;bn35_out0<=0;bn36_out0<=0;bn37_out0<=0;bn38_out0<=0;
bn41_out0<=0;bn42_out0<=0;bn43_out0<=0;bn44_out0<=0;bn45_out0<=0;bn46_out0<=0;bn47_out0<=0;bn48_out0<=0;
bn11_out1<=0;bn12_out1<=0;bn13_out1<=0;bn14_out1<=0;bn15_out1<=0;bn16_out1<=0;bn17_out1<=0;bn18_out1<=0;
bn21_out1<=0;bn22_out1<=0;bn23_out1<=0;bn24_out1<=0;bn25_out1<=0;bn26_out1<=0;bn27_out1<=0;bn28_out1<=0;
bn31_out1<=0;bn32_out1<=0;bn33_out1<=0;bn34_out1<=0;bn35_out1<=0;bn36_out1<=0;bn37_out1<=0;bn38_out1<=0;
bn41_out1<=0;bn42_out1<=0;bn43_out1<=0;bn44_out1<=0;bn45_out1<=0;bn46_out1<=0;bn47_out1<=0;bn48_out1<=0;
@(posedge clk)
//Set FP/BP stride=1 mode
reset_n<=1;
//pe_rst_n<=1;
in<=1;
inbuf_en<=1;
weight_en<=1;
//give fp input value
//give initial input value 

@(posedge clk) 
//start store mode
//in<=0;
//give input value (second)
i011=2;i012=1;i013=3;i014=4;i015=5;i016=2;i017=1;i018=3;i021=4;i022=5;i023=2;i024=1;i025=3;i026=4;i027=5;i028=2;i031=1;i032=3;i033=4;i034=5;i035=2;i036=1;
i037=3;i038=4;i041=5;i042=2;i043=1;i044=3;i045=4;i046=5;i047=2;i048=1;i111=3;i112=4;i113=5;i114=2;i115=1;i116=3;i117=4;i118=5;i121=2;i122=1;i123=3;i124=4;
i125=5;i126=2;i127=1;i128=3;i131=4;i132=5;i133=2;i134=1;i135=3;i136=4;i137=5;i138=2;i141=1;i142=3;i143=4;i144=5;i145=2;i146=1;i147=3;i148=4;w011=5;w012=2;
w013=1;w014=3;w015=4;w016=5;w017=2;w018=1;w021=3;w022=4;w023=5;w024=2;w025=1;w026=3;w027=4;w028=5;w031=2;w032=1;w033=3;w034=4;w035=5;w036=2;w037=1;w038=3;
w041=4;w042=5;w043=2;w044=1;w045=3;w046=4;w047=5;w048=2;w111=1;w112=3;w113=4;w114=5;w115=2;w116=1;w117=3;w118=4;w121=5;w122=2;w123=1;w124=3;w125=4;w126=5;
w127=2;w128=1;w131=3;w132=4;w133=5;w134=2;w135=1;w136=3;w137=4;w138=5;w141=2;w142=1;w143=3;w144=4;w145=5;w146=2;w147=1;w148=3;w211=4;w212=5;w213=2;w214=1;
w215=3;w216=4;w217=5;w218=2;w221=1;w222=3;w223=4;w224=5;w225=2;w226=1;w227=3;w228=4;w231=5;w232=2;w233=1;w234=3;w235=4;w236=5;w237=2;w238=1;w241=3;w242=4;
w243=5;w244=2;w245=1;w246=3;w247=4;w248=5;
@(posedge clk)
//give input value (third)
i011=1;i012=2;i013=3;i014=4;i015=5;i016=1;i017=2;i018=3;i021=4;i022=5;i023=1;i024=2;i025=3;i026=4;i027=5;i028=1;i031=2;i032=3;i033=4;i034=5;i035=1;i036=2;
i037=3;i038=4;i041=5;i042=1;i043=2;i044=3;i045=4;i046=5;i047=1;i048=2;i111=3;i112=4;i113=5;i114=1;i115=2;i116=3;i117=4;i118=5;i121=1;i122=2;i123=3;i124=4;
i125=5;i126=1;i127=2;i128=3;i131=4;i132=5;i133=1;i134=2;i135=3;i136=4;i137=5;i138=1;i141=2;i142=3;i143=4;i144=5;i145=1;i146=2;i147=3;i148=4;w011=5;w012=1;
w013=2;w014=3;w015=4;w016=5;w017=1;w018=2;w021=3;w022=4;w023=5;w024=1;w025=2;w026=3;w027=4;w028=5;w031=1;w032=2;w033=3;w034=4;w035=5;w036=1;w037=2;w038=3;
w041=4;w042=5;w043=1;w044=2;w045=3;w046=4;w047=5;w048=1;w111=2;w112=3;w113=4;w114=5;w115=1;w116=2;w117=3;w118=4;w121=5;w122=1;w123=2;w124=3;w125=4;w126=5;
w127=1;w128=2;w131=3;w132=4;w133=5;w134=1;w135=2;w136=3;w137=4;w138=5;w141=1;w142=2;w143=3;w144=4;w145=5;w146=1;w147=2;w148=3;w211=4;w212=5;w213=1;w214=2;
w215=3;w216=4;w217=5;w218=1;w221=2;w222=3;w223=4;w224=5;w225=1;w226=2;w227=3;w228=4;w231=5;w232=1;w233=2;w234=3;w235=4;w236=5;w237=1;w238=2;w241=3;w242=4;
w243=5;w244=1;w245=2;w246=3;w247=4;w248=5;

@(posedge clk)

//give input value (forth)
i011=2;i012=5;i013=1;i014=4;i015=3;i016=2;i017=5;i018=1;i021=4;i022=3;i023=2;i024=5;i025=1;i026=4;i027=3;i028=2;i031=5;i032=1;i033=4;i034=3;i035=2;i036=5;
i037=1;i038=4;i041=3;i042=2;i043=5;i044=1;i045=4;i046=3;i047=2;i048=5;i111=1;i112=4;i113=3;i114=2;i115=5;i116=1;i117=4;i118=3;i121=2;i122=5;i123=1;i124=4;
i125=3;i126=2;i127=5;i128=1;i131=4;i132=3;i133=2;i134=5;i135=1;i136=4;i137=3;i138=2;i141=5;i142=1;i143=4;i144=3;i145=2;i146=5;i147=1;i148=4;w011=3;w012=2;
w013=5;w014=1;w015=4;w016=3;w017=2;w018=5;w021=1;w022=4;w023=3;w024=2;w025=5;w026=1;w027=4;w028=3;w031=2;w032=5;w033=1;w034=4;w035=3;w036=2;w037=5;w038=1;
w041=4;w042=3;w043=2;w044=5;w045=1;w046=4;w047=3;w048=2;w111=5;w112=1;w113=4;w114=3;w115=2;w116=5;w117=1;w118=4;w121=3;w122=2;w123=5;w124=1;w125=4;w126=3;
w127=2;w128=5;w131=1;w132=4;w133=3;w134=2;w135=5;w136=1;w137=4;w138=3;w141=2;w142=5;w143=1;w144=4;w145=3;w146=2;w147=5;w148=1;w211=4;w212=3;w213=2;w214=5;
w215=1;w216=4;w217=3;w218=2;w221=5;w222=1;w223=4;w224=3;w225=2;w226=5;w227=1;w228=4;w231=3;w232=2;w233=5;w234=1;w235=4;w236=3;w237=2;w238=5;w241=1;w242=4;
w243=3;w244=2;w245=5;w246=1;w247=4;w248=3;
@(posedge clk)

i011=0;i012=0;i013=0;i014=0;i015=0;i016=0;i017=0;i018=0;i021=0;i022=0;i023=0;i024=0;i025=0;i026=0;i027=0;i028=0;i031=0;
i032=0;i033=0;i034=0;i035=0;i036=0;i037=0;i038=0;i041=0;i042=0;i043=0;i044=0;i045=0;i046=0;i047=0;
i048=0;i111=0;i112=0;i113=0;i114=0;i115=0;i116=0;i117=0;i118=0;i121=0;i122=0;i123=0;i124=0;i125=0;i126=0;i127=0;i128=0;
i131=0;i132=0;i133=0;i134=0;i135=0;i136=0;i137=0;i138=0;i141=0;i142=0;i143=0;i144=0;i145=0;i146=0;i147=0;i148=0;w011=0;
w012=0;w013=0;w014=0;w015=0;w016=0;w017=0;w018=0;w021=0;w022=0;w023=0;w024=0;w025=0;w026=0;w027=0;w028=0;w031=0;w032=0;
w033=0;w034=0;w035=0;w036=0;w037=0;w038=0;w041=0;w042=0;w043=0;w044=0;w045=0;w046=0;w047=0;w048=0;w111=0;w112=0;w113=0;
w114=0;w115=0;w116=0;w117=0;w118=0;w121=0;w122=0;w123=0;w124=0;w125=0;w126=0;w127=0;w128=0;w131=0;w132=0;w133=0;w134=0;
w135=0;w136=0;w137=0;w138=0;w141=0;w142=0;w143=0;w144=0;w145=0;w146=0;w147=0;w148=0;w211=0;w212=0;w213=0;w214=0;w215=0;
w216=0;w217=0;w218=0;w221=0;w222=0;w223=0;w224=0;w225=0;w226=0;w227=0;w228=0;w231=0;w232=0;w233=0;w234=0;w235=0;w236=0;
w237=0;w238=0;w241=0;w242=0;w243=0;w244=0;w245=0;w246=0;w247=0;w248=0;
@(posedge clk)
@(posedge clk)
@(posedge clk)
@(posedge clk)
w013=5;w014=1;w015=4;w016=3;w017=2;w018=5;w021=1;w022=4;w023=3;w024=2;w025=5;w026=1;w027=4;w028=3;w031=2;w032=5;w033=1;w034=4;w035=3;w036=2;w037=5;w038=1;
w041=4;w042=3;w043=2;w044=5;w045=1;w046=4;w047=3;w048=2;w111=5;w112=1;w113=4;w114=3;w115=2;w116=5;w117=1;w118=4;w121=3;w122=2;w123=5;w124=1;w125=4;w126=3;
w127=2;w128=5;w131=1;w132=4;w133=3;w134=2;w135=5;w136=1;w137=4;w138=3;w141=2;w142=5;w143=1;w144=4;w145=3;w146=2;w147=5;w148=1;w211=4;w212=3;w213=2;w214=5;
w215=1;w216=4;w217=3;w218=2;w221=5;w222=1;w223=4;w224=3;w225=2;w226=5;w227=1;w228=4;w231=3;w232=2;w233=5;w234=1;w235=4;w236=3;w237=2;w238=5;w241=1;w242=4;
w243=3;w244=2;w245=5;w246=1;w247=4;w248=3;
@(posedge clk)
w013=2;w014=3;w015=4;w016=5;w017=1;w018=2;w021=3;w022=4;w023=5;w024=1;w025=2;w026=3;w027=4;w028=5;w031=1;w032=2;w033=3;w034=4;w035=5;w036=1;w037=2;w038=3;
w041=4;w042=5;w043=1;w044=2;w045=3;w046=4;w047=5;w048=1;w111=2;w112=3;w113=4;w114=5;w115=1;w116=2;w117=3;w118=4;w121=5;w122=1;w123=2;w124=3;w125=4;w126=5;
w127=1;w128=2;w131=3;w132=4;w133=5;w134=1;w135=2;w136=3;w137=4;w138=5;w141=1;w142=2;w143=3;w144=4;w145=5;w146=1;w147=2;w148=3;w211=4;w212=5;w213=1;w214=2;
w215=3;w216=4;w217=5;w218=1;w221=2;w222=3;w223=4;w224=5;w225=1;w226=2;w227=3;w228=4;w231=5;w232=1;w233=2;w234=3;w235=4;w236=5;w237=1;w238=2;w241=3;w242=4;
w243=5;w244=1;w245=2;w246=3;w247=4;w248=5;
@(posedge clk)
w013=1;w014=3;w015=4;w016=5;w017=2;w018=1;w021=3;w022=4;w023=5;w024=2;w025=1;w026=3;w027=4;w028=5;w031=2;w032=1;w033=3;w034=4;w035=5;w036=2;w037=1;w038=3;
w041=4;w042=5;w043=2;w044=1;w045=3;w046=4;w047=5;w048=2;w111=1;w112=3;w113=4;w114=5;w115=2;w116=1;w117=3;w118=4;w121=5;w122=2;w123=1;w124=3;w125=4;w126=5;
w127=2;w128=1;w131=3;w132=4;w133=5;w134=2;w135=1;w136=3;w137=4;w138=5;w141=2;w142=1;w143=3;w144=4;w145=5;w146=2;w147=1;w148=3;w211=4;w212=5;w213=2;w214=1;
w215=3;w216=4;w217=5;w218=2;w221=1;w222=3;w223=4;w224=5;w225=2;w226=1;w227=3;w228=4;w231=5;w232=2;w233=1;w234=3;w235=4;w236=5;w237=2;w238=1;w241=3;w242=4;
w243=5;w244=2;w245=1;w246=3;w247=4;w248=5;
end

initial
begin
$monitor
($time,"curr_state=%d,next_state=%d,i011=%d,w011=%d,w111=%d,w211=%d,pe11_out0=%d,pe11_out1=%d;",curr_state,next_state,in011,w011,w111,w211,out211,out111);
#80 $stop;
end

always
#1 clk=~clk;



endmodule