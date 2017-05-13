//+------------------------------------------------------------------+
//|                                spot future arb profitability.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>
//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start()
  {
//----
   string spot="EURUSD";
   string future="#ECH3";
   string period="PERIOD_H1";
   
   double trans=MarketInfo(spot,MODE_SPREAD)*MarketInfo(spot,MODE_POINT)+MarketInfo(future,MODE_SPREAD)*MarketInfo(future,MODE_POINT);
   double profit;
   
   int bars=MathMin(iBars(spot,period),iBars(future,period));
   
   
   for (int i=0;i<300;i++){
   
      profit=MathAbs(iClose(spot,period,i)-iClose(future,period,i))-trans;
      
      double spotP=iClose(spot,period,i);
      double futureP=iClose(future,period,i);
      double profitability=100*profit/iClose(spot,period,i);
      
      if(1==1){
         Print(stringTime(TimeCurrent()));
         Print(i,"   ",spotP,"    ",futureP,"   ",profitability,"%");
      }
      
      
   }
   
//----
   return(0);
  }
//+------------------------------------------------------------------+