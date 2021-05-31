#NoEnv
#SingleInstance force
#NoTrayIcon

browser := "C:\Program Files\Mozilla Firefox\firefox.exe"

; Alt + F2
!F2::
query := GetSelection()
Run,  %browser% https://social.msdn.microsoft.com/search/en-US/?query=%query%
return
 
; Alt + Shift + F2
!+F2::
query := GetSelection(true)
Run, %browser% https://www.google.com/search?q=%query%
return

GetSelection(iReplaceSpace := false)
{
  ;MsgBox, Inside GetSelection
  savedClip := ClipboardAll
  Clipboard = ; to allow ClipWait to detect when text has arrived.
  SendInput {Ctrl down}c{Ctrl up}
  ClipWait, 2 ; Wait at least for 2 seconds for clipboard to contain text
  if ErrorLevel
  {
    MsgBox, Failed to copy text.
    return
  }
  selection := Clipboard
  ;MsgBox % selection
  Clipboard := savedClip
  savedClip =
  
  selection := RegExReplace(selection, "`r`n", " ")
  if(iReplaceSpace)
  {
    selection := StrReplace(selection, A_Space, "+")
    selection := StrReplace(selection, A_Tab, "+")
  }
  
  ;MsgBox % selection
  
  return selection
}
