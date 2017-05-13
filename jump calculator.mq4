//+------------------------------------------------------------------+
//|                                              jump calculator.mq4 |
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

   double cum=0;
   for(int i=0;i<Bars-1;i++){
      cum+=MathAbs((Open[i]-Close[i+1])/Close[i+1]);
   }
   cum/=(Bars-1);
   int file=FileOpen("jump.csv",FILE_CSV|FILE_WRITE|FILE_READ,',');
   Print(FileSeek(file,0,SEEK_END));
   FileWrite(file,Symbol(),cum);
   FileClose(file);
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
   
//----
   return(0);
  }
//+------------------------------------------------------------------+