//+------------------------------------------------------------------+
//|                                              z news straddle.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>
//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+

extern double multi=2;

double loss=0.0357;
double leverage=100;
int lotDigi=2;

int second=55;

double size;


int start()
  {
//----
double array[20];

for(int i=0;i<ArraySize(array);i++){
   array[i]=iClose(Symbol(),PERIOD_M5,i+1);
}


size=NormalizeDouble(AccountEquity()*loss/((MarketInfo(Symbol(),MODE_STOPLEVEL)+MarketInfo(Symbol(),MODE_SPREAD))*Point*leverage),lotDigi);

while(TimeSeconds(TimeLocal())<second){Sleep(1);}

oneCancelAnother(size,NormalizeDouble(MarketInfo(Symbol(),MODE_STOPLEVEL)*multi,Digits));   

//----
   
//----
   return(0);
  }
//+------------------------------------------------------------------+