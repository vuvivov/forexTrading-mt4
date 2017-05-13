//+------------------------------------------------------------------+
//|                                                  calculation.mq4 |
//|                        Copyright 2012, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2012, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2005

//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);

// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import

//+------------------------------------------------------------------+
//| EX4 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex4"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+




double maxLot(double proportion=1){
   double scale=100;
   double step=MarketInfo(Symbol(),MODE_LOTSTEP);
   
   double scaledStep=step*scale;
   int intScaledStep=scaledStep;
   
   double lot=proportion*AccountFreeMargin()/MarketInfo(Symbol(),MODE_MARGINREQUIRED);
   
   double scaledLot=lot*scale;
   int intScaledLot=scaledLot;
   
   intScaledLot-= intScaledLot%intScaledStep;
   
   double doubleScaledLot=intScaledLot;
   
   double maxLot=doubleScaledLot/scale;
   
   
   return (maxLot);

}



//not finished!!!!
double maxLotHedge(){
   int scale=100;
   
   double step=MarketInfo(Symbol(),MODE_LOTSTEP);
   int scaledStep=step*scale;
   
   double lot=0.5*(AccountFreeMargin()/MarketInfo(Symbol(),MODE_MARGINREQUIRED));
   int scaledLot=lot*scale;
   
   scaledLot-= scaledLot%scaledStep;
   
   double maxLot=scaledLot/scale;
   
   return (maxLot);
   

}




int getDecimal(double a){
   //assume min lot = 0.01
   if(a>=1){
      return (0);
   }
   
   if(0.1<=a<1){
      return (1);
   }
   
   if(0.01<=a<0.1){
      return (2);
   }

   
}