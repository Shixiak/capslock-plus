#Requires AutoHotkey v2.0

; lib\log.ahk
Log(text) {
    ts := FormatTime(, "yyyy-MM-dd HH:mm:ss")
    FileAppend(ts "  " text "`n", A_ScriptDir "\debug.log", "UTF-8")
}
