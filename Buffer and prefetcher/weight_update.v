module weight_update(
en,clk,reset_n

,pe11_out,pe12_out,pe13_out,pe14_out,pe15_out,pe16_out,pe17_out,pe18_out,pe21_out
,pe22_out,pe23_out,pe24_out,pe25_out,pe26_out,pe27_out,pe28_out,pe31_out,pe32_out
,pe33_out,pe34_out,pe35_out,pe36_out,pe37_out,pe38_out,pe41_out,pe42_out,pe43_out
,pe44_out,pe45_out,pe46_out,pe47_out,pe48_out

,






);
/*---------------------------------------------------------------------------------*/

parameter N = 8;

/*---------------------------------------------------------------------------------*/
input en,clk,reset_n;

//n-1bit 進入buf
input [N-1:0] 
pe11_out,pe12_out,pe13_out,pe14_out,pe15_out,pe16_out,pe17_out,pe18_out,pe21_out
,pe22_out,pe23_out,pe24_out,pe25_out,pe26_out,pe27_out,pe28_out,pe31_out,pe32_out
,pe33_out,pe34_out,pe35_out,pe36_out,pe37_out,pe38_out,pe41_out,pe42_out,pe43_out
,pe44_out,pe45_out,pe46_out,pe47_out,pe48_out;




/*---------------------------------------------------------------------------------*/
//go to weight_pref
output reg [N-1:0]
weight_pref011,weight_pref012,weight_pref013,weight_pref014,weight_pref015,weight_pref016
,weight_pref017,weight_pref018,weight_pref021,weight_pref022,weight_pref023,weight_pref024,weight_pref025,weight_pref026
,weight_pref027,input_pref_in028,weight_pref028,input_pref_in031,weight_pref031,input_pref_in032
,weight_pref032,input_pref_in033,weight_pref033,input_pref_in034,weight_pref034,input_pref_in035
,weight_pref035,input_pref_in036,weight_pref036,input_pref_in037,weight_pref037,input_pref_in038
,weight_pref038,input_pref_in041,weight_pref041,input_pref_in042,weight_pref042,input_pref_in043
,weight_pref043,input_pref_in044,weight_pref044,input_pref_in045,weight_pref045,input_pref_in046
,weight_pref046,input_pref_in047,weight_pref047,input_pref_in048,weight_pref048;




/*---------------------------------------------------------------------------------*/
//wire
wire [N-1:0]pe11_out011,pe12_out012,pe13_out013,pe14_out014, pe15_out015, pe16_out016, pe17_out017, pe18_out018
, pe21_out021,pe22_out022,pe23_out023,pe24_out024, pe25_out025, pe26_out026, pe27_out027, pe28_out028
,pe31_out031,pe32_out032,pe33_out033,pe34_out034, pe35_out035, pe36_out036, pe37_out037, pe38_out038
,pe41_out041,pe42_out042,pe43_out043,pe44_out044, pe45_out045, pe46_out046, pe47_out047, pe48_out048;


//



//





/*---------------------------------------------------------------------------------*/








/*---------------------------------------------------------------------------------*/







/*---------------------------------------------------------------------------------*/











endmodule