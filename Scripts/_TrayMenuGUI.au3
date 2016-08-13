;_TrayMenuGUI.au3
Global $TrayMenuGUI, $TrayMenu_Control[4][3], $TrayMenuTimer
TraySetToolTip('OPHi Student')
Func _TrayMenuGUI()
	If BitAND(WinGetState($GUIMAIN), 2) = 2 Then 
		GUISetState(@SW_RESTORE,$GUIMAIN)
		WinSetOnTop($GUIMAIN,'',1)
		WinSetOnTop($GUIMAIN,'',0)
		Return 0
	EndIf
	If IsHWnd($TrayMenuGUI) Then Return 0
	$TrayMenuGUI = GUICreate("OPHi Student", 458, 164, @DesktopWidth - 458 - 10, @DesktopHeight - 164, $WS_POPUP, BitOR($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW))
	GUISetBkColor(0x0072C6, $TrayMenuGUI)
	GUICtrlCreateLabel("OPHi Student", 20, 11, 381, 32, -1, -1)
	GUICtrlSetFont(-1, 16, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$TrayMenu_Control[0][0] = GUICtrlCreateLabel("", 20, 55, 93, 93, -1, -1)
	GUICtrlSetBkColor(-1, "0x008AF0")
	_GUICtrl_OnHoverRegister(-1, "_TrayMenuHover", "_TrayMenuNormal", "_Nothing", "_TrayMenuClick")
	$TrayMenu_Control[0][1] = GUICtrlCreateLabel($ICON_OPEN, 20, 66, 93, 36, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 25, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$TrayMenu_Control[0][2] = GUICtrlCreateLabel("Mở giao diện", 20, 110, 93, 32, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$TrayMenu_Control[1][0] = GUICtrlCreateLabel("", 129, 55, 93, 93, -1, -1)
	GUICtrlSetBkColor(-1, "0x008AF0")
	_GUICtrl_OnHoverRegister(-1, "_TrayMenuHover", "_TrayMenuNormal", "_Nothing", "_TrayMenuClick")
	$TrayMenu_Control[1][1] = GUICtrlCreateLabel($ICON_NOTE, 129, 66, 93, 36, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 25, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$TrayMenu_Control[1][2] = GUICtrlCreateLabel("Ghi chú mới", 129, 110, 93, 32, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$TrayMenu_Control[2][0] = GUICtrlCreateLabel("", 236, 55, 93, 93, -1, -1)
	GUICtrlSetBkColor(-1, "0x008AF0")
	_GUICtrl_OnHoverRegister(-1, "_TrayMenuHover", "_TrayMenuNormal", "_Nothing", "_TrayMenuClick")
	$TrayMenu_Control[2][1] = GUICtrlCreateLabel($ICON_ADD, 236, 66, 93, 36, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 25, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	Local $text = "Nhắc nhở mới"
	If Number($GUI_TKB[0]) <= 0 Then
		$text = 'Khóa biểu mới'
	Else
		Local $read = IniReadSection($Database, "TKB" & $GUI_TKB[1])
		If @error Then $text = 'Môn học mới'
	EndIf
	$TrayMenu_Control[2][2] = GUICtrlCreateLabel($text, 236, 110, 93, 32, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$TrayMenu_Control[3][0] = GUICtrlCreateLabel("", 343, 54, 93, 93, -1, -1)
	GUICtrlSetBkColor(-1, "0x008AF0")
	_GUICtrl_OnHoverRegister(-1, "_TrayMenuHover", "_TrayMenuNormal", "_Nothing", "_TrayMenuClick")
	$TrayMenu_Control[3][1] = GUICtrlCreateLabel("", 343, 65, 93, 36, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 25, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$TrayMenu_Control[3][2] = GUICtrlCreateLabel("Thoát", 343, 109, 93, 32, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	WinSetTrans($TrayMenuGUI, '', 0)
	GUISetState(@SW_SHOW, $TrayMenuGUI)
	Local $trans = 100
	For $i = @DesktopHeight - 164 To @DesktopHeight - 164 - 50 Step -5
		$trans += 5
		WinMove($TrayMenuGUI, '', Default, $i)
		WinSetTrans($TrayMenuGUI, '', $trans)
		Sleep(20)
	Next
	WinSetTrans($TrayMenuGUI, '', 255)
	$TrayMenuTimer = TimerInit()
EndFunc   ;==>_TrayMenuGUI
