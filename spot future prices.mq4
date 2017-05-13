//+------------------------------------------------------------------+
//|                                           spot future prices.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start()
  {
//----
   string spot="#JPM";
   string future="#C";
   int period=PERIOD_M5;
   double scale=1;
   
   int bars=MathMin(iBars(spot,period),iBars(future,period));
   
   string filename=StringConcatenate("spot future prices ",spot,future," .csv");
   
   int file=FileOpen(filename,FILE_WRITE,',');
   /*
   for (int i=0;i<bars;i++){
   
      double spotP=iClose(spot,period,i);
      double futureP=iClose(future,period,i);
      datetime t=iTime(spot,period,i);
      string T=StringConcatenate(TimeYear(t),".",TimeMonth(t),".",TimeDay(t),"  ",TimeHour(t),":",TimeMinute(t),":",TimeSeconds(t));
      
    
      
      
         FileWrite(file,i,T,spotP-futureP);
   }
   */
   
   int s=0;
   int f=0;
   datetime ts;
   datetime tf;
   int sign;
   
   double spotP;
   double futureP;

   
   
   while(s<bars&&f<bars){
      

      
      ts=iTime(spot,period,s);
      tf=iTime(future,period,f);
      if(ts==tf){
         
         sign=0;
      }
      
      if(ts<tf){
         sign=1;
      }
      
      if(ts>tf){
         sign=2;
      }

      
      switch(sign){
         case 0:
            spotP=iClose(spot,period,s);
            futureP=iClose(future,period,f)*scale;
            FileWrite(file,s,stringTime(ts),spotP-futureP);
 
            s++;
            f++;
         case 1:
            f++;
         case 2:
            s++;
         
      }

      
   }
//----
   return(0);
  }
//+------------------------------------------------------------------+