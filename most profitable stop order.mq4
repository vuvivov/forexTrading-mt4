//+------------------------------------------------------------------+
//|                                   most profitable stop order.mq4 |
//|                        Copyright 2012, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2012, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+

datetime t1=D'2000.01.01 00:15:00';
datetime t2=D'2000.01.01 00:00:00';
datetime timeGap;

datetime T1;
datetime T2;

int init()
  {
//----
   timeGap=t2-t1;
   
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

   Print("timegap",timeGap);
   T2=TimeCurrent();
   T2+=timeGap;

   
   Print(TimeMinute(T2));
//----
   return(0);
  }
//+------------------------------------------------------------------+