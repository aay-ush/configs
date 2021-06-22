#NoEnv
#SingleInstance force
#NoTrayIcon
#WinActivateForce ; avoid taskbar flashing on smoe systems

windows_to_navigate := []
last_process := ""
window_i := 0

; Windows + ` to navigate forward windows of same process
#`::
    WinGet, current_process, ProcessName, A
    ;MsgBox, ProcessName: %current_process% LastProcess: %last_process%
    if (current_process != last_process)
    {
        last_process := current_process
        window_i = 1  ; start navigating from topmost window
        ;MsgBox, NbWindows: %windows_to_navigate%
    }
    WinGet, window_count, Count, ahk_exe %current_process%
    if (window_count != windows_to_navigate)
    {
        ; update windows_to_naviate since process has opened/closed window(s)
        WinGet, windows_to_navigate, List, ahk_exe %current_process%
    }
    window_i := ++window_i > windows_to_navigate ? 1 : window_i
    ;MsgBox, Activating Window: %window_i%
    window_id := windows_to_navigate%window_i%
    ;WinGetTitle, pid, ahk_id %window_id%
    ;MsgBox, Window id: %pid%
    WinActivate, ahk_id %window_id%
return

; Windows + Shift + ` to navigate backwards between windows of same process
#+`::
    WinGet, current_process, ProcessName, A
    if (current_process != last_process)
    {
        last_process := current_process
        window_i := windows_to_navigate   ; start navigation from bottommost window
    }
    WinGet, window_count, Count, ahk_exe %current_process%
    if (window_count != windows_to_navigate)
    {
        ; update windows_to_navigate since process has opened/closed window(s)
        WinGet, windows_to_navigate, List, ahk_exe %current_process%
    }
    window_i := --window_i < 1 ? windows_to_navigate : window_i
    window_id := windows_to_navigate%window_i%
    WinActivate, ahk_id %window_id%
return

