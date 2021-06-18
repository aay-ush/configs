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
      window_i = 1  ; reset window_i index
      ;MsgBox, NbWindows: %windows_to_navigate%
    }
    WinGet, windows_to_navigate, List, ahk_exe %current_process%  ; update windows_to_navigate
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
    window_i := windows_to_navigate   ; reset window_i to bottommost window
  }
  WinGet, windows_to_navigate, List, ahk_exe %current_process%  ; update windows_to_navigate
  window_i := --window_i < 1 ? windows_to_navigate : window_i
  window_id := windows_to_navigate%window_i%
  WinActivate, ahk_id %window_id%
return

