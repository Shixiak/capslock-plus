#Requires AutoHotkey v2.0
#UseHook
global capsUsedAsMod := false
global prevCapsState := GetKeyState("CapsLock", "T")

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

~CapsLock & e::
{
    SetCapsUsedAsMod(true)
    Send "{Escape}"
}

~CapsLock & h::
{
    SetCapsUsedAsMod(true)
    Send "{Backspace}"
}

Log(text) {
    ts := FormatTime(, "yyyy-MM-dd HH:mm:ss")
    FileAppend(ts "  " text "`n", A_ScriptDir "\debug.log", "UTF-8")
}

; 修改 capsUsedAsMod 变量
SetCapsUsedAsMod(value) {
    global capsUsedAsMod
    capsUsedAsMod := value
}