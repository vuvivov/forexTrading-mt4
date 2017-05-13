//+------------------------------------------------------------------+
//|                                              first tick time.mq4 |
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
int d;
int count=0;
int start()
  {
//----


if(count==1){
   
   Print(stringTime(TimeCurrent()));
   count=0;
}


if(d!=TimeDay(TimeCurrent())){
   d=TimeDay(TimeCurrent());
   count=1;
   //Print(stringTime(TimeCurrent()));
}   
//----
   return(0);
  }
//+------------------------------------------------------------------+