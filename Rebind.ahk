#Requires AutoHotkey v2.0

; Prevent CapsLock from toggling capitalization
SetCapsLockState "AlwaysOff"

; Detect CapsLock alone and send Escape
CapsLock::{
    KeyWait "CapsLock", "T0.15"  ; Wait up to 150ms to check if another key is pressed
    if !GetKeyState("f", "P")  ; If F is not being held, send Escape
        Send "{Esc}"
}

; Allow CapsLock + F to send Tab
#HotIf GetKeyState("CapsLock", "P")
f::Send "{Tab}"
#HotIf

