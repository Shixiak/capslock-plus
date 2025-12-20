#Requires AutoHotkey v2.0
#UseHook
global capsUsedAsMod := false
global prevCapsState := GetKeyState("CapsLock", "T")

; log.ahk
Log(text) {
    ts := FormatTime(, "yyyy-MM-dd HH:mm:ss")
    FileAppend(ts "  " text "`n", A_ScriptDir "\debug.log", "UTF-8")
}

; 修改 capsUsedAsMod 变量
SetCapsUsedAsMod(value) {
    global capsUsedAsMod
    capsUsedAsMod := value
}

CapsLock:: SetCapsUsedAsMod(false)

CapsLock up:: {
    global prevCapsState
    if !capsUsedAsMod {
        SetCapsLockState(prevCapsState ? "AlwaysOff" : "On")
        prevCapsState := !prevCapsState
    } else {
        SetCapsLockState(prevCapsState ? "On" : "AlwaysOff")
    }
}

; #region 通用

; #region 按下 capslock + i, j, k, l 实现方向键功能
CapsLock & i:: {
    SetCapsUsedAsMod(true)
    Send "{Up}"
}

CapsLock & k:: {
    SetCapsUsedAsMod(true)
    Send "{Down}"
}

CapsLock & j:: {
    SetCapsUsedAsMod(true)
    Send "{Left}"
}

CapsLock & l:: {
    SetCapsUsedAsMod(true)
    Send "{Right}"
}
; #endregion

; #region capslock + u/o => Ctrl + Left/Right
CapsLock & u:: {
    SetCapsUsedAsMod(true)
    Send "^{Left}"
}

CapsLock & o:: {
    SetCapsUsedAsMod(true)
    Send "^{Right}"
}
; #endregion

; #region capslock + [] => Home/End
CapsLock & [:: {
    SetCapsUsedAsMod(true)
    Send "{Home}"
}

CapsLock & ]:: {
    SetCapsUsedAsMod(true)
    Send "{End}"
}
; #endregion

; #region capslock + h/d => Backspace/Delete
CapsLock & h:: {
    SetCapsUsedAsMod(true)
    Send "{Backspace}"
}

CapsLock & d:: {
    SetCapsUsedAsMod(true)
    Send "{Delete}"
}
; #endregion

; #region capslock + c/v => ctrl + shift + alt + f1/f2
CapsLock & c:: {
    SetCapsUsedAsMod(true)
    Send "^+!{F1}"
}

CapsLock & v:: {
    SetCapsUsedAsMod(true)
    Send "^+!{F2}"
}

; capslock + e => Esc
CapsLock & e:: {
    SetCapsUsedAsMod(true)
    Send "{Escape}"
}

; capslock + w => Ctrl + w
CapsLock & w:: {
    SetCapsUsedAsMod(true)
    Send "^{w}"
}

; capslock + s => Ctrl + s
CapsLock & s:: {
    SetCapsUsedAsMod(true)
    Send "^{s}"
}
; #endregion

; #endregion

; #region VSCode 配置

#HotIf WinActive("ahk_exe Code.exe")

; capslock + r => Ctrl + r
CapsLock & r:: {
    SetCapsUsedAsMod(true)
    Send "^{r}"
}

; capslock + t => Ctrl + t
CapsLock & t:: {
    SetCapsUsedAsMod(true)
    Send "^{t}"
}

; capslock + ` => Ctrl + `
CapsLock & `:: {
    SetCapsUsedAsMod(true)
    Send "^{vkC0sc029}"
}

; capslock + b => Ctrl + b
CapsLock & b:: {
    SetCapsUsedAsMod(true)
    Send "^{b}"
}

; capslock + f => Ctrl + f
CapsLock & f:: {
    SetCapsUsedAsMod(true)
    Send "^{f}"
}

; #endregion
