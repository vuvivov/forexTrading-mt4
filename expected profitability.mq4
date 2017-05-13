//+------------------------------------------------------------------+
//|                                       expected profitability.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
double change=0.01;

int start()
  {
//----
   double stopLoss;
   double point;
   double stopLossPoint;


   stopLoss=MarketInfo(Symbol(),MODE_STOPLEVEL);
   point=MarketInfo(Symbol(),MODE_POINT);
   stopLossPoint=stopLoss*point;



   double p=(Bid+Ask)/2;
   double jump=change*p;
   
   if(jump>=stopLossPoint){
         
         Print(100*10*(jump-MarketInfo(Symbol(),MODE_STOPLEVEL)*Point-MarketInfo(Symbol(),MODE_SPREAD)*Point)/p,"%");
      
   }   
   
   else{Print("not big enough jump ");}
   
//----
   return(0);
  }
//+------------------------------------------------------------------+