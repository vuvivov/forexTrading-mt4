//+------------------------------------------------------------------+
//|                                        div arb profitability.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
extern int m,d;
extern string sym;

int start()
  {
//----
   int count=0;
   while(TimeMonth(iTime(sym,PERIOD_D1,count))!=m&&TimeDay(iTime(sym,PERIOD_D1,count))!=d){
      count++;
   }
   
   double open=iOpen(sym,PERIOD_D1,count);
   double close=iClose(sym,PERIOD_D1,count+1);
   
   double cost=MarketInfo(sym,MODE_SPREAD)*MarketInfo(sym,MODE_POINT)+close/1000;
   double profit=MathMax(close-open,0);
   double lost=0;
   if(open-close>0){
      lost=MathMin(MarketInfo(sym,MODE_STOPLEVEL),open-close);
   }
   double capital=close/10;
   double r=(profit-cost-lost)/capital;
   double change=(open-close)/close;
   
   Print(m,",",d,"   r: ",r*100,"%  div: ",change*400,"%");
   
//----
   return(0);
  }
//+------------------------------------------------------------------+