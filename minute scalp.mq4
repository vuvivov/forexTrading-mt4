//+------------------------------------------------------------------+
//|                                                 minute scalp.mq4 |
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
if(TimeMinute(TimeCurrent())==1){
   OrderSend(Symbol(),0,0.1,Ask,9,0,Bid+Point*MarketInfo(Symbol(),MODE_STOPLEVEL));
   OrderSend(Symbol(),1,0.1,Bid,9,0,Ask-Point*MarketInfo(Symbol(),MODE_STOPLEVEL));
   }
//----
   return(0);
  }
//+------------------------------------------------------------------+