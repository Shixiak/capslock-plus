#Requires AutoHotkey v2.0
#UseHook

global capsUsedAsMod := false
global prevCapsState := GetKeyState("CapsLock", "T")

; 输出调试日志
Log(text) {
    ts := FormatTime(, "yyyy-MM-dd HH:mm:ss")
    FileAppend(ts "  " text "`n", A_ScriptDir "\debug.log", "UTF-8")
}

SetCapsUsedAsMod(value := true) {
    global capsUsedAsMod
    capsUsedAsMod := value
}

SendWithCapsUsed(keys, *) {
    SetCapsUsedAsMod(true)
    Send keys
}

; 把映射表注册成真实热键
RegisterCapsLayer(mapObj, hotIfFn := 0) {
    if (hotIfFn) 
        HotIf(hotIfFn)
    for key, sendKeys in mapObj {
        Hotkey "CapsLock & " key, SendWithCapsUsed.Bind(sendKeys)
    }
    if (hotIfFn)
        HotIf()
}

; CapsLock 原始行为
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

; 全局映射
global GLOBAL_MAP := Map(
    "i", "{Up}",
    "k", "{Down}",
    "j", "{Left}",
    "l", "{Right}",

    "u", "^{Left}",  ; move cursor by word left
    "o", "^{Right}",  ; move cursor by word right

    "[", "{Home}",
    "]", "{End}",

    "h", "{Backspace}",
    "d", "{Delete}",
    "n", "^{z}",  ; undo
    "y", "^{y}",  ; redo
    "s", "^{s}",  ; save

    "c", "^+!{F1}",  ; shortcut for snipping tool
    "v", "^+!{F2}",

    "e", "{Escape}",  ; escape
    "w", "^{w}"  ; close tab
)

RegisterCapsLayer(GLOBAL_MAP)


; VSCode 专用映射
global VSCODE_MAP := Map(
    "r", "^{r}",            ; open project
    "t", "^{t}",            ; find identifier
    ";", "^{vkC0sc029}",    ; toggle terminal (Ctrl+`)
    "b", "^{b}",            ; toggle sidebar
    "f", "^{f}",            ; find
    "p", "^{p}",            ; search file
    "Enter", "^{Enter}"     ; open in new editor
)

RegisterCapsLayer(VSCODE_MAP, (*) => WinActive("ahk_exe Code.exe"))