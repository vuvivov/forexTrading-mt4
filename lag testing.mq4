//+------------------------------------------------------------------+
//|                                                  lag testing.mq4 |
//|                        Copyright 2012, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2012, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int file;

int init()
  {
//----
   file=FileOpen("hfq",FILE_WRITE);
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

datetime t;
int start()
  {
//----

   for(int i=0;i<9;i++){
   t=TimeCurrent();
      openMin(0);
   
   FileWrite(file,TimeCurrent()-t," ",TimeHour(TimeCurrent()),TimeMinute(TimeCurrent()),TimeSeconds(TimeCurrent()));
   Print(TimeCurrent()-t);
   closeAll();
   }
//----
   return(0);
  }
//+------------------------------------------------------------------+