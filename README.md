#cPuTTY
A real cluster solution for PuTTY

### Contents
[What the...?](#what-the)  
[Features](#features)  
[Installing cPuTTY](#installing-cputty)  
[Working with cPuTTY](#working-with-cputty)  
[Shortcuts](#shortcuts)  
[Troubleshooting](#troubleshooting)  
[Acknowledgements](#acknowledgements)  
[License](#license)

### What the...?
Are you one of the poor who have to make the same changes to a file on multiple servers with PuTTY? You don't want to do this manually on each server? You are tired of not working cluster solutions for PuTTY? You are still searching a tool which is a real cluster for PuTTY? Then you should give cPuTTY a try, your search might be over. cPuTTY recognises all keyboard and mouse events which were sent to a PuTTY window and forwards them to all other clustered PuTTY windows. Type character by character once for multiple windows - in real-time!

### Features
* Add PuTTY windows to a cluster, remove them from a cluster or kill the whole cluster with shortcuts
* All keyboard and mouse events within a cluster are forwarded to all other clustered PuTTY windows
* Each key and shortcut on your keyboard - even mouse commands (right-click only) - are supported
* PuTTY forks like FuTTY, KiTTY, PieTTY and TuTTY are also supported
* Fully support for UNIX commands like ``vi``
* No additional windows are needed - simply use your existing PuTTY windows
* Easy to use, works like expected :smile:

### Installing cPuTTY
* Download the attached ZIP file of [the latest release](https://github.com/dprokscha/cputty/releases)
* Execute *cputty.exe* or *cputty_x64.exe* (for Windows 64-bit)
* That's all - cPuTTY is running now!

cPuTTY should work with Windows Vista, Windows 7 and later.

### Working with cPuTTY
* Start cPuTTY
* Open multiple SHH connections with PuTTY
* Select a PuTTY window and press ``Ctrl`` + ``Alt`` + ``Page Up`` to add it to the cluster
* Add other PuTTY windows to the cluster as described above
* Now type something in one of the windows you have added to the cluster and have a look to the other clustered windows
* Play a bit - everything you do in a clustered window will be imitated by the other clustered windows
* To remove a window from a cluster, press ``Ctrl`` + ``Alt`` + ``Page Down``
* To kill the whole cluster, press ``Ctrl`` + ``Alt`` + ``End`` (if the cluster is empty, this shortcut closes cPuTTY)
* Press ``Ctrl`` + ``Alt`` + ``Home`` to bring all clustered windows to the top

### Shortcuts
``Ctrl`` + ``Alt`` + ``Page Up`` - Adds the active PuTTY window to the cluster.  
``Ctrl`` + ``Alt`` + ``Page Down`` - Removes the active PuTTY window from the cluster.  
``Ctrl`` + ``Alt`` + ``Home`` - Brings all clustered windows to the top.  
``Ctrl`` + ``Alt`` + ``End`` - Removes all windows from the cluster. Closes cPuTTY, if the cluster is empty.

### Troubleshooting
##### My antivirus software detects cPuTTY as a virus.
Ignore it. It's a false positive.
##### How can I start cPuTTY automatically on windows startup?
Simply create a shortcut of *cputty.exe* (or *cputty_x64.exe*) and move it to the autostart folder located in the Windows start menu.
##### The right-click (pasting things from the clipboard) does not work. What I am doing wrong?
Due to technical reasons the right-click only works for active PuTTY windows. Please activate a PuTTY window before you right-click.
##### How can I change the default shortcuts of cPuTTY?
Feel free to [download the source](cputty/cputty.ahk) and to change it - it is all made with [AutoHotKey](http://autohotkey.com/).
##### I have another question, bug or feature request.
Please use the [GitHub Issue Tracker](https://github.com/dprokscha/cputty/issues).

### Acknowledgements
Special thanks goes to [Dean Householder](http://www.deanhouseholder.com/). Your [PuTTY Keystroke Sender](http://www.deanhouseholder.com/projects/putty-keystroke-sender/) and finally its [source](http://www.autohotkey.com/board/topic/84935-send-keystrokes-to-multiple-windows/?p=541210) inspired me to develop a improved version of your idea.

### License
Copyright (c) 2013 Daniel Prokscha

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.