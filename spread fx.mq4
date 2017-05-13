//+------------------------------------------------------------------+
//|                                                    spread fx.mq4 |
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
      Print(MarketInfo(Symbol(),MODE_SPREAD)*Point*10000);
//----
   return(0);
  }
//+------------------------------------------------------------------+