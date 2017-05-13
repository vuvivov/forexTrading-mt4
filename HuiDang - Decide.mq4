//+------------------------------------------------------------------+
//|                                             HuiDang - Decide.mq4 |
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

   int a[5]={3,7,10,12,15};
   int b[6]={30,35,40,45,50,60};
   
   int A=0;
   int B=0;
   int d=0;
      for(int j=0;j<5;j++){
         A+=iMA(Symbol(),0,a[j],0,1,0,i);
      }
      A/=5;
      for(int k=0;k<6;k++){
         B+=iMA(Symbol(),0,b[k],0,1,0,i);
      }
      B/=6;
      d=A-B;
      return (d);
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
      

/*      
      switch(state){
         case 0:{
            if(abs>max){
               max=abs;
               break;
            }         
            
            if(abs/max<r){
               min=abs;
               state=1;
            }   
         }   
         case 1:{
            if(abs<min){
               min=abs;
               break;
            }
            
            if(min/abs<r){
               max=abs;
               state=0;
            }   
         }     
      }
*/     
      
      if(state==0&&abs>max){
         max=abs;
      } 
     
      if(state==0&&abs<=max&&abs/(max+0.000000001)<r){
         min=abs;
         state=1;
      }
 
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
   
   
   /*
double abs=MathAbs(d(Bars-1));   
   for(int i=Bars-2; i>-1;i--){
      abs=MathAbs(d(i));
      ExtMapBuffer1[i]=abs;
   }
 */  
  
   //--------------------------------+
   
   return (0);
}