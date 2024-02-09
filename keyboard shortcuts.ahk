#SingleInstance Force

; tabs management
<!w:: send ^w
    Return
<!e::send ^+{tab}
    Return
<!r::send ^{tab}
    Return
<!d::send !{left}
    Return
<!f::send !{right}
    Return

; up down left right
!i::send {up} 
!k::send {down}
>!j::send {left}
>!l::send {right}
    Return

; cursor moves to next word
<!j::send ^{left}
    Return
<!l::send ^{right}
    Return

; cursor moves to beggining or end of line
<!u::send {Home}
    Return
<!o::send {End}
    Return

; copy cut paste undo redo

!c::send ^c
    Return
!v::send ^v
    Return
!x::send ^x
    Return
!z::send ^z
    Return
!+z::send ^+z
    Return


; select letter
>!+l::send +{right}
    Return
>!+j::Send +{left}
    Return

; select word
<!s::send ^{left}^+{right}

; select line
>!s::send {home}+{end}
    Return
<!+i::send ^+{up}
    Return
<!+k::send ^+{down}
    Return

; select word to the left or right
<!+l::send ^+{right}
    Return
<!+j::send ^+{left}
    Return


; select to the begining or end of line
<!+u::send +{home}
    Return
<!+o::send +{end}
    Return

; Capitalize
<!+s::
    Send ^c ; Copy selected text
    ClipWait
    StringLower, clipboard, clipboard
    StringUpper, clipboard, clipboard, T
    Send ^v ;
    Return

; joing line below
!Del::send {end}{CtrlDown}{ShiftDown}{right}{ShiftUp}{CtrlUp}{Space}
    Return

; media settings
!p::Send {Media_Play_Pause}
    return

; change desktop
#+j::send ^#{Left}
    Return
#+l::send ^#{Right}
    Return

; windows title
!t::
    WinGetTitle, Title, A
    StringSplit, ProgramName, Title, -
    MsgBox, The active software is "%ProgramName1%".
    return

#IfWinActive ahk_exe chrome.exe
    ; find element in vscode 
    !q::
        delay := 200
        ClipWait
        SavedClipboard := Clipboard
        Send ^+c
        Clipboard := ""
        Send ^c
        ClipWait
        Clipboard := RegExReplace(Clipboard, "[*+?{.()^$|&]", "\$0")
        Clipboard := RegExReplace(Clipboard, "[\n\s]+", "[\n\s]*")
        if WinExist("ahk_exe code.exe") {
            WinActivate 
            Sleep %delay%
            Send {CtrlDown}f{CtrlUp}
            Sleep %delay%
            Send ^a{BackSpace}
            Send ^v
            Clipboard := SavedClipboard
        }
        Return

    ; open tab search
    !g:: send {CtrlDown}{ShiftDown}a{CtrlUp}{ShiftUp}
        Return

    ; go to tab number
    !1::Send ^1
    !2::Send ^2
    !3::Send ^3
    !4::Send ^4
    !5::Send ^5
    !6::Send ^6
    !7::Send ^7
    !8::Send ^8
    !9::Send ^9
    !0::Send ^0
    return

#IfWinActive ahk_exe thinkorswim.exe
    ^/::Send {home}`{#}{Down}
    return

    !,:: Send {LButton} {MButton} {Down} {Enter}
    !.:: Send {LButton} {MButton} {Down 3} {Enter}
    !/:: Send {LButton} {MButton} {Down 14} {Enter}
    return