//+------------------------------------------------------------------+
//|                                                get tick data.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>


string filename;
int file;
//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
//----
   filename=StringConcatenate("tick data ",Symbol());
   file=FileOpen(filename,FILE_WRITE|FILE_BIN);
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
   //FileWrite(file,TimeCurrent(),Bid);
   FileWriteInteger(file,TimeCurrent());
   FileWriteDouble(file,Bid);
//----
   return(0);
  }
//+------------------------------------------------------------------+