//+------------------------------------------------------------------+
//|                                                        xkurt.mq4 |
//|                        Copyright 2012, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2012, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

#include <basic.mqh>

extern datetime exdate= D'2012.12.28';
extern string openTime= "16:30";
extern string closeTime= "22:59";

extern datetime _openTime=D'2012.12.28 2:00:00';
extern datetime _closeTime;


extern int stop1=15;
extern int stop2=30;
extern int stop3=15;

extern int t1=24;
extern int t2=32;





//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init(){
  return (0);
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



       
      
      




datetime openDate;
int closeIndex=0;

int start()
  {

  //double optLot=maxLot();
  double optLot=maxLotHedge();

  //open and modify when PC power is limited
   if(TimeHour(TimeCurrent())==22&&TimeMinute(TimeCurrent())==59)
      {
            
            if(TimeSeconds(TimeCurrent())<=t1){
               openAndModify(stop1,optLot);
            }
            
            else{
               if(TimeSeconds(TimeCurrent())<=t2){
                  openAndModify(stop2,optLot);
               }
               
               else{
                      openAndModify(stop3,optLot);              
               }
            }
            
            /*
            while(TimeSeconds(TimeLocal())<45){Print(TimeSeconds(TimeLocal()));}
            openAndModify(stop3,optLot);
            
            //show second
            Print(TimeSeconds(TimeCurrent()));
            */
            
            openDate=TimeDay(TimeCurrent());
        
         
    }
    
    
    /*
    //open and modify when PC is powerful enough
    
     if(TimeHour(TimeCurrent())==22&&TimeMinute(TimeCurrent())==59&&TimeSeconds(TimeCurrent())>=30)
      {
            
            //Print("opentime");
            
            while(TimeSeconds(TimeCurrent())<31){Print("hi");}
         
            if(OrderSelect(0,SELECT_BY_POS)==false){
               OrderSend(Symbol(),OP_BUY,_optLot,Ask,9,Bid-Point*4,0);
               OrderSend(Symbol(),OP_SELL,_optLot,Bid,9,Ask+Point*4,0);
               Print(TimeDayOfWeek(TimeCurrent()));
               openDate=TimeDay(TimeCurrent());
               }
               
            if(OrderSelect(0,SELECT_BY_POS)==true){
               //Print("modify");
               //Print(OrderModify(OrderTicket(),OrderOpenPrice(),Bid-Point*4,0,0));
               modify();
            }
    }
    */
    
  
  //close order
  if(TimeDay(TimeCurrent())>openDate){
   //Print("closetime");
  
   
   closeAll();
   
  }

   return(0);
}