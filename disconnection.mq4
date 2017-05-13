//+------------------------------------------------------------------+
//|                                                disconnection.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
extern int t=600;

int init()
  {
//----
      if(MathAbs(TimeCurrent()-TimeLocal())>t){
         if(0<TimeDayOfWeek(TimeLocal())<6){
            SendNotification("disconnection");
            Print("disconnection");
         }
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
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
  {
//----


         while(1==1){
      if(MathAbs(TimeCurrent()-TimeLocal())>t){
         if(0<TimeDayOfWeek(TimeLocal())<6){
            SendNotification("disconnection");
            Print("disconnection");
         }
      }
      Sleep(1000*t);
   }
//----
   return(0);
  }
//+------------------------------------------------------------------+