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
