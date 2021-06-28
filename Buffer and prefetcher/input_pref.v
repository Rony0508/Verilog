module input_pref(
pe11_in011,pe12_in012,pe13_in013,pe14_in014,pe15_in015,pe16_in016,pe17_in017,pe18_in018
,pe21_in021,pe22_in022,pe23_in023,pe24_in024,pe25_in025,pe26_in026,pe27_in027,pe28_in028
,pe31_in031,pe32_in032,pe33_in033,pe34_in034,pe35_in035,pe36_in036,pe37_in037,pe38_in038
,pe41_in041,pe42_in042,pe43_in043,pe44_in044,pe45_in045,pe46_in046,pe47_in047,pe48_in048

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
//come from input buffer
input [N-1:0]
pe11_in011,pe12_in012,pe13_in013,pe14_in014,pe15_in015,pe16_in016,pe17_in017,pe18_in018
,pe21_in021,pe22_in022,pe23_in023,pe24_in024,pe25_in025,pe26_in026,pe27_in027,pe28_in028
,pe31_in031,pe32_in032,pe33_in033,pe34_in034,pe35_in035,pe36_in036,pe37_in037,pe38_in038
,pe41_in041,pe42_in042,pe43_in043,pe44_in044,pe45_in045,pe46_in046,pe47_in047,pe48_in048;

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
//wire



//



//





/*---------------------------------------------------------------------------------*/
//將16bit資料擷取成8 bit fixed point







/*---------------------------------------------------------------------------------*/







/*---------------------------------------------------------------------------------*/











endmodule