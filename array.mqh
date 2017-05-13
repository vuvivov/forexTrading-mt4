//+------------------------------------------------------------------+
//|                                                        array.mq4 |
//|                        Copyright 2012, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2012, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

double arraySum(double array[]){
   int len=ArraySize(array);
   double sum=0;
   for (int i=0;i<len;i++){
      sum+=array[i];
   }
   
   return (sum);
}

double arrayAverage(double array[]){
   return (arraySum(array)/ArraySize(array));
}

double arrayStdDev(double array[]){
   int len=ArraySize(array);
   double av=arrayAverage(array);
   double temp=0;
   
   for (int i=0;i<len;i++){
      temp+=MathPow(array[i]-av,2);
   }
   
   return (MathSqrt(temp/(len-1)));
}