module weight_buf(en,clk,reset_n,buf_select

,pe11_weight011,pe12_weight012,pe13_weight013,pe14_weight014,pe15_weight015,pe16_weight016
,pe17_weight017,pe18_weight018,pe21_weight021,pe22_weight022,pe23_weight023,pe24_weight024
,pe25_weight025,pe26_weight026,pe27_weight027,pe28_weight028,pe31_weight031,pe32_weight032
,pe33_weight033,pe34_weight034,pe35_weight035,pe36_weight036,pe37_weight037,pe38_weight038
,pe41_weight041,pe42_weight042,pe43_weight043,pe44_weight044,pe45_weight045,pe46_weight046
,pe47_weight047,pe48_weight048

,pe11_third_weight,pe12_third_weight,pe13_third_weight,pe14_third_weight,pe15_third_weight
,pe16_third_weight,pe17_third_weight,pe18_third_weight,pe21_third_weight,pe22_third_weight
,pe23_third_weight,pe24_third_weight,pe25_third_weight,pe26_third_weight,pe27_third_weight
,pe28_third_weight,pe31_third_weight,pe32_third_weight,pe33_third_weight,pe34_third_weight
,pe35_third_weight,pe36_third_weight,pe37_third_weight,pe38_third_weight,pe41_third_weight
,pe42_third_weight,pe43_third_weight,pe44_third_weight,pe45_third_weight,pe46_third_weight
,pe47_third_weight,pe48_third_weight

);
/*---------------------------------------------------------------------------------*/
parameter N=8;
/*---------------------------------------------------------------------------------*/
input buf_select,reset_n,clk,en;
input [N-1:0]
pe11_weight011,pe12_weight012,pe13_weight013,pe14_weight014,pe15_weight015,pe16_weight016
,pe17_weight017,pe18_weight018,pe21_weight021,pe22_weight022,pe23_weight023,pe24_weight024
,pe25_weight025,pe26_weight026,pe27_weight027,pe28_weight028,pe31_weight031,pe32_weight032
,pe33_weight033,pe34_weight034,pe35_weight035,pe36_weight036,pe37_weight037,pe38_weight038
,pe41_weight041,pe42_weight042,pe43_weight043,pe44_weight044,pe45_weight045,pe46_weight046
,pe47_weight047,pe48_weight048;
/*---------------------------------------------------------------------------------*/
wire [N-1:0]pe11_fir_weight,pe11_sec_weight,pe12_fir_weight,pe12_sec_weight,pe13_fir_weight,pe13_sec_weight, pe14_fir_weight, pe14_sec_weight
,pe15_fir_weight,pe15_sec_weight,pe16_fir_weight,pe16_sec_weight,pe17_fir_weight,pe17_sec_weight,pe18_fir_weight,pe18_sec_weight
,pe21_fir_weight,pe21_sec_weight,pe22_fir_weight,pe22_sec_weight,pe23_fir_weight,pe23_sec_weight,pe24_fir_weight,pe24_sec_weight
,pe25_fir_weight,pe25_sec_weight,pe26_fir_weight,pe26_sec_weight,pe27_fir_weight,pe27_sec_weight,pe28_fir_weight,pe28_sec_weight
,pe31_fir_weight,pe31_sec_weight,pe32_fir_weight,pe32_sec_weight,pe33_fir_weight,pe33_sec_weight,pe34_fir_weight,pe34_sec_weight
,pe35_fir_weight,pe35_sec_weight,pe36_fir_weight,pe36_sec_weight,pe37_fir_weight,pe37_sec_weight,pe38_fir_weight,pe38_sec_weight
,pe41_fir_weight,pe41_sec_weight,pe42_fir_weight,pe42_sec_weight,pe43_fir_weight,pe43_sec_weight,pe44_fir_weight,pe44_sec_weight
,pe45_fir_weight,pe45_sec_weight,pe46_fir_weight,pe46_sec_weight,pe47_fir_weight, pe47_sec_weight,pe48_fir_weight,pe48_sec_weight;
/*---------------------------------------------------------------------------------*/
output [N-1:0]
pe11_third_weight,pe12_third_weight,pe13_third_weight,pe14_third_weight,pe15_third_weight
,pe16_third_weight,pe17_third_weight,pe18_third_weight,pe21_third_weight,pe22_third_weight
,pe23_third_weight,pe24_third_weight,pe25_third_weight,pe26_third_weight,pe27_third_weight
,pe28_third_weight,pe31_third_weight,pe32_third_weight,pe33_third_weight,pe34_third_weight
,pe35_third_weight,pe36_third_weight,pe37_third_weight,pe38_third_weight,pe41_third_weight
,pe42_third_weight,pe43_third_weight,pe44_third_weight,pe45_third_weight,pe46_third_weight
,pe47_third_weight,pe48_third_weight;

/*---------------------------------------------------------------------------------*/
DFF_en pe11_DFF_en0(en,clk,reset_n,pe11_weight011, pe11_fir_weight);
DFF_en pe11_DFF_en1(en,clk,reset_n,pe11_fir_weight,pe11_sec_weight);
DFF_en pe11_DFF_en2(en,clk,reset_n,pe11_sec_weight,pe11_third_weight);

DFF_en pe12_DFF_en0(en,clk, reset_n, pe12_weight012, pe12_fir_weight);
DFF_en pe12_DFF_en1(en,clk, reset_n, pe12_fir_weight,pe12_sec_weight);
DFF_en pe12_DFF_en2(en,clk, reset_n, pe12_sec_weight,pe12_third_weight);

DFF_en pe13_DFF_en0(en,clk, reset_n, pe13_weight013, pe13_fir_weight);
DFF_en pe13_DFF_en1(en,clk, reset_n, pe13_fir_weight,pe13_sec_weight);
DFF_en pe13_DFF_en2(en,clk, reset_n, pe13_sec_weight,pe13_third_weight);

DFF_en pe14_DFF_en0(en,clk, reset_n, pe14_weight014, pe14_fir_weight);
DFF_en pe14_DFF_en1(en,clk, reset_n, pe14_fir_weight,pe14_sec_weight);
DFF_en pe14_DFF_en2(en,clk, reset_n, pe14_sec_weight,pe14_third_weight);

DFF_en pe15_DFF_en0(en,clk, reset_n, pe15_weight015, pe15_fir_weight);
DFF_en pe15_DFF_en1(en,clk, reset_n, pe15_fir_weight,pe15_sec_weight);
DFF_en pe15_DFF_en2(en,clk, reset_n, pe15_sec_weight,pe15_third_weight);

DFF_en pe16_DFF_en0(en,clk, reset_n, pe16_weight016, pe16_fir_weight);
DFF_en pe16_DFF_en1(en,clk, reset_n, pe16_fir_weight,pe16_sec_weight);
DFF_en pe16_DFF_en2(en,clk, reset_n, pe16_sec_weight,pe16_third_weight);

DFF_en pe17_DFF_en0(en,clk, reset_n, pe17_weight017, pe17_fir_weight);
DFF_en pe17_DFF_en1(en,clk, reset_n, pe17_fir_weight,pe17_sec_weight);
DFF_en pe17_DFF_en2(en,clk, reset_n, pe17_sec_weight,pe17_third_weight);

DFF_en pe18_DFF_en0(en,clk, reset_n, pe18_weight018, pe18_fir_weight);
DFF_en pe18_DFF_en1(en,clk, reset_n, pe18_fir_weight,pe18_sec_weight);
DFF_en pe18_DFF_en2(en,clk, reset_n, pe18_sec_weight,pe18_third_weight);

DFF_en pe21_DFF_en0(en,clk, reset_n, pe21_weight021, pe21_fir_weight);
DFF_en pe21_DFF_en1(en,clk, reset_n, pe21_fir_weight,pe21_sec_weight);
DFF_en pe21_DFF_en2(en,clk, reset_n, pe21_sec_weight,pe21_third_weight);

DFF_en pe22_DFF_en0(en,clk, reset_n, pe22_weight022, pe22_fir_weight);
DFF_en pe22_DFF_en1(en,clk, reset_n, pe22_fir_weight,pe22_sec_weight);
DFF_en pe22_DFF_en2(en,clk, reset_n, pe22_sec_weight,pe22_third_weight);

DFF_en pe23_DFF_en0(en,clk, reset_n, pe23_weight023, pe23_fir_weight);
DFF_en pe23_DFF_en1(en,clk, reset_n, pe23_fir_weight,pe23_sec_weight);
DFF_en pe23_DFF_en2(en,clk, reset_n, pe23_sec_weight,pe23_third_weight);

DFF_en pe24_DFF_en0(en,clk, reset_n, pe24_weight024, pe24_fir_weight);
DFF_en pe24_DFF_en1(en,clk, reset_n, pe24_fir_weight,pe24_sec_weight);
DFF_en pe24_DFF_en2(en,clk, reset_n, pe24_sec_weight,pe24_third_weight);

DFF_en pe25_DFF_en0(en,clk, reset_n, pe25_weight025, pe25_fir_weight);
DFF_en pe25_DFF_en1(en,clk, reset_n, pe25_fir_weight,pe25_sec_weight);
DFF_en pe25_DFF_en2(en,clk, reset_n, pe25_sec_weight,pe25_third_weight);

DFF_en pe26_DFF_en0(en,clk, reset_n, pe26_weight026, pe26_fir_weight);
DFF_en pe26_DFF_en1(en,clk, reset_n, pe26_fir_weight,pe26_sec_weight);
DFF_en pe26_DFF_en2(en,clk, reset_n, pe26_sec_weight,pe26_third_weight);

DFF_en pe27_DFF_en0(en,clk, reset_n, pe27_weight027, pe27_fir_weight);
DFF_en pe27_DFF_en1(en,clk, reset_n, pe27_fir_weight,pe27_sec_weight);
DFF_en pe27_DFF_en2(en,clk, reset_n, pe27_sec_weight,pe27_third_weight);

DFF_en pe28_DFF_en0(en,clk, reset_n, pe28_weight028, pe28_fir_weight);
DFF_en pe28_DFF_en1(en,clk, reset_n, pe28_fir_weight,pe28_sec_weight);
DFF_en pe28_DFF_en2(en,clk, reset_n, pe28_sec_weight,pe28_third_weight);

DFF_en pe31_DFF_en0(en,clk, reset_n, pe31_weight031, pe31_fir_weight);
DFF_en pe31_DFF_en1(en,clk, reset_n, pe31_fir_weight,pe31_sec_weight);
DFF_en pe31_DFF_en2(en,clk, reset_n, pe31_sec_weight,pe31_third_weight);

DFF_en pe32_DFF_en0(en,clk, reset_n, pe32_weight032, pe32_fir_weight);
DFF_en pe32_DFF_en1(en,clk, reset_n, pe32_fir_weight,pe32_sec_weight);
DFF_en pe32_DFF_en2(en,clk, reset_n, pe32_sec_weight,pe32_third_weight);

DFF_en pe33_DFF_en0(en,clk, reset_n, pe33_weight033, pe33_fir_weight);
DFF_en pe33_DFF_en1(en,clk, reset_n, pe33_fir_weight,pe33_sec_weight);
DFF_en pe33_DFF_en2(en,clk, reset_n, pe33_sec_weight,pe33_third_weight);

DFF_en pe34_DFF_en0(en,clk, reset_n, pe34_weight034, pe34_fir_weight);
DFF_en pe34_DFF_en1(en,clk, reset_n, pe34_fir_weight,pe34_sec_weight);
DFF_en pe34_DFF_en2(en,clk, reset_n, pe34_sec_weight,pe34_third_weight);

DFF_en pe35_DFF_en0(en,clk, reset_n, pe35_weight035, pe35_fir_weight);
DFF_en pe35_DFF_en1(en,clk, reset_n, pe35_fir_weight,pe35_sec_weight);
DFF_en pe35_DFF_en2(en,clk, reset_n, pe35_sec_weight,pe35_third_weight);

DFF_en pe36_DFF_en0(en,clk, reset_n, pe36_weight036, pe36_fir_weight);
DFF_en pe36_DFF_en1(en,clk, reset_n, pe36_fir_weight,pe36_sec_weight);
DFF_en pe36_DFF_en2(en,clk, reset_n, pe36_sec_weight,pe36_third_weight);

DFF_en pe37_DFF_en0(en,clk, reset_n, pe37_weight037, pe37_fir_weight);
DFF_en pe37_DFF_en1(en,clk, reset_n, pe37_fir_weight,pe37_sec_weight);
DFF_en pe37_DFF_en2(en,clk, reset_n, pe37_sec_weight,pe37_third_weight);

DFF_en pe38_DFF_en0(en,clk, reset_n, pe38_weight038, pe38_fir_weight);
DFF_en pe38_DFF_en1(en,clk, reset_n, pe38_fir_weight,pe38_sec_weight);
DFF_en pe38_DFF_en2(en,clk, reset_n, pe38_sec_weight,pe38_third_weight);

DFF_en pe41_DFF_en0(en,clk, reset_n, pe41_weight041, pe41_fir_weight);
DFF_en pe41_DFF_en1(en,clk, reset_n, pe41_fir_weight,pe41_sec_weight);
DFF_en pe41_DFF_en2(en,clk, reset_n, pe41_sec_weight,pe41_third_weight);

DFF_en pe42_DFF_en0(en,clk, reset_n, pe42_weight042, pe42_fir_weight);
DFF_en pe42_DFF_en1(en,clk, reset_n, pe42_fir_weight,pe42_sec_weight);
DFF_en pe42_DFF_en2(en,clk, reset_n, pe42_sec_weight,pe42_third_weight);

DFF_en pe43_DFF_en0(en,clk, reset_n, pe43_weight043, pe43_fir_weight);
DFF_en pe43_DFF_en1(en,clk, reset_n, pe43_fir_weight,pe43_sec_weight);
DFF_en pe43_DFF_en2(en,clk, reset_n, pe43_sec_weight,pe43_third_weight);

DFF_en pe44_DFF_en0(en,clk, reset_n, pe44_weight044, pe44_fir_weight);
DFF_en pe44_DFF_en1(en,clk, reset_n, pe44_fir_weight,pe44_sec_weight);
DFF_en pe44_DFF_en2(en,clk, reset_n, pe44_sec_weight,pe44_third_weight);

DFF_en pe45_DFF_en0(en,clk, reset_n, pe45_weight045, pe45_fir_weight);
DFF_en pe45_DFF_en1(en,clk, reset_n, pe45_fir_weight,pe45_sec_weight);
DFF_en pe45_DFF_en2(en,clk, reset_n, pe45_sec_weight,pe45_third_weight);

DFF_en pe46_DFF_en0(en,clk, reset_n, pe46_weight046, pe46_fir_weight);
DFF_en pe46_DFF_en1(en,clk, reset_n, pe46_fir_weight,pe46_sec_weight);
DFF_en pe46_DFF_en2(en,clk, reset_n, pe46_sec_weight,pe46_third_weight);

DFF_en pe47_DFF_en0(en,clk, reset_n, pe47_weight047, pe47_fir_weight);
DFF_en pe47_DFF_en1(en,clk, reset_n, pe47_fir_weight,pe47_sec_weight);
DFF_en pe47_DFF_en2(en,clk, reset_n, pe47_sec_weight,pe47_third_weight);

DFF_en pe48_DFF_en0(en,clk, reset_n, pe48_weight048, pe48_fir_weight);
DFF_en pe48_DFF_en1(en,clk, reset_n, pe48_fir_weight,pe48_sec_weight);
DFF_en pe48_DFF_en2(en,clk, reset_n, pe48_sec_weight,pe48_third_weight);






endmodule
