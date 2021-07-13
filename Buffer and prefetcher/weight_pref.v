module weight_pref(

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

parameter N = 8;

/*---------------------------------------------------------------------------------*/
input en,clk,reset_n,buf_select;

input [2*N-1;0]
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
,weight_pref48_wg0,weight_pref48_wg1,weight_pref48_wg2



/*---------------------------------------------------------------------------------*/
//go to SA
output reg [N-1:0]





/*---------------------------------------------------------------------------------*/
//wire



//



//





/*---------------------------------------------------------------------------------*/








/*---------------------------------------------------------------------------------*/







/*---------------------------------------------------------------------------------*/











endmodule