#q::
if WinExist("ahk_exe KeePassXC.exe")
	WinActivate
else
	Run "C:\Program Files\KeePassXC\KeePassXC.exe"
Return