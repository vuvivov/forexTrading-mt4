//+------------------------------------------------------------------+
//|                                                    HuiDang -.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

#property indicator_separate_window
#property indicator_buffers 1
#property indicator_color1 Red
//--- buffers
double ExtMapBuffer1[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
  {
//---- indicators
   SetIndexStyle(0,DRAW_LINE);
   SetIndexBuffer(0,ExtMapBuffer1);
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int start()
  {
   int    counted_bars=IndicatorCounted();
//----
   int a[5]={3,7,10,12,15};
   int b[6]={30,35,40,45,50,60};
   
   for(int i=0; i<Bars;i++){
   int A=0;
   int B=0;
      for(int j=0;j<5;j++){
         A+=iMA(Symbol(),0,a[j],0,1,Close,i);
      }
      A/=5;
      for(int k=0;k<6;k++){
         B+=iMA(Symbol(),0,b[k],0,1,Close,i);
      }
      B/=6;
      
      
      ExtMapBuffer1[i]=MathAbs(A-B);
   }
//----
   return(0);
  }
//+------------------------------------------------------------------+--------------------+