#Requires AutoHotkey v2.0

; Win+R, shell:startup

CapsLock::Esc  ; Pressing CapsLock alone sends Escape
CapsLock & f::Tab  ; CapsLock + F sends Tab

; Prevent CapsLock from toggling capitalization
SetCapsLockState "AlwaysOff"
