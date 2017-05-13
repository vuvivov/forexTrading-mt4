//+------------------------------------------------------------------+
//|                                             bollinger narrow.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

#property indicator_separate_window
#property indicator_buffers 3
#property indicator_color1 Blue
#property indicator_color2 Red
#property indicator_color3 Red
//--- buffers
double ExtMapBuffer1[];
double ExtMapBuffer2[];
double ExtMapBuffer3[];

extern double r=0.5;
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

double d(int i){

   
    return (iStdDev(Symbol(),0,13,0,0,0,i));
}

double max=0;
double min=0;
bool state=0;//0=find down, 1= find top
int start()
  {
   int    counted_bars=IndicatorCounted();
//----

//identify max/ min




//re-identity max/ min




//decide
double abs=MathAbs(d(Bars-1));
max=abs;
min=abs;

   for(int i=Bars-2; i>-1;i--){
      abs=MathAbs(d(i));
      

     

  
      
      if(state==0&&abs>max){
         max=abs;
      } 
    
      if(state==0&&abs<=max&&abs/(max+0.000000001)<r){
         min=abs;
         state=1;
      }
  /* */
      if(state==1&&abs<=min){
         min=abs;
      }
      
      //******next line +0.00001
      if(state==1&&abs>min&&min/(abs+0.000000001)<r){
         max=abs;
         state=0;
      }
   
      ExtMapBuffer1[i]=state*max/2;
      ExtMapBuffer2[i]=min;
      ExtMapBuffer3[i]=max;
      
   }
   

   //--------------------------------+
   
   return (0);
}