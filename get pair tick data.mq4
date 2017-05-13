//+------------------------------------------------------------------+
//|                                           get pair tick data.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

string filename;
int file;
int fileopen;

datetime t[];
double p[];
int count=0;//eventually arraysize=count

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
//----
   Print("aa");

   string openfilename="tick data #ECH3";
   fileopen=FileOpen(openfilename,FILE_BIN);
   
   
   while(FileIsEnding(fileopen)==false){
      ArrayResize(t,count+1);
      ArrayResize(p,count+1);
      
      t[count]=FileReadInteger(fileopen);
      p[count]=FileReadDouble(fileopen);
      
      count++;
      Print(count);
   }
   
   
   
   
   filename=StringConcatenate("pair ",Symbol(),openfilename," .csv");
   file=FileOpen(filename,FILE_WRITE,',');
   
   
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
datetime tt;
double pp;

int start()
  {
//----
   tt=TimeCurrent();
   pp=Bid;
   
   //need a b-search
   for (int i=0;i<count-1;i++){
      if(t[i]<=tt<t[i+1]){
         FileWrite(file,stringTime(tt),pp,p[i]);
      }
   } 
   
//----
   return(0);
  }
//+------------------------------------------------------------------+