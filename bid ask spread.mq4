//+------------------------------------------------------------------+
//|                                               bid ask spread.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int file;

int init()
  {
//----


   file=FileOpen(StringConcatenate("spread",Symbol(),".csv"),FILE_WRITE|FILE_CSV,',');
   
   if(file==-1){
      printError();
   }
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   FileClose(file);
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
  {
//----
   FileWrite(file,TimeHour(TimeCurrent())*3600+TimeMinute(TimeCurrent())*60+TimeSeconds(TimeCurrent()),Ask-Bid);
//----
   return(0);
  }
//+------------------------------------------------------------------+