module input_buf(en,clk,reset_n,buf_select,pe11_in011,pe12_in012,pe13_in013,pe14_in014,pe15_in015,pe16_in016,pe17_in017,pe18_in018
,pe21_in021,pe22_in022,pe23_in023,pe24_in024,pe25_in025,pe26_in026,pe27_in027,pe28_in028
,pe31_in031,pe32_in032,pe33_in033,pe34_in034,pe35_in035,pe36_in036,pe37_in037,pe38_in038
,pe41_in041,pe42_in042,pe43_in043,pe44_in044,pe45_in045,pe46_in046,pe47_in047,pe48_in048
,pe11_third_in,pe12_third_in,pe13_third_in,pe14_third_in, pe15_third_in,pe16_third_in,pe17_third_in
,pe18_third_in,pe21_third_in, pe22_third_in,pe23_third_in,pe24_third_in, pe25_third_in,pe26_third_in,pe27_third_in
,pe28_third_in,pe31_third_in, pe32_third_in,pe33_third_in, pe34_third_in, pe35_third_in
,pe36_third_in,pe37_third_in,pe38_third_in,pe41_third_in,pe42_third_in,pe43_third_in
,pe44_third_in, pe45_third_in,pe46_third_in,pe47_third_in,pe48_third_in);
/*---------------------------------------------------------------------------------*/
//input 8bit fixed point
parameter N=8;
/*---------------------------------------------------------------------------------*/
input buf_select,reset_n,clk,en;

input [N-1:0]pe11_in011,pe12_in012,pe13_in013,pe14_in014, pe15_in015, pe16_in016, pe17_in017, pe18_in018
,pe21_in021,pe22_in022,pe23_in023,pe24_in024, pe25_in025, pe26_in026, pe27_in027, pe28_in028
,pe31_in031,pe32_in032,pe33_in033,pe34_in034, pe35_in035, pe36_in036, pe37_in037, pe38_in038
,pe41_in041,pe42_in042,pe43_in043,pe44_in044, pe45_in045, pe46_in046, pe47_in047, pe48_in048;
/*---------------------------------------------------------------------------------*/
wire [N-1:0]pe11_fir_in,pe11_sec_in,pe12_fir_in,pe12_sec_in,pe13_fir_in,pe13_sec_in, pe14_fir_in, pe14_sec_in
,pe15_fir_in,pe15_sec_in,pe16_fir_in,pe16_sec_in,pe17_fir_in,pe17_sec_in,pe18_fir_in,pe18_sec_in
,pe21_fir_in,pe21_sec_in,pe22_fir_in,pe22_sec_in,pe23_fir_in,pe23_sec_in,pe24_fir_in,pe24_sec_in
,pe25_fir_in,pe25_sec_in,pe26_fir_in,pe26_sec_in,pe27_fir_in,pe27_sec_in,pe28_fir_in,pe28_sec_in
,pe31_fir_in,pe31_sec_in,pe32_fir_in,pe32_sec_in,pe33_fir_in,pe33_sec_in,pe34_fir_in,pe34_sec_in
,pe35_fir_in,pe35_sec_in,pe36_fir_in,pe36_sec_in,pe37_fir_in,pe37_sec_in,pe38_fir_in,pe38_sec_in
,pe41_fir_in,pe41_sec_in,pe42_fir_in,pe42_sec_in,pe43_fir_in,pe43_sec_in,pe44_fir_in,pe44_sec_in
,pe45_fir_in,pe45_sec_in,pe46_fir_in,pe46_sec_in,pe47_fir_in, pe47_sec_in,pe48_fir_in,pe48_sec_in;
/*---------------------------------------------------------------------------------*/
output [N-1:0]pe11_third_in,pe12_third_in,pe13_third_in,pe14_third_in, pe15_third_in,pe16_third_in,pe17_third_in
,pe18_third_in,pe21_third_in, pe22_third_in,pe23_third_in,pe24_third_in, pe25_third_in,pe26_third_in,pe27_third_in
,pe28_third_in,pe31_third_in, pe32_third_in,pe33_third_in, pe34_third_in, pe35_third_in
,pe36_third_in,pe37_third_in,pe38_third_in,pe41_third_in,pe42_third_in,pe43_third_in
,pe44_third_in, pe45_third_in,pe46_third_in,pe47_third_in,pe48_third_in;
/*---------------------------------------------------------------------------------*/
DFF_en pe11_DFF_en0(en,clk,reset_n,pe11_in011, pe11_fir_in);
DFF_en pe11_DFF_en1(en,clk,reset_n,pe11_fir_in,pe11_sec_in);
DFF_en pe11_DFF_en2(en,clk,reset_n,pe11_sec_in,pe11_third_in);

DFF_en pe12_DFF_en0(en,clk, reset_n, pe12_in012, pe12_fir_in);
DFF_en pe12_DFF_en1(en,clk, reset_n, pe12_fir_in,pe12_sec_in);
DFF_en pe12_DFF_en2(en,clk, reset_n, pe12_sec_in,pe12_third_in);

DFF_en pe13_DFF_en0(en,clk, reset_n, pe13_in013, pe13_fir_in);
DFF_en pe13_DFF_en1(en,clk, reset_n, pe13_fir_in,pe13_sec_in);
DFF_en pe13_DFF_en2(en,clk, reset_n, pe13_sec_in,pe13_third_in);

DFF_en pe14_DFF_en0(en,clk, reset_n, pe14_in014, pe14_fir_in);
DFF_en pe14_DFF_en1(en,clk, reset_n, pe14_fir_in,pe14_sec_in);
DFF_en pe14_DFF_en2(en,clk, reset_n, pe14_sec_in,pe14_third_in);

DFF_en pe15_DFF_en0(en,clk, reset_n, pe15_in015, pe15_fir_in);
DFF_en pe15_DFF_en1(en,clk, reset_n, pe15_fir_in,pe15_sec_in);
DFF_en pe15_DFF_en2(en,clk, reset_n, pe15_sec_in,pe15_third_in);

DFF_en pe16_DFF_en0(en,clk, reset_n, pe16_in016, pe16_fir_in);
DFF_en pe16_DFF_en1(en,clk, reset_n, pe16_fir_in,pe16_sec_in);
DFF_en pe16_DFF_en2(en,clk, reset_n, pe16_sec_in,pe16_third_in);

DFF_en pe17_DFF_en0(en,clk, reset_n, pe17_in017, pe17_fir_in);
DFF_en pe17_DFF_en1(en,clk, reset_n, pe17_fir_in,pe17_sec_in);
DFF_en pe17_DFF_en2(en,clk, reset_n, pe17_sec_in,pe17_third_in);

DFF_en pe18_DFF_en0(en,clk, reset_n, pe18_in018, pe18_fir_in);
DFF_en pe18_DFF_en1(en,clk, reset_n, pe18_fir_in,pe18_sec_in);
DFF_en pe18_DFF_en2(en,clk, reset_n, pe18_sec_in,pe18_third_in);

DFF_en pe21_DFF_en0(en,clk, reset_n, pe21_in021, pe21_fir_in);
DFF_en pe21_DFF_en1(en,clk, reset_n, pe21_fir_in,pe21_sec_in);
DFF_en pe21_DFF_en2(en,clk, reset_n, pe21_sec_in,pe21_third_in);

DFF_en pe22_DFF_en0(en,clk, reset_n, pe22_in022, pe22_fir_in);
DFF_en pe22_DFF_en1(en,clk, reset_n, pe22_fir_in,pe22_sec_in);
DFF_en pe22_DFF_en2(en,clk, reset_n, pe22_sec_in,pe22_third_in);

DFF_en pe23_DFF_en0(en,clk, reset_n, pe23_in023, pe23_fir_in);
DFF_en pe23_DFF_en1(en,clk, reset_n, pe23_fir_in,pe23_sec_in);
DFF_en pe23_DFF_en2(en,clk, reset_n, pe23_sec_in,pe23_third_in);

DFF_en pe24_DFF_en0(en,clk, reset_n, pe24_in024, pe24_fir_in);
DFF_en pe24_DFF_en1(en,clk, reset_n, pe24_fir_in,pe24_sec_in);
DFF_en pe24_DFF_en2(en,clk, reset_n, pe24_sec_in,pe24_third_in);

DFF_en pe25_DFF_en0(en,clk, reset_n, pe25_in025, pe25_fir_in);
DFF_en pe25_DFF_en1(en,clk, reset_n, pe25_fir_in,pe25_sec_in);
DFF_en pe25_DFF_en2(en,clk, reset_n, pe25_sec_in,pe25_third_in);

DFF_en pe26_DFF_en0(en,clk, reset_n, pe26_in026, pe26_fir_in);
DFF_en pe26_DFF_en1(en,clk, reset_n, pe26_fir_in,pe26_sec_in);
DFF_en pe26_DFF_en2(en,clk, reset_n, pe26_sec_in,pe26_third_in);

DFF_en pe27_DFF_en0(en,clk, reset_n, pe27_in027, pe27_fir_in);
DFF_en pe27_DFF_en1(en,clk, reset_n, pe27_fir_in,pe27_sec_in);
DFF_en pe27_DFF_en2(en,clk, reset_n, pe27_sec_in,pe27_third_in);

DFF_en pe28_DFF_en0(en,clk, reset_n, pe28_in028, pe28_fir_in);
DFF_en pe28_DFF_en1(en,clk, reset_n, pe28_fir_in,pe28_sec_in);
DFF_en pe28_DFF_en2(en,clk, reset_n, pe28_sec_in,pe28_third_in);

DFF_en pe31_DFF_en0(en,clk, reset_n, pe31_in031, pe31_fir_in);
DFF_en pe31_DFF_en1(en,clk, reset_n, pe31_fir_in,pe31_sec_in);
DFF_en pe31_DFF_en2(en,clk, reset_n, pe31_sec_in,pe31_third_in);

DFF_en pe32_DFF_en0(en,clk, reset_n, pe32_in032, pe32_fir_in);
DFF_en pe32_DFF_en1(en,clk, reset_n, pe32_fir_in,pe32_sec_in);
DFF_en pe32_DFF_en2(en,clk, reset_n, pe32_sec_in,pe32_third_in);

DFF_en pe33_DFF_en0(en,clk, reset_n, pe33_in033, pe33_fir_in);
DFF_en pe33_DFF_en1(en,clk, reset_n, pe33_fir_in,pe33_sec_in);
DFF_en pe33_DFF_en2(en,clk, reset_n, pe33_sec_in,pe33_third_in);

DFF_en pe34_DFF_en0(en,clk, reset_n, pe34_in034, pe34_fir_in);
DFF_en pe34_DFF_en1(en,clk, reset_n, pe34_fir_in,pe34_sec_in);
DFF_en pe34_DFF_en2(en,clk, reset_n, pe34_sec_in,pe34_third_in);

DFF_en pe35_DFF_en0(en,clk, reset_n, pe35_in035, pe35_fir_in);
DFF_en pe35_DFF_en1(en,clk, reset_n, pe35_fir_in,pe35_sec_in);
DFF_en pe35_DFF_en2(en,clk, reset_n, pe35_sec_in,pe35_third_in);

DFF_en pe36_DFF_en0(en,clk, reset_n, pe36_in036, pe36_fir_in);
DFF_en pe36_DFF_en1(en,clk, reset_n, pe36_fir_in,pe36_sec_in);
DFF_en pe36_DFF_en2(en,clk, reset_n, pe36_sec_in,pe36_third_in);

DFF_en pe37_DFF_en0(en,clk, reset_n, pe37_in037, pe37_fir_in);
DFF_en pe37_DFF_en1(en,clk, reset_n, pe37_fir_in,pe37_sec_in);
DFF_en pe37_DFF_en2(en,clk, reset_n, pe37_sec_in,pe37_third_in);

DFF_en pe38_DFF_en0(en,clk, reset_n, pe38_in038, pe38_fir_in);
DFF_en pe38_DFF_en1(en,clk, reset_n, pe38_fir_in,pe38_sec_in);
DFF_en pe38_DFF_en2(en,clk, reset_n, pe38_sec_in,pe38_third_in);

DFF_en pe41_DFF_en0(en,clk, reset_n, pe41_in041, pe41_fir_in);
DFF_en pe41_DFF_en1(en,clk, reset_n, pe41_fir_in,pe41_sec_in);
DFF_en pe41_DFF_en2(en,clk, reset_n, pe41_sec_in,pe41_third_in);

DFF_en pe42_DFF_en0(en,clk, reset_n, pe42_in042, pe42_fir_in);
DFF_en pe42_DFF_en1(en,clk, reset_n, pe42_fir_in,pe42_sec_in);
DFF_en pe42_DFF_en2(en,clk, reset_n, pe42_sec_in,pe42_third_in);

DFF_en pe43_DFF_en0(en,clk, reset_n, pe43_in043, pe43_fir_in);
DFF_en pe43_DFF_en1(en,clk, reset_n, pe43_fir_in,pe43_sec_in);
DFF_en pe43_DFF_en2(en,clk, reset_n, pe43_sec_in,pe43_third_in);

DFF_en pe44_DFF_en0(en,clk, reset_n, pe44_in044, pe44_fir_in);
DFF_en pe44_DFF_en1(en,clk, reset_n, pe44_fir_in,pe44_sec_in);
DFF_en pe44_DFF_en2(en,clk, reset_n, pe44_sec_in,pe44_third_in);

DFF_en pe45_DFF_en0(en,clk, reset_n, pe45_in045, pe45_fir_in);
DFF_en pe45_DFF_en1(en,clk, reset_n, pe45_fir_in,pe45_sec_in);
DFF_en pe45_DFF_en2(en,clk, reset_n, pe45_sec_in,pe45_third_in);

DFF_en pe46_DFF_en0(en,clk, reset_n, pe46_in046, pe46_fir_in);
DFF_en pe46_DFF_en1(en,clk, reset_n, pe46_fir_in,pe46_sec_in);
DFF_en pe46_DFF_en2(en,clk, reset_n, pe46_sec_in,pe46_third_in);

DFF_en pe47_DFF_en0(en,clk, reset_n, pe47_in047, pe47_fir_in);
DFF_en pe47_DFF_en1(en,clk, reset_n, pe47_fir_in,pe47_sec_in);
DFF_en pe47_DFF_en2(en,clk, reset_n, pe47_sec_in,pe47_third_in);

DFF_en pe48_DFF_en0(en,clk, reset_n, pe48_in048, pe48_fir_in);
DFF_en pe48_DFF_en1(en,clk, reset_n, pe48_fir_in,pe48_sec_in);
DFF_en pe48_DFF_en2(en,clk, reset_n, pe48_sec_in,pe48_third_in);


endmodule 