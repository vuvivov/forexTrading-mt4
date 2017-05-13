//+------------------------------------------------------------------+
//|                                                      return%.mq4 |
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

double temp=0;
double cum=0;
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
   //cum=cum/(Bars-1);
   Print(Symbol());//," ",cum);
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
   for(int i=0; i<Bars;i++){
      temp=MathAbs((Open[i]-Close[i+1])/Close[i+1])*100;
      ExtMapBuffer1[i]=temp;
      cum+=temp;
   }
   
//----
   return(0);
  }
//+------------------------------------------------------------------+