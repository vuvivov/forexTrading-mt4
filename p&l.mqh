//+------------------------------------------------------------------+
//|                                                          p&l.mq4 |
//|                        Copyright 2012, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2012, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

double transaction(bool type,double commision,bool overnight){
      if(overnight==false){
      
      return (MarketInfo(Symbol(),MODE_SPREAD)*Point+commision);
   }
   
   
   if(type==0){
      return (MarketInfo(Symbol(),MODE_SPREAD)*Point+commision-MarketInfo(Symbol(),MODE_SWAPLONG));
   }
   
   return (MarketInfo(Symbol(),MODE_SPREAD)*Point+commision-MarketInfo(Symbol(),MODE_SWAPSHORT));
   
}





