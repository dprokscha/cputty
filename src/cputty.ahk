#Persistent
#SingleInstance force

GroupAdd, WindowGroup, ahk_class FuTTY
GroupAdd, WindowGroup, ahk_class KiTTY
GroupAdd, WindowGroup, ahk_class PieTTY
GroupAdd, WindowGroup, ahk_class PuTTY
GroupAdd, WindowGroup, ahk_class TuTTY
GroupAdd, WindowGroup, ahk_class TTYPLUSMAIN
GroupAdd, WindowGroup, ahk_class WindowsForms10.Window.8.app.0.3ce0bb8
GroupAdd, WindowGroup, ahk_class PUTTYCS_WND_CLASS

Cluster := []

AddToCluster()
{
    global Cluster
    WinGet, WinActive, ID, A
    Cluster[WinActive] := 1
}

Cluster()
{
    global Cluster
    WinGet, WinActive, ID, A
    for WinCluster, WinTitle in Cluster
    {
        if (WinActive != WinCluster AND Cluster[WinActive])
        {
            ControlSend, , % "{Blind}{" RegExReplace(A_ThisHotkey, "[*$~]") "}", % "ahk_id " WinCluster
        }
    }
}

RemoveFromCluster()
{
    global Cluster
    WinGet, WinActive, ID, A
    Cluster.Remove(WinActive, "")
}

StopClustering()
{
    global Cluster
    for WinCluster, WinTitle in Cluster
    {
        WinSetTitle, ahk_id %WinCluster%, , %WinTitle%
    }
    Cluster := []
}

#IfWinActive ahk_group WindowGroup

$<^<!PgUp::AddToCluster()
$<^<!PgDn::RemoveFromCluster()
$<^<!End::StopClustering()

~*SC029::
~*SC002::
~*SC003::
~*SC004::
~*SC005::
~*SC006::
~*SC007::
~*SC008::
~*SC009::
~*SC00A::
~*SC00B::
~*SC00C::
~*SC00D::
~*SC010::
~*SC011::
~*SC012::
~*SC013::
~*SC014::
~*SC015::
~*SC016::
~*SC017::
~*SC018::
~*SC019::
~*SC01A::
~*SC01B::
~*SC01E::
~*SC01F::
~*SC020::
~*SC021::
~*SC022::
~*SC023::
~*SC024::
~*SC025::
~*SC026::
~*SC027::
~*SC028::
~*SC02B::
~*SC056::
~*SC02C::
~*SC02D::
~*SC02E::
~*SC02F::
~*SC030::
~*SC031::
~*SC032::
~*SC033::
~*SC034::
~*SC035::
~*F1::
~*F2::
~*F3::
~*F4::
~*F5::
~*F6::
~*F7::
~*F8::
~*F9::
~*F10::
~*F11::
~*F12::
~*F13::
~*F14::
~*F15::
~*F16::
~*F17::
~*F18::
~*F19::
~*F20::
~*F21::
~*F22::
~*F23::
~*F24::
~*Space::
~*Tab::
~*Enter::
~*Escape::
~*Backspace::
~*Delete::
~*Insert::
~*Home::
~*End::
~*PgUp::
~*PgDn::
~*Up::
~*Down::
~*Left::
~*Right::
~*ScrollLock::
~*CapsLock::
~*NumLock::
~*Numpad0::
~*Numpad1::
~*Numpad2::
~*Numpad3::
~*Numpad4::
~*Numpad5::
~*Numpad6::
~*Numpad7::
~*Numpad8::
~*Numpad9::
~*NumpadDot::
~*NumpadDiv::
~*NumpadMult::
~*NumpadAdd::
~*NumpadSub::
~*NumpadEnter::
~*NumpadIns::
~*NumpadEnd::
~*NumpadDown::
~*NumpadPgDn::
~*NumpadLeft::
~*NumpadClear::
~*NumpadRight::
~*NumpadHome::
~*NumpadUp::
~*NumpadPgUp::
~*NumpadDel::
Cluster()

#IfWinActive