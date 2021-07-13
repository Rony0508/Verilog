module weight_update(
en,clk,reset_n

,pe11_wg0,pe11_wg1,pe11_wg2,pe12_wg0,pe12_wg1,pe12_wg2,pe13_wg0,pe13_wg1,pe13_wg2
,pe14_wg0,pe14_wg1,pe14_wg2,pe15_wg0,pe15_wg1,pe15_wg2,pe16_wg0,pe16_wg1,pe16_wg2
,pe17_wg0,pe17_wg1,pe17_wg2,pe18_wg0,pe18_wg1,pe18_wg2,pe21_wg0,pe21_wg1,pe21_wg2
,pe22_wg0,pe22_wg1,pe22_wg2,pe23_wg0,pe23_wg1,pe23_wg2,pe24_wg0,pe24_wg1,pe24_wg2
,pe25_wg0,pe25_wg1,pe25_wg2,pe26_wg0,pe26_wg1,pe26_wg2,pe27_wg0,pe27_wg1,pe27_wg2
,pe28_wg0,pe28_wg1,pe28_wg2,pe31_wg0,pe31_wg1,pe31_wg2,pe32_wg0,pe32_wg1,pe32_wg2
,pe33_wg0,pe33_wg1,pe33_wg2,pe34_wg0,pe34_wg1,pe34_wg2,pe35_wg0,pe35_wg1,pe35_wg2
,pe36_wg0,pe36_wg1,pe36_wg2,pe37_wg0,pe37_wg1,pe37_wg2,pe38_wg0,pe38_wg1,pe38_wg2
,pe41_wg0,pe41_wg1,pe41_wg2,pe42_wg0,pe42_wg1,pe42_wg2,pe43_wg0,pe43_wg1,pe43_wg2
,pe44_wg0,pe44_wg1,pe44_wg2,pe45_wg0,pe45_wg1,pe45_wg2,pe46_wg0,pe46_wg1,pe46_wg2
,pe47_wg0,pe47_wg1,pe47_wg2,pe48_wg0,pe48_wg1,pe48_wg2

,weight_pref11_wg0,weight_pref11_wg1,weight_pref11_wg2
,weight_pref12_wg0,weight_pref12_wg1,weight_pref12_wg2
,weight_pref13_wg0,weight_pref13_wg1,weight_pref13_wg2
,weight_pref14_wg0,weight_pref14_wg1,weight_pref14_wg2
,weight_pref15_wg0,weight_pref15_wg1,weight_pref15_wg2
,weight_pref16_wg0,weight_pref16_wg1,weight_pref16_wg2
,weight_pref17_wg0,weight_pref17_wg1,weight_pref17_wg2
,weight_pref18_wg0,weight_pref18_wg1,weight_pref18_wg2
,weight_pref21_wg0,weight_pref21_wg1,weight_pref21_wg2
,weight_pref22_wg0,weight_pref22_wg1,weight_pref22_wg2
,weight_pref23_wg0,weight_pref23_wg1,weight_pref23_wg2
,weight_pref24_wg0,weight_pref24_wg1,weight_pref24_wg2
,weight_pref25_wg0,weight_pref25_wg1,weight_pref25_wg2
,weight_pref26_wg0,weight_pref26_wg1,weight_pref26_wg2
,weight_pref27_wg0,weight_pref27_wg1,weight_pref27_wg2
,weight_pref28_wg0,weight_pref28_wg1,weight_pref28_wg2
,weight_pref31_wg0,weight_pref31_wg1,weight_pref31_wg2
,weight_pref32_wg0,weight_pref32_wg1,weight_pref32_wg2
,weight_pref33_wg0,weight_pref33_wg1,weight_pref33_wg2
,weight_pref34_wg0,weight_pref34_wg1,weight_pref34_wg2
,weight_pref35_wg0,weight_pref35_wg1,weight_pref35_wg2
,weight_pref36_wg0,weight_pref36_wg1,weight_pref36_wg2
,weight_pref37_wg0,weight_pref37_wg1,weight_pref37_wg2
,weight_pref38_wg0,weight_pref38_wg1,weight_pref38_wg2
,weight_pref41_wg0,weight_pref41_wg1,weight_pref41_wg2
,weight_pref42_wg0,weight_pref42_wg1,weight_pref42_wg2
,weight_pref43_wg0,weight_pref43_wg1,weight_pref43_wg2
,weight_pref44_wg0,weight_pref44_wg1,weight_pref44_wg2
,weight_pref45_wg0,weight_pref45_wg1,weight_pref45_wg2
,weight_pref46_wg0,weight_pref46_wg1,weight_pref46_wg2
,weight_pref47_wg0,weight_pref47_wg1,weight_pref47_wg2
,weight_pref48_wg0,weight_pref48_wg1,weight_pref48_wg2




);
/*---------------------------------------------------------------------------------*/

parameter N = 16;

/*---------------------------------------------------------------------------------*/
input en,clk,reset_n;

//n-1bit pe to update
input [N-1:0] 
,pe11_wg0,pe11_wg1,pe11_wg2,pe12_wg0,pe12_wg1,pe12_wg2,pe13_wg0,pe13_wg1,pe13_wg2
,pe14_wg0,pe14_wg1,pe14_wg2,pe15_wg0,pe15_wg1,pe15_wg2,pe16_wg0,pe16_wg1,pe16_wg2
,pe17_wg0,pe17_wg1,pe17_wg2,pe18_wg0,pe18_wg1,pe18_wg2,pe21_wg0,pe21_wg1,pe21_wg2
,pe22_wg0,pe22_wg1,pe22_wg2,pe23_wg0,pe23_wg1,pe23_wg2,pe24_wg0,pe24_wg1,pe24_wg2
,pe25_wg0,pe25_wg1,pe25_wg2,pe26_wg0,pe26_wg1,pe26_wg2,pe27_wg0,pe27_wg1,pe27_wg2
,pe28_wg0,pe28_wg1,pe28_wg2,pe31_wg0,pe31_wg1,pe31_wg2,pe32_wg0,pe32_wg1,pe32_wg2
,pe33_wg0,pe33_wg1,pe33_wg2,pe34_wg0,pe34_wg1,pe34_wg2,pe35_wg0,pe35_wg1,pe35_wg2
,pe36_wg0,pe36_wg1,pe36_wg2,pe37_wg0,pe37_wg1,pe37_wg2,pe38_wg0,pe38_wg1,pe38_wg2
,pe41_wg0,pe41_wg1,pe41_wg2,pe42_wg0,pe42_wg1,pe42_wg2,pe43_wg0,pe43_wg1,pe43_wg2
,pe44_wg0,pe44_wg1,pe44_wg2,pe45_wg0,pe45_wg1,pe45_wg2,pe46_wg0,pe46_wg1,pe46_wg2
,pe47_wg0,pe47_wg1,pe47_wg2,pe48_wg0,pe48_wg1,pe48_wg2;


/*---------------------------------------------------------------------------------*/
//go to weight_pref
output reg [N-1:0]
weight_pref11_wg0,weight_pref11_wg1,weight_pref11_wg2
,weight_pref12_wg0,weight_pref12_wg1,weight_pref12_wg2
,weight_pref13_wg0,weight_pref13_wg1,weight_pref13_wg2
,weight_pref14_wg0,weight_pref14_wg1,weight_pref14_wg2
,weight_pref15_wg0,weight_pref15_wg1,weight_pref15_wg2
,weight_pref16_wg0,weight_pref16_wg1,weight_pref16_wg2
,weight_pref17_wg0,weight_pref17_wg1,weight_pref17_wg2
,weight_pref18_wg0,weight_pref18_wg1,weight_pref18_wg2
,weight_pref21_wg0,weight_pref21_wg1,weight_pref21_wg2
,weight_pref22_wg0,weight_pref22_wg1,weight_pref22_wg2
,weight_pref23_wg0,weight_pref23_wg1,weight_pref23_wg2
,weight_pref24_wg0,weight_pref24_wg1,weight_pref24_wg2
,weight_pref25_wg0,weight_pref25_wg1,weight_pref25_wg2
,weight_pref26_wg0,weight_pref26_wg1,weight_pref26_wg2
,weight_pref27_wg0,weight_pref27_wg1,weight_pref27_wg2
,weight_pref28_wg0,weight_pref28_wg1,weight_pref28_wg2
,weight_pref31_wg0,weight_pref31_wg1,weight_pref31_wg2
,weight_pref32_wg0,weight_pref32_wg1,weight_pref32_wg2
,weight_pref33_wg0,weight_pref33_wg1,weight_pref33_wg2
,weight_pref34_wg0,weight_pref34_wg1,weight_pref34_wg2
,weight_pref35_wg0,weight_pref35_wg1,weight_pref35_wg2
,weight_pref36_wg0,weight_pref36_wg1,weight_pref36_wg2
,weight_pref37_wg0,weight_pref37_wg1,weight_pref37_wg2
,weight_pref38_wg0,weight_pref38_wg1,weight_pref38_wg2
,weight_pref41_wg0,weight_pref41_wg1,weight_pref41_wg2
,weight_pref42_wg0,weight_pref42_wg1,weight_pref42_wg2
,weight_pref43_wg0,weight_pref43_wg1,weight_pref43_wg2
,weight_pref44_wg0,weight_pref44_wg1,weight_pref44_wg2
,weight_pref45_wg0,weight_pref45_wg1,weight_pref45_wg2
,weight_pref46_wg0,weight_pref46_wg1,weight_pref46_wg2
,weight_pref47_wg0,weight_pref47_wg1,weight_pref47_wg2
,weight_pref48_wg0,weight_pref48_wg1,weight_pref48_wg2;



/*---------------------------------------------------------------------------------*/
//Buffer (mode b,d)
DFF_en pe11_DFF_wg0(en,clk,reset_n,pe11_wg0,weight_pref11_wg0);
DFF_en pe11_DFF_wg1(en,clk,reset_n,pe11_wg1,weight_pref11_wg1);
DFF_en pe11_DFF_wg2(en,clk,reset_n,pe11_wg2,weight_pref11_wg2);

DFF_en pe12_DFF_wg0(en,clk,reset_n,pe12_wg0,weight_pref12_wg0);
DFF_en pe12_DFF_wg1(en,clk,reset_n,pe12_wg1,weight_pref12_wg1);
DFF_en pe12_DFF_wg2(en,clk,reset_n,pe12_wg2,weight_pref12_wg2);

DFF_en pe13_DFF_wg0(en,clk,reset_n,pe13_wg0,weight_pref13_wg0);
DFF_en pe13_DFF_wg1(en,clk,reset_n,pe13_wg1,weight_pref13_wg1);
DFF_en pe13_DFF_wg2(en,clk,reset_n,pe13_wg2,weight_pref13_wg2);

DFF_en pe14_DFF_wg0(en,clk,reset_n,pe14_wg0,weight_pref14_wg0);
DFF_en pe14_DFF_wg1(en,clk,reset_n,pe14_wg1,weight_pref14_wg1);
DFF_en pe14_DFF_wg2(en,clk,reset_n,pe14_wg2,weight_pref14_wg2);

DFF_en pe15_DFF_wg0(en,clk,reset_n,pe15_wg0,weight_pref15_wg0);
DFF_en pe15_DFF_wg1(en,clk,reset_n,pe15_wg1,weight_pref15_wg1);
DFF_en pe15_DFF_wg2(en,clk,reset_n,pe15_wg2,weight_pref15_wg2);

DFF_en pe16_DFF_wg0(en,clk,reset_n,pe16_wg0,weight_pref16_wg0);
DFF_en pe16_DFF_wg1(en,clk,reset_n,pe16_wg1,weight_pref16_wg1);
DFF_en pe16_DFF_wg2(en,clk,reset_n,pe16_wg2,weight_pref16_wg2);

DFF_en pe17_DFF_wg0(en,clk,reset_n,pe17_wg0,weight_pref17_wg0);
DFF_en pe17_DFF_wg1(en,clk,reset_n,pe17_wg1,weight_pref17_wg1);
DFF_en pe17_DFF_wg2(en,clk,reset_n,pe17_wg2,weight_pref17_wg2);

DFF_en pe18_DFF_wg0(en,clk,reset_n,pe18_wg0,weight_pref18_wg0);
DFF_en pe18_DFF_wg1(en,clk,reset_n,pe18_wg1,weight_pref18_wg1);
DFF_en pe18_DFF_wg2(en,clk,reset_n,pe18_wg2,weight_pref18_wg2);

DFF_en pe21_DFF_wg0(en,clk,reset_n,pe21_wg0,weight_pref21_wg0);
DFF_en pe21_DFF_wg1(en,clk,reset_n,pe21_wg1,weight_pref21_wg1);
DFF_en pe21_DFF_wg2(en,clk,reset_n,pe21_wg2,weight_pref21_wg2);

DFF_en pe22_DFF_wg0(en,clk,reset_n,pe22_wg0,weight_pref22_wg0);
DFF_en pe22_DFF_wg1(en,clk,reset_n,pe22_wg1,weight_pref22_wg1);
DFF_en pe22_DFF_wg2(en,clk,reset_n,pe22_wg2,weight_pref22_wg2);

DFF_en pe23_DFF_wg0(en,clk,reset_n,pe23_wg0,weight_pref23_wg0);
DFF_en pe23_DFF_wg1(en,clk,reset_n,pe23_wg1,weight_pref23_wg1);
DFF_en pe23_DFF_wg2(en,clk,reset_n,pe23_wg2,weight_pref23_wg2);

DFF_en pe24_DFF_wg0(en,clk,reset_n,pe24_wg0,weight_pref24_wg0);
DFF_en pe24_DFF_wg1(en,clk,reset_n,pe24_wg1,weight_pref24_wg1);
DFF_en pe24_DFF_wg2(en,clk,reset_n,pe24_wg2,weight_pref24_wg2);

DFF_en pe25_DFF_wg0(en,clk,reset_n,pe25_wg0,weight_pref25_wg0);
DFF_en pe25_DFF_wg1(en,clk,reset_n,pe25_wg1,weight_pref25_wg1);
DFF_en pe25_DFF_wg2(en,clk,reset_n,pe25_wg2,weight_pref25_wg2);

DFF_en pe26_DFF_wg0(en,clk,reset_n,pe26_wg0,weight_pref26_wg0);
DFF_en pe26_DFF_wg1(en,clk,reset_n,pe26_wg1,weight_pref26_wg1);
DFF_en pe26_DFF_wg2(en,clk,reset_n,pe26_wg2,weight_pref26_wg2);

DFF_en pe27_DFF_wg0(en,clk,reset_n,pe27_wg0,weight_pref27_wg0);
DFF_en pe27_DFF_wg1(en,clk,reset_n,pe27_wg1,weight_pref27_wg1);
DFF_en pe27_DFF_wg2(en,clk,reset_n,pe27_wg2,weight_pref27_wg2);

DFF_en pe28_DFF_wg0(en,clk,reset_n,pe28_wg0,weight_pref28_wg0);
DFF_en pe28_DFF_wg1(en,clk,reset_n,pe28_wg1,weight_pref28_wg1);
DFF_en pe28_DFF_wg2(en,clk,reset_n,pe28_wg2,weight_pref28_wg2);

DFF_en pe31_DFF_wg0(en,clk,reset_n,pe31_wg0,weight_pref31_wg0);
DFF_en pe31_DFF_wg1(en,clk,reset_n,pe31_wg1,weight_pref31_wg1);
DFF_en pe31_DFF_wg2(en,clk,reset_n,pe31_wg2,weight_pref31_wg2);

DFF_en pe32_DFF_wg0(en,clk,reset_n,pe32_wg0,weight_pref32_wg0);
DFF_en pe32_DFF_wg1(en,clk,reset_n,pe32_wg1,weight_pref32_wg1);
DFF_en pe32_DFF_wg2(en,clk,reset_n,pe32_wg2,weight_pref32_wg2);

DFF_en pe33_DFF_wg0(en,clk,reset_n,pe33_wg0,weight_pref33_wg0);
DFF_en pe33_DFF_wg1(en,clk,reset_n,pe33_wg1,weight_pref33_wg1);
DFF_en pe33_DFF_wg2(en,clk,reset_n,pe33_wg2,weight_pref33_wg2);

DFF_en pe34_DFF_wg0(en,clk,reset_n,pe34_wg0,weight_pref34_wg0);
DFF_en pe34_DFF_wg1(en,clk,reset_n,pe34_wg1,weight_pref34_wg1);
DFF_en pe34_DFF_wg2(en,clk,reset_n,pe34_wg2,weight_pref34_wg2);

DFF_en pe35_DFF_wg0(en,clk,reset_n,pe35_wg0,weight_pref35_wg0);
DFF_en pe35_DFF_wg1(en,clk,reset_n,pe35_wg1,weight_pref35_wg1);
DFF_en pe35_DFF_wg2(en,clk,reset_n,pe35_wg2,weight_pref35_wg2);

DFF_en pe36_DFF_wg0(en,clk,reset_n,pe36_wg0,weight_pref36_wg0);
DFF_en pe36_DFF_wg1(en,clk,reset_n,pe36_wg1,weight_pref36_wg1);
DFF_en pe36_DFF_wg2(en,clk,reset_n,pe36_wg2,weight_pref36_wg2);

DFF_en pe37_DFF_wg0(en,clk,reset_n,pe37_wg0,weight_pref37_wg0);
DFF_en pe37_DFF_wg1(en,clk,reset_n,pe37_wg1,weight_pref37_wg1);
DFF_en pe37_DFF_wg2(en,clk,reset_n,pe37_wg2,weight_pref37_wg2);

DFF_en pe38_DFF_wg0(en,clk,reset_n,pe38_wg0,weight_pref38_wg0);
DFF_en pe38_DFF_wg1(en,clk,reset_n,pe38_wg1,weight_pref38_wg1);
DFF_en pe38_DFF_wg2(en,clk,reset_n,pe38_wg2,weight_pref38_wg2);

DFF_en pe41_DFF_wg0(en,clk,reset_n,pe41_wg0,weight_pref41_wg0);
DFF_en pe41_DFF_wg1(en,clk,reset_n,pe41_wg1,weight_pref41_wg1);
DFF_en pe41_DFF_wg2(en,clk,reset_n,pe41_wg2,weight_pref41_wg2);

DFF_en pe42_DFF_wg0(en,clk,reset_n,pe42_wg0,weight_pref42_wg0);
DFF_en pe42_DFF_wg1(en,clk,reset_n,pe42_wg1,weight_pref42_wg1);
DFF_en pe42_DFF_wg2(en,clk,reset_n,pe42_wg2,weight_pref42_wg2);

DFF_en pe43_DFF_wg0(en,clk,reset_n,pe43_wg0,weight_pref43_wg0);
DFF_en pe43_DFF_wg1(en,clk,reset_n,pe43_wg1,weight_pref43_wg1);
DFF_en pe43_DFF_wg2(en,clk,reset_n,pe43_wg2,weight_pref43_wg2);

DFF_en pe44_DFF_wg0(en,clk,reset_n,pe44_wg0,weight_pref44_wg0);
DFF_en pe44_DFF_wg1(en,clk,reset_n,pe44_wg1,weight_pref44_wg1);
DFF_en pe44_DFF_wg2(en,clk,reset_n,pe44_wg2,weight_pref44_wg2);

DFF_en pe45_DFF_wg0(en,clk,reset_n,pe45_wg0,weight_pref45_wg0);
DFF_en pe45_DFF_wg1(en,clk,reset_n,pe45_wg1,weight_pref45_wg1);
DFF_en pe45_DFF_wg2(en,clk,reset_n,pe45_wg2,weight_pref45_wg2);

DFF_en pe46_DFF_wg0(en,clk,reset_n,pe46_wg0,weight_pref46_wg0);
DFF_en pe46_DFF_wg1(en,clk,reset_n,pe46_wg1,weight_pref46_wg1);
DFF_en pe46_DFF_wg2(en,clk,reset_n,pe46_wg2,weight_pref46_wg2);

DFF_en pe47_DFF_wg0(en,clk,reset_n,pe47_wg0,weight_pref47_wg0);
DFF_en pe47_DFF_wg1(en,clk,reset_n,pe47_wg1,weight_pref47_wg1);
DFF_en pe47_DFF_wg2(en,clk,reset_n,pe47_wg2,weight_pref47_wg2);

DFF_en pe48_DFF_wg0(en,clk,reset_n,pe48_wg0,weight_pref48_wg0);
DFF_en pe48_DFF_wg1(en,clk,reset_n,pe48_wg1,weight_pref48_wg1);
DFF_en pe48_DFF_wg2(en,clk,reset_n,pe48_wg2,weight_pref48_wg2);





/*---------------------------------------------------------------------------------*/

endmodule