//+------------------------------------------------------------------+
//|                                             spot future tick.mq4 |
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
   string fileName=StringConcatenate("tick",Symbol());
   file=FileOpen(fileName,FILE_BIN|FILE_WRITE);
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
   FileWriteInteger(file,TimeCurrent());
   FileWriteDouble(file,Bid);
//----
   return(0);
  }
//+------------------------------------------------------------------+