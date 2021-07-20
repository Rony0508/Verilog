module input_pref(
en_cutting0,en_cutting1,mode_selector,mode_selector_output

,en,clk,reset_n,buf_select

,pe11_third_in,pe12_third_in,pe13_third_in,pe14_third_in, pe15_third_in,pe16_third_in,pe17_third_in
,pe18_third_in,pe21_third_in, pe22_third_in,pe23_third_in,pe24_third_in, pe25_third_in,pe26_third_in,pe27_third_in
,pe28_third_in,pe31_third_in, pe32_third_in,pe33_third_in, pe34_third_in, pe35_third_in
,pe36_third_in,pe37_third_in,pe38_third_in,pe41_third_in,pe42_third_in,pe43_third_in
,pe44_third_in, pe45_third_in,pe46_third_in,pe47_third_in,pe48_third_in

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

,i011,i012,i013,i014,i015,i016,i017,i018,i021,i022,i023,i024,i025,i026,i027,i028
,i031,i032,i033,i034,i035,i036,i037,i038,i041,i042,i043,i044,i045,i046,i047,i048
,i111,i112,i113,i114,i115,i116,i117,i118,i121,i122,i123,i124,i125,i126,i127,i128
,i131,i132,i133,i134,i135,i136,i137,i138,i141,i142,i143,i144,i145,i146,i147,i148
);

/*---------------------------------------------------------------------------------*/

parameter N = 8;

/*---------------------------------------------------------------------------------*/

input en,clk,reset_n,buf_select;
input [1:0] mode_selector;
input [2:0] mode_selector_output;
input en_cutting0,en_cutting1;

//come from input buffer
input [N-1:0]
pe11_third_in,pe12_third_in,pe13_third_in,pe14_third_in, pe15_third_in,pe16_third_in,pe17_third_in
,pe18_third_in,pe21_third_in, pe22_third_in,pe23_third_in,pe24_third_in, pe25_third_in,pe26_third_in,pe27_third_in
,pe28_third_in,pe31_third_in, pe32_third_in,pe33_third_in, pe34_third_in, pe35_third_in
,pe36_third_in,pe37_third_in,pe38_third_in,pe41_third_in,pe42_third_in,pe43_third_in
,pe44_third_in, pe45_third_in,pe46_third_in,pe47_third_in,pe48_third_in;

//come from output buffer 0
input [2*N-1:0]
input_pref_in011,input_pref_in012,input_pref_in013,input_pref_in014,input_pref_in015
,input_pref_in016,input_pref_in017,input_pref_in018,input_pref_in021,input_pref_in022
,input_pref_in023,input_pref_in024,input_pref_in025,input_pref_in026,input_pref_in027
,input_pref_in028,input_pref_in031,input_pref_in032,input_pref_in033,input_pref_in034
,input_pref_in035,input_pref_in036,input_pref_in037,input_pref_in038,input_pref_in041
,input_pref_in042,input_pref_in043,input_pref_in044,input_pref_in045,input_pref_in046
,input_pref_in047,input_pref_in048;


//come from output buffer 1
input [2*N-1:0]
input_pref_in111,input_pref_in112,input_pref_in113,input_pref_in114,input_pref_in115
,input_pref_in116,input_pref_in117,input_pref_in118,input_pref_in121,input_pref_in122
,input_pref_in123,input_pref_in124,input_pref_in125,input_pref_in126,input_pref_in127
,input_pref_in128,input_pref_in131,input_pref_in132,input_pref_in133,input_pref_in134
,input_pref_in135,input_pref_in136,input_pref_in137,input_pref_in138,input_pref_in141
,input_pref_in142,input_pref_in143,input_pref_in144,input_pref_in145,input_pref_in146
,input_pref_in147,input_pref_in148;



/*---------------------------------------------------------------------------------*/
//go to SA
output reg [N-1:0]
i011,i012,i013,i014,i015,i016,i017,i018,i021,i022,i023,i024,i025,i026,i027,i028
,i031,i032,i033,i034,i035,i036,i037,i038,i041,i042,i043,i044,i045,i046,i047,i048
,i111,i112,i113,i114,i115,i116,i117,i118,i121,i122,i123,i124,i125,i126,i127,i128
,i131,i132,i133,i134,i135,i136,i137,i138,i141,i142,i143,i144,i145,i146,i147,i148;

/*---------------------------------------------------------------------------------*/

//wire cutting0 to MUX2to2
wire [N-1:0] 
cutting_out011,cutting_out012,cutting_out013,cutting_out014,cutting_out015,cutting_out016
,cutting_out017,cutting_out018,cutting_out021,cutting_out022,cutting_out023,cutting_out024
,cutting_out025,cutting_out026,cutting_out027,cutting_out028,cutting_out031,cutting_out032
,cutting_out033,cutting_out034,cutting_out035,cutting_out036,cutting_out037,cutting_out038
,cutting_out041,cutting_out042,cutting_out043,cutting_out044,cutting_out045,cutting_out046
,cutting_out047,cutting_out048;

wire [N-1:0]
cutting_out111,cutting_out112,cutting_out113,cutting_out114,cutting_out115,cutting_out116
,cutting_out117,cutting_out118,cutting_out121,cutting_out122,cutting_out123,cutting_out124
,cutting_out125,cutting_out126,cutting_out127,cutting_out128,cutting_out131,cutting_out132
,cutting_out133,cutting_out134,cutting_out135,cutting_out136,cutting_out137,cutting_out138
,cutting_out141,cutting_out142,cutting_out143,cutting_out144,cutting_out145,cutting_out146
,cutting_out147,cutting_out148;

//before parity
wire [N-1:0]
parity11,parity12,parity13,parity14,parity15,parity16,parity17,parity18,parity21
,parity22,parity23,parity24,parity25,parity26,parity27,parity28,parity31,parity32
,parity33,parity34,parity35,parity36,parity37,parity38,parity41,parity42,parity43
,parity44,parity45,parity46,parity47,parity48;

//no parity
wire [N-1:0]
unparity11,unparity12,unparity13,unparity14,unparity15,unparity16,unparity17,unparity18
,unparity21,unparity22,unparity23,unparity24,unparity25,unparity26,unparity27,unparity28
,unparity31,unparity32,unparity33,unparity34,unparity35,unparity36,unparity37,unparity38
,unparity41,unparity42,unparity43,unparity44,unparity45,unparity46,unparity47,unparity48;

//odd and even 
wire [N-1:0]
odd11,odd12,odd13,odd14,odd15,odd16,odd17,odd18,odd21,odd22,odd23,odd24
,odd25,odd26,odd27,odd28,odd31,odd32,odd33,odd34,odd35,odd36,odd37,odd38
,odd41,odd42,odd43,odd44,odd45,odd46,odd47,odd48;
wire [N-1:0]
even11,even12,even13,even14,even15,even16,even17,even18,even21,even22,even23
,even24,even25,even26,even27,even28,even31,even32,even33,even34,even35,even36
,even37,even38,even41,even42,even43,even44,even45,even46,even47,even48;

/*---------------------------------------------------------------------------------*/
//將16bit資料擷取成8 bit fixed point
cutting output_buf011(clk,en_cutting0,input_pref_in011,cutting_out011);
cutting output_buf012(clk,en_cutting0,input_pref_in012,cutting_out012);
cutting output_buf013(clk,en_cutting0,input_pref_in013,cutting_out013);
cutting output_buf014(clk,en_cutting0,input_pref_in014,cutting_out014);
cutting output_buf015(clk,en_cutting0,input_pref_in015,cutting_out015);
cutting output_buf016(clk,en_cutting0,input_pref_in016,cutting_out016);
cutting output_buf017(clk,en_cutting0,input_pref_in017,cutting_out017);
cutting output_buf018(clk,en_cutting0,input_pref_in018,cutting_out018);
cutting output_buf021(clk,en_cutting0,input_pref_in021,cutting_out021);
cutting output_buf022(clk,en_cutting0,input_pref_in022,cutting_out022);
cutting output_buf023(clk,en_cutting0,input_pref_in023,cutting_out023);
cutting output_buf024(clk,en_cutting0,input_pref_in024,cutting_out024);
cutting output_buf025(clk,en_cutting0,input_pref_in025,cutting_out025);
cutting output_buf026(clk,en_cutting0,input_pref_in026,cutting_out026);
cutting output_buf027(clk,en_cutting0,input_pref_in027,cutting_out027);
cutting output_buf028(clk,en_cutting0,input_pref_in028,cutting_out028);
cutting output_buf031(clk,en_cutting0,input_pref_in031,cutting_out031);
cutting output_buf032(clk,en_cutting0,input_pref_in032,cutting_out032);
cutting output_buf033(clk,en_cutting0,input_pref_in033,cutting_out033);
cutting output_buf034(clk,en_cutting0,input_pref_in034,cutting_out034);
cutting output_buf035(clk,en_cutting0,input_pref_in035,cutting_out035);
cutting output_buf036(clk,en_cutting0,input_pref_in036,cutting_out036);
cutting output_buf037(clk,en_cutting0,input_pref_in037,cutting_out037);
cutting output_buf038(clk,en_cutting0,input_pref_in038,cutting_out038);
cutting output_buf041(clk,en_cutting0,input_pref_in041,cutting_out041);
cutting output_buf042(clk,en_cutting0,input_pref_in042,cutting_out042);
cutting output_buf043(clk,en_cutting0,input_pref_in043,cutting_out043);
cutting output_buf044(clk,en_cutting0,input_pref_in044,cutting_out044);
cutting output_buf045(clk,en_cutting0,input_pref_in045,cutting_out045);
cutting output_buf046(clk,en_cutting0,input_pref_in046,cutting_out046);
cutting output_buf047(clk,en_cutting0,input_pref_in047,cutting_out047);
cutting output_buf048(clk,en_cutting0,input_pref_in048,cutting_out048);


cutting output_buf111(clk,en_cutting1,input_pref_in111,cutting_out111);
cutting output_buf112(clk,en_cutting1,input_pref_in112,cutting_out112);
cutting output_buf113(clk,en_cutting1,input_pref_in113,cutting_out113);
cutting output_buf114(clk,en_cutting1,input_pref_in114,cutting_out114);
cutting output_buf115(clk,en_cutting1,input_pref_in115,cutting_out115);
cutting output_buf116(clk,en_cutting1,input_pref_in116,cutting_out116);
cutting output_buf117(clk,en_cutting1,input_pref_in117,cutting_out117);
cutting output_buf118(clk,en_cutting1,input_pref_in118,cutting_out118);
cutting output_buf121(clk,en_cutting1,input_pref_in121,cutting_out121);
cutting output_buf122(clk,en_cutting1,input_pref_in122,cutting_out122);
cutting output_buf123(clk,en_cutting1,input_pref_in123,cutting_out123);
cutting output_buf124(clk,en_cutting1,input_pref_in124,cutting_out124);
cutting output_buf125(clk,en_cutting1,input_pref_in125,cutting_out125);
cutting output_buf126(clk,en_cutting1,input_pref_in126,cutting_out126);
cutting output_buf127(clk,en_cutting1,input_pref_in127,cutting_out127);
cutting output_buf128(clk,en_cutting1,input_pref_in128,cutting_out128);
cutting output_buf131(clk,en_cutting1,input_pref_in131,cutting_out131);
cutting output_buf132(clk,en_cutting1,input_pref_in132,cutting_out132);
cutting output_buf133(clk,en_cutting1,input_pref_in133,cutting_out133);
cutting output_buf134(clk,en_cutting1,input_pref_in134,cutting_out134);
cutting output_buf135(clk,en_cutting1,input_pref_in135,cutting_out135);
cutting output_buf136(clk,en_cutting1,input_pref_in136,cutting_out136);
cutting output_buf137(clk,en_cutting1,input_pref_in137,cutting_out137);
cutting output_buf138(clk,en_cutting1,input_pref_in138,cutting_out138);
cutting output_buf141(clk,en_cutting1,input_pref_in141,cutting_out141);
cutting output_buf142(clk,en_cutting1,input_pref_in142,cutting_out142);
cutting output_buf143(clk,en_cutting1,input_pref_in143,cutting_out143);
cutting output_buf144(clk,en_cutting1,input_pref_in144,cutting_out144);
cutting output_buf145(clk,en_cutting1,input_pref_in145,cutting_out145);
cutting output_buf146(clk,en_cutting1,input_pref_in146,cutting_out146);
cutting output_buf147(clk,en_cutting1,input_pref_in147,cutting_out147);
cutting output_buf148(clk,en_cutting1,input_pref_in148,cutting_out148);


/*---------------------------------------------------------------------------------*/
//Port Mux2t02
MUX2to2_8bit MUX2to2_8bit11 (mode_selector,pe11_third_in,cutting_out011,parity11,unparity11);
MUX2to2_8bit MUX2to2_8bit12 (mode_selector,pe12_third_in,cutting_out012,parity12,unparity12);
MUX2to2_8bit MUX2to2_8bit13 (mode_selector,pe13_third_in,cutting_out013,parity13,unparity13);
MUX2to2_8bit MUX2to2_8bit14 (mode_selector,pe14_third_in,cutting_out014,parity14,unparity14);
MUX2to2_8bit MUX2to2_8bit15 (mode_selector,pe15_third_in,cutting_out015,parity15,unparity15);
MUX2to2_8bit MUX2to2_8bit16 (mode_selector,pe16_third_in,cutting_out016,parity16,unparity16);
MUX2to2_8bit MUX2to2_8bit17 (mode_selector,pe17_third_in,cutting_out017,parity17,unparity17);
MUX2to2_8bit MUX2to2_8bit18(mode_selector,pe18_third_in,cutting_out018,parity18,unparity18);
MUX2to2_8bit MUX2to2_8bit21(mode_selector,pe21_third_in,cutting_out021,parity21,unparity21);
MUX2to2_8bit MUX2to2_8bit22(mode_selector,pe22_third_in,cutting_out022,parity22,unparity22);
MUX2to2_8bit MUX2to2_8bit23(mode_selector,pe23_third_in,cutting_out023,parity23,unparity23);
MUX2to2_8bit MUX2to2_8bit24(mode_selector,pe24_third_in,cutting_out024,parity24,unparity24);
MUX2to2_8bit MUX2to2_8bit25(mode_selector,pe25_third_in,cutting_out025,parity25,unparity25);
MUX2to2_8bit MUX2to2_8bit26(mode_selector,pe26_third_in,cutting_out026,parity26,unparity26);
MUX2to2_8bit MUX2to2_8bit27(mode_selector,pe27_third_in,cutting_out027,parity27,unparity27);
MUX2to2_8bit MUX2to2_8bit28(mode_selector,pe28_third_in,cutting_out028,parity28,unparity28);
MUX2to2_8bit MUX2to2_8bit31(mode_selector,pe31_third_in,cutting_out031,parity31,unparity31);
MUX2to2_8bit MUX2to2_8bit32(mode_selector,pe32_third_in,cutting_out032,parity32,unparity32);
MUX2to2_8bit MUX2to2_8bit33(mode_selector,pe33_third_in,cutting_out033,parity33,unparity33);
MUX2to2_8bit MUX2to2_8bit34(mode_selector,pe34_third_in,cutting_out034,parity34,unparity34);
MUX2to2_8bit MUX2to2_8bit35(mode_selector,pe35_third_in,cutting_out035,parity35,unparity35);
MUX2to2_8bit MUX2to2_8bit36(mode_selector,pe36_third_in,cutting_out036,parity36,unparity36);
MUX2to2_8bit MUX2to2_8bit37(mode_selector,pe37_third_in,cutting_out037,parity37,unparity37);
MUX2to2_8bit MUX2to2_8bit38(mode_selector,pe38_third_in,cutting_out038,parity38,unparity38);
MUX2to2_8bit MUX2to2_8bit41(mode_selector,pe41_third_in,cutting_out041,parity41,unparity41);
MUX2to2_8bit MUX2to2_8bit42(mode_selector,pe42_third_in,cutting_out042,parity42,unparity42);
MUX2to2_8bit MUX2to2_8bit43(mode_selector,pe43_third_in,cutting_out043,parity43,unparity43);
MUX2to2_8bit MUX2to2_8bit44(mode_selector,pe44_third_in,cutting_out044,parity44,unparity44);
MUX2to2_8bit MUX2to2_8bit45(mode_selector,pe45_third_in,cutting_out045,parity45,unparity45);
MUX2to2_8bit MUX2to2_8bit46(mode_selector,pe46_third_in,cutting_out046,parity46,unparity46);
MUX2to2_8bit MUX2to2_8bit47(mode_selector,pe47_third_in,cutting_out047,parity47,unparity47);
MUX2to2_8bit MUX2to2_8bit48(mode_selector,pe48_third_in,cutting_out048,parity48,unparity48);

/*---------------------------------------------------------------------------------*/
//parity
DEMUX1to2_8bit parity_module11 (parity11,parity_counter,odd11,even11);
DEMUX1to2_8bit parity_module12 (parity12,parity_counter,odd12,even12);
DEMUX1to2_8bit parity_module13 (parity13,parity_counter,odd13,even13);
DEMUX1to2_8bit parity_module14 (parity14,parity_counter,odd14,even14);
DEMUX1to2_8bit parity_module15 (parity15,parity_counter,odd15,even15);
DEMUX1to2_8bit parity_module16 (parity16,parity_counter,odd16,even16);
DEMUX1to2_8bit parity_module17 (parity17,parity_counter,odd17,even17);
DEMUX1to2_8bit parity_module18 (parity18,parity_counter,odd18,even18);
DEMUX1to2_8bit parity_module21 (parity21,parity_counter,odd21,even21);
DEMUX1to2_8bit parity_module22 (parity22,parity_counter,odd22,even22);
DEMUX1to2_8bit parity_module23 (parity23,parity_counter,odd23,even23);
DEMUX1to2_8bit parity_module24 (parity24,parity_counter,odd24,even24);
DEMUX1to2_8bit parity_module25 (parity25,parity_counter,odd25,even25);
DEMUX1to2_8bit parity_module26 (parity26,parity_counter,odd26,even26);
DEMUX1to2_8bit parity_module27 (parity27,parity_counter,odd27,even27);
DEMUX1to2_8bit parity_module28 (parity28,parity_counter,odd28,even28);
DEMUX1to2_8bit parity_module31 (parity31,parity_counter,odd31,even31);
DEMUX1to2_8bit parity_module32 (parity32,parity_counter,odd32,even32);
DEMUX1to2_8bit parity_module33 (parity33,parity_counter,odd33,even33);
DEMUX1to2_8bit parity_module34 (parity34,parity_counter,odd34,even34);
DEMUX1to2_8bit parity_module35 (parity35,parity_counter,odd35,even35);
DEMUX1to2_8bit parity_module36 (parity36,parity_counter,odd36,even36);
DEMUX1to2_8bit parity_module37 (parity37,parity_counter,odd37,even37);
DEMUX1to2_8bit parity_module38 (parity38,parity_counter,odd38,even38);
DEMUX1to2_8bit parity_module41 (parity41,parity_counter,odd41,even41);
DEMUX1to2_8bit parity_module42 (parity42,parity_counter,odd42,even42);
DEMUX1to2_8bit parity_module43 (parity43,parity_counter,odd43,even43);
DEMUX1to2_8bit parity_module44 (parity44,parity_counter,odd44,even44);
DEMUX1to2_8bit parity_module45 (parity45,parity_counter,odd45,even45);
DEMUX1to2_8bit parity_module46 (parity46,parity_counter,odd46,even46);
DEMUX1to2_8bit parity_module47 (parity47,parity_counter,odd47,even47);
DEMUX1to2_8bit parity_module48 (parity48,parity_counter,odd48,even48);


/*---------------------------------------------------------------------------------*/
//before input_pref output we need to select the mode that we need to 

mode_input_selector mode_input_selector11(mode_selector_output,even11,odd11,unparity11,cutting_out111,i011,i111);
mode_input_selector mode_input_selector12(mode_selector_output,even12,odd12,unparity12,cutting_out112,i012,i112);
mode_input_selector mode_input_selector13(mode_selector_output,even13,odd13,unparity13,cutting_out113,i013,i113);
mode_input_selector mode_input_selector14(mode_selector_output,even14,odd14,unparity14,cutting_out114,i014,i114);
mode_input_selector mode_input_selector15(mode_selector_output,even15,odd15,unparity15,cutting_out115,i015,i115);
mode_input_selector mode_input_selector16(mode_selector_output,even16,odd16,unparity16,cutting_out116,i016,i116);
mode_input_selector mode_input_selector17(mode_selector_output,even17,odd17,unparity17,cutting_out117,i017,i117);
mode_input_selector mode_input_selector18(mode_selector_output,even18,odd18,unparity18,cutting_out118,i018,i118);
mode_input_selector mode_input_selector21(mode_selector_output,even21,odd21,unparity21,cutting_out121,i021,i121);
mode_input_selector mode_input_selector22(mode_selector_output,even22,odd22,unparity22,cutting_out122,i022,i122);
mode_input_selector mode_input_selector23(mode_selector_output,even23,odd23,unparity23,cutting_out123,i023,i123);
mode_input_selector mode_input_selector24(mode_selector_output,even24,odd24,unparity24,cutting_out124,i024,i124);
mode_input_selector mode_input_selector25(mode_selector_output,even25,odd25,unparity25,cutting_out125,i025,i125);
mode_input_selector mode_input_selector26(mode_selector_output,even26,odd26,unparity26,cutting_out126,i026,i126);
mode_input_selector mode_input_selector27(mode_selector_output,even27,odd27,unparity27,cutting_out127,i027,i127);
mode_input_selector mode_input_selector28(mode_selector_output,even28,odd28,unparity28,cutting_out128,i028,i128);
mode_input_selector mode_input_selector31(mode_selector_output,even31,odd31,unparity31,cutting_out131,i031,i131);
mode_input_selector mode_input_selector32(mode_selector_output,even32,odd32,unparity32,cutting_out132,i032,i132);
mode_input_selector mode_input_selector33(mode_selector_output,even33,odd33,unparity33,cutting_out133,i033,i133);
mode_input_selector mode_input_selector34(mode_selector_output,even34,odd34,unparity34,cutting_out134,i034,i134);
mode_input_selector mode_input_selector35(mode_selector_output,even35,odd35,unparity35,cutting_out135,i035,i135);
mode_input_selector mode_input_selector36(mode_selector_output,even36,odd36,unparity36,cutting_out136,i036,i136);
mode_input_selector mode_input_selector37(mode_selector_output,even37,odd37,unparity37,cutting_out137,i037,i137);
mode_input_selector mode_input_selector38(mode_selector_output,even38,odd38,unparity38,cutting_out138,i038,i138);
mode_input_selector mode_input_selector41(mode_selector_output,even41,odd41,unparity41,cutting_out141,i041,i141);
mode_input_selector mode_input_selector42(mode_selector_output,even42,odd42,unparity42,cutting_out142,i042,i142);
mode_input_selector mode_input_selector43(mode_selector_output,even43,odd43,unparity43,cutting_out143,i043,i143);
mode_input_selector mode_input_selector44(mode_selector_output,even44,odd44,unparity44,cutting_out144,i044,i144);
mode_input_selector mode_input_selector45(mode_selector_output,even45,odd45,unparity45,cutting_out145,i045,i145);
mode_input_selector mode_input_selector46(mode_selector_output,even46,odd46,unparity46,cutting_out146,i046,i146);
mode_input_selector mode_input_selector47(mode_selector_output,even47,odd47,unparity47,cutting_out147,i047,i147);
mode_input_selector mode_input_selector48(mode_selector_output,even48,odd48,unparity48,cutting_out148,i048,i148);

/*---------------------------------------------------------------------------------*/


endmodule