//+------------------------------------------------------------------+
//|                                              spot future dif.mq4 |
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
   Print("AA");
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
   string spot="EURUSD";
   string future="#ECH3";

int start()
  {
//----
   

   
   
   Print(10000*(MarketInfo(spot,MODE_BID)-MarketInfo(future,MODE_BID)));
   
//----
   return(0);
  }
//+------------------------------------------------------------------+