; #IfWinActive ahk_exe sublime_text.exe
; #Left::Send ^{Left}
; return

; #IfWinActive ahk_exe sublime_text.exe
; #+Left::Send ^+{Left}
; return

; #IfWinActive ahk_exe sublime_text.exe
; #Right::Send ^{Right}
; return

; #IfWinActive ahk_exe sublime_text.exe
; #+Right::Send ^+{Right}
; return


#IfWinActive ahk_exe sublime_text.exe
#MenuMaskKey RAlt

; *LWin::return

; #if GetKeyState("LWin", "P")
; Alt::Alt
; Put your other Win+ hotkeys here, without #.

; LAlt::Control
LWin::LControl
