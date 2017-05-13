//+------------------------------------------------------------------+
//|                                                    s&r level.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
//----
   double level[800][2];

//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
extern int sl=50;
extern int tp=50;
double point=0.00001;
extern int p=24;
double tempH=0;
double tempL=0;
extern double lot=0.1;
double tempO=0;
extern int closeT=10;
int start()
  {
//----
for(int j=0;j<OrdersTotal();j++){
   OrderSelect(j,SELECT_BY_POS);
   if(OrderProfit()<-999&&OrderType()==1){//OrderProfit()>=0||TimeCurrent()-OrderOpenTime()>closeT){
      OrderClose(OrderTicket(),OrderLots(),Ask,9);
   }
}


if(TimeMinute(TimeCurrent())!=1){
   return (0);
}
for(int i=1;i<p+1;i++){
   
   tempH=High[iHighest(Symbol(),PERIOD_H1,MODE_HIGH,p,1)];
   tempL=Low[iLowest(Symbol(),PERIOD_H1,MODE_LOW,p,1)];
   
   if(iHigh(Symbol(),PERIOD_H1,i)==tempH){
      //OrderSend(Symbol(),0,lot,tempH+MarketInfo(Symbol(),MODE_SPREAD),9,tempH+MarketInfo(Symbol(),MODE_SPREAD)-MODE_STOPLEVEL*Point,tempH+MarketInfo(Symbol(),MODE_SPREAD)+MODE_STOPLEVEL*Point);
      //Print(tempO," ",tempH);
      if(tempO!=tempH){
         //OrderSend(Symbol(),3,lot,tempH,9,tempH-Point*20+Point*70,tempH+Point*20-Point*70);//tempH+MarketInfo(Symbol(),MODE_SPREAD)+MarketInfo(Symbol(),MODE_STOPLEVEL)*Point,tempH+MarketInfo(Symbol(),MODE_SPREAD)-MarketInfo(Symbol(),MODE_STOPLEVEL)*Point);
         //OrderSend(Symbol(),4,lot,tempH+MarketInfo(Symbol(),MODE_SPREAD)*Point,9,tempH+MarketInfo(Symbol(),MODE_SPREAD)*Point-Point*700,tempH+MarketInfo(Symbol(),MODE_SPREAD)*Point+Point*333);
         OrderSend(Symbol(),3,lot,tempH,9,0,tempH-point*tp);
         tempO=tempH;
      }
   }
   
   
   /*
   if(Low[i]==tempL){
      //OrderSend(Symbol(),0,lot,tempL+MarketInfo(Symbol(),MODE_SPREAD),0,tempL+MarketInfo(Symbol(),MODE_SPREAD)-MODE_STOPLEVEL*Point,tempL+MarketInfo(Symbol(),MODE_SPREAD)+MODE_STOPLEVEL*Point);
      OrderSend(Symbol(),1,lot,tempL,9,0,0);//tempL+MODE_STOPLEVEL*Point,tempL+MarketInfo(Symbol(),MODE_SPREAD)-MODE_STOPLEVEL*Point);
   }
   */
}

   
//----
   return(0);
  }
//+------------------------------------------------------------------+