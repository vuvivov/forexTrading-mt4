//+------------------------------------------------------------------+
//|                                      stop order single stock.mq4 |
//|                        Copyright 2012, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2012, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

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
int H=21;
int M=13;
int S=55;

int start()
  {
      if(openPending()==false&&openPosition()==false){
         Print("loop started");
         while(earlierHMS(H,M,S,TimeLocal())==true){Sleep(1);}
         openStopStraddle(maxLot(0.99),MarketInfo(Symbol(),MODE_STOPLEVEL),MarketInfo(Symbol(),MODE_STOPLEVEL));
      }
  
  
      else{
         if(earlierHMS(H,M,S,TimeLocal())==true){
            while(closeDeleteAll()==false){};
         }
         
         else{
            while(modifyAllPending(MarketInfo(Symbol(),MODE_STOPLEVEL),MarketInfo(Symbol(),MODE_STOPLEVEL))==false){};
            while(modifyAllOpen(MarketInfo(Symbol(),MODE_STOPLEVEL))==false){};
         }//the while loop here may keep working when market is closed, so need to check everyday after the market is closed to terminate it if need to.
      }
 
  
  //below is an earlier version which needs an input for date
  /*
//----

if(d==TimeDay(TimeLocal())){
   
  if(openPending()==false&&openPosition()==false){ 
   while(earlierHMS(22,59,55,TimeLocal())==true){}
      
   openStopStraddle(MarketInfo(Symbol(),MODE_MINLOT),MarketInfo(Symbol(),MODE_STOPLEVEL),MarketInfo(Symbol(),MODE_STOPLEVEL));
  }
  
  if(openPending()==true){
   modifyAllPending(MarketInfo(Symbol(),MODE_STOPLEVEL),MarketInfo(Symbol(),MODE_STOPLEVEL));
  }
  
  if(openPosition()==true){
   modifyAllOpen(MarketInfo(Symbol(),MODE_STOPLEVEL));
  }
     
}


else{
   closeDeleteAll();
}
*/
//----
   return(0);
  }
//+------------------------------------------------------------------+