^b::  ; CTRL+B hotkey
Send, {Ctrl down}c{Ctrl up}  ; Copies the selected text. ^c could be used as well, but this method is more secure.
SendInput, [b]{Ctrl down}v{Ctrl up}[/b] ; Wraps the selected text in BBCode tags to make it bold in a forum.
return  ; This ends the hotkey. The code below this will not be executed when pressing the hotkey.