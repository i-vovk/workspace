;-----------------------------------------
; Mac keyboard to Windows Key Mappings
;=========================================

; --------------------------------------------------------------
; NOTES
; --------------------------------------------------------------
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN
;
; Debug action snippet: MsgBox You pressed Control-A while Notepad is active.

#InstallKeybdHook
; #KeyHistory 0
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

; --------------------------------------------------------------
; Disable start menu on left winkey
; --------------------------------------------------------------
LWin & vk07::Return
LWin::Return ; (or run Launchy)


; --------------------------------------------------------------
; Windows launch & search
; --------------------------------------------------------------
!Space::
    Send {Alt up}{Space up}{RWin}
Return

; --------------------------------------------------------------
; Lock
; --------------------------------------------------------------
#^SC010::
    Run schtasks /run /tn "enableLock"
    Sleep 500
    DllCall("LockWorkStation")
Return

; --------------------------------------------------------------
; Mac-like screenshots in Windows (requires Windows 10 Snip & Sketch)
; --------------------------------------------------------------

; Capture entire screen with CMD/WIN + SHIFT + 3
#+3::Send #{PrintScreen}

; Capture portion of the screen with CMD/WIN + SHIFT + 4
#+4::Send {PrintScreen}

; --------------------------------------------------------------
; Media/f-keys mapped to the right option key
; --------------------------------------------------------------

; TODO
; RAlt & F[N]::

F7::SendInput {Media_Prev}
F8::SendInput {Media_Play_Pause}
F9::SendInput {Media_Next}
F10::SendInput {Volume_Mute}
F11::SendInput {Volume_Down}
F12::SendInput {Volume_Up}

; F13-15, standard windows mapping
F13::SendInput #{PrintScreen}
F14::SendInput {ScrollLock}
F15::SendInput {Pause}

;F16-19 custom app launchers, see http://www.autohotkey.com/docs/Tutorial.htm for usage info
; F16::Run http://twitter.com
; F17::Run http://tumblr.com
; F18::Run http://www.reddit.com
; F19::Run https://facebook.com

; --------------------------------------------------------------
; OS X system shortcuts
; --------------------------------------------------------------

; Save
#SC01F::Send ^s

; Selecting
#SC01E::Send ^a

; Copying
#SC02E::Send ^c

; Pasting
#SC02F::Send ^v

; Cutting
#SC02D::Send ^x

; Opening
#SC018::Send ^o

; Commenting
#SC035::Send ^{SC035} ; /

; Finding
#SC021::Send ^f
#SC022::Send {F3}

; Printing
#SC019::Send ^p

; Undo
#SC02C::Send ^z

; Redo
#SC015::Send ^y

; New tab
#SC014::Send ^t
#+SC014::Send ^+t

; Close tab
#SC011::Send ^w

; Refresh
#SC013::Send ^r

; Close windows (cmd + q to Alt + F4)
; #q::Send !{F4}
; #SC010::Send {LAlt down}{Ctrl up}{F4}{LAlt up}
#SC010::Send !{F4}

; Remap Windows + Tab to Alt + Tab.
Lwin & Tab::AltTab

; Minimize windows
#SC023::WinMinimize,a ;h

; Following section remaps alt-arrow and command-arrow keys to mimic OSX behaviour
#Up::Send {Lctrl down}{Home}{Lctrl up}
#Down::Send {Lctrl down}{End}{Lctrl up}
#Left::Send {Home}
#Right::Send {End}
#+Up::Send {Shift down}{Lctrl down}{Home}{Lctrl up}{Shift up}
#+Down::Send {Shift down}{Lctrl down}{End}{Lctrl up}{Shift up}
#+Left::Send {Shift down}{Home}{Shift up}
#+Right::Send {Shift down}{End}{Shift up}

; Tabs switching
#!Left::Send {LCtrl down}{LShift down}{Tab}{LShift up}{LCtrl up}
#!Right::Send {LCtrl down}{Tab}{LCtrl up}

; Switching between windows of the same app
#SC029::    ; Next window Cmd+\ (left from Z)
WinGetClass, ActiveClass, A
WinGet, WinClassCount, Count, ahk_class %ActiveClass%
IF WinClassCount = 1
    Return
Else
WinSet, Bottom,, A
WinActivate, ahk_class %ActiveClass%
return

; --------------------------------------------------------------
; OS X keyboard mappings for special chars
; --------------------------------------------------------------

!-::Send {ASC 0150}
!+-::Send {ASC 0151}
; !=::!=
; !+=::±
; ![::“
; !+[::”
; !]::‘
; !+]::’
; !;::…
; !'::æ
; !+'::Æ
; !\::«
; !+\::»
; !,::<=
; !+,::¯
; !.::>=
;!+.::breve
; !/::÷
; !+/::¿
; !_::—


; --------------------------------------------------------------
; Application specific
; --------------------------------------------------------------

; Google Chrome
#IfWinActive, ahk_class Chrome_WidgetWin_1

; Show Web Developer Tools with cmd + alt + i
#!SC017::Send {F12} ;i

; Show source code with cmd + alt + u
#!SC016::Send {Alt up}{LCtrl down}{SC016}{LCtrl up} ;u

#IfWinActive

; Sublime Text
#IfWinActive, ahk_exe sublime_text.exe

#!Down::Send {F12}
#+!Down::Send +{F12}
#^Down:: Send !{Down}
#^Up:: Send !{Up}
#SC020::Send ^d
#SC025::Send ^k
#SC026::Send ^l
#SC031::Send ^n
#SC016::Send ^u
#SC01A::Send ^[
#SC01B::Send ^]
#+SC021::Send ^+f
#+SC01F::Send ^+s
#+SC016::Send ^+u
#+SC013::Send ^+r
#+SC02F::Send ^+v
#+SC019::Send ^+p
#^SC019::Send ^!p
#^SC022::Send !{F3}

#IfWinActive
