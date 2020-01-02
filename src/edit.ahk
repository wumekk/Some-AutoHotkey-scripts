^e::
; TrayTip %Clipboard%
If !WinActive("ahk_exe Explorer.EXE")
{
	TrayTip WuAHK, Gdzie się patrzysz? Tylko Explorer.exe,, 33
	return ; brak pliku 
}
ClipSaved := ClipboardAll 
Clipboard :=  
Sleep 10
Send ^c
Sleep 10
if (Clipboard = "") {
	TrayTip WuAHK, Smutnabuzia.jpg - pusty schowek.,, 33
	Return
}
else {
	Splitpath, Clipboard, fname, fdir, fext, fnamene, fdrv
	StringLower, fext, fext
;	MsgBox,0x1000,,name=%fname%`ndir=%fdir%`next=%fext%`nnameNE=%fnamene%`ndrv=%fdrv%
	switch fext {
		case "jpg":	Run pbrush.exe "%Clipboard%"
		case "png":	Run pbrush.exe "%Clipboard%"
		case "bmp":	Run pbrush.exe "%Clipboard%"
		default:   	Run "C:\Program Files (x86)\Notepad++\notepad++.exe" "%Clipboard%"
	}
			
;	Run notepad.exe %Clipboard%
	Clipboard := ClipSaved 	; Restore the original clipboard.
}
Return
