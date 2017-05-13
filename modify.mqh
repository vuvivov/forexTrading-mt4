//+------------------------------------------------------------------+
//|                                                       modify.mq4 |
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

/*
void modifyAllPending(double stop, double stopLoss=0, double takeProfit=0){
   bool success=false;
   
   for(int i=0;i<OrdersTotal();i++)
     {
     
      if(OrderSelect(i,SELECT_BY_POS)==false)   
      {     
      Print("no open order");
      break;}
      
      if(OrderSymbol()!=Symbol()) {
      Print("not corresponding symbol");
      continue;}
      //---- check order type 
      
      if(stopLoss==0){
            if(OrderType()==OP_BUYSTOP)
        {
         success=false;
         while(success==false){
            success=OrderModify(OrderTicket(),NormalizeDouble(MarketInfo(Symbol(),MODE_ASK)+stop*Point, Digits),0,0,0);
            if(success==false){printError();}
            
         }
         
        
        }
        
        
      if(OrderType()==OP_SELLSTOP)
        {
         success=false;
         while(success==false){
            success=OrderModify(OrderTicket(),NormalizeDouble(MarketInfo(Symbol(),MODE_BID)-stop*Point, Digits),0,0,0);
            if(success==false){printError();}
            
         }
         
         
        }
        
      
      }
      
      
  //need add else    
      if(OrderType()==OP_BUYSTOP)
        {
         success=false;
         while(success==false){
            success=OrderModify(OrderTicket(),NormalizeDouble(MarketInfo(Symbol(),MODE_ASK)+stop*Point, Digits),NormalizeDouble(MarketInfo(Symbol(),MODE_ASK)+stop*Point-stopLoss*Point, Digits),0,0);
            if(success==false){printError();}
            
         }
         
         
        
        }
      
      
      if(OrderType()==OP_SELLSTOP)
        {
         success=false;
         while(success==false){
            success=OrderModify(OrderTicket(),NormalizeDouble(MarketInfo(Symbol(),MODE_BID)-stop*Point, Digits),NormalizeDouble(MarketInfo(Symbol(),MODE_BID)-stop*Point+Point*stopLoss, Digits),0,0);
            if(success==false){printError();}
            
         }
         
         
         
        }
        
      
      
     }
}







void modifyAllOpen(double stopLoss, double takeProfit=0){
   bool success=false;
   
   for(int i=0;i<OrdersTotal();i++)
     {
     
      if(OrderSelect(i,SELECT_BY_POS)==false)   
      {     
      Print("no open order");
      break;}
      
      if(OrderSymbol()!=Symbol()) {
      Print("not corresponding symbol");
      continue;}
      //---- check order type 
      
      
    if(takeProfit==0){
      if(OrderType()==0)
        {
         success=false;
         while(success==false){
            success=OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(MarketInfo(Symbol(),MODE_BID)-stopLoss*Point, Digits),0,0);
            if(success==false){printError();}
            
         }
         
         
        
        }
      
      
      if(OrderType()==1)
        {
         success=false;
         while(success==false){
            success=OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(MarketInfo(Symbol(),MODE_ASK)+stopLoss*Point, Digits),0,0);
            if(success==false){printError();}
            
         }
         
         
        
        }
        
       } 
      
      
   }


}

*/










bool modifyAllPending(double stop, double stopLoss=0, double takeProfit=0){
   bool success=true;
   
   for(int i=0;i<OrdersTotal();i++)
     {
      if(OrderSelect(i,SELECT_BY_POS)==false)   
      {     
         printError();
         break;
      }
      
      if(OrderSymbol()!=Symbol()) {
      Print("not corresponding symbol");
      continue;}
      //---- check order type 
      
      if(stopLoss==0){
            if(OrderType()==OP_BUYSTOP)
        {
            if(OrderModify(OrderTicket(),NormalizeDouble(MarketInfo(Symbol(),MODE_ASK)+stop*Point, Digits),0,0,0)==false){
               printError();
               success=false;
            }
        }
        
        
            if(OrderType()==OP_SELLSTOP)
        {
            if(OrderModify(OrderTicket(),NormalizeDouble(MarketInfo(Symbol(),MODE_BID)-stop*Point, Digits),0,0,0)==false){
               printError();
               success=false;
            }
        }
      }
      
 else{
      if(OrderType()==OP_BUYSTOP)
        {
            if(OrderModify(OrderTicket(),NormalizeDouble(MarketInfo(Symbol(),MODE_ASK)+stop*Point, Digits),NormalizeDouble(MarketInfo(Symbol(),MODE_ASK)+stop*Point-stopLoss*Point, Digits),0,0)==false){
               printError();
               success=false;
            }
        }
         
      if(OrderType()==OP_SELLSTOP)
        {
            if(OrderModify(OrderTicket(),NormalizeDouble(MarketInfo(Symbol(),MODE_BID)-stop*Point, Digits),NormalizeDouble(MarketInfo(Symbol(),MODE_BID)-stop*Point+Point*stopLoss, Digits),0,0)==false){
               printError();
               success=false;
            }
        }

     }
   }
   
   return (success);
}







bool modifyAllOpen(double stopLoss, double takeProfit=0){
   bool success=true;
      
   for(int i=0;i<OrdersTotal();i++)
     {
      if(OrderSelect(i,SELECT_BY_POS)==false)   
      {     
         printError();
         break;
      }
      if(OrderSymbol()!=Symbol()) {
      Print("not corresponding symbol");
      continue;}
      //---- check order type 
     
     //need add takeprofit !=0
      
    if(takeProfit==0){
      if(OrderType()==0)
        {
            if(OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(MarketInfo(Symbol(),MODE_BID)-stopLoss*Point, Digits),0,0)==false){
               printError();
               success=false;
            }
        }
      
      
      if(OrderType()==1)
        {
         if(OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(MarketInfo(Symbol(),MODE_ASK)+stopLoss*Point, Digits),0,0)==false){
               printError();
               success=false;
            }
        }
     } 
   }
   
   return (success);
}