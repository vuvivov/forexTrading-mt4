//+------------------------------------------------------------------+
//|                                                        close.mq4 |
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
int s=10;
/*
void closeDeleteAll()
  {
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
      
      if(OrderType()==OP_BUY)
        {
         success=false;
         while(success==false){
            success=OrderClose(OrderTicket(),OrderLots(),MarketInfo(Symbol(),MODE_BID),s,White);
            if(success==false){printError();}
            
         }
        }
        
      if(OrderType()==OP_SELL)
        {
         success=false;
         while(success==false){
            success=OrderClose(OrderTicket(),OrderLots(),MarketInfo(Symbol(),MODE_ASK),s,White);
            if(success==false){printError();}
            
         }
         
         
        }
        
      else{
      
         success=false;
         while(success==false){
            success=OrderDelete(OrderTicket());
            if(success==false){printError();}
            
         }
         
      }
      
      
      
     }
     
     
}
*/







bool closeDeleteAll()
  {
   bool success=true;
      int i=0;
    while(OrderSelect(i,SELECT_BY_POS)!=false)   
    {     
         
      
      if(OrderSymbol()!=Symbol()) {
      Print("not corresponding symbol");
      i++;
      
      continue;}
      //---- check order type 
      
      if(OrderType()==OP_BUY)
        {
            if(OrderClose(OrderTicket(),OrderLots(),MarketInfo(Symbol(),MODE_BID),s,White)==false){
               printError();
               success=false;
               
            }
     
               continue;
        }
        
      if(OrderType()==OP_SELL)
        {
            if(OrderClose(OrderTicket(),OrderLots(),MarketInfo(Symbol(),MODE_ASK),s,White)==false){
               printError();
               success=false;
               
            }
  
               continue;
        }
         
       
        
      else{
            if(OrderDelete(OrderTicket())==false){
               printError();
               success=false;
            }

               continue;
         }
     }
     
   return (success);
}







void closeAllAllFast()
  {
  
   
   while(OrderSelect(0,SELECT_BY_POS)!=false)   
     {
      
      if(OrderType()==OP_BUY)
        {
            if(OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_BID),s,White)==false){
               printError();
               
            }
        }
        
      if(OrderType()==OP_SELL)
        {
            if(OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_ASK),s,White)==false){
               printError();
               
            }
        }
         
       }
}




void closeAllAllFastRev()
  {
  
   
   while(OrderSelect(OrdersTotal()-1,SELECT_BY_POS)!=false)   
     {
      
      if(OrderType()==OP_BUY)
        {
            if(OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_BID),s,White)==false){
               printError();
               
            }
        }
        
      if(OrderType()==OP_SELL)
        {
            if(OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_ASK),s,White)==false){
               printError();
               
            }
        }
         
       }
}





void cleanAll(){
   
   while(OrderSelect(0,SELECT_BY_POS)!=false)   
     {
      
      if(OrderType()==OP_BUY)
        {
            if(OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_BID),s,White)==false){
               printError();
               
            }
        }
        
      if(OrderType()==OP_SELL)
        {
            if(OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_ASK),s,White)==false){
               printError();
               
            }
        }
        
      else{
         OrderDelete(OrderTicket());
      }
         
       }
      
}