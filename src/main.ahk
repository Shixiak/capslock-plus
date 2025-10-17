#Requires AutoHotkey v2.0
#UseHook
#Include ./lib/utils.ahk
global capsUsedAsMod := false
global prevCapsState := GetKeyState("CapsLock", "T")

; 修改 capsUsedAsMod 变量
SetCapsUsedAsMod(value) {
    global capsUsedAsMod
    capsUsedAsMod := value
}

CapsLock::SetCapsUsedAsMod(false)

CapsLock up::
{
    global prevCapsState
    if !capsUsedAsMod {
        SetCapsLockState(prevCapsState ? "AlwaysOff" : "On")
        prevCapsState := !prevCapsState
    } else {
        SetCapsLockState(prevCapsState ? "On" : "AlwaysOff")
    }
}


; 按下 capslock + i, j, k, l 实现方向键功能
~CapsLock & i::
{
    SetCapsUsedAsMod(true)
    Send "{Up}"
}

~CapsLock & k::
{
    SetCapsUsedAsMod(true)
    Send "{Down}"
}

~CapsLock & j::
{
    SetCapsUsedAsMod(true)
    Send "{Left}"
}

~CapsLock & l::
{
    SetCapsUsedAsMod(true)
    Send "{Right}"
}


; capslock + u/o => Ctrl + Left/Right
~CapsLock & u::
{
    SetCapsUsedAsMod(true)
    Send "^{Left}"
}

~CapsLock & o::
{
    SetCapsUsedAsMod(true)
    Send "^{Right}"
}


; capslock + m/n => End/Home
~CapsLock & m::
{
    SetCapsUsedAsMod(true)
    Send "{End}"
}

~CapsLock & n::
{
    SetCapsUsedAsMod(true)
    Send "{Home}"
}


; capslock + e => Esc
~CapsLock & e::
{
    SetCapsUsedAsMod(true)
    Send "{Escape}"
}


; capslock + h => Backspace
~CapsLock & h::
{
    SetCapsUsedAsMod(true)
    Send "{Backspace}"
}


; capslock + d => Delete
~CapsLock & d::
{
    SetCapsUsedAsMod(true)
    Send "{Delete}"
}


; capslock + p => Ctrl + p
~CapsLock & p::
{
    SetCapsUsedAsMod(true)
    Send "^{p}"
}
