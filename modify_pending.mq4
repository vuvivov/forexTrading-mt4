//+------------------------------------------------------------------+
//|                                               modify_pending.mq4 |
//|                      Copyright © 2004, MetaQuotes Software Corp. |
//|                                       http://www.metaquotes.net/ |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2004, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net/"
#property show_confirm

//+------------------------------------------------------------------+
//| script "modify first pending order"                              |
//+------------------------------------------------------------------+
int start()
  {
   bool   result;
   double price,point;
   int    cmd,total;
   int    expiration;
//----
   total=OrdersTotal();
   point=MarketInfo(Symbol(),MODE_POINT);
//----
   for(int i=0; i<total; i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         cmd=OrderType();
         //---- pending orders only are considered
         if(cmd!=OP_BUY && cmd!=OP_SELL)
           {
            //---- print selected order
            OrderPrint();
            //---- modify first pending order
            price=OrderOpenPrice()-10*point;
            expiration=OrderExpiration();
            result=OrderModify(OrderTicket(),price,0,0,expiration,CLR_NONE);
            if(result!=TRUE) Print("LastError = ", GetLastError());
            //---- print modified order (it still selected after modify)
            else OrderPrint();
            break;
           }
        }
      else { Print( "Error when order select ", GetLastError()); break; }
     }
//----
   return(0);
  }
//+------------------------------------------------------------------+