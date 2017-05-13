//+------------------------------------------------------------------+
//|                                                HuiDang Angle.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

#property indicator_separate_window
#property indicator_buffers 3
#property indicator_color1 Red
#property indicator_color2 Red
#property indicator_color3 Red
//--- buffers
double ExtMapBuffer1[];
double ExtMapBuffer2[];
double ExtMapBuffer3[];
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
   SetIndexStyle(2,DRAW_LINE);
   SetIndexBuffer(2,ExtMapBuffer3);
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
   int AA=0;
   int BB=0;
   
      for(int j=0;j<5;j++){
         AA+=iMA(Symbol(),0,a[j],0,1,0,i+1);
      }
      AA/=5;
      
      for(int jj=0;jj<5;jj++){
         A+=iMA(Symbol(),0,a[jj],0,1,0,i);
      }
      A/=5;
      for(int k=0;k<6;k++){
         BB+=iMA(Symbol(),0,b[k],0,1,0,i+1);
      }
      BB/=6;
      for(int kk=0;kk<6;kk++){
         B+=iMA(Symbol(),0,b[kk],0,1,0,i);
      }
      B/=6;
      
      
      ExtMapBuffer1[i]=1000*((AA-A)-(BB-B));

      
   }
   
   
   return(0);
  }
//+------------------------------------------------------------------+