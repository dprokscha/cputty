; Copyright (c) 2015 Daniel Prokscha
;
; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:
;
; The above copyright notice and this permission notice shall be included in
; all copies or substantial portions of the Software.
;
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
; THE SOFTWARE.

#NoEnv
#NoTrayIcon
#Persistent
#SingleInstance force
#WinActivateForce

GroupAdd, WindowGroup, ahk_class FuTTY
GroupAdd, WindowGroup, ahk_class KiTTY
GroupAdd, WindowGroup, ahk_class PieTTY
GroupAdd, WindowGroup, ahk_class PuTTY
GroupAdd, WindowGroup, ahk_class TuTTY
GroupAdd, WindowGroup, ahk_class TTYPLUSMAIN
GroupAdd, WindowGroup, ahk_class PUTTYCS_WND_CLASS

AltDown := 0
Cluster := []
Caption := 1

class Keys {
    ; Identifier       := [SYSKEY, Extended, SC  , VK  ]
    static SC001       := [0     , 0       , 0x00, 0x00],
    static SC002       := [0     , 0       , 0x00, 0x00],
    static SC003       := [0     , 0       , 0x00, 0x00],
    static SC004       := [0     , 0       , 0x00, 0x00],
    static SC005       := [0     , 0       , 0x00, 0x00],
    static SC006       := [0     , 0       , 0x00, 0x00],
    static SC007       := [0     , 0       , 0x00, 0x00],
    static SC008       := [0     , 0       , 0x00, 0x00],
    static SC009       := [0     , 0       , 0x00, 0x00],
    static SC00A       := [0     , 0       , 0x00, 0x00],
    static SC00B       := [0     , 0       , 0x00, 0x00],
    static SC00C       := [0     , 0       , 0x00, 0x00],
    static SC00D       := [0     , 0       , 0x00, 0x00],
    static SC00E       := [0     , 0       , 0x00, 0x00],
    static SC00F       := [0     , 0       , 0x00, 0x00],
    static SC010       := [0     , 0       , 0x00, 0x00],
    static SC011       := [0     , 0       , 0x00, 0x00],
    static SC012       := [0     , 0       , 0x00, 0x00],
    static SC013       := [0     , 0       , 0x00, 0x00],
    static SC014       := [0     , 0       , 0x00, 0x00],
    static SC015       := [0     , 0       , 0x00, 0x00],
    static SC016       := [0     , 0       , 0x00, 0x00],
    static SC017       := [0     , 0       , 0x00, 0x00],
    static SC018       := [0     , 0       , 0x00, 0x00],
    static SC019       := [0     , 0       , 0x00, 0x00],
    static SC01A       := [0     , 0       , 0x00, 0x00],
    static SC01B       := [0     , 0       , 0x00, 0x00],
    static SC01C       := [0     , 0       , 0x00, 0x00],
    static SC01D       := [0     , 0       , 0x00, 0x11],
    static SC01E       := [0     , 0       , 0x00, 0x00],
    static SC01F       := [0     , 0       , 0x00, 0x00],
    static SC020       := [0     , 0       , 0x00, 0x00],
    static SC021       := [0     , 0       , 0x00, 0x00],
    static SC022       := [0     , 0       , 0x00, 0x00],
    static SC023       := [0     , 0       , 0x00, 0x00],
    static SC024       := [0     , 0       , 0x00, 0x00],
    static SC025       := [0     , 0       , 0x00, 0x00],
    static SC026       := [0     , 0       , 0x00, 0x00],
    static SC027       := [0     , 0       , 0x00, 0x00],
    static SC028       := [0     , 0       , 0x00, 0x00],
    static SC029       := [0     , 0       , 0x00, 0x00],
    static SC02A       := [0     , 0       , 0x00, 0x10],
    static SC02B       := [0     , 0       , 0x00, 0x00],
    static SC02C       := [0     , 0       , 0x00, 0x00],
    static SC02D       := [0     , 0       , 0x00, 0x00],
    static SC02E       := [0     , 0       , 0x00, 0x00],
    static SC02F       := [0     , 0       , 0x00, 0x00],
    static SC030       := [0     , 0       , 0x00, 0x00],
    static SC031       := [0     , 0       , 0x00, 0x00],
    static SC032       := [0     , 0       , 0x00, 0x00],
    static SC033       := [0     , 0       , 0x00, 0x00],
    static SC034       := [0     , 0       , 0x00, 0x00],
    static SC035       := [0     , 0       , 0x00, 0x00],
    static SC038       := [1     , 0       , 0x00, 0x12],
    static SC039       := [0     , 0       , 0x00, 0x00],
    static SC03A       := [0     , 0       , 0x00, 0x00],
    static SC03B       := [0     , 0       , 0x00, 0x00],
    static SC03C       := [0     , 0       , 0x00, 0x00],
    static SC03D       := [0     , 0       , 0x00, 0x00],
    static SC03E       := [0     , 0       , 0x00, 0x00],
    static SC03F       := [0     , 0       , 0x00, 0x00],
    static SC040       := [0     , 0       , 0x00, 0x00],
    static SC041       := [0     , 0       , 0x00, 0x00],
    static SC042       := [0     , 0       , 0x00, 0x00],
    static SC043       := [0     , 0       , 0x00, 0x00],
    static SC044       := [1     , 0       , 0x00, 0x00],
    static SC046       := [0     , 0       , 0x00, 0x00],
    static SC056       := [0     , 0       , 0x00, 0x00],
    static SC057       := [0     , 0       , 0x00, 0x00],
    static SC058       := [0     , 0       , 0x00, 0x00],
    static SC070       := [0     , 0       , 0x00, 0x00],
    static SC073       := [0     , 0       , 0x00, 0x00],
    static SC077       := [0     , 0       , 0x00, 0x00],
    static SC079       := [0     , 0       , 0x00, 0x00],
    static SC07B       := [0     , 0       , 0x00, 0x00],
    static SC07E       := [0     , 0       , 0x00, 0x00],
    static SC11D       := [0     , 1       , 0x00, 0x11],
    static SC136       := [0     , 0       , 0x00, 0x10],
    static SC138       := [0     , 1       , 0x00, 0x12],
    static SC145       := [0     , 1       , 0x00, 0x00],
    static SC15B       := [0     , 1       , 0x00, 0x00],
    static SC15C       := [0     , 1       , 0x00, 0x00],
    static SC15D       := [0     , 1       , 0x00, 0x00],
    static SC15E       := [0     , 1       , 0x00, 0x00],
    static SC15F       := [0     , 1       , 0x00, 0x00],
    static SC163       := [0     , 1       , 0x00, 0x00],
    static Break       := [0     , 0       , 0x45, 0x00],
    static CtrlBreak   := [0     , 1       , 0x00, 0x00],
    static Delete      := [0     , 1       , 0x00, 0x00],
    static Down        := [0     , 1       , 0x00, 0x00],
    static End         := [0     , 1       , 0x00, 0x00],
    static Home        := [0     , 1       , 0x00, 0x00],
    static Insert      := [0     , 1       , 0x00, 0x00],
    static Left        := [0     , 1       , 0x00, 0x00],
    static Numpad0     := [0     , 0       , 0x00, 0x00],
    static Numpad1     := [0     , 0       , 0x00, 0x00],
    static Numpad2     := [0     , 0       , 0x00, 0x00],
    static Numpad3     := [0     , 0       , 0x00, 0x00],
    static Numpad4     := [0     , 0       , 0x00, 0x00],
    static Numpad5     := [0     , 0       , 0x00, 0x00],
    static Numpad6     := [0     , 0       , 0x00, 0x00],
    static Numpad7     := [0     , 0       , 0x00, 0x00],
    static Numpad8     := [0     , 0       , 0x00, 0x00],
    static Numpad9     := [0     , 0       , 0x00, 0x00],
    static NumpadAdd   := [0     , 0       , 0x00, 0x00],
    static NumpadClear := [0     , 0       , 0x00, 0x00],
    static NumpadDel   := [0     , 0       , 0x00, 0x00],
    static NumpadDiv   := [0     , 1       , 0x00, 0x00],
    static NumpadDot   := [0     , 0       , 0x00, 0x00],
    static NumpadDown  := [0     , 0       , 0x00, 0x00],
    static NumpadEnd   := [0     , 0       , 0x00, 0x00],
    static NumpadEnter := [0     , 1       , 0x00, 0x00],
    static NumpadHome  := [0     , 0       , 0x00, 0x00],
    static NumpadIns   := [0     , 0       , 0x00, 0x00],
    static NumpadLeft  := [0     , 0       , 0x00, 0x00],
    static NumpadMult  := [0     , 0       , 0x00, 0x00],
    static NumpadPgDn  := [0     , 0       , 0x00, 0x00],
    static NumpadPgUp  := [0     , 0       , 0x00, 0x00],
    static NumpadRight := [0     , 0       , 0x00, 0x00],
    static NumpadSub   := [0     , 0       , 0x00, 0x00],
    static NumpadUp    := [0     , 0       , 0x00, 0x00],
    static Pause       := [0     , 0       , 0x45, 0x00],
    static PgDn        := [0     , 1       , 0x00, 0x00],
    static PgUp        := [0     , 1       , 0x00, 0x00],
    static PrintScreen := [0     , 1       , 0x00, 0x00],
    static Right       := [0     , 1       , 0x00, 0x00],
    static Up          := [0     , 1       , 0x00, 0x00]
}

For Identifier, None In Keys {
    if ("__Class" != Identifier) {
        Hotkey, IfWinActive, ahk_group WindowGroup
        Hotkey, % "~*" Identifier, ClusterKeyDown
        Hotkey, % "~*" Identifier " up", ClusterKeyUp
        if (0 == Keys[Identifier][3]) {
            Keys[Identifier][3] := GetKeySC(Identifier)
        }
        if (0 == Keys[Identifier][4]) {
            Keys[Identifier][4] := GetKeyVK(Identifier)
        }
    }
}

AddToCluster(Group := 0)
{
    global AltDown
    global Cluster
    WinGet, WinActive, ID, A
    Cluster[WinActive] := Group
    AltDown := 0
}

AllToCluster()
{
    global Cluster
    WinGet AllWindows, List, ahk_group WindowGroup
    Loop %AllWindows% {
        Cluster[AllWindows%A_Index%] := 0
    }
}

ClusterKeyDown()
{
    global AltDown
    global Cluster
    ; Omit unclustered windows
    WinGet, WinActive, ID, A
    if ("" == Cluster[WinActive]) {
        return
    }
    ; Prepare post
    Identifier := RegExReplace(A_ThisHotkey, "[~*]")
    Message    := 0x100
    ScanCode   := Keys[Identifier][3]
    VirtualKey := Keys[Identifier][4]
    LParam     := 1 | ScanCode << 16
    ; SYSKEY pressed (ALT, ALT pressed or F10)
    if (1 == Keys[Identifier][1] or AltDown) {
        Message := 0x104
    }
    ; ALT down
    if (0x12 == VirtualKey) {
        AltDown := 1
    }
    ; ALT pressed
    if (1 == AltDown) {
        LParam := LParam | 1 << 29
    }
    ; Extended flag
    if (1 == Keys[Identifier][2]) {
        LParam := LParam | 1 << 24
    }
    ; Post to clustered windows
    for WinClustered, Group in Cluster {
        if (WinActive != WinClustered && Cluster[WinActive] == Group) {
            PostMessage, Message, VirtualKey, LParam, , ahk_id %WinClustered%
        }
    }
}

ClusterKeyUp()
{
    global AltDown
    global Cluster
    ; Omit unclustered windows
    WinGet, WinActive, ID, A
    if ("" == Cluster[WinActive]) {
        return
    }
    ; Prepare post
    Identifier := RegExReplace(A_ThisHotkey, "[~* up]")
    Message    := 0x101
    ScanCode   := Keys[Identifier][3]
    VirtualKey := Keys[Identifier][4]
    LParam     := 1 | ScanCode << 16
    LParam     := LParam | 1 << 30
    LParam     := LParam | 1 << 31
    ; SYSKEY pressed (ALT, ALT pressed or F10)
    if (1 == Keys[Identifier][1] or AltDown) {
        Message := 0x105
    }
    ; ALT up
    if (0x12 == VirtualKey) {
        AltDown := 0
    }
    ; ALT pressed
    if (1 == AltDown) {
        LParam := LParam | 1 << 29
    }
    ; Extended flag
    if (1 == Keys[Identifier][2]) {
        LParam := LParam | 1 << 24
    }
    ; Post to clustered windows
    for WinClustered, Group in Cluster {
        if (WinActive != WinClustered && Cluster[WinActive] == Group) {
            PostMessage, Message, VirtualKey, LParam, , ahk_id %WinClustered%
        }
    }
}

ClusterMouse()
{
    global Cluster
    WinGet, WinActive, ID, A
    if ("" == Cluster[WinActive]) {
        return
    }
    for WinClustered, Group in Cluster {
        if (WinActive != WinClustered && Cluster[WinActive] == Group) {
            ControlClick, , ahk_id %WinClustered%, , RIGHT
        }
    }
}

FocusCluster(Group := 0)
{
    global Cluster
    for WinClustered, None in Cluster {
        if (Cluster[WinClustered] == Group) {
            WinActivate ahk_id %WinClustered%
        }
    }
}

RemoveFromCluster()
{
    global AltDown
    global Cluster
    WinGet, WinActive, ID, A
    Cluster.Remove(WinActive, "")
    AltDown := 0
}

StopClustering()
{
    global AltDown
    global Cluster
    WinGet, WinActive, ID, A
    if ("" == Cluster.MaxIndex()) {
        MsgBox, 36, cPuTTY, Do you really want to close cPuTTY?
        IfMsgBox, Yes
            ExitApp
    }
    AltDown := 0
    if ("" != Cluster[WinActive]) {
        Tmp := []
        for WinClustered, Group in Cluster {
            if (Cluster[WinActive] != Group) {
                Tmp[WinClustered] := Group
            }
        }
        Cluster := Tmp
        return
    }
    Cluster := []
}

;How many monitors to use for tiling
TileCluster(usemons := 1)
{
    ; number of putty windows in all Clusters
    global Cluster
    for id, None in Cluster {
        IfWinExist, ahk_id %id%
            total++
    }
    if (total<1)
        return

    ; number of screens to tile on
    SysGet, monitors, 80 ;SM_CMONITORS
    if (usemons>monitors)
        usemons := monitors

    iMax:=1
    iMin:=1
    Loop, %usemons% {
        ; windows per this screen
        if (A_Index = usemons)
            num := total
        else {
            num := Ceil(total/(usemons - A_Index + 1))
            total -= num
        }
        rows := Floor(Sqrt(num))
        cols := Ceil(num/rows)

        if(usemons=1) {
            SysGet, prim, MonitorPrimary
            SysGet, mwa, MonitorWorkArea, %prim%
        }
        else
            SysGet, mwa, MonitorWorkArea, %A_Index%
        puttyWidth := (mwaRight - mwaLeft)/cols
        puttyHeight := (mwaBottom - mwaTop)/rows
        yPos := mwaTop
        xPos := mwaLeft
        yCount:=0

        i:=1
        iMax+=num
        ;MsgBox %A_Index% monitor %xPos%:%yPos% start, %num% windows, %cols%x%rows%, %iMin%-%iMax%
        for id, None in Cluster {
            if (i>=iMin and i<iMax and WinExist("ahk_id " id)) {
                WinActivate ahk_id %id%
                WM_ENTERSIZEMOVE=0x0231
                WM_EXITSIZEMOVE=0x0232
                SendMessage, WM_ENTERSIZEMOVE
                WinMove, ahk_id %id% , , xPos, yPos, puttyWidth, puttyHeight
                SendMessage, WM_EXITSIZEMOVE
                yCount++
                yPos := yPos + puttyHeight
                if (yCount >= rows) {
                    xPos := xPos + puttyWidth
                    yPos := mwaTop
                    yCount := 0
                }
            }
            i++
        }
        iMin:=iMax
    }
}

$<^<!Insert::AllToCluster()
$<^<!SC002::FocusCluster(1)
$<^<!SC003::FocusCluster(2)
$<^<!SC004::FocusCluster(3)
$<^<!SC005::FocusCluster(4)
$<^<!SC006::FocusCluster(5)
$<^<!SC007::FocusCluster(6)
$<^<!SC008::FocusCluster(7)
$<^<!SC009::FocusCluster(8)
$<^<!SC00A::FocusCluster(9)
$<^<!SC00B::FocusCluster(0)
$<^<!Home::FocusCluster(0)
$<^<!End::StopClustering()
$<^<!Numpad1::TileCluster(1)
$<^<!Numpad2::TileCluster(2)
$<^<!Numpad3::TileCluster(3)

#IfWinActive ahk_group WindowGroup

$<^<!SC002::AddToCluster(1)
$<^<!SC003::AddToCluster(2)
$<^<!SC004::AddToCluster(3)
$<^<!SC005::AddToCluster(4)
$<^<!SC006::AddToCluster(5)
$<^<!SC007::AddToCluster(6)
$<^<!SC008::AddToCluster(7)
$<^<!SC009::AddToCluster(8)
$<^<!SC00A::AddToCluster(9)
$<^<!SC00B::AddToCluster(0)
$<^<!PgUp::AddToCluster(0)
$<^<!PgDn::RemoveFromCluster()

~*RButton::ClusterMouse()

#IfWinActive

return

ClusterKeyDown:
    ClusterKeyDown()
    return

ClusterKeyUp:
    ClusterKeyUp()
    return