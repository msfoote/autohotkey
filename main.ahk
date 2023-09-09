#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Insert the current date
#z::
FormatTime, CurrentDateTime,, yyyy-MM-dd
SendInput %CurrentDateTime%
return

; Insert the current date and time
#+z::
FormatTime, CurrentDateTime,, yyyy-MM-dd HH:mm:ss
SendInput %CurrentDateTime%
return

switchedDesktop := false
XButton2::
switchDesktop() 
{
global switchedDesktop
    if switchedDesktop
    {
        SendEvent ^#{Right}
        switchedDesktop := false
    }
    else
    {
        SendEvent ^#{Left}
        switchedDesktop := true
    }
}
return