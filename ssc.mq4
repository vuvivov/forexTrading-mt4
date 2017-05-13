//+------------------------------------------------------------------+
//|                                                          sto.mq4 |
//|                        Copyright 2013, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"





//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
//----
   
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
extern double level=35;
extern double sl=2;
extern double tp=1;
extern int ma=200;
extern int k=5;
extern int d=3;
extern int j=3;
extern double lot=0.1;
extern double stdP=14;


double diff(int i){
   return (iStochastic(NULL,0,k,d,j,0,0,0,i)-iStochastic(NULL,0,k,d,j,0,0,1,i));
}

double avSto(){
   int i=1;
   return ((iStochastic(NULL,0,k,d,j,0,0,0,i)+iStochastic(NULL,0,k,d,j,0,0,1,i))/2);
}

int start()
  {
//----
   //Long
   //if higher than MA && stoDiff off peak && sto> level {buy sl,tp as std}
   if(Close[1]>iMA(NULL,0,ma,0,0,0,1)&&diff(2)>diff(1)&&avSto()<level){
      OrderSend(Symbol(),0,lot,Ask,0,Bid-NormalizeDouble(sl*iStdDev(NULL,0,stdP,0,0,0,1),Digits),Bid+NormalizeDouble(tp*iStdDev(NULL,0,stdP,0,0,0,1),Digits));
   }

   //short 
   if(Close[1]<iMA(NULL,0,ma,0,0,0,1)&&diff(2)>diff(1)&&avSto()>100-level){
      OrderSend(Symbol(),1,lot,Bid,0,Ask+NormalizeDouble(sl*iStdDev(NULL,0,stdP,0,0,0,1),Digits),Ask-NormalizeDouble(tp*iStdDev(NULL,0,stdP,0,0,0,1),Digits));
   }
     
   
   
   
   
   
//----
   return(0);
  }
//+------------------------------------------------------------------+