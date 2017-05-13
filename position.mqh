//+------------------------------------------------------------------+
//|                                                     position.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

bool openPosition(){
     
     
     int n=OrdersTotal();
     
     if(n==0){
      return (false);
     }


      for(int i=0;i<n;i++)
     {
      
      OrderSelect(i,SELECT_BY_POS);  
      if(OrderSymbol()==Symbol()&&OrderType()<=1){
         return (true);
         break;
      }
     }
      return (false);

}




bool openPending(){
     
     
     int n=OrdersTotal();
     
     if(n==0){
      return (false);
     }


      for(int i=0;i<n;i++)
     {
      
      OrderSelect(i,SELECT_BY_POS);  
      if(OrderSymbol()==Symbol()&&OrderType()>1){
         return (true);
         break;
      }
     }
      return (false);
      
      
}