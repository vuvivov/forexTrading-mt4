//+------------------------------------------------------------------+
//|                                         HuiDang Consolidated.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

#property indicator_separate_window
#property indicator_minimum -1
#property indicator_maximum 2
#property indicator_buffers 1
#property indicator_color1 Red
//--- buffers
double ExtMapBuffer1[];

extern double r=0.5;
extern double range=500;
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
double angle=0;
int start()
  {
   int    counted_bars=IndicatorCounted();

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
 
      if(state==1&&abs<=min){
         min=abs;
      }
      
      //******next line +0.00001
      if(state==1&&abs>min&&min/(abs+0.000000001)<r){
         max=abs;
         state=0;
      }
      
      
      //------angle:
         int a[5]={3,7,10,12,15};
   int b[6]={30,35,40,45,50,60};
   

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
      
      
      angle=1000*((AA-A)-(BB-B));
      
      
      
      if(state==1&&MathAbs(angle)<range){
         ExtMapBuffer1[i]=1;
      }
      else{
         ExtMapBuffer1[i]=0;
      }

      
   }

   //--------------------------------+
   
   return (0);
}















