//+------------------------------------------------------------------+
//|                                            get tick data csv.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
string filename;
int file;

int init()
  {
//----
      filename=StringConcatenate("tick data ",Symbol(),".csv");
   file=FileOpen(filename,FILE_WRITE|FILE_CSV,',');
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
   FileWrite(file,stringTime(TimeCurrent()),Bid);
   //FileWriteInteger(file,TimeCurrent());
   //FileWriteDouble(file,Bid);
//----
   return(0);
  }
//+------------------------------------------------------------------+