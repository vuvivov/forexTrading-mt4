//+------------------------------------------------------------------+
//|                                             check connection.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>
//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start()
  {
//----
   while(1==1){
      if(MathAbs(TimeCurrent()-TimeLocal())>1000){
         if(0<TimeDayOfWeek(TimeLocal())<7){
            SendNotification("disconnection");
            Print("disconnection");
         }
      }
      Sleep(100000);
   }
//----
   return(0);
  }
//+------------------------------------------------------------------+