#NoEnv
#SingleInstance force
#NoTrayIcon

" Use shift+Capslock for capslock toggle
+Capslock::Capslock
return

last_minimized_window :=

" Use capslock to minimize current window
Capslock::
last_minimized_window := WinExist("A")
WinMinimize, ahk_id %last_minimized_window%
return

" Use Ctrl + Capslock to restore last hotkey minimized window
^Capslock::
WinActivate, ahk_id  %last_minimized_window%
return


;;--------;
;; To hide a window. Shouldn't be used because it literally hides it.
;;    (Window doesn't appear even when Alt+Tab is pressed.)
;;
;Hid_Window_Log = %A_ScriptDir%\logs\Hid_Window_Log.txt
;Capslock::
;WinGetTitle, hid_window, A
;GroupAdd, hidWindows, %hid_window%
;FormatTime, time_of_hide, R D1 T12
;FileAppend, %time_of_hide%`t%hid_window%`n, %Hid_Window_Log%
;Winhide A
;WinMinimize A
;WinActivate A
;return

;<^Capslock::WinShow, ahk_group hidWindows
;;----------;
