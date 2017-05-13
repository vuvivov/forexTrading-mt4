//+------------------------------------------------------------------+
//|                                                            a.mq4 |
//|                        Copyright 2012, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2012, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int t=50;
int file;

int init()
  {
//----
   //Print(MarketInfo(Symbol(),MODE_SWAPLONG),"    ",MarketInfo(Symbol(),MODE_SWAPSHORT));
   file=FileOpen("hfq",FILE_WRITE);
   Print(file);
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   //FileClose(file);
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+


int start()
  {
//----

   if(TimeSeconds(TimeCurrent())>t){return (0);}
   
   while(TimeSeconds(TimeCurrent())<t){}
  //Print(TimeSeconds(TimeCurrent()));
   openMin(0);
   FileWrite(file,TimeSeconds(TimeCurrent()));
   closeAll();
   
//----
   return(0);
  }
//+------------------------------------------------------------------+