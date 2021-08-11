module output_buf(en,clk,reset_n,buf_input_select,buf_output_select

,pe11_out,bn11_out,pe12_out,bn12_out,pe13_out,bn13_out,pe14_out,bn14_out
,pe15_out,bn15_out,pe16_out,bn16_out,pe17_out,bn17_out,pe18_out,bn18_out,pe21_out,bn21_out
,pe22_out,bn22_out,pe23_out,bn23_out,pe24_out,bn24_out,pe25_out,bn25_out,pe26_out,bn26_out
,pe27_out,bn27_out,pe28_out,bn28_out,pe31_out,bn31_out,pe32_out,bn32_out,pe33_out,bn33_out
,pe34_out,bn34_out,pe35_out,bn35_out,pe36_out,bn36_out,pe37_out,bn37_out,pe38_out,bn38_out
,pe41_out,bn41_out,pe42_out,bn42_out,pe43_out,bn43_out,pe44_out,bn44_out,pe45_out,bn45_out
,pe46_out,bn46_out,pe47_out,bn47_out,pe48_out,bn48_out

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
,weight_pref047,weight_pref048

);
/*---------------------------------------------------------------------------------*/
//變數
parameter N=16;
/*---------------------------------------------------------------------------------*/
//1bit Select,reset,clk,enable
input buf_input_select,buf_output_select,reset_n,clk,en;
//n-1bit 進入buf之前的MUX input (pe_out,bn_out)
input [N-1:0] pe11_out,bn11_out,pe12_out,bn12_out,pe13_out,bn13_out,pe14_out,bn14_out
,pe15_out,bn15_out,pe16_out,bn16_out,pe17_out,bn17_out,pe18_out,bn18_out,pe21_out,bn21_out
,pe22_out,bn22_out,pe23_out,bn23_out,pe24_out,bn24_out,pe25_out,bn25_out,pe26_out,bn26_out
,pe27_out,bn27_out,pe28_out,bn28_out,pe31_out,bn31_out,pe32_out,bn32_out,pe33_out,bn33_out
,pe34_out,bn34_out,pe35_out,bn35_out,pe36_out,bn36_out,pe37_out,bn37_out,pe38_out,bn38_out
,pe41_out,bn41_out,pe42_out,bn42_out,pe43_out,bn43_out,pe44_out,bn44_out,pe45_out,bn45_out
,pe46_out,bn46_out,pe47_out,bn47_out,pe48_out,bn48_out;

/*---------------------------------------------------------------------------------*/
//n-1bit 出去buf之前的DEMUX output (input_pref_in,weight_pref)

// (0)

output  [N-1:0] input_pref_in011,weight_pref011,input_pref_in012,weight_pref012,input_pref_in013
,weight_pref013,input_pref_in014,weight_pref014,input_pref_in015,weight_pref015,input_pref_in016
,weight_pref016,input_pref_in017,weight_pref017,input_pref_in018,weight_pref018,input_pref_in021
,weight_pref021,input_pref_in022,weight_pref022,input_pref_in023,weight_pref023,input_pref_in024
,weight_pref024,input_pref_in025,weight_pref025,input_pref_in026,weight_pref026,input_pref_in027
,weight_pref027,input_pref_in028,weight_pref028,input_pref_in031,weight_pref031,input_pref_in032
,weight_pref032,input_pref_in033,weight_pref033,input_pref_in034,weight_pref034,input_pref_in035
,weight_pref035,input_pref_in036,weight_pref036,input_pref_in037,weight_pref037,input_pref_in038
,weight_pref038,input_pref_in041,weight_pref041,input_pref_in042,weight_pref042,input_pref_in043
,weight_pref043,input_pref_in044,weight_pref044,input_pref_in045,weight_pref045,input_pref_in046
,weight_pref046,input_pref_in047,weight_pref047,input_pref_in048,weight_pref048;


/*---------------------------------------------------------------------------------*/
//n-1bit BUF中間的wire(0)
wire [N-1:0]pe11_fir_out,pe11_sec_out,pe12_fir_out,pe12_sec_out,pe13_fir_out,pe13_sec_out, pe14_fir_out, pe14_sec_out
,pe15_fir_out,pe15_sec_out,pe16_fir_out,pe16_sec_out,pe17_fir_out,pe17_sec_out,pe18_fir_out,pe18_sec_out
,pe21_fir_out,pe21_sec_out,pe22_fir_out,pe22_sec_out,pe23_fir_out,pe23_sec_out,pe24_fir_out,pe24_sec_out
,pe25_fir_out,pe25_sec_out,pe26_fir_out,pe26_sec_out,pe27_fir_out,pe27_sec_out,pe28_fir_out,pe28_sec_out
,pe31_fir_out,pe31_sec_out,pe32_fir_out,pe32_sec_out,pe33_fir_out,pe33_sec_out,pe34_fir_out,pe34_sec_out
,pe35_fir_out,pe35_sec_out,pe36_fir_out,pe36_sec_out,pe37_fir_out,pe37_sec_out,pe38_fir_out,pe38_sec_out
,pe41_fir_out,pe41_sec_out,pe42_fir_out,pe42_sec_out,pe43_fir_out,pe43_sec_out,pe44_fir_out,pe44_sec_out
,pe45_fir_out,pe45_sec_out,pe46_fir_out,pe46_sec_out,pe47_fir_out, pe47_sec_out,pe48_fir_out,pe48_sec_out;
//n-1bit BUF與input中間的wire(0)
wire [N-1:0]pe11_out011,pe12_out012,pe13_out013,pe14_out014, pe15_out015, pe16_out016, pe17_out017, pe18_out018
, pe21_out021,pe22_out022,pe23_out023,pe24_out024, pe25_out025, pe26_out026, pe27_out027, pe28_out028
,pe31_out031,pe32_out032,pe33_out033,pe34_out034, pe35_out035, pe36_out036, pe37_out037, pe38_out038
,pe41_out041,pe42_out042,pe43_out043,pe44_out044, pe45_out045, pe46_out046, pe47_out047, pe48_out048;
//n-1bit BUF與output中間的wire(0)
wire [N-1:0]pe11_third_out,pe12_third_out,pe13_third_out,pe14_third_out, pe15_third_out,pe16_third_out,pe17_third_out
,pe18_third_out,pe21_third_out, pe22_third_out,pe23_third_out,pe24_third_out, pe25_third_out,pe26_third_out,pe27_third_out
,pe28_third_out,pe31_third_out, pe32_third_out,pe33_third_out, pe34_third_out, pe35_third_out
,pe36_third_out,pe37_third_out,pe38_third_out,pe41_third_out,pe42_third_out,pe43_third_out
,pe44_third_out, pe45_third_out,pe46_third_out,pe47_third_out,pe48_third_out;

/*---------------------------------------------------------------------------------*/
//input mux

MUX2to1 pe11_input_mux(pe11_out,bn11_out,buf_input_select,pe11_out011);
MUX2to1 pe12_input_mux(pe12_out,bn12_out,buf_input_select,pe12_out012);
MUX2to1 pe13_input_mux(pe13_out,bn13_out,buf_input_select,pe13_out013);
MUX2to1 pe14_input_mux(pe14_out,bn14_out,buf_input_select,pe14_out014);
MUX2to1 pe15_input_mux(pe15_out,bn15_out,buf_input_select,pe15_out015);
MUX2to1 pe16_input_mux(pe16_out,bn16_out,buf_input_select,pe16_out016);
MUX2to1 pe17_input_mux(pe17_out,bn17_out,buf_input_select,pe17_out017);
MUX2to1 pe18_input_mux(pe18_out,bn18_out,buf_input_select,pe18_out018);

MUX2to1 pe21_input_mux(pe21_out,bn21_out,buf_input_select,pe21_out021);
MUX2to1 pe22_input_mux(pe22_out,bn22_out,buf_input_select,pe22_out022);
MUX2to1 pe23_input_mux(pe23_out,bn23_out,buf_input_select,pe23_out023);
MUX2to1 pe24_input_mux(pe24_out,bn24_out,buf_input_select,pe24_out024);
MUX2to1 pe25_input_mux(pe25_out,bn25_out,buf_input_select,pe25_out025);
MUX2to1 pe26_input_mux(pe26_out,bn26_out,buf_input_select,pe26_out026);
MUX2to1 pe27_input_mux(pe27_out,bn27_out,buf_input_select,pe27_out027);
MUX2to1 pe28_input_mux(pe28_out,bn28_out,buf_input_select,pe28_out028);

MUX2to1 pe31_input_mux(pe31_out,bn31_out,buf_input_select,pe31_out031);
MUX2to1 pe32_input_mux(pe32_out,bn32_out,buf_input_select,pe32_out032);
MUX2to1 pe33_input_mux(pe33_out,bn33_out,buf_input_select,pe33_out033);
MUX2to1 pe34_input_mux(pe34_out,bn34_out,buf_input_select,pe34_out034);
MUX2to1 pe35_input_mux(pe35_out,bn35_out,buf_input_select,pe35_out035);
MUX2to1 pe36_input_mux(pe36_out,bn36_out,buf_input_select,pe36_out036);
MUX2to1 pe37_input_mux(pe37_out,bn37_out,buf_input_select,pe37_out037);
MUX2to1 pe38_input_mux(pe38_out,bn38_out,buf_input_select,pe38_out038);

MUX2to1 pe41_input_mux(pe41_out,bn41_out,buf_input_select,pe41_out041);
MUX2to1 pe42_input_mux(pe42_out,bn42_out,buf_input_select,pe42_out042);
MUX2to1 pe43_input_mux(pe43_out,bn43_out,buf_input_select,pe43_out043);
MUX2to1 pe44_input_mux(pe44_out,bn44_out,buf_input_select,pe44_out044);
MUX2to1 pe45_input_mux(pe45_out,bn45_out,buf_input_select,pe45_out045);
MUX2to1 pe46_input_mux(pe46_out,bn46_out,buf_input_select,pe46_out046);
MUX2to1 pe47_input_mux(pe47_out,bn47_out,buf_input_select,pe47_out047);
MUX2to1 pe48_input_mux(pe48_out,bn48_out,buf_input_select,pe48_out048);
/*---------------------------------------------------------------------------------*/
//output demux

DEMUX1to2_16 pe11_output_mux(pe11_third_out,buf_output_select,input_pref_in011,weight_pref011);
DEMUX1to2_16 pe12_output_mux(pe12_third_out,buf_output_select,input_pref_in012,weight_pref012);
DEMUX1to2_16 pe13_output_mux(pe13_third_out,buf_output_select,input_pref_in013,weight_pref013);
DEMUX1to2_16 pe14_output_mux(pe14_third_out,buf_output_select,input_pref_in014,weight_pref014);
DEMUX1to2_16 pe15_output_mux(pe15_third_out,buf_output_select,input_pref_in015,weight_pref015);
DEMUX1to2_16 pe16_output_mux(pe16_third_out,buf_output_select,input_pref_in016,weight_pref016);
DEMUX1to2_16 pe17_output_mux(pe17_third_out,buf_output_select,input_pref_in017,weight_pref017);
DEMUX1to2_16 pe18_output_mux(pe18_third_out,buf_output_select,input_pref_in018,weight_pref018);

DEMUX1to2_16 pe21_output_mux(pe21_third_out,buf_output_select,input_pref_in021,weight_pref021);
DEMUX1to2_16 pe22_output_mux(pe22_third_out,buf_output_select,input_pref_in022,weight_pref022);
DEMUX1to2_16 pe23_output_mux(pe23_third_out,buf_output_select,input_pref_in023,weight_pref023);
DEMUX1to2_16 pe24_output_mux(pe24_third_out,buf_output_select,input_pref_in024,weight_pref024);
DEMUX1to2_16 pe25_output_mux(pe25_third_out,buf_output_select,input_pref_in025,weight_pref025);
DEMUX1to2_16 pe26_output_mux(pe26_third_out,buf_output_select,input_pref_in026,weight_pref026);
DEMUX1to2_16 pe27_output_mux(pe27_third_out,buf_output_select,input_pref_in027,weight_pref027);
DEMUX1to2_16 pe28_output_mux(pe28_third_out,buf_output_select,input_pref_in028,weight_pref028);

DEMUX1to2_16 pe31_output_mux(pe31_third_out,buf_output_select,input_pref_in031,weight_pref031);
DEMUX1to2_16 pe32_output_mux(pe32_third_out,buf_output_select,input_pref_in032,weight_pref032);
DEMUX1to2_16 pe33_output_mux(pe33_third_out,buf_output_select,input_pref_in033,weight_pref033);
DEMUX1to2_16 pe34_output_mux(pe34_third_out,buf_output_select,input_pref_in034,weight_pref034);
DEMUX1to2_16 pe35_output_mux(pe35_third_out,buf_output_select,input_pref_in035,weight_pref035);
DEMUX1to2_16 pe36_output_mux(pe36_third_out,buf_output_select,input_pref_in036,weight_pref036);
DEMUX1to2_16 pe37_output_mux(pe37_third_out,buf_output_select,input_pref_in037,weight_pref037);
DEMUX1to2_16 pe38_output_mux(pe38_third_out,buf_output_select,input_pref_in038,weight_pref038);

DEMUX1to2_16 pe41_output_mux(pe41_third_out,buf_output_select,input_pref_in041,weight_pref041);
DEMUX1to2_16 pe42_output_mux(pe42_third_out,buf_output_select,input_pref_in042,weight_pref042);
DEMUX1to2_16 pe43_output_mux(pe43_third_out,buf_output_select,input_pref_in043,weight_pref043);
DEMUX1to2_16 pe44_output_mux(pe44_third_out,buf_output_select,input_pref_in044,weight_pref044);
DEMUX1to2_16 pe45_output_mux(pe45_third_out,buf_output_select,input_pref_in045,weight_pref045);
DEMUX1to2_16 pe46_output_mux(pe46_third_out,buf_output_select,input_pref_in046,weight_pref046);
DEMUX1to2_16 pe47_output_mux(pe47_third_out,buf_output_select,input_pref_in047,weight_pref047);
DEMUX1to2_16 pe48_output_mux(pe48_third_out,buf_output_select,input_pref_in048,weight_pref048);
/*---------------------------------------------------------------------------------*/
//Buffer0 (expect mode e )

DFF_en pe11_DFF_en0(en,clk,reset_n,pe11_out011, pe11_fir_out);
DFF_en pe11_DFF_en1(en,clk,reset_n,pe11_fir_out,pe11_sec_out);
DFF_en pe11_DFF_en2(en,clk,reset_n,pe11_sec_out,pe11_third_out);

DFF_en pe12_DFF_en0(en,clk, reset_n, pe12_out012, pe12_fir_out);
DFF_en pe12_DFF_en1(en,clk, reset_n, pe12_fir_out,pe12_sec_out);
DFF_en pe12_DFF_en2(en,clk, reset_n, pe12_sec_out,pe12_third_out);

DFF_en pe13_DFF_en0(en,clk, reset_n, pe13_out013, pe13_fir_out);
DFF_en pe13_DFF_en1(en,clk, reset_n, pe13_fir_out,pe13_sec_out);
DFF_en pe13_DFF_en2(en,clk, reset_n, pe13_sec_out,pe13_third_out);

DFF_en pe14_DFF_en0(en,clk, reset_n, pe14_out014, pe14_fir_out);
DFF_en pe14_DFF_en1(en,clk, reset_n, pe14_fir_out,pe14_sec_out);
DFF_en pe14_DFF_en2(en,clk, reset_n, pe14_sec_out,pe14_third_out);

DFF_en pe15_DFF_en0(en,clk, reset_n, pe15_out015, pe15_fir_out);
DFF_en pe15_DFF_en1(en,clk, reset_n, pe15_fir_out,pe15_sec_out);
DFF_en pe15_DFF_en2(en,clk, reset_n, pe15_sec_out,pe15_third_out);

DFF_en pe16_DFF_en0(en,clk, reset_n, pe16_out016, pe16_fir_out);
DFF_en pe16_DFF_en1(en,clk, reset_n, pe16_fir_out,pe16_sec_out);
DFF_en pe16_DFF_en2(en,clk, reset_n, pe16_sec_out,pe16_third_out);

DFF_en pe17_DFF_en0(en,clk, reset_n, pe17_out017, pe17_fir_out);
DFF_en pe17_DFF_en1(en,clk, reset_n, pe17_fir_out,pe17_sec_out);
DFF_en pe17_DFF_en2(en,clk, reset_n, pe17_sec_out,pe17_third_out);

DFF_en pe18_DFF_en0(en,clk, reset_n, pe18_out018, pe18_fir_out);
DFF_en pe18_DFF_en1(en,clk, reset_n, pe18_fir_out,pe18_sec_out);
DFF_en pe18_DFF_en2(en,clk, reset_n, pe18_sec_out,pe18_third_out);

DFF_en pe21_DFF_en0(en,clk, reset_n, pe21_out021, pe21_fir_out);
DFF_en pe21_DFF_en1(en,clk, reset_n, pe21_fir_out,pe21_sec_out);
DFF_en pe21_DFF_en2(en,clk, reset_n, pe21_sec_out,pe21_third_out);

DFF_en pe22_DFF_en0(en,clk, reset_n, pe22_out022, pe22_fir_out);
DFF_en pe22_DFF_en1(en,clk, reset_n, pe22_fir_out,pe22_sec_out);
DFF_en pe22_DFF_en2(en,clk, reset_n, pe22_sec_out,pe22_third_out);

DFF_en pe23_DFF_en0(en,clk, reset_n, pe23_out023, pe23_fir_out);
DFF_en pe23_DFF_en1(en,clk, reset_n, pe23_fir_out,pe23_sec_out);
DFF_en pe23_DFF_en2(en,clk, reset_n, pe23_sec_out,pe23_third_out);

DFF_en pe24_DFF_en0(en,clk, reset_n, pe24_out024, pe24_fir_out);
DFF_en pe24_DFF_en1(en,clk, reset_n, pe24_fir_out,pe24_sec_out);
DFF_en pe24_DFF_en2(en,clk, reset_n, pe24_sec_out,pe24_third_out);

DFF_en pe25_DFF_en0(en,clk, reset_n, pe25_out025, pe25_fir_out);
DFF_en pe25_DFF_en1(en,clk, reset_n, pe25_fir_out,pe25_sec_out);
DFF_en pe25_DFF_en2(en,clk, reset_n, pe25_sec_out,pe25_third_out);

DFF_en pe26_DFF_en0(en,clk, reset_n, pe26_out026, pe26_fir_out);
DFF_en pe26_DFF_en1(en,clk, reset_n, pe26_fir_out,pe26_sec_out);
DFF_en pe26_DFF_en2(en,clk, reset_n, pe26_sec_out,pe26_third_out);

DFF_en pe27_DFF_en0(en,clk, reset_n, pe27_out027, pe27_fir_out);
DFF_en pe27_DFF_en1(en,clk, reset_n, pe27_fir_out,pe27_sec_out);
DFF_en pe27_DFF_en2(en,clk, reset_n, pe27_sec_out,pe27_third_out);

DFF_en pe28_DFF_en0(en,clk, reset_n, pe28_out028, pe28_fir_out);
DFF_en pe28_DFF_en1(en,clk, reset_n, pe28_fir_out,pe28_sec_out);
DFF_en pe28_DFF_en2(en,clk, reset_n, pe28_sec_out,pe28_third_out);

DFF_en pe31_DFF_en0(en,clk, reset_n, pe31_out031, pe31_fir_out);
DFF_en pe31_DFF_en1(en,clk, reset_n, pe31_fir_out,pe31_sec_out);
DFF_en pe31_DFF_en2(en,clk, reset_n, pe31_sec_out,pe31_third_out);

DFF_en pe32_DFF_en0(en,clk, reset_n, pe32_out032, pe32_fir_out);
DFF_en pe32_DFF_en1(en,clk, reset_n, pe32_fir_out,pe32_sec_out);
DFF_en pe32_DFF_en2(en,clk, reset_n, pe32_sec_out,pe32_third_out);

DFF_en pe33_DFF_en0(en,clk, reset_n, pe33_out033, pe33_fir_out);
DFF_en pe33_DFF_en1(en,clk, reset_n, pe33_fir_out,pe33_sec_out);
DFF_en pe33_DFF_en2(en,clk, reset_n, pe33_sec_out,pe33_third_out);

DFF_en pe34_DFF_en0(en,clk, reset_n, pe34_out034, pe34_fir_out);
DFF_en pe34_DFF_en1(en,clk, reset_n, pe34_fir_out,pe34_sec_out);
DFF_en pe34_DFF_en2(en,clk, reset_n, pe34_sec_out,pe34_third_out);

DFF_en pe35_DFF_en0(en,clk, reset_n, pe35_out035, pe35_fir_out);
DFF_en pe35_DFF_en1(en,clk, reset_n, pe35_fir_out,pe35_sec_out);
DFF_en pe35_DFF_en2(en,clk, reset_n, pe35_sec_out,pe35_third_out);

DFF_en pe36_DFF_en0(en,clk, reset_n, pe36_out036, pe36_fir_out);
DFF_en pe36_DFF_en1(en,clk, reset_n, pe36_fir_out,pe36_sec_out);
DFF_en pe36_DFF_en2(en,clk, reset_n, pe36_sec_out,pe36_third_out);

DFF_en pe37_DFF_en0(en,clk, reset_n, pe37_out037, pe37_fir_out);
DFF_en pe37_DFF_en1(en,clk, reset_n, pe37_fir_out,pe37_sec_out);
DFF_en pe37_DFF_en2(en,clk, reset_n, pe37_sec_out,pe37_third_out);

DFF_en pe38_DFF_en0(en,clk, reset_n, pe38_out038, pe38_fir_out);
DFF_en pe38_DFF_en1(en,clk, reset_n, pe38_fir_out,pe38_sec_out);
DFF_en pe38_DFF_en2(en,clk, reset_n, pe38_sec_out,pe38_third_out);

DFF_en pe41_DFF_en0(en,clk, reset_n, pe41_out041, pe41_fir_out);
DFF_en pe41_DFF_en1(en,clk, reset_n, pe41_fir_out,pe41_sec_out);
DFF_en pe41_DFF_en2(en,clk, reset_n, pe41_sec_out,pe41_third_out);

DFF_en pe42_DFF_en0(en,clk, reset_n, pe42_out042, pe42_fir_out);
DFF_en pe42_DFF_en1(en,clk, reset_n, pe42_fir_out,pe42_sec_out);
DFF_en pe42_DFF_en2(en,clk, reset_n, pe42_sec_out,pe42_third_out);

DFF_en pe43_DFF_en0(en,clk, reset_n, pe43_out043, pe43_fir_out);
DFF_en pe43_DFF_en1(en,clk, reset_n, pe43_fir_out,pe43_sec_out);
DFF_en pe43_DFF_en2(en,clk, reset_n, pe43_sec_out,pe43_third_out);

DFF_en pe44_DFF_en0(en,clk, reset_n, pe44_out044, pe44_fir_out);
DFF_en pe44_DFF_en1(en,clk, reset_n, pe44_fir_out,pe44_sec_out);
DFF_en pe44_DFF_en2(en,clk, reset_n, pe44_sec_out,pe44_third_out);

DFF_en pe45_DFF_en0(en,clk, reset_n, pe45_out045, pe45_fir_out);
DFF_en pe45_DFF_en1(en,clk, reset_n, pe45_fir_out,pe45_sec_out);
DFF_en pe45_DFF_en2(en,clk, reset_n, pe45_sec_out,pe45_third_out);

DFF_en pe46_DFF_en0(en,clk, reset_n, pe46_out046, pe46_fir_out);
DFF_en pe46_DFF_en1(en,clk, reset_n, pe46_fir_out,pe46_sec_out);
DFF_en pe46_DFF_en2(en,clk, reset_n, pe46_sec_out,pe46_third_out);

DFF_en pe47_DFF_en0(en,clk, reset_n, pe47_out047, pe47_fir_out);
DFF_en pe47_DFF_en1(en,clk, reset_n, pe47_fir_out,pe47_sec_out);
DFF_en pe47_DFF_en2(en,clk, reset_n, pe47_sec_out,pe47_third_out);

DFF_en pe48_DFF_en0(en,clk, reset_n, pe48_out048, pe48_fir_out);
DFF_en pe48_DFF_en1(en,clk, reset_n, pe48_fir_out,pe48_sec_out);
DFF_en pe48_DFF_en2(en,clk, reset_n, pe48_sec_out,pe48_third_out);
/*---------------------------------------------------------------------------------*/

endmodule 

