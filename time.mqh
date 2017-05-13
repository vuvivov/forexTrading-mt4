//+------------------------------------------------------------------+
//|                                                         time.mq4 |
//|                        Copyright 2012, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2012, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

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
int T;

string stringTime(datetime t){
   return (StringConcatenate(TimeYear(t),".",TimeMonth(t),".",TimeDay(t),"  ",TimeHour(t),":",TimeMinute(t),":",TimeSeconds(t)));
}

bool timeMatch(int t=9){
   T=TimeCurrent()-TimeLocal();
   if(MathAbs(T)>t){
      Print("time mismatched, current - local = ",T);
      return (false);
   }
   
   return (true);
}


bool checkDateHMS(int h, int m, int s){
   if (h<0||h>23){
      Print("ivalide hour");
      return (false);}
   
   if(m<0||m>59){
      Print("ivalide minute");
      return (false);}
   
   if(s<0||s>59){
      Print("ivalide second");
      return (false);}
   
   return (true);
}

bool checkDateYMD(int y, int m, int d){
   if (y<1974){
      Print("ivalide hour");
      return (false);}
   
   if(m<1||m>12){
      Print("ivalide minute");
      return (false);}
   
   if(d<1||d>31){
      Print("ivalide second");
      return (false);}
      //may add check d for dif. month
   
   return (true);
}



bool atHMS(int h, int m, int s, datetime t){
   if(checkDateHMS(h,m,s)==false){}
   
   else{
      if(h==TimeHour(t)&&m==TimeMinute(t)&&s==TimeSeconds(t)){return (true);}
   }
   
   return (false);   
}

bool atYMD(int y, int m, int d, datetime t){
   if(checkDateYMD(y,m,d)==false){}
   
   else{
      if(y==TimeYear(t)&&m==TimeMonth(t)&&d==TimeDay(t)){return (true);}
   }
   
   return (false);   
}


bool atYMDHMS(int y, int m, int d, int h, int _m, int s, datetime t){
   if(atYMD(y,m,d,t)==true&&atHMS(h,_m,s,t)==true){return (true);}
   return (false);
}


bool earlierHMS(int h, int m, int s, datetime t){
   if(checkDateHMS(h,m,s)==false){}
   else{
      if(h>TimeHour(t)){
         return (true);
      }
      
      if(h<TimeHour(t)){
         return (false);
      }
      
      if(m>TimeMinute(t)){
         return (true);
      }
      
      if(m<TimeMinute(t)){
         return (false);
      }
      
      if(s>TimeSeconds(t))
         {
            return (true);
         }
         
      if(s<TimeSeconds(t))
         {
            return (false);
         }
        
      return (false);   
   }
   
}


bool earlierYMD(int y, int m, int d, datetime t){
   if(checkDateYMD(y,m,d)==false){}
   else{
      if(y>TimeYear(t)){
         return (true);
      }
      
      if(y<TimeYear(t)){
         return (false);
      }
      
      if(m>TimeMonth(t)){
         return (true);
      }
      
      if(m<TimeMonth(t)){
         return (false);
      }
      
      if(d>TimeDay(t))
         {
            return (true);
         }
         
      if(d<TimeDay(t))
         {
            return (false);
         }
        
      return (false);   
   }
   
}


bool earlierYMDHMS(int y, int m, int d, int h, int _m, int s, datetime t){
   
      if(laterYMD(y,m,d,t)==true){
         return (true);
      }
      
      if(earlierYMD(y,m,d,t)==true){
         return (false);
      }
      
      if(laterHMS(h,_m,s,t)==true){
         return (true);
      }
      
      if(earlierHMS(h,_m,s,t)==true){
         return (false);
      }
        
      return (false);   
   
   
}

//eeeeeeeeeeeeee

bool laterHMS(int h, int m, int s, datetime t){

   if(checkDateHMS(h,m,s)==false){}
   
   else{
      if(earlierHMS(h,m,s,t)==false&&atHMS(h,m,s,t)==false){return (true);}
   }

   
   return (false);
}

bool laterYMD(int y, int m, int d, datetime t){

   if(checkDateYMD(y,m,d)==false){}
   
   else{
      if(earlierYMD(y,m,d,t)==false&&atYMD(y,m,d,t)==false){return (true);}
   }

   
   return (false);
}

bool laterYMDHMS(int y, int m, int d,int h, int _m, int s, datetime t){


      if(earlierYMDHMS(y,m,d,h,_m,s,t)==false&&atYMDHMS(y,m,d,h,_m,s,t)==false){return (true);}

   
   return (false);
}

//closed "[]" not open"()"
bool betweenHMS(int h1, int m1, int s1, int h2, int m2, int s2,datetime t){
   if(checkDateHMS(h1,m1,s1)==false||checkDateHMS(h2,m2,s2)==false){}
   else{
      if(atHMS(h1,m1,s1,t)==true||atHMS(h2,m2,s2,t)==true){
         return (true);
      }
      
      if(laterHMS(h1,m1,s1,t)==true&&earlierHMS(h2,m2,s2,t)==true){
         return (true);
      }
      
   }
   
   return (false);

}


//closed "[]" not open"()"
bool betweenYMD(int y1, int m1, int d1, int y2, int m2, int d2,datetime t){
   if(checkDateYMD(y1,m1,d1)==false||checkDateYMD(y2,m2,d2)==false){}
   else{
      if(atYMD(y1,m1,d1,t)==true||atYMD(y2,m2,d2,t)==true){
         return (true);
      }
      
      if(laterYMD(y1,m1,d1,t)==true&&earlierYMD(y2,m2,d2,t)==true){
         return (true);
      }
      
   }
   
   return (false);

}


//closed "[]" not open"()"
bool betweenYMDHMS(int y1, int m1, int d1, int h1, int _m1, int s1, int y2, int m2, int d2,int h2, int _m2, int s2,datetime t){
   
      if(atYMDHMS(y1,m1,d1,h1,_m1,s1,t)==true||atYMDHMS(y2,m2,d2,h2,_m2,s2,t)==true){
         return (true);
      }
      
      if(laterYMDHMS(y1,m1,d1,h1,_m1,s1,t)==true&&earlierYMDHMS(y2,m2,d2,h2,_m2,s2,t)==true){
         return (true);
      }

   return (false);

}


