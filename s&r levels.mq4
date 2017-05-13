//+------------------------------------------------------------------+
//|                                                   s&r levels.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

#property indicator_chart_window
#property indicator_buffers 2
#property indicator_color1 Red
#property indicator_color2 Aqua
//--- buffers
double ExtMapBuffer1[];
double ExtMapBuffer2[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
  {
//---- indicators
   SetIndexStyle(0,DRAW_LINE);
   SetIndexBuffer(0,ExtMapBuffer1);
   SetIndexStyle(1,DRAW_LINE);
   SetIndexBuffer(1,ExtMapBuffer2);
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

extern int p=24;
int start()
  {
   int    counted_bars=IndicatorCounted();

   
   //double low()
//----
   for(int i=0; i<Bars;i++){
      ExtMapBuffer1[i]=High[iHighest(Symbol(),0,MODE_HIGH,p,i-p/2)];//;
      ExtMapBuffer2[i]=Low[iLowest(Symbol(),0,MODE_LOW,p,i-p/2)];//;
   }
//----
   return(0);
  }
//+------------------------------------------------------------------+