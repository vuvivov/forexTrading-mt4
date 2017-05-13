//+------------------------------------------------------------------+
//|                                              bollinger break.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

extern int period=20;


extern int RATIO100=10;
   double ratio;

extern int SL100=50;
   double sl;

extern int TP100=160;
   double tp;

//extern int SCALE100=220;
  // double scale;

extern int longMARatio100=1000;
   double longMADouble;
   double longMA;

   double MA;
   int order;
   
extern int ELIMINATE1_10=40;
   double eliminate1;
   
extern int ELIMINATE2_10=40;
   double eliminate2;

extern double lot=0.1;


//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
//----
//scale(SCALE100, scale,100,true);
scale(RATIO100,ratio,100,true);
scale(TP100,tp,100,true);
scale(SL100,sl,100,true);
scale(ELIMINATE1_10,eliminate1,10,true);
scale(ELIMINATE2_10,eliminate2,10,true);
scale(longMARatio100,longMA,100,true);
longMA=period*longMA;
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
  {
//----
/*
   int i=0;
   double profit[0];
   while(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY)!=false){
      ArrayResize(profit,i+1);
      profit[i]=OrderProfit()+OrderSwap()+OrderCommission();
      i++;
   }
   
   

   int file=FileOpen(StringConcatenate("mean-variance",Symbol(),Period(),".csv"),FILE_CSV|FILE_READ|FILE_WRITE,',');
   while(FileIsEnding(file)==false){
      FileReadNumber(file);
   }
   
   
   FileWrite(file,period,ratio,ArraySize(profit),arrayAverage(profit),arrayStdDev(profit)/MathSqrt(ArraySize(profit)),arrayAverage(profit)/(arrayStdDev(profit))/MathSqrt(ArraySize(profit)));
   FileClose(file);*/
//----
   return(0);
  }
  
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
  {
//----
if(TimeDayOfWeek(Time[0])<TimeDayOfWeek(Time[period])){return (0);}


//open
//if(OrderSelect(order,SELECT_BY_TICKET)==false){
  if(OrderSelect(0,SELECT_BY_POS)==false){
   
      MA=iMA(NULL,0,period,0,MODE_SMA,PRICE_CLOSE,2);
      double BREAK=Close[1]-MA;
      double sd=iStdDev(NULL,0,period,0,MODE_SMA,PRICE_CLOSE,2); 

      
   if((BREAK-MarketInfo(Symbol(),MODE_SPREAD)*Point)/sd>ratio){

//eliminate 
      if((Open[1]-Low[1])>eliminate1*sd||(High[1]-Close[1])/(Close[1]-Open[1])>eliminate2){return (0);}
      
      order=OrderSend(Symbol(),1,lot,Bid,0,NormalizeDouble(MA+tp*(Close[1]-MA),Digits),NormalizeDouble(MathMax(MA+(Close[1]-MA)*sl,iMA(NULL,0,longMA,0,MODE_SMA,PRICE_CLOSE,0)),Digits),"bolling algo");      
   }   
   
   if((BREAK+MarketInfo(Symbol(),MODE_SPREAD)*Point)/sd<-ratio){

//eliminate 
      if((-Open[1]+High[1])>eliminate1*sd||(-Low[1]+Close[1])/(-Close[1]+Open[1])>eliminate2){return (0);}
      
      order=OrderSend(Symbol(),0,lot,Bid,1,NormalizeDouble(MA-tp*(-Close[1]+MA),Digits),NormalizeDouble(MathMin(MA-(MA-Close[1])*sl,iMA(NULL,0,longMA,0,MODE_SMA,PRICE_CLOSE,0)),Digits),"bolling algo");
   }
}

//modify
  

else{

   //Print(order,"  ",OrderTicket(),"jk;l");
   if(OrderType()==1){
      OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss( ) ,NormalizeDouble(MathMax(MA+(Close[1]-MA)*sl,iMA(NULL,0,longMA,0,MODE_SMA,PRICE_CLOSE,0)),Digits),0);
   }
   if(OrderType()==0){
      OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss( ) ,NormalizeDouble(MathMin(MA-(MA-Close[1])*sl,iMA(NULL,0,longMA,0,MODE_SMA,PRICE_CLOSE,0)),Digits),0);
   }
}
//----
   return(0);
  }
//+------------------------------------------------------------------+