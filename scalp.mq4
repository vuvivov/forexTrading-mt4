//+------------------------------------------------------------------+
//|                                                        scalp.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

extern int o=12;
extern int c=25;
extern int tp0000=5;
extern int sl0000=100;

bool opened=0;
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
int start()
  {
//----
   double tp=tp0000;
   tp=tp/10000;
   double sl=sl0000;
   sl=sl/10000;
   
   if(opened==0){
      if(TimeHour(TimeCurrent())==o){
         OrderSend(Symbol(),0,0.1,Ask,0,Bid-sl,Bid+tp);
         //OrderSend(Symbol(),1,0.1,Bid,0,Ask+sl,Ask-tp);
         //opened=1;
      }
   
   }

   /*
   if(TimeHour(TimeCurrent())==c){
      cleanAll();
      opened=0;
   }
   */
//----
   return(0);
  }
//+------------------------------------------------------------------+