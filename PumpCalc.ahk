
I_Icon = C:\Users\PC\Documents\GitHub\PrecisionStrike\Pump.ico
IfExist, %I_Icon%
Menu, Tray, Icon, %I_Icon%
;return


; Create GUI widows, instantiate GUI name
Gui , PrecisionStrike: Show , w200 h 230, PrecisionStrike - Pump Calc
Gui , PrecisionStrike: +AlwaysOnTop +ToolWindow

; Set the overall background color for GUI
; Gui, PrecisionStrike: Color, 0x808080


; Set the overall text font for GUI
Gui , PrecisionStrike:Font , s10 , Arial


; buttons and texts for setting up hours, minutes, and seconds
Gui , PrecisionStrike:Add , Edit , x20 y116 w55 h20 center ve3
Gui , PrecisionStrike:Add , UpDown , x20 y116 w55 h20 -VScroll , 0
Gui , PrecisionStrike:Add , Edit ,  x75 y116 w55 h20 center ve2
Gui , PrecisionStrike:Add , UpDown , x75 y116 w55 h20 -VScroll , 0
Gui , PrecisionStrike:Add , Edit ,  x130 y116 w55 h20 center ve1
Gui , PrecisionStrike:Add , UpDown , x130 y116 w55 h20 -VScroll , 10
Gui , PrecisionStrike:add , Text , x20 y100 w40 center , Hrs
Gui , PrecisionStrike:add , Text , x75 y100 w40 center , Min
Gui , PrecisionStrike:add , Text , x130 y100 w40 center , Sec
Gui , PrecisionStrike:Add , Button , gstart x20 y141 w80 h22 center , Start
Gui , PrecisionStrike:Add , Button , gresume x100 y141 w85 h22 center , Resume


; System time
Gui , PrecisionStrike:add, text , vTStart x0 y210 w60 h30,


; add drop down list
Gui, PrecisionStrike:Add, DropDownList, vtimer_options Choose1 altsubmit x89 y205 w110 gset_option_func, N/A|Sleep|Shutdown




Gui , PrecisionStrike:Font , s25 c800000 , Segoe UI
Gui , PrecisionStrike:add , text , x10 y30 w180 h60 center vdispt , Pump Calc
return

start:
   Pause , 0
   Gui , Submit , NoHide
   
   Gui , PrecisionStrike:Font , s26 cBlue , Segoe UI
   GuiControl , PrecisionStrike:Font , dispt
 If e3 is not number
   e3:=0
 If e2 is not number
   e2:=0
 If e1 is not number
   e1:=0
   secsLeft :=  e3*3600+e2*60+e1
   seconds := Format("{:02}" , floor(mod(secsLeft , 60)))   
   minutes := Format("{:02}" , mod(floor(secsLeft/60) , 60))
   hours  :=  floor(secsLeft/3600)
   
   hur := Format("{:02}" , floor(abs(secsleft)/3600))
   min := Format("{:02}" , floor(mod(abs(secsLeft/60),60)))
   sec := Format("{:02}" , floor(mod(abs(secsLeft), 60)))
   
   GuiControl , PrecisionStrike:text , dispt , %hur%:%min%:%sec% 
   
   FormatTime , TimeString, , HH:mm:ss
   GuiControl , PrecisionStrike:text , TStart , %TimeString%
   SetTimer , PSTimer , 1000

loop {
MouseMove, 500, 312
sleep, 100
MouseMove, 500, 500
sleep, 100
MouseMove, 400, 600
sleep, 100
}


return

resume:
   Pause , Toggle , 1
   GuiControl , , e3 , %hours%
   GuiControl , , e2 , %minutes%
   GuiControl , , e1 , %seconds%
   GuiControl , , dispt , %hur%:%min%:%sec%
return

PSTimer:
;   Gui , Submit , NoHide
   secsLeft--
   hur := Format("{:02}" , floor(abs(secsleft)/3600))
   min := Format("{:02}" , floor(mod(abs(secsLeft/60),60)))
   sec := Format("{:02}" , floor(mod(abs(secsLeft), 60)))
   GuiControl , PrecisionStrike:text , dispt, %hur%:%min%:%sec%
   IfEqual , secsLeft , 0
   {
      Gui , PrecisionStrike:Font , s26 cRed ; Segoe UI
      GuiControl , PrecisionStrike:Font , dispt  
      goto  opb%timer_options%
      return
   }
   Else  
      Return
   

   
set_option_func:
   Gui , Submit , NoHide
   goto  opa%timer_options%


opb1:
   msgbox , 262144 , PrecisionStrike, Pump Calc Completed !!
ExitApp
opa1:
return

opb2:
   run, rundll32.exe powrprof.dll`,SetSuspendState Sleep
ExitApp
opa2:
return

opb3:
   run, shutdown.exe /s
opa3:
return

TimerGuiClose:
ExitApp

Esc::ExitApp