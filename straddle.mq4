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
datetime start;
datetime t2=D'2000.01.01 00:01:00';
datetime t1=D'2000.01.01 00:00:00';
datetime gap;


int init()
  {
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
   Print(Volume[0]);
//----

   //openStraddle(10);
   
   //openStopStraddle(10,MarketInfo(Symbol(),MODE_STOPLEVEL));
   //open(0,10);
   //open(1,10);
   
   //modifyAllPending(MarketInfo(Symbol(),MODE_STOPLEVEL));
   //modifyAllOpen(MarketInfo(Symbol(),MODE_STOPLEVEL));
   
   //closeDeleteAll();




 // for (int i=0;i<4;i++){
   //closeAll();
   
   //Print(MarketInfo(Symbol(),MODE_STOPLEVEL),"*",Point);
   
   
   
 /*
 while(1==1){
  Print(Ask*10000,"  ",MarketInfo(Symbol(),MODE_ASK)*10000,"   ",Ask*10000-MarketInfo(Symbol(),MODE_ASK)*10000);
 } 
  */
   
  //}   
   //openMax(1);
   
   //Print("b");
   
   //datetime time=TimeLocal();

   
   
   /*
   if(laterHMS(22,55,0,time)==true){
      Print(TimeSeconds(time));
   }
   */
   
   
   //Print(TimeSeconds(time));
   
   /*
   Print("MARGINCALCMODE",MarketInfo(Symbol(),MODE_MARGINCALCMODE)); 
   Print("MODE_MARGININIT",MarketInfo(Symbol(),MODE_MARGININIT));
   Print("MODE_MARGINREQUIRED",MarketInfo(Symbol(),MODE_MARGINREQUIRED)); 
   Print("MODE_MINLOT",MarketInfo(Symbol(),MODE_MINLOT));
   Print("MODE_LOTSTEP",MarketInfo(Symbol(),MODE_LOTSTEP));
   */
//----
   return(0);
  }
//+------------------------------------------------------------------+