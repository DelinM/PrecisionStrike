﻿#SingleInstance, force ; prevent program keep asking you when doing every program testing


;GUI Layout
;--------------------------------------------
;--------------------------------------------

;GUI Text
;--------------------------------------------
Gui, Font, s15
Gui, Add, Text, x80 y10 cwhite, Thank you for using Precision Strike
Gui, Add, Text, x120 y500 cwhite, Click the button below to start
Gui, Add, Edit, x200 y200 w100, hi

;GUI Button
;--------------------------------------------
Gui, Add, Button, x155 y550 w200 h50 gFirst_Button, Press to become top talent



Gui, -AlwaysOnTop ; The program will get buried.
Gui, Color, 344955 ; set up the color for the GUI
Gui, Show, w500 h650, Precision Strike ; initate GUI with 500 width and 300 height
return



;Labels
;--------------------------------------------

GuiClose: 
    ExitApp
    return





First_Button:

    msgbox, top talent, strong contributor, it is all the same.
    return





;Function
;--------------------------------------------
;--------------------------------------------
add(x,y)
    {
        return x + y
    }





^x:: ExitApp ; Use hotkey "x" to exit the program