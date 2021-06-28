module input_pref(
en_cutting0,mode_selector
,en,clk,reset_n,buf_select

pe11_third_in,pe12_third_in,pe13_third_in,pe14_third_in, pe15_third_in,pe16_third_in,pe17_third_in
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
input en_cutting0;
//come from input buffer
input [N-1:0]
pe11_third_in,pe12_third_in,pe13_third_in,pe14_third_in, pe15_third_in,pe16_third_in,pe17_third_in
,pe18_third_in,pe21_third_in, pe22_third_in,pe23_third_in,pe24_third_in, pe25_third_in,pe26_third_in,pe27_third_in
,pe28_third_in,pe31_third_in, pe32_third_in,pe33_third_in, pe34_third_in, pe35_third_in
,pe36_third_in,pe37_third_in,pe38_third_in,pe41_third_in,pe42_third_in,pe43_third_in
,pe44_third_in, pe45_third_in,pe46_third_in,pe47_third_in,pe48_third_in;

//come from output buffer 0
input [N-1:0]
input_pref_in011,input_pref_in012,input_pref_in013,input_pref_in014,input_pref_in015
,input_pref_in016,input_pref_in017,input_pref_in018,input_pref_in021,input_pref_in022
,input_pref_in023,input_pref_in024,input_pref_in025,input_pref_in026,input_pref_in027
,input_pref_in028,input_pref_in031,input_pref_in032,input_pref_in033,input_pref_in034
,input_pref_in035,input_pref_in036,input_pref_in037,input_pref_in038,input_pref_in041
,input_pref_in042,input_pref_in043,input_pref_in044,input_pref_in045,input_pref_in046
,input_pref_in047,input_pref_in048;

/*
//come from output buffer 1
input [N-1:0]


*/

/*---------------------------------------------------------------------------------*/
//go to SA
output reg [N-1:0]
i011,i012,i013,i014,i015,i016,i017,i018,i021,i022,i023,i024,i025,i026,i027,i028
,i031,i032,i033,i034,i035,i036,i037,i038,i041,i042,i043,i044,i045,i046,i047,i048
,i111,i112,i113,i114,i115,i116,i117,i118,i121,i122,i123,i124,i125,i126,i127,i128
,i131,i132,i133,i134,i135,i136,i137,i138,i141,i142,i143,i144,i145,i146,i147,i148

/*---------------------------------------------------------------------------------*/
//wire cutting0 to MUX2to2
wire [N-1:0] 
cutting_out011,cutting_out012,cutting_out013,cutting_out014,cutting_out015,cutting_out016
,cutting_out017,cutting_out018,cutting_out021,cutting_out022,cutting_out023,cutting_out024
,cutting_out025,cutting_out026,cutting_out027,cutting_out028,cutting_out031,cutting_out032
,cutting_out033,cutting_out034,cutting_out035,cutting_out036,cutting_out037,cutting_out038
,cutting_out041,cutting_out042,cutting_out043,cutting_out044,cutting_out045,cutting_out046
,cutting_out047,cutting_out048;

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

/*
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
*/

/*---------------------------------------------------------------------------------*/
//Port Mux2t02
MUX2to2_8bit MUX2to2_8bit11 (mode_selector,pe11_third_in,cutting_out011,parity11,unparity11);
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











endmodule