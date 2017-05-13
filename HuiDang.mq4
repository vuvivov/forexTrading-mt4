//+------------------------------------------------------------------+
//|                                                      HuiDang.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>

extern double r=0.5;
extern double range=500;
extern double sl=2;
extern double tp=6;
extern int period=13;
//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+

double max=0;
double min=0;
bool state=0;//0=find down, 1= find top
double angle=0;
double abs;

int init()
  {
//----
   abs=MathAbs(d());
max=abs;
min=abs;
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




double d(){

   int a[5]={3,7,10,12,15};
   int b[6]={30,35,40,45,50,60};
   
   int A=0;
   int B=0;
   int d=0;
      for(int j=0;j<5;j++){
         A+=iMA(Symbol(),0,a[j],0,1,0,0);
      }
      A/=5;
      for(int k=0;k<6;k++){
         B+=iMA(Symbol(),0,b[k],0,1,0,0);
      }
      B/=6;
      d=A-B;
      return (d);
}


int i=0;

int start()
  {
//----
   abs=MathAbs(d());

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
      
      
      //***************
      if(state==1&&MathAbs(angle)<range){
         if(AA>BB){
            OrderSend(Symbol(),0,1,Ask,9,Bid-sl*iStdDev(0,0,period,0,0,0,0),Ask+tp*iStdDev(0,0,period,0,0,0,0));
         }
         else{
            OrderSend(Symbol(),1,1,Bid,9,Ask+sl*iStdDev(0,0,period,0,0,0,0),Bid-tp*iStdDev(0,0,period,0,0,0,0));
         }
         
      }
      
      /*
      if(OrdersTotal()!=0){
         for(int i=0;i<OrdersTotal();i++){
            OrderSelect(i,SELECT_BY_POS);
            if(OrderType()==0){
               OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),Ask+tp*iStdDev(0,0,period,0,0,0,0),0);
            }
            else{
               OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),Bid-tp*iStdDev(0,0,period,0,0,0,0),0);
            }
         }
      }
      */
//----
   return(0);
  }
//+------------------------------------------------------------------+