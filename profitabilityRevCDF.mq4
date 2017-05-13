//+------------------------------------------------------------------+
//|                                          profitabilityRevCDF.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start()
  {
//----
   
      double stopLoss;
   double point;
   double stopLossPoint;


   stopLoss=MarketInfo(Symbol(),MODE_STOPLEVEL);
   point=MarketInfo(Symbol(),MODE_POINT);
   stopLossPoint=stopLoss*point;

   double jump=0;
   
   double p=(Bid+Ask)/2;
   
   double step=0.0001;

   double ceiling=0.1;
   
   double profitability=0;
   
   double change=0;
   
   int file=FileOpen(StringConcatenate("profitabilityRevCDF ",Symbol(),".csv"),FILE_WRITE|FILE_CSV,',');
   
   
   for(int i =0;i<300;i++){
      change=MathAbs((Open[i]-Close[i+1])/Close[i+1]);
      jump=change*p;
      
      if(jump>=stopLossPoint){
         profitability=10*(jump-MarketInfo(Symbol(),MODE_STOPLEVEL)*Point-MarketInfo(Symbol(),MODE_SPREAD)*Point)/p;
      }
      
      else{profitability=0;}
      
      FileWrite(file,profitability);
      //FileWrite(file,change,profitability);
      
   }
   
//----
   return(0);
  }
//+------------------------------------------------------------------+