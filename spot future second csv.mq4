//+------------------------------------------------------------------+
//|                                           spot future second.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
datetime t1,t2,T1,T2,tt;
double p1,p2,P1,P2;
   
void read(datetime &a, datetime &b, double &c, double &d,int handle){
   a=b;
   b=FileReadInteger(handle);
   c=d;
   d=FileReadDouble(handle);
   
   if(a==b){read(a,b,c,d,handle);}
}



int start()
  {
//----
   datetime end=D'13.01.2013';
   string a="tickGBPUSD";
   string b="tick#BPH3";

   int sf=FileOpen(a,FILE_BIN|FILE_READ);
   int ff=FileOpen(b,FILE_BIN|FILE_READ);
   string fileName=StringConcatenate(a,b," second.csv");
   int file=FileOpen(fileName,FILE_WRITE|FILE_CSV,',');
   //int file=FileOpen(fileName,FILE_WRITE|FILE_BIN);
   
   t1=FileReadInteger(sf); 
   p1=FileReadDouble(sf);
   T1=FileReadInteger(ff);
   P1=FileReadDouble(ff);   
   
   t2=FileReadInteger(sf); 
   p2=FileReadDouble(sf);
   T2=FileReadInteger(ff);
   P2=FileReadDouble(ff);
   
   tt=MathMin(t2,T2);
   
   while(FileIsEnding(sf)==false&&FileIsEnding(ff)==false){//&&tt<end){
      if(tt==t2){
         //FileWriteDouble(file,p2-P2);
         FileWrite(file,stringTime(tt),p2,P2,p2-P2);
         read(t1,t2,p1,p2,sf);
         //Print("aaaaa");
      }
      
      if(tt==T2){
         //FileWrite(file,stringTime(tt),p2,P2,p2-P2);
         read(T1,T2,P1,P2,ff);
         //Print("bbbbbbbb");
      }
      
      tt++;
      //Print(stringTime(tt));
   }
   
   
//----
   return(0);
  }
//+------------------------------------------------------------------+