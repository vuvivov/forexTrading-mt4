//+------------------------------------------------------------------+
//|                                         stop order high freq.mq4 |
//|                        Copyright 2012, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2012, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

extern int stopLoss=10;
//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
//----
   
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
int start()
  {
//----
   if(TimeHour(TimeCurrent())!=TimeHour(TimeLocal())){return(0);}
   

   if(betweenHMS(22,55,0,22,59,59,TimeLocal())==true){
      
   }
//----
   return(0);
  }
//+------------------------------------------------------------------+