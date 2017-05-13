//+------------------------------------------------------------------+
//|                                                 bol mean rev.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+

extern int ma=111;
extern int sd=250;
double sdD;
extern double lot=20;
extern int slp=0;
extern int sl=100;
double slD;
extern int tp=100;
double tpD;
int init()
  {
//----
   sdD=sd/100;
   slD=sl/100;
   tpD=tp/100;
   
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
if(Close[1]-iMA(Symbol(),NULL,ma,0,0,6,1)>sdD*iStdDev(Symbol(),NULL,ma,0,0,6,1)){
      //open sell
      OrderSend(Symbol(),0,lot,Ask,slp,Bid-0.5*slD*iStdDev(Symbol(),NULL,ma,0,0,6,1),Bid+0.5*tpD*iStdDev(Symbol(),NULL,ma,0,0,6,1));
   }
   
   if(Close[1]-iMA(Symbol(),NULL,ma,0,0,6,1)<-sdD*iStdDev(Symbol(),NULL,ma,0,0,6,1)){
      //open buy
      
      OrderSend(Symbol(),1,lot,Bid,slp,Ask+0.5*slD*iStdDev(Symbol(),NULL,ma,0,0,6,1),Ask-0.5*tpD*iStdDev(Symbol(),NULL,ma,0,0,6,1));
   }


/*
if(OrdersTotal()==0){
   
}


else{
   //modify order
}
*/
   
//----
   return(0);
  }
//+------------------------------------------------------------------+