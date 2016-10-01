#cPuTTY  
A real cluster solution for PuTTY.  
Furter development of:
- https://github.com/deanhouseholder/PuTTY-Keystroke-Sender
- https://github.com/dprokscha/cputty

### What the...?
Are you one of the poor who have to make the same changes on multiple servers with PuTTY? You don't want to do this manually on each server? You are tired of not working cluster solutions for PuTTY? You are still searching a tool which is a real cluster for PuTTY? Then you should give cPuTTY a try, your search might be over. cPuTTY recognises all keyboard and mouse events which were sent to a PuTTY window and forwards them to all other clustered PuTTY windows. Type character by character once for multiple windows - in real-time!

### Features
* Add PuTTY windows to a numbered cluster, remove them from a cluster or kill the whole cluster with shortcuts
* All keyboard and mouse events within a cluster are forwarded to all other clustered PuTTY windows
* Each key and shortcut on your keyboard - even mouse commands (right-click only) - are supported
* PuTTY forks like FuTTY, KiTTY, PieTTY and TuTTY are supported. Also including MinTTY.
* Tile PuTTY windows over (multiple) monitors
* Fully support for UNIX commands like ``vi``
* No additional windows are needed - simply use your existing PuTTY windows
* It should work with Windows Vista, Windows 7 and later

### Download
* Download compiled binary in [Releases](https://github.com/sepich/cputty/releases) section
* Or run from sources via [AutoHotKey](https://github.com/Lexikos/AutoHotkey_L)
* No installation needed

### Shortcuts
``Ctrl`` + ``Alt`` + ``1-4`` - Tile windows over 1-4 monitors  
``Ctrl`` + ``Alt`` + ``5-0`` - Adds the active PuTTY window to a cluster group (see [extended usage](#extended-usage))  
``Ctrl`` + ``Alt`` + ``Page Down`` - Stop sending events to other windows  
``Ctrl`` + ``Alt`` + ``Page Up`` - Resumes event sending  
``Ctrl`` + ``Alt`` + ``Home`` - Brings all windows from the default cluster to the top  
``Ctrl`` + ``Alt`` + ``End`` - Removes windows from current cluster. Closes cPuTTY, if all clusters are empty.  
``Win`` + ``W`` - Auto-enter saved text (password). On first run asks for the text  
``Alt`` + ``G`` - Reload cPuTTY

### Working with cPuTTY
* Start cPuTTY, it would sit in System Tray
* Open multiple PuTTY windows
* They would automatically added to default cluster (0), and have this number added to Window Title
* To tile/align all windows on one screen by pressing ``Ctrl`` + ``Alt`` + ``1``
* To move some windows to another cluster, select the window and press ``Ctrl`` + ``Alt`` + ``5-9``
* Now type something in one of the windows you have added to the cluster and have a look to the other windows of the same cluster
* To temporary stop replicating events, press  ``Ctrl`` + ``Alt`` + ``Page Down``. System Tray icon would change to lock. To resume press ``Ctrl`` + ``Alt`` + ``Page Up``
* Press ``Ctrl`` + ``Alt`` + ``Home`` to bring all clustered windows to the top

### Extended usage
cPuTTY allows up to six grouped clusters. For example, open four PuTTY windows. For the first both press ``Ctrl`` + ``Alt`` + ``9``, for the last both ``Ctrl`` + ``Alt`` + ``5``. You have created two standalone clusters. By opening more PuTTY windows and pressing ``Ctrl`` + ``Alt`` + ``5-0`` you can easily extend your clusters. Please note, that ``0`` is the default cluster. This means that newly opened windows would be automatically added to it. If a PuTTY window is already clustered, you can move it with ``Ctrl`` + ``Alt`` + ``5-0`` to any other cluster. While no PuTTY window is active, press ``Ctrl`` + ``Alt`` + ``5-0`` to bring your clusters to the top.

### Troubleshooting
##### My antivirus software detects cPuTTY as a virus.
AutoHotKey sometimes being marked as a virus. In case precompiled binary looks unsafe for you - run cPuTTY as ahk script.
##### How can I start cPuTTY automatically on windows startup?
Simply create a shortcut of *cputty.exe* and move it to the autostart folder located in the Windows start menu.
##### How can I change the default shortcuts of cPuTTY?
Feel free to [download the source](src/cputty.ahk) and to change it - it is all made with [AutoHotKey](https://github.com/Lexikos/AutoHotkey_L).
##### I have another question, bug or feature request.
Please use the [GitHub Issue Tracker](https://github.com/sepich/cputty/issues).

### Acknowledgements
Thanks to the original [dprokscha/cputty](https://github.com/dprokscha/cputty) and [deanhouseholder/PuTTY-Keystroke-Sender](https://github.com/deanhouseholder/PuTTY-Keystroke-Sender)  
Changes are:  
- Windows tiling/aligning
- Auto-enter saved text
- Fixed: Right click to non active window
- Fixed: Win-<x> shortcuts leave <x> typed in other windows
- Fixed: Shift-Ins paste correctly to all windows
