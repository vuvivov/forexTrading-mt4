//+------------------------------------------------------------------+
//|                                                        basic.mq4 |
//|                        Copyright 2012, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2012, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <stdlib.mqh>
#include <time.mqh>
#include <open.mqh>
#include <calculation.mqh>
#include <modify.mqh>
#include <close.mqh>
#include <array.mqh>
#include <p&l.mqh>
#include <position.mqh>


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

void printError(){
   Print(ErrorDescription(GetLastError()));
}

void terminate(){
   if(MarketInfo(Symbol(),MODE_TRADEALLOWED)==false){
      Print("market closed");
      return (0);
   }
}

void scale(int A, double& a,double scale,bool print=false){
      a=A;
   a=a/scale;
   if(print==true){
      Print(a);
   }  
}
     
   


