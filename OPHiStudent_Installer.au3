#NoTrayIcon
#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=C:\Users\vinhp\Desktop\Software\favicon.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Comment=OPHi Student Installer
#AutoIt3Wrapper_Res_Description=OPHi Student Installer
#AutoIt3Wrapper_Res_Fileversion=1.2.0.0
#AutoIt3Wrapper_Res_LegalCopyright=OPDO.VN
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;*****************************************
;OPHiStudent_Installer.au3 by vinhp
;Created with ISN AutoIt Studio v. 1.00
;*****************************************
#include <GuiTab.au3>
#include <StaticConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiButton.au3>
#include <EditConstants.au3>
#include <_ControlHover.au3>
#include <String.au3>
#include <APIGdiConstants.au3>
#include <WinAPIGdi.au3>
FileInstall('segoeui.ttf', @TempDir & '\segoeui.ttf', 1)
_WinAPI_AddFontResourceEx( @TempDir & '\segoeui.ttf', $FR_PRIVATE) ; load font

Global $SETTING[18] = ["Shift", "Alt", "O", "Shift", "Alt", "T", "Shift", "Alt", "S", "Shift", "Alt", "N", "Ctrl", "Alt", "N", "Ctrl", "Alt", "R"]

Global $INSTALLER_Control[10], $INSTALLER_STATE = -1, $back, $huy
Global $MAINGUI = GUICreate("OPHi Student Installer", 388, 390, -1, -1, $WS_POPUP, -1)
GUISetBkColor(0x0072C6, $MAINGUI)
GUICtrlCreateLabel("", 0, 362, 392, 32, -1, -1)
GUICtrlSetState(-1, BitOR($GUI_SHOW, $GUI_DISABLE))
GUICtrlSetBkColor(-1, "0x008AF0")
GUICtrlCreateLabel("", 0, 0, 381, 121, -1, $GUI_WS_EX_PARENTDRAG)
GUICtrlSetBkColor(-1, "-2")
FileInstall('Logo.bmp', @TempDir & "\Logo.bmp", 1)
GUICtrlCreatePic(@TempDir & "\Logo.bmp", 147, 27, 94, 94, -1, -1)
$back = GUICtrlCreateLabel("[Quay lại]", 284, 370, 47, 15, -1, -1)
GUICtrlSetFont(-1, 8, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xEEEEEE")
GUICtrlSetBkColor(-1, "-2")
GUICtrlSetCursor(-1, 0)
GUICtrlCreateLabel("v1.2 - opdo.vn", 16, 370, 112, 15, -1, -1)
GUICtrlSetFont(-1, 8, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xEEEEEE")
GUICtrlSetBkColor(-1, "-2")
$huy = GUICtrlCreateLabel("[Hủy bỏ]", 337, 370, 44, 15, -1, -1)
GUICtrlSetFont(-1, 8, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xEEEEEE")
GUICtrlSetBkColor(-1, "-2")
GUICtrlSetCursor(-1, 0)

Global $tab = GUICtrlCreateTab(-1000, -1000)

GUICtrlCreateTabItem("tab0")
Global $tab0_button
GUICtrlCreateLabel("Xin chào!" & @CRLF & "Rất vui được làm quen với bạn", 20, 170, 349, 57, $SS_CENTER, -1)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
if RegRead('HKEY_CURRENT_USER\SOFTWARE\opdo\HiStudent','Path') <> '' Then
	GUICtrlSetData (-1,"Cập nhật mới!" & @CRLF & "Đây là phiên bản 1.2")
EndIf
$tab0_button = GUICtrlCreateLabel("Xin chào", 150, 245, 91, 24, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "0x008AF0")
_ControlHover(2, $MAINGUI, $tab0_button)


GUICtrlCreateTabItem("tab1")
Global $tab1_button, $tab1_name, $name
GUICtrlCreateLabel("Mình tên là OPHi Student" & @CRLF & "Mình là một phần mềm hỗ trợ học tập" & @CRLF & "Còn bạn tên gì?", 21, 160, 351, 71, $SS_CENTER, -1)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
$tab1_button = GUICtrlCreateLabel("Đồng ý", 147, 292, 91, 24, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "0x008AF0")
_ControlHover(2, $MAINGUI, $tab1_button)
$tab1_name = GUICtrlCreateInput("", 111, 248, 164, 25, $ES_CENTER, 0)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "0x0072C6")
GUICtrlCreateLabel("", 109, 275, 169, 2, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1) ; line
GUICtrlSetBkColor(-1, "0xFFFFFF")


GUICtrlCreateTabItem("tab2")
Global $tab2_button, $tab2_text
$tab2_text = GUICtrlCreateLabel('', 21, 160, 351, 89, $SS_CENTER, -1)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
$tab2_button = GUICtrlCreateLabel("Đồng ý", 147, 310, 91, 24, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "0x008AF0")
_ControlHover(2, $MAINGUI, $tab2_button)
$tab2_info = GUICtrlCreateLabel("Xem thêm thông tin về mình", 20, 259, 351, 18, $SS_CENTER, -1)
GUICtrlSetFont(-1, 10, 400, 4, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlSetCursor(-1, 4)

GUICtrlCreateTabItem("tab3")
Global $tab3_button, $tab3_check1, $tab3_check2, $tab3_check3
$tab3_check1 = GUICtrlCreateLabel("☒ Cho phép mình khởi động cùng hệ thống", 21, 152, 351, 20, $SS_CENTER, -1)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
$tab3_button = GUICtrlCreateLabel("Đồng ý", 148, 319, 91, 24, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "0x008AF0")
_ControlHover(2, $MAINGUI, $tab3_button)
GUICtrlCreateLabel("Đừng lo, mình 'mi nhon' lắm :D", 21, 180, 351, 18, $SS_CENTER, -1)
GUICtrlSetFont(-1, 9, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
$tab3_check2 = GUICtrlCreateLabel("☒ Tạo shortcut của mình tại Desktop", 21, 205, 351, 20, $SS_CENTER, -1)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel("Sẽ tiện hơn khi bạn tìm mình ❤", 21, 233, 351, 18, $SS_CENTER, -1)
GUICtrlSetFont(-1, 9, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
$tab3_check3 = GUICtrlCreateLabel("☒ Mình sẽ hoạt động bằng quyền admin", 21, 257, 351, 20, $SS_CENTER, -1)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel("Để mình quản lý dữ liệu thôi ♛", 21, 285, 351, 18, $SS_CENTER, -1)
GUICtrlSetFont(-1, 9, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")

GUICtrlCreateTabItem("tab4")
Global $tab4_button, $tab4_button2, $tab4_path, $path
$tab4_button = GUICtrlCreateLabel("Đồng ý", 147, 291, 91, 24, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "0x008AF0")
_ControlHover(2, $MAINGUI, $tab4_button)

$tab4_path = GUICtrlCreateInput(RegRead('HKEY_CURRENT_USER\SOFTWARE\opdo\HiStudent','Path') = '' ? @ProgramFilesDir & "\opdo\HiStudent" : RegRead('HKEY_CURRENT_USER\SOFTWARE\opdo\HiStudent','Path'), 80, 235, 190, 21, $ES_READONLY, 0)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "0x0072C6")
GUICtrlCreateLabel("", 77, 265, 203, 2, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "0xFFFFFF")
$tab4_button2 = GUICtrlCreateLabel("Chọn", 280, 231, 44, 36, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0x008AF0")
GUICtrlSetBkColor(-1, "0xFFFFFF")
GUICtrlCreateLabel("Chọn nhà cho mình nha 😊" & @CRLF & "Ý mình là: cài mình ở đâu ấy!", 20, 160, 351, 54, $SS_CENTER, -1)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")

GUICtrlCreateTabItem("tab5")
Global $tab5_button, $tab5_button2
$tab5_button = GUICtrlCreateLabel("Đồng ý", 150, 277, 91, 24, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "0x008AF0")
_ControlHover(2, $MAINGUI, $tab5_button)
GUICtrlCreateLabel("Bằng việc ấn nút đồng ý cài đặt cũng đồng nghĩa với việc bạn chấp thuận điều khoản sử dụng của nhà phát triển", 21, 197, 351, 33, $SS_CENTER, -1)
GUICtrlSetFont(-1, 9, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
$tab5_button2 = GUICtrlCreateLabel("Đọc điều khoản sứ dụng", 21, 240, 351, 19, $SS_CENTER, -1)
GUICtrlSetFont(-1, 9, 400, 4, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlSetCursor(-1, 4)
GUICtrlCreateLabel("Sẵn sàng chưa, mình sẽ bắt đầu cài đặt ✌", 21, 166, 351, 31, $SS_CENTER, -1)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")

GUICtrlCreateTabItem("tab6")
Global $tab6_text
$tab6_text = GUICtrlCreateLabel("", 0, 210, 388, 45, $SS_CENTER, -1)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")

GUICtrlCreateTabItem("tab7")
Global $tab7_button
$tab7_button = GUICtrlCreateLabel("Đồng ý", 147, 299, 91, 24, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "0x008AF0")
_ControlHover(2, $MAINGUI, $tab7_button)
GUICtrlCreateLabel("Nếu gặp bất kỳ vấn đề gì cần hỗ trợ, xin liên hệ với chúng tôi:" & @CRLF & "" & @CRLF & "✉ Email: imopdo@opdo.vn" & @CRLF & "★ Website: http://opdo.vn" & @CRLF & "☏ Điện thoại: 0120 7575 299", 21, 190, 351, 92, $SS_CENTER, -1)
GUICtrlSetFont(-1, 9, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel("HOÀN TẤT RỒI 👍", 21, 154, 351, 31, $SS_CENTER, -1)
GUICtrlSetFont(-1, 15, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")

GUICtrlCreateTabItem("tab8")
Global $tab8_button
$tab8_button = GUICtrlCreateLabel("Bắt đầu", 147, 298, 91, 24, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "0x008AF0")
_ControlHover(2, $MAINGUI, $tab8_button)
$tab8_hd = GUICtrlCreateLabel("Đọc hướng dẫn sử dụng", 10, 210, 372, 21, $SS_CENTER, -1)
GUICtrlSetFont(-1, 9, 400, 4, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlSetCursor(-1, 4)
$tab8_web = GUICtrlCreateLabel("Truy cập trang web", 10, 231, 372, 21, $SS_CENTER, -1)
GUICtrlSetFont(-1, 9, 400, 4, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlSetCursor(-1, 4)
$tab8_donate = GUICtrlCreateLabel("Donate cho tác giả", 10, 252, 372, 21, $SS_CENTER, -1)
GUICtrlSetFont(-1, 9, 400, 4, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlSetCursor(-1, 4)
GUICtrlCreateLabel("Được tạo bởi VinhPham" & @CRLF & "với ❤ dành cho bạn", 0, 150, 388, 45, $SS_CENTER, -1)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")

GUISetState(@SW_SHOW, $MAINGUI)

_NextTab()
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $tab5_button2
			FileInstall('Dieukhoan.mht',@TempDir&'\Dieukhoan.mht')
			ShellExecute(@TempDir&'\Dieukhoan.mht')
		Case $tab8_hd
			ShellExecute($path & '\help.chm')
		Case $tab8_donate
			ShellExecute('http://www.opdo.vn/p/ong-gop-cho-tac-gia.html')
		Case $tab2_info, $tab8_web
			ShellExecute('http://hi.opdo.vn')
		Case $back
			If $INSTALLER_STATE > 0 Then
					If RegRead('HKEY_CURRENT_USER\SOFTWARE\opdo\HiStudent','Path') <> '' Then
		if $INSTALLER_STATE = 4 Then $INSTALLER_STATE = 1
					Else

	EndIf
				$INSTALLER_STATE -= 2
				_NextTab()
			EndIf
		Case $huy
			If MsgBox(4 + 48, "Thông báo", "Bạn có muốn ngưng cài đặt?") = 6 Then Exit
		Case $tab7_button
			_NextTab()
		Case $tab8_button
			ShellExecute($path & '\OPHi_Student.exe')
			Exit
		Case $tab5_button
			_NextTab()
			GUICtrlSetData($tab6_text, 'Đang cài bộ fonts...')
			_CheckFont()
			Sleep(1000)
			GUICtrlSetData($tab6_text, 'Đang cài chương trình...')
			_Install()
			Sleep(1000)
			GUICtrlSetData($tab6_text, 'Đang nạp dữ liệu...')
			_ApplyData()
			Sleep(1000)
			_NextTab()
		Case $tab4_button
			$path = GUICtrlRead($tab4_path)
			If FileExists($path) Then
				If RegRead('HKEY_CURRENT_USER\SOFTWARE\opdo\HiStudent','Path') = '' Then
				If MsgBox(48 + 4, 'Thông báo', 'Thư mục này đã tồn tại, bạn có muốn cài đặt mình vào đó?') = 6 Then _NextTab()
				Else
					_NextTab()
				EndIf
			Else
				_NextTab()
			EndIf

		Case $tab4_button2
			$folder = FileSelectFolder("Chọn thư mục", "")
			If Not @error And $folder <> '' Then GUICtrlSetData($tab4_path, $folder & '\HiStudent')
		Case $tab3_button
			_NextTab()
		Case $tab3_check1, $tab3_check2
			If StringLeft(GUICtrlRead($nMsg), 1) = '☒' Then
				GUICtrlSetData($nMsg, '☐' & StringTrimLeft(GUICtrlRead($nMsg), 1))
			Else
				GUICtrlSetData($nMsg, '☒' & StringTrimLeft(GUICtrlRead($nMsg), 1))
			EndIf
		Case $tab2_button
			_NextTab()
		Case $tab0_button
			If RegRead('HKEY_CURRENT_USER\SOFTWARE\opdo\HiStudent','Path') <> '' Then
				_NextTab(4)
			Else
				_NextTab()
			EndIf
		Case $tab1_button
			If GUICtrlRead($tab1_name) <> '' Then
				$name = StringUpper(StringLeft(GUICtrlRead($tab1_name), 1)) & StringTrimLeft(GUICtrlRead($tab1_name), 1)
				GUICtrlSetData($tab2_text, "Mình được lập trình để hỗ trợ bạn trong việc học tập như tạo ghi chú, lập lịch và thời khóa biểu cùng nhắc nhở cho bạn" & @CRLF & "Hi vọng " & $name & " và mình sẽ sớm thân nhau!")
				_NextTab()
			Else
				MsgBox(48, "Thông báo", "Khoan đã, hãy cho mình biết tên bạn đi ^^")
			EndIf

	EndSwitch

	If _ControlHover(0, $MAINGUI) Then
		$control = @extended
		GUICtrlSetColor($control, "0x008AF0")
		GUICtrlSetBkColor($control, "0xFFFFFF")
	Else
		$control = @extended
		GUICtrlSetColor($control, "0xFFFFFF")
		GUICtrlSetBkColor($control, "0x008AF0")
	EndIf
WEnd
Func _NextTab($sl = 1)

	$INSTALLER_STATE += $sl
	_GUICtrlTab_SetCurFocus($tab, $INSTALLER_STATE)
	If $INSTALLER_STATE = 0 Or $INSTALLER_STATE > 5 Then
		If $INSTALLER_STATE <> 0 Then GUICtrlSetState($huy, $GUI_HIDE)
		GUICtrlSetState($back, $GUI_HIDE)
	Else
		GUICtrlSetState($huy, $GUI_SHOW)
		GUICtrlSetState($back, $GUI_SHOW)
	EndIf
EndFunc   ;==>_NextTab

Func _IniWrite($file, $sec, $key, $value)
	Return IniWrite($file, $sec, $key, _StringToHex($value))
EndFunc   ;==>_IniWrite
Func _Install()
	DirCreate($path & '\Data')
	DirCreate($path & '\Data\NOTE')
	DirCreate($path & '\Images\Process')
	FileInstall('help.chm', $path & '\help.chm', 1)
	if ProcessExists('Uninstaller.exe') Then ProcessClose('Uninstaller.exe')
	FileInstall('Uninstaller.exe', $path & '\Uninstaller.exe', 1)
	if ProcessExists('OPHi_Student.exe') Then ProcessClose('OPHi_Student.exe')
	FileInstall('OPHi_Student.exe', $path & '\OPHi_Student.exe', 1)
	FileInstall('Startup.exe', $path & '\Startup.exe', 1)
	FileInstall('nen.png', $path & '\Images\Process\nen.png', 1)
	If RegRead('HKEY_CURRENT_USER\SOFTWARE\opdo\HiStudent','Path') = '' Then FileInstall('GHICHUMAU.rtf',$path & '\Data\NOTE\GHICHUMAU.rtf',1)
	FileInstall('fontawesome.ttf',$path & '\Data\fontawesome.ttf',1)
EndFunc   ;==>_Install
Func _ApplyData()
	If RegRead('HKEY_CURRENT_USER\SOFTWARE\opdo\HiStudent','Path') = '' Then
	DirCreate($path & '\Data')
	_IniWrite($path & '\Data\Database.opdo', 'Pro5', 'Name', $name)
	_Iniwrite($path & '\Data\Database.opdo', 'NOTE', "GHICHUMAU", '[Ghi chú mẫu][0][1][0][584][535][396][102][0x800080][255][106]')
	For $i = 0 To 17
		_IniWrite($path & '\Data\Database.opdo', "Pro5", "Setting_Hotkey_" & Int($i / 3) & '_' & Mod($i, 3), $SETTING[$i])
	Next

	RegWrite('HKEY_CURRENT_USER\SOFTWARE\opdo\HiStudent', 'Path', 'REG_SZ', $path)
	If StringLeft(GUICtrlRead($tab3_check1), 1) = '☒' Then
		_IniWrite($path & '\Data\Database.opdo', 'Pro5', 'Startup', 1)
		FileCreateShortcut($path & '\OPHi_Student.exe', @StartupDir & '\OPHi_Student.lnk')
	Else
		_IniWrite($path & '\Data\Database.opdo', 'Pro5', 'Startup', 0)
	EndIf
	If StringLeft(GUICtrlRead($tab3_check2), 1) = '☒' Then
		FileCreateShortcut($path & '\OPHi_Student.exe', @DesktopDir & '\OPHi Student')
	EndIf
	EndIf
EndFunc   ;==>_ApplyData
Func _CheckFont()
	If Not FileExists(@WindowsDir & '\Fonts\segoeui.ttf') Then
		FileInstall('segoeui.ttf', @TempDir & '\segoeui.ttf', 1)
		_InstallFont(@TempDir & '\segoeui.ttf')
		FileDelete(@TempDir & '\segoeui.ttf')
	EndIf
	If Not FileExists(@WindowsDir & '\Fonts\segoeuib.ttf') Then
		FileInstall('segoeuib.ttf', @TempDir & '\segoeuib.ttf', 1)
		_InstallFont(@TempDir & '\segoeuib.ttf')
		FileDelete(@TempDir & '\segoeuib.ttf')
	EndIf
	If Not FileExists(@WindowsDir & '\Fonts\segoeuii.ttf') Then
		FileInstall('segoeuii.ttf', @TempDir & '\segoeuii.ttf', 1)
		_InstallFont(@TempDir & '\segoeuii.ttf')
		FileDelete(@TempDir & '\segoeuii.ttf')
	EndIf
	If Not FileExists(@WindowsDir & '\Fonts\segoeuil.ttf') Then
		FileInstall('segoeuil.ttf', @TempDir & '\segoeuil.ttf', 1)
		_InstallFont(@TempDir & '\segoeuil.ttf')
		FileDelete(@TempDir & '\segoeuil.ttf')
	EndIf
	If Not FileExists(@WindowsDir & '\Fonts\segoeuisl.ttf') Then
		FileInstall('segoeuisl.ttf', @TempDir & '\segoeuisl.ttf', 1)
		_InstallFont(@TempDir & '\segoeuisl.ttf')
		FileDelete(@TempDir & '\segoeuisl.ttf')
	EndIf
	If Not FileExists(@WindowsDir & '\Fonts\segoeuiz.ttf') Then
		FileInstall('segoeuiz.ttf', @TempDir & '\segoeuiz.ttf', 1)
		_InstallFont(@TempDir & '\segoeuiz.ttf')
		FileDelete(@TempDir & '\segoeuiz.ttf')
	EndIf
	If Not FileExists(@WindowsDir & '\Fonts\seguibl.ttf') Then
		FileInstall('seguibl.ttf', @TempDir & '\seguibl.ttf', 1)
		_InstallFont(@TempDir & '\seguibl.ttf')
		FileDelete(@TempDir & '\seguibl.ttf')
	EndIf
	If Not FileExists(@WindowsDir & '\Fonts\seguibli.ttf') Then
		FileInstall('seguibli.ttf', @TempDir & '\seguibli.ttf', 1)
		_InstallFont(@TempDir & '\seguibli.ttf')
		FileDelete(@TempDir & '\seguibli.ttf')
	EndIf
	If Not FileExists(@WindowsDir & '\Fonts\seguili.ttf') Then
		FileInstall('seguili.ttf', @TempDir & '\seguili.ttf', 1)
		_InstallFont(@TempDir & '\seguili.ttf')
		FileDelete(@TempDir & '\seguili.ttf')
	EndIf
	If Not FileExists(@WindowsDir & '\Fonts\seguisb.ttf') Then
		FileInstall('seguisb.ttf', @TempDir & '\seguisb.ttf', 1)
		_InstallFont(@TempDir & '\seguisb.ttf')
		FileDelete(@TempDir & '\seguisb.ttf')
	EndIf
	If Not FileExists(@WindowsDir & '\Fonts\seguisbi.ttf') Then
		FileInstall('seguisbi.ttf', @TempDir & '\seguisbi.ttf', 1)
		_InstallFont(@TempDir & '\seguisbi.ttf')
		FileDelete(@TempDir & '\seguisbi.ttf')
	EndIf
	If Not FileExists(@WindowsDir & '\Fonts\seguisli.ttf') Then
		FileInstall('seguisli.ttf', @TempDir & '\seguisli.ttf', 1)
		_InstallFont(@TempDir & '\seguisli.ttf')
		FileDelete(@TempDir & '\seguisli.ttf')
	EndIf


EndFunc   ;==>_CheckFont

Func _InstallFont($sSourceFile, $sFontDescript = "", $sFontsPath = "")
	Local Const $HWND_BROADCAST = 0xFFFF
	Local Const $WM_FONTCHANGE = 0x1D

	If $sFontsPath = "" Then $sFontsPath = @WindowsDir & "\fonts"

	Local $sFontName = StringRegExpReplace($sSourceFile, "^.*\\", "")
	If Not FileCopy($sSourceFile, $sFontsPath & "\" & $sFontName, 1) Then Return SetError(1, 0, 0)

	Local $hSearch = FileFindFirstFile($sSourceFile)
	Local $iFontIsWildcard = StringRegExp($sFontName, "\*|\?")
	Local $aRet, $hGdi32_DllOpen = DllOpen("gdi32.dll")

	If $hSearch = -1 Then Return SetError(2, 0, 0)
	If $hGdi32_DllOpen = -1 Then Return SetError(3, 0, 0)

	While 1
		$sFontName = FileFindNextFile($hSearch)
		If @error Then ExitLoop

		If $iFontIsWildcard Then $sFontDescript = StringRegExpReplace($sFontName, "\.[^\.]*$", "")

		$aRet = DllCall($hGdi32_DllOpen, "Int", "AddFontResource", "str", $sFontsPath & "\" & $sFontName)
		If IsArray($aRet) And $aRet[0] > 0 Then
			RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts", _
					$sFontDescript, "REG_SZ", $sFontsPath & "\" & $sFontName)
		EndIf
	WEnd

	DllClose($hGdi32_DllOpen)
	DllCall("user32.dll", "Int", "SendMessage", "hwnd", $HWND_BROADCAST, "int", $WM_FONTCHANGE, "int", 0, "int", 0)
	Return 1
EndFunc   ;==>_InstallFont

