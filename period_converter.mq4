//+------------------------------------------------------------------+
//|                                             Period_Converter.mq4 |
//|                 Copyright © 2005-2007, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2007, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
#property show_inputs
#include <WinUser32.mqh>

extern int ExtPeriodMultiplier=3; // new period multiplier factor
int        ExtHandle=-1;
//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start()
  {
   int    i, start_pos, i_time, time0, last_fpos, periodseconds;
   double d_open, d_low, d_high, d_close, d_volume, last_volume;
   int    hwnd=0,cnt=0;
//---- History header
   int    version=400;
   string c_copyright;
   string c_symbol=Symbol();
   int    i_period=Period()*ExtPeriodMultiplier;
   int    i_digits=Digits;
   int    i_unused[13];
//----  
   ExtHandle=FileOpenHistory(c_symbol+i_period+".hst", FILE_BIN|FILE_WRITE);
   if(ExtHandle < 0) return(-1);
//---- write history file header
   c_copyright="(C)opyright 2003, MetaQuotes Software Corp.";
   FileWriteInteger(ExtHandle, version, LONG_VALUE);
   FileWriteString(ExtHandle, c_copyright, 64);
   FileWriteString(ExtHandle, c_symbol, 12);
   FileWriteInteger(ExtHandle, i_period, LONG_VALUE);
   FileWriteInteger(ExtHandle, i_digits, LONG_VALUE);
   FileWriteInteger(ExtHandle, 0, LONG_VALUE);       //timesign
   FileWriteInteger(ExtHandle, 0, LONG_VALUE);       //last_sync
   FileWriteArray(ExtHandle, i_unused, 0, 13);
//---- write history file
   periodseconds=i_period*60;
   start_pos=Bars-1;
   d_open=Open[start_pos];
   d_low=Low[start_pos];
   d_high=High[start_pos];
   d_volume=Volume[start_pos];
   //---- normalize open time
   i_time=Time[start_pos]/periodseconds;
   i_time*=periodseconds;
   for(i=start_pos-1;i>=0; i--)
     {
      time0=Time[i];
      //---- history may be updated
      if(i==0)
        {
         //---- modify index if history was updated
         if(RefreshRates())
            i=iBarShift(NULL,0,time0);
        }
      //----
      if(time0>=i_time+periodseconds || i==0)
        {
         if(i==0 && time0<i_time+periodseconds)
           {
            d_volume+=Volume[0];
            if (Low[0]<d_low)   d_low=Low[0];
            if (High[0]>d_high) d_high=High[0];
            d_close=Close[0];
           }
         last_fpos=FileTell(ExtHandle);
         last_volume=Volume[i];
         FileWriteInteger(ExtHandle, i_time, LONG_VALUE);
         FileWriteDouble(ExtHandle, d_open, DOUBLE_VALUE);
         FileWriteDouble(ExtHandle, d_low, DOUBLE_VALUE);
         FileWriteDouble(ExtHandle, d_high, DOUBLE_VALUE);
         FileWriteDouble(ExtHandle, d_close, DOUBLE_VALUE);
         FileWriteDouble(ExtHandle, d_volume, DOUBLE_VALUE);
         FileFlush(ExtHandle);
         cnt++;
         if(time0>=i_time+periodseconds)
           {
            i_time=time0/periodseconds;
            i_time*=periodseconds;
            d_open=Open[i];
            d_low=Low[i];
            d_high=High[i];
            d_close=Close[i];
            d_volume=last_volume;
           }
        }
       else
        {
         d_volume+=Volume[i];
         if (Low[i]<d_low)   d_low=Low[i];
         if (High[i]>d_high) d_high=High[i];
         d_close=Close[i];
        }
     } 
   FileFlush(ExtHandle);
   Print(cnt," record(s) written");
//---- collect incoming ticks
   int last_time=LocalTime()-5;
   while(IsStopped()==false)
     {
      int cur_time=LocalTime();
      //---- check for new rates
      if(RefreshRates())
        {
         time0=Time[0];
         FileSeek(ExtHandle,last_fpos,SEEK_SET);
         //---- is there current bar?
         if(time0<i_time+periodseconds)
           {
            d_volume+=Volume[0]-last_volume;
            last_volume=Volume[0]; 
            if (Low[0]<d_low) d_low=Low[0];
            if (High[0]>d_high) d_high=High[0];
            d_close=Close[0];
           }
         else
           {
            //---- no, there is new bar
            d_volume+=Volume[1]-last_volume;
            if (Low[1]<d_low) d_low=Low[1];
            if (High[1]>d_high) d_high=High[1];
            //---- write previous bar remains
            FileWriteInteger(ExtHandle, i_time, LONG_VALUE);
            FileWriteDouble(ExtHandle, d_open, DOUBLE_VALUE);
            FileWriteDouble(ExtHandle, d_low, DOUBLE_VALUE);
            FileWriteDouble(ExtHandle, d_high, DOUBLE_VALUE);
            FileWriteDouble(ExtHandle, d_close, DOUBLE_VALUE);
            FileWriteDouble(ExtHandle, d_volume, DOUBLE_VALUE);
            last_fpos=FileTell(ExtHandle);
            //----
            i_time=time0/periodseconds;
            i_time*=periodseconds;
            d_open=Open[0];
            d_low=Low[0];
            d_high=High[0];
            d_close=Close[0];
            d_volume=Volume[0];
            last_volume=d_volume;
           }
         //----
         FileWriteInteger(ExtHandle, i_time, LONG_VALUE);
         FileWriteDouble(ExtHandle, d_open, DOUBLE_VALUE);
         FileWriteDouble(ExtHandle, d_low, DOUBLE_VALUE);
         FileWriteDouble(ExtHandle, d_high, DOUBLE_VALUE);
         FileWriteDouble(ExtHandle, d_close, DOUBLE_VALUE);
         FileWriteDouble(ExtHandle, d_volume, DOUBLE_VALUE);
         FileFlush(ExtHandle);
         //----
         if(hwnd==0)
           {
            hwnd=WindowHandle(Symbol(),i_period);
            if(hwnd!=0) Print("Chart window detected");
           }
         //---- refresh window not frequently than 1 time in 2 seconds
         if(hwnd!=0 && cur_time-last_time>=2)
           {
            PostMessageA(hwnd,WM_COMMAND,33324,0);
            last_time=cur_time;
           }
        }
      Sleep(50); 
     }      
//----
   return(0);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void deinit()
  {
   if(ExtHandle>=0) { FileClose(ExtHandle); ExtHandle=-1; }
  }
//+------------------------------------------------------------------+