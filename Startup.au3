;Startup.au3
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=C:\Users\vinhp\Desktop\Software\favicon.ico
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Res_Comment=OPHi Student
#AutoIt3Wrapper_Res_Description=OPHi Student
#AutoIt3Wrapper_Res_Fileversion=1.2.0.0
#AutoIt3Wrapper_Res_LegalCopyright=OPDO.VN
#Au3Stripper_Parameters=/so /tl
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#NoTrayIcon
Global Const $file = @ScriptDir&'\OPHi_Student.exe'
If FileExists($file) Then ShellExecute($file)
