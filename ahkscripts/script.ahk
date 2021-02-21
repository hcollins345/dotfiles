#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#UseHook

;skype remapping
#ifwinactive ahk_exe lync.exe
enter::sendinput, +{enter}
ctrl & enter::sendinput, {enter}
return
#If

; Map window snapping to vim keys
#k::
Send, #{Up}
return
#j::
Send, #{Down}
return
#h::
Send, #{Left}
return
#l::
Send, #{Right}
return
#+k::
Send, #+{Up}
return
#+j::
Send, #+{Down}
return
#+h::
Send, #+{Left}
return
#+l::
Send, #+{Right}
return

; Close active window
#Backspace::
WinClose, A
