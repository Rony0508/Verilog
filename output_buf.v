module output_buf(en,clk,reset_n,buf_select,pe11_out011,pe12_out012,pe13_out013,pe14_out014,pe15_out015,pe16_out016,pe17_out017,pe18_out018
,pe21_out021,pe22_out022,pe23_out023,pe24_out024,pe25_out025,pe26_out026,pe27_out027,pe28_out028
,pe31_out031,pe32_out032,pe33_out033,pe34_out034,pe35_out035,pe36_out036,pe37_out037,pe38_out038
,pe41_out041,pe42_out042,pe43_out043,pe44_out044,pe45_out045,pe46_out046,pe47_out047,pe48_out048
,pe11_third_out,pe12_third_out,pe13_third_out,pe14_third_out, pe15_third_out,pe16_third_out,pe17_third_out
,pe18_third_out,pe21_third_out, pe22_third_out,pe23_third_out,pe24_third_out, pe25_third_out,pe26_third_out,pe27_third_out
,pe28_third_out,pe31_third_out, pe32_third_out,pe33_third_out, pe34_third_out, pe35_third_out
,pe36_third_out,pe37_third_out,pe38_third_out,pe41_third_out,pe42_third_out,pe43_third_out
,pe44_third_out, pe45_third_out,pe46_third_out,pe47_third_out,pe48_third_out);
parameter N=17;
input buf_select,reset_n,clk,en;
input [N-1:0]pe11_out011,pe12_out012,pe13_out013,pe14_out014, pe15_out015, pe16_out016, pe17_out017, pe18_out018
, pe21_out021,pe22_out022,pe23_out023,pe24_out024, pe25_out025, pe26_out026, pe27_out027, pe28_out028
,pe31_out031,pe32_out032,pe33_out033,pe34_out034, pe35_out035, pe36_out036, pe37_out037, pe38_out038
,pe41_out041,pe42_out042,pe43_out043,pe44_out044, pe45_out045, pe46_out046, pe47_out047, pe48_out048;

wire [N-1:0]pe11_fir_out,pe11_sec_out,pe12_fir_out,pe12_sec_out,pe13_fir_out,pe13_sec_out, pe14_fir_out, pe14_sec_out
,pe15_fir_out,pe15_sec_out,pe16_fir_out,pe16_sec_out,pe17_fir_out,pe17_sec_out,pe18_fir_out,pe18_sec_out
,pe21_fir_out,pe21_sec_out,pe22_fir_out,pe22_sec_out,pe23_fir_out,pe23_sec_out,pe24_fir_out,pe24_sec_out
,pe25_fir_out,pe25_sec_out,pe26_fir_out,pe26_sec_out,pe27_fir_out,pe27_sec_out,pe28_fir_out,pe28_sec_out
,pe31_fir_out,pe31_sec_out,pe32_fir_out,pe32_sec_out,pe33_fir_out,pe33_sec_out,pe34_fir_out,pe34_sec_out
,pe35_fir_out,pe35_sec_out,pe36_fir_out,pe36_sec_out,pe37_fir_out,pe37_sec_out,pe38_fir_out,pe38_sec_out
,pe41_fir_out,pe41_sec_out,pe42_fir_out,pe42_sec_out,pe43_fir_out,pe43_sec_out,pe44_fir_out,pe44_sec_out
,pe45_fir_out,pe45_sec_out,pe46_fir_out,pe46_sec_out,pe47_fir_out, pe47_sec_out,pe48_fir_out,pe48_sec_out;
output [N-1:0]pe11_third_out,pe12_third_out,pe13_third_out,pe14_third_out, pe15_third_out,pe16_third_out,pe17_third_out
,pe18_third_out,pe21_third_out, pe22_third_out,pe23_third_out,pe24_third_out, pe25_third_out,pe26_third_out,pe27_third_out
,pe28_third_out,pe31_third_out, pe32_third_out,pe33_third_out, pe34_third_out, pe35_third_out
,pe36_third_out,pe37_third_out,pe38_third_out,pe41_third_out,pe42_third_out,pe43_third_out
,pe44_third_out, pe45_third_out,pe46_third_out,pe47_third_out,pe48_third_out;

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


endmodule 