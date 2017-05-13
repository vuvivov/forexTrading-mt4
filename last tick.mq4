//+------------------------------------------------------------------+
//|                                                    last tick.mq4 |
//|                        Copyright 2012, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2012, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
datetime t1;
datetime t2;
int file;
int init()
  {
//----
   t1=TimeCurrent();
   t2=TimeCurrent();
   file=FileOpen("last tick.csv",FILE_WRITE);
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

int t;
int start()
  {
//----
   t2=TimeCurrent();
   
   if(TimeDay(t2)!=TimeDay(t1)){
      t=60-TimeSeconds(t1)+60*(59-TimeMinute(t1));
      if(t<300){
         FileWrite(file,t,"  ",TimeYear(t1),TimeMonth(t1),TimeDay(t1),TimeHour(t1),TimeMinute(t1),TimeSeconds(t1));
      }
   }
   
   
   t1=TimeCurrent();
//----
   return(0);
  }
//+------------------------------------------------------------------+