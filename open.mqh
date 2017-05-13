//+------------------------------------------------------------------+
//|                                                         open.mq4 |
//|                        Copyright 2012, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2012, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#include <basic.mqh>
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2005

//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);

// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import

//+------------------------------------------------------------------+
//| EX4 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex4"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+


int slip=10;

/*
void openMinLF(){
  
   if(OrderSend(Symbol(),OP_BUY, MarketInfo(Symbol(),MODE_MINLOT),Ask,slip,0,0)==-1){
      printError();
   }
   //Print("open");
}
*/



//keep doing until execute order
//by returning false, the function may have opened half of the straddle already. Be careful!
void openStraddle(double lot,double stopLoss=0, double takeProfit=0){
   
 if(lot>MarketInfo(Symbol(),MODE_MAXLOT)){
      openStraddle( MarketInfo(Symbol(),MODE_MAXLOT), stopLoss,  takeProfit);
      openStraddle( lot-MarketInfo(Symbol(),MODE_MAXLOT), stopLoss,  takeProfit);
 }
   
 else{  
   if(stopLoss==0&&takeProfit==0){

         while(OrderSend(Symbol(),0, lot,NormalizeDouble(MarketInfo(Symbol(),MODE_ASK), Digits) ,slip,stopLoss,takeProfit)==-1){
               printError();
 
            } 
         while(OrderSend(Symbol(),1, lot,NormalizeDouble(MarketInfo(Symbol(),MODE_BID), Digits),slip,stopLoss,takeProfit)==-1){
               printError();
 
            }
    }  
      
   
   
   //need to add senario when stoploss and takeprofit !=0
   
   if(stopLoss!=0&&takeProfit==0){
      
   
         while(OrderSend(Symbol(),0, lot,NormalizeDouble(MarketInfo(Symbol(),MODE_ASK), Digits),slip,NormalizeDouble(MarketInfo(Symbol(),MODE_BID)-Point*stopLoss, Digits),takeProfit)==-1==-1){
            printError();

         }
         
         while(OrderSend(Symbol(),1, lot,
            NormalizeDouble(MarketInfo(Symbol(),MODE_BID), Digits),
            slip,
            NormalizeDouble(MarketInfo(Symbol(),MODE_ASK)+Point*stopLoss, Digits),
            takeProfit)==-1){
            printError();

         }
     
   }
 } 
}






//by returning false, the function may have opened half of the straddle already. Be careful!

void openStopStraddle(double lot,double stop, double stopLoss=0, double takeProfit=0){
   if(lot>MarketInfo(Symbol(),MODE_MAXLOT)){
      openStopStraddle( MarketInfo(Symbol(),MODE_MAXLOT),stop, stopLoss,  takeProfit);
      openStopStraddle( lot-MarketInfo(Symbol(),MODE_MAXLOT), stop, stopLoss,  takeProfit);
 }
   
  else{ 
   
  // bool success=true;
      
   if(stopLoss==0&&takeProfit==0){
      
   
         while(OrderSend(Symbol(),OP_BUYSTOP, lot,NormalizeDouble(MarketInfo(Symbol(),MODE_ASK)+stop*Point, Digits) ,slip,stopLoss,takeProfit)==-1){
            printError();
          //  success=false;
            
         }
         
      
   
         while(OrderSend(Symbol(),OP_SELLSTOP, lot,NormalizeDouble(MarketInfo(Symbol(),MODE_BID)-stop*Point, Digits),slip,stopLoss,takeProfit)==-1){
            printError();
            //success=false;
            
         }
      
    }  
      
   //need to add senario when stoploss and takeprofit !=0
   
   if(stopLoss!=0&&takeProfit==0){
      
   
         while(OrderSend(Symbol(),OP_BUYSTOP, lot,NormalizeDouble(MarketInfo(Symbol(),MODE_ASK)+stop*Point, Digits),slip,NormalizeDouble(MarketInfo(Symbol(),MODE_ASK)+stop*Point-stopLoss*Point, Digits),takeProfit)==-1){
            printError();
            //success=false;
         }
      
   
         while(OrderSend(Symbol(),OP_SELLSTOP, lot,
            NormalizeDouble(MarketInfo(Symbol(),MODE_BID)-stop*Point, Digits),
            slip,
            NormalizeDouble(MarketInfo(Symbol(),MODE_BID)-stop*Point+Point*stopLoss, Digits),
            takeProfit)==-1){
            printError();
            //success=false;
         }
     
   }
  }    
   //return (success);      
}











void open(int type,double lot, double stopLoss=0, double takeProfit=0){

if(lot>MarketInfo(Symbol(),MODE_MAXLOT)){
      open(type, MarketInfo(Symbol(),MODE_MAXLOT), stopLoss,  takeProfit);
      open(type, lot-MarketInfo(Symbol(),MODE_MAXLOT),  stopLoss,  takeProfit);
 }
   
else{ 
   
   if(type==0&&stopLoss==0&&takeProfit==0){
         while(OrderSend(Symbol(),type, lot,NormalizeDouble(MarketInfo(Symbol(),MODE_ASK), Digits) ,slip,stopLoss,takeProfit)==-1){
            printError();

      }   
   }
   
   
   if(type==1&&stopLoss==0&&takeProfit==0){
         while(OrderSend(Symbol(),type, lot,NormalizeDouble(MarketInfo(Symbol(),MODE_BID), Digits) ,slip,stopLoss,takeProfit)==-1){
            printError();

         }
   }
   
   //need to add senario when stoploss and takeprofit !=0
   
   if(type==0&&stopLoss!=0&&takeProfit==0){
         while(OrderSend(Symbol(),type, lot,NormalizeDouble(MarketInfo(Symbol(),MODE_ASK), Digits) ,slip,NormalizeDouble(MarketInfo(Symbol(),MODE_BID)-stopLoss*Point, Digits),takeProfit)==-1){
            printError();

      }
   }
   
 
   if(type==1&&stopLoss!=0&&takeProfit==0){
         while(OrderSend(Symbol(),type, lot,NormalizeDouble(MarketInfo(Symbol(),MODE_BID), Digits) ,slip,NormalizeDouble(MarketInfo(Symbol(),MODE_ASK)+stopLoss*Point, Digits),takeProfit)==-1){
            printError();

            
         }
   }
}   

}


void oneCancelAnother(double lot, double stopLoss=0,double takeProfit=0, int type=0){
   int order1=-1;
   while(order1==-1)
   {order1=OrderSend(Symbol(),OP_BUYSTOP, lot,NormalizeDouble(MarketInfo(Symbol(),MODE_ASK)+stopLoss*Point, Digits) ,slip,NormalizeDouble(MarketInfo(Symbol(),MODE_BID)+(stopLoss-MarketInfo(Symbol(),MODE_STOPLEVEL))*Point, Digits),takeProfit);
      printError();
   }

   
   int order2=-1;
   while(order2==-1)   
   {order2=OrderSend(Symbol(),OP_SELLSTOP, lot,NormalizeDouble(MarketInfo(Symbol(),MODE_BID)-stopLoss*Point, Digits) ,slip,NormalizeDouble(MarketInfo(Symbol(),MODE_ASK)+(MarketInfo(Symbol(),MODE_STOPLEVEL)-stopLoss)*Point, Digits),takeProfit);
      printError();
   }

   
   OrderSelect(order1,SELECT_BY_TICKET);
   int orderState=OrderType();
   OrderSelect(order2,SELECT_BY_TICKET);
   orderState+= OrderType();  
   
   int temp=orderState;
   while(orderState==temp)   
   {
   OrderSelect(order1,SELECT_BY_TICKET);
   temp=OrderType();
   OrderSelect(order2,SELECT_BY_TICKET);
   temp+= OrderType();
   Sleep(1);
   }

   
   OrderSelect(order1,SELECT_BY_TICKET);   
   if(OrderType()!=0){
      while(OrderDelete(order1)==false){printError();}
   }
   
   OrderSelect(order2,SELECT_BY_TICKET);   
   if(OrderType()!=1){
      while(OrderDelete(order2)==false){printError();}      
   }
   
   
}