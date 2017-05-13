//+------------------------------------------------------------------+
//|                                                  rotate_text.mq4 |
//|                      Copyright © 2004, MetaQuotes Software Corp. |
//|                                       http://www.metaquotes.net/ |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2004, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net/"
#include <stdlib.mqh>

string line_name="rotating_line";
string object_name1="rotating_text";

void init()
  {
   Print("point = ", Point,"   bars=",Bars);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void deinit()
  {
   ObjectDelete(line_name);
   ObjectDelete(object_name1);
   ObjectsRedraw();
  }
//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start()
  {
   int    time2;
   int    error,index,fontsize=10;
   double price,price1,price2;
   double angle=0.0;
//----
   price2=High[10]+Point*10;
   ObjectCreate(line_name, OBJ_TRENDBYANGLE, 0, Time[10], price2);
   index=20;
   ObjectCreate(object_name1, OBJ_TEXT, 0, Time[index], Low[index]-Point*100);
   ObjectSetText(object_name1, "rotating_text", fontsize);
   while(IsStopped()==false)
     {
      index++;
      price=ObjectGet(object_name1, OBJPROP_PRICE1)+Point;
      error=GetLastError();
      if(error!=0)
        {
         Print(object_name1," : ",ErrorDescription(error));
         break;
        }
      ObjectMove(object_name1, 0, Time[index], price);
      ObjectSet(object_name1, OBJPROP_ANGLE, angle*2);
      ObjectSet(object_name1, OBJPROP_FONTSIZE, fontsize);
      ObjectSet(line_name, OBJPROP_WIDTH, angle/18.0);
      double line_angle=360.0-angle;
      if(line_angle==90.0)  ObjectSet(line_name, OBJPROP_PRICE2, price2+Point*50);
      if(line_angle==270.0) ObjectSet(line_name, OBJPROP_PRICE2, price2-Point*50);
      time2=ObjectGet(line_name,OBJPROP_TIME2);
      if(line_angle>90.0 && line_angle<270.0) time2=Time[index+10];
      else                                    time2=Time[0];
      ObjectSet(line_name, OBJPROP_TIME2, time2);
      ObjectSet(line_name, OBJPROP_ANGLE, line_angle);
      ObjectsRedraw();
      angle+=3.0;
      if(angle>=360.0) angle=360.0-angle;
      fontsize++;
      if(fontsize>48) fontsize=6;
      Sleep(500);
      price1=ObjectGetValueByShift(line_name, index);
      if(GetLastError()==0)
        {
         if(MathAbs(price1-price) < Point*50)
           {
            Print("price=",price,"  price1=", price1);
            ObjectSetText(object_name1, "REMOVED", 48, "Arial", RGB(255,215,0));
            ObjectsRedraw();
            Sleep(5000);
//            ObjectDelete(object_name1);
           }
        }
     }
   return(0);
  }
//+------------------------------------------------------------------+