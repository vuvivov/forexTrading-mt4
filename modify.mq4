//+------------------------------------------------------------------+
//|                                                       modify.mq4 |
//|                      Copyright © 2004, MetaQuotes Software Corp. |
//|                                       http://www.metaquotes.net/ |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2004, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net/"
#property show_confirm

//+------------------------------------------------------------------+
//| script "modify first market order"                               |
//+------------------------------------------------------------------+
int start()
  {
   bool   result;
   double stop_loss,point;
   int    cmd,total,error;
//----
   total=OrdersTotal();
   point=MarketInfo(Symbol(),MODE_POINT);
//----
   for(int i=0; i<total; i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         //---- print selected order
         OrderPrint();
         cmd=OrderType();
         //---- buy or sell orders are considered
         if(cmd==OP_BUY || cmd==OP_SELL)
           {
            //---- modify first market order
            while(true)
              {
               if(cmd==OP_BUY) stop_loss=Bid-20*point;
               else            stop_loss=Ask+20*point;
               result=OrderModify(OrderTicket(),0,stop_loss,0,0,CLR_NONE);
               if(result!=TRUE) { error=GetLastError(); Print("LastError = ",error); }
               else error=0;
               if(error==135) RefreshRates();
               else break;
              }
             //---- print modified order (it still selected after modify)
             OrderPrint();
             break;
           }
        }
      else { Print( "Error when order select ", GetLastError()); break; }
     }
//----
   return(0);
  }
//+------------------------------------------------------------------+