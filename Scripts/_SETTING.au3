;_SETTING.au3
Global $MAINSETTING_Control4, $MAINSETTING_Tab, $MAINSETTING_Note1, $MAINSETTING_Note2, $MAINSETTING_TKB1, $MAINSETTING_TKB2
Global $MAIN_SETTING, $MAINSETTING_Control[18], $MAINSETTING_Control1, $MAINSETTING_Control2, $MAINSETTING_Control3, $MAINSETTING_Name, $MAINSETTING_NameOK
Func _SettingGUI()
	If IsHWnd($MAIN_SETTING) Then
		For $i = 0 To 3
			GUICtrlSetBkColor(($MAIN_Tab5_Control[2])[$i], '-2')
			GUICtrlSetColor(($MAIN_Tab5_Control[2])[$i], '0xFFFFFF')
		Next
		GUICtrlSetBkColor(($MAIN_Tab5_Control[2])[0], '0xFFFFFF')
		GUICtrlSetColor(($MAIN_Tab5_Control[2])[0], '0x008AF0')
		_GUIScrollBars_SetScrollInfoPos($MAIN_SETTING, $SB_VERT, 0)
		_GUICtrlTab_SetCurFocus($MAINSETTING_Tab, 0)
		Return 0
	EndIf
	$MAIN_SETTING = GUICreate("OPHi Student", 580, 240 - 23, 280, 260 + 23, $WS_POPUP, -1) ;353
	_WinAPI_SetParent($MAIN_SETTING, $GUIMAIN)
	GUISetBkColor(0x0072C6, $MAIN_SETTING)
	$MAINSETTING_Tab = GUICtrlCreateTab(-1000, -1000)
	GUICtrlCreateTabItem('tab0')
	GUICtrlCreateLabel("Số popup thông báo tối đa:", 30, 52, 194, 24, -1, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$MAINSETTING_Control1 = GUICtrlCreateLabel("4", 228, 52, 32, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	_GUICtrl_OnHoverRegister(-1, "_MainSettingHover", "_MainSettingNormal", "_Nothing", "_MainSettingClick")
	GUICtrlCreateLabel("và thời gian hiển thị", 274, 52, 132, 24, -1, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$MAINSETTING_Control2 = GUICtrlCreateLabel("5", 414, 52, 32, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	_GUICtrl_OnHoverRegister(-1, "_MainSettingHover", "_MainSettingNormal", "_Nothing", "_MainSettingClick")
	GUICtrlCreateLabel("giây.", 456, 52, 42, 24, -1, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("Độ mờ cửa sổ thông báo:", 30, 88, 184, 24, -1, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$MAINSETTING_Control3 = GUICtrlCreateLabel("không mờ", 228, 88, 98, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	_GUICtrl_OnHoverRegister(-1, "_MainSettingHover", "_MainSettingNormal", "_Nothing", "_MainSettingClick")
	GUICtrlCreateLabel("Thiết lập phím tắt:", 30, 122, 124, 24, -1, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("- Mở giao diện chương trình:", 70, 160, 204, 24, -1, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("- Tạo nhanh ghi chú mới:", 70, 279, 204, 24, -1, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	$MAINSETTING_Control4 = GUICtrlCreateLabel("☑ Khởi động chương trình cùng hệ thống", 30, 17, 312, 24, -1, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_Nothing", "_Nothing", "_Nothing", "_MainSettingClick")
	If Number(_InIRead($Database, "Pro5", "Startup", 1)) = 0 Then
		GUICtrlSetData($MAINSETTING_Control4, "□ Khởi động chương trình cùng hệ thống")
	EndIf
	

	GUICtrlCreateLabel("- Tạo nhanh nhắc mở mới:", 70, 308, 204, 24, -1, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("- Mở nhanh lịch biểu:", 70, 190, 204, 24, -1, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("- Mở nhanh thời khóa biểu:", 70, 220, 204, 24, -1, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("- Mở nhanh ghi chú:", 70, 250, 204, 24, -1, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$MAINSETTING_Control[0] = GUICtrlCreateLabel("Ctrl", 294, 160, 74, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	$MAINSETTING_Control[1] = GUICtrlCreateLabel("Ctrl", 376, 160, 74, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	$MAINSETTING_Control[2] = GUICtrlCreateLabel("Ctrl", 457, 160, 74, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")

	$MAINSETTING_Control[3] = GUICtrlCreateLabel("Ctrl", 294, 190, 74, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	$MAINSETTING_Control[4] = GUICtrlCreateLabel("Ctrl", 376, 190, 74, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	$MAINSETTING_Control[5] = GUICtrlCreateLabel("Ctrl", 457, 190, 74, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")

	$MAINSETTING_Control[6] = GUICtrlCreateLabel("Ctrl", 294, 220, 74, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	$MAINSETTING_Control[7] = GUICtrlCreateLabel("Ctrl", 376, 220, 74, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	$MAINSETTING_Control[8] = GUICtrlCreateLabel("Ctrl", 457, 220, 74, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")

	$MAINSETTING_Control[9] = GUICtrlCreateLabel("Ctrl", 294, 250, 74, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	$MAINSETTING_Control[10] = GUICtrlCreateLabel("Ctrl", 376, 250, 74, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	$MAINSETTING_Control[11] = GUICtrlCreateLabel("Ctrl", 457, 250, 74, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")

	$MAINSETTING_Control[12] = GUICtrlCreateLabel("Ctrl", 294, 279, 74, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	$MAINSETTING_Control[13] = GUICtrlCreateLabel("Ctrl", 376, 279, 74, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	$MAINSETTING_Control[14] = GUICtrlCreateLabel("Ctrl", 457, 279, 74, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")

	$MAINSETTING_Control[15] = GUICtrlCreateLabel("Ctrl", 294, 308, 74, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	$MAINSETTING_Control[16] = GUICtrlCreateLabel("Ctrl", 376, 308, 74, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	$MAINSETTING_Control[17] = GUICtrlCreateLabel("Ctrl", 457, 308, 74, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	For $i = 0 To 17
		_GUICtrl_OnHoverRegister($MAINSETTING_Control[$i], "_MainSettingHover", "_MainSettingNormal", "_Nothing", "_MainSettingClick")
		GUICtrlSetData($MAINSETTING_Control[$i], _InIRead($Database, "Pro5", "Setting_Hotkey_" & Int($i / 3) & '_' & Mod($i, 3), "None"))
		If Mod($i, 3) = 0 Then
			If GUICtrlRead($MAINSETTING_Control[$i]) <> 'Shift' And GUICtrlRead($MAINSETTING_Control[$i]) <> 'Ctrl' Then
				GUICtrlSetState($MAINSETTING_Control[$i + 1], $GUI_HIDE)
				GUICtrlSetState($MAINSETTING_Control[$i + 2], $GUI_HIDE)
				GUICtrlSetData($MAINSETTING_Control[$i], 'Tắt')
			EndIf
		ElseIf Mod($i, 3) = 1 Then
			If GUICtrlRead($MAINSETTING_Control[$i]) <> 'Alt' Then
				GUICtrlSetState($MAINSETTING_Control[$i + 1], $GUI_HIDE)
			EndIf
		EndIf
	Next

	GUICtrlSetData($MAINSETTING_Control1, _InIRead($Database, "Pro5", "Setting_Setting_1", "5"))
	GUICtrlSetData($MAINSETTING_Control2, _InIRead($Database, "Pro5", "Setting_Setting_2", "5"))
	GUICtrlSetData($MAINSETTING_Control3, StringSplit('Không mờ|Mờ 20%|Mờ 40%|Mờ 60%|Mờ 80%', '|')[Number(_InIRead($Database, "Pro5", "Setting_Setting_3", "1"))])

	$MAINSETTING_Name = GUICtrlCreateInput(_InIRead($Database, "Pro5", "name", 'bạn'), 125, 351, 160, 21, -1, 0)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x0072C6")
	GUICtrlCreateLabel("", 125, 376, 163, 2, -1, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0xFFFFFF")
	GUICtrlCreateLabel("Ngôn ngữ:", 30, 397, 88, 24, -1, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$MAINSETTING_Language = GUICtrlCreateLabel("Tiếng Việt", 125, 397, 119, 24, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	$MAINSETTING_NameOK = GUICtrlCreateLabel("OK", 285, 354, 38, 24, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetOnEvent(-1, '_Setting_SaveName')
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0x0072C6")
	GUICtrlSetBkColor(-1, "0xFFFFFF")
	GUICtrlCreateLabel("Tên của bạn:", 30, 354, 88, 24, -1, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateTabItem('tab1')

	$MAINSETTING_Note1 = GUICtrlCreateLabel("☑ Mở các ghi chú đã chọn ghim khi phần mềm khởi động", 30, 20, 422, 22, -1, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	If Number(_InIRead($Database, "Pro5", "Note1", 1)) = 0 Then
		GUICtrlSetData($MAINSETTING_Note1, "□ Mở các ghi chú đã chọn ghim khi phần mềm khởi động")
	EndIf
	
	_GUICtrl_OnHoverRegister(-1, "_Nothing", "_Nothing", "_Nothing", "_MainSettingClick")

	
	
	$MAINSETTING_Note2 = GUICtrlCreateLabel("☑ Sử dụng phím tắt trong ghi chú để định dạng", 30, 51, 422, 22, -1, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	If Number(_InIRead($Database, "Pro5", "Note2", 1)) = 0 Then
		GUICtrlSetData($MAINSETTING_Note2, "□ Sử dụng phím tắt trong ghi chú để định dạng")
	EndIf
	_GUICtrl_OnHoverRegister(-1, "_Nothing", "_Nothing", "_Nothing", "_MainSettingClick")

	GUICtrlCreateTabItem('tab2')
	$MAINSETTING_TKB1 = GUICtrlCreateLabel("□ Bật widget thời khóa biểu tuần", 30, 20, 258, 22, -1, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_Nothing", "_Nothing", "_Nothing", "_MainSettingClick")
	$MAINSETTING_TKB2 = GUICtrlCreateLabel("□ Bật widget thời khóa biểu ngày", 30, 52, 258, 22, -1, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_Nothing", "_Nothing", "_Nothing", "_MainSettingClick")
	If Number(_InIRead($Database, "Pro5", "TKB1", 0)) = 1 Then
		GUICtrlSetData($MAINSETTING_TKB1, "☑ Bật widget thời khóa biểu tuần")
	EndIf
	If Number(_InIRead($Database, "Pro5", "TKB2", 0)) = 1 Then
		GUICtrlSetData($MAINSETTING_TKB2, "☑ Bật widget thời khóa biểu ngày")
	EndIf
	
	GUICtrlCreateTabItem('tab3')
	GUICtrlCreateLabel("(Không có thiết lập trong mục này)", 30, 100, 531, 22, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	GUICtrlCreateTabItem('')
	_GUIScrollbars_Generate($MAIN_SETTING, 0, 441)
	GUISetState(@SW_SHOW, $MAIN_SETTING)
EndFunc   ;==>_SettingGUI
Func _Setting_SaveName()
	If GUICtrlRead($MAINSETTING_Name) <> '' Then
		_InIWrite($Database, "Pro5", "name", GUICtrlRead($MAINSETTING_Name))
		_MAIN_SetWelcome()
		_Msgbox(64, 'Thông báo', 'Từ nay mình sẽ gọi bạn là ' & GUICtrlRead($MAINSETTING_Name) & ' ^^')
	Else
		_Msgbox(16, 'Thông báo', 'Vui lòng cho mình biết tên bạn nha!')
	EndIf
EndFunc   ;==>_Setting_SaveName
Func _Setting_Save()
	If StringLeft(GUICtrlRead($MAINSETTING_Note1), 1) = '☑' Then
		_IniWrite($Database, "Pro5", "Note1", 1)
	Else
		_IniWrite($Database, "Pro5", "Note1", 0)
	EndIf
	If StringLeft(GUICtrlRead($MAINSETTING_Note2), 1) = '☑' Then
		_IniWrite($Database, "Pro5", "Note2", 1)
	Else
		_IniWrite($Database, "Pro5", "Note2", 0)
	EndIf
	If StringLeft(GUICtrlRead($MAINSETTING_TKB1), 1) = '☑' Then
		_IniWrite($Database, "Pro5", "TKB1", 1)
	Else
		_IniWrite($Database, "Pro5", "TKB1", 0)
	EndIf
	If StringLeft(GUICtrlRead($MAINSETTING_TKB2), 1) = '☑' Then
		_IniWrite($Database, "Pro5", "TKB2", 1)
	Else
		_IniWrite($Database, "Pro5", "TKB2", 0)
	EndIf
	_LoadWidget()
EndFunc   ;==>_Setting_Save

#Region MỘT SỐ HÀM LOAD SETTING
Global $SETTING_NUMBER_POPUP, $SETTING_POPUP_TIME, $SETTING_POPUP_TRANS, $SETTING_HOTKEY[6], $SETTING_HOTKEY_FUNC[6] = ['_MAIN_Show', '_ShowGUI_LICH', '_MoGUITKB', '_NOTE_ShowGUI', '_NOTE_NewNote', '_TKB_NewNhacNho']
Func _SETTING_LOAD_PROGRAMSETTING()
	If @Compiled Then
		If Number(_InIRead($Database, "Pro5", "Startup", 1)) = 1 Then FileCreateShortcut(@ScriptDir&'\Startup.exe', @StartupDir & '\Startup.lnk')
	EndIf
	$SETTING_NUMBER_POPUP = Number(_InIRead($Database, "Pro5", "Setting_Setting_1", "5"))
	$SETTING_POPUP_TIME = Number(_InIRead($Database, "Pro5", "Setting_Setting_2", "5"))
	$SETTING_POPUP_TRANS = (Number(_InIRead($Database, "Pro5", "Setting_Setting_3", "1")) - 1) * 50
	$SETTING_POPUP_TRANS = $SETTING_POPUP_TRANS = 0 ? 255 : $SETTING_POPUP_TRANS
	For $i = 0 To 17 Step 3
		If $SETTING_HOTKEY[Int($i / 3)] <> '' Then HotKeySet($SETTING_HOTKEY[Int($i / 3)])
		$SETTING_HOTKEY[Int($i / 3)] = ''
		If _InIRead($Database, "Pro5", "Setting_Hotkey_" & Int($i / 3) & '_0', "None") == 'Shift' Or _InIRead($Database, "Pro5", "Setting_Hotkey_" & Int($i / 3) & '_0', "None") == 'Ctrl' Then
			If _InIRead($Database, "Pro5", "Setting_Hotkey_" & Int($i / 3) & '_0', "None") == 'Shift' Then
				$SETTING_HOTKEY[Int($i / 3)] = '+'
			Else
				$SETTING_HOTKEY[Int($i / 3)] = '^'
			EndIf
			
			If _InIRead($Database, "Pro5", "Setting_Hotkey_" & Int($i / 3) & '_1', "None") == 'Alt' Then
				$SETTING_HOTKEY[Int($i / 3)] &= '!' & StringLower(_InIRead($Database, "Pro5", "Setting_Hotkey_" & Int($i / 3) & '_2', "A"))
			Else
				$SETTING_HOTKEY[Int($i / 3)] &= StringLower(_InIRead($Database, "Pro5", "Setting_Hotkey_" & Int($i / 3) & '_1', "A"))
			EndIf
		EndIf
		If $SETTING_HOTKEY[Int($i / 3)] <> '' Then
			
			HotKeySet($SETTING_HOTKEY[Int($i / 3)], $SETTING_HOTKEY_FUNC[Int($i / 3)])
		EndIf
	Next
EndFunc   ;==>_SETTING_LOAD_PROGRAMSETTING
Func _SETTING_NOTE_LoadStick()
	Local $temp = IniReadSection($Database, "NOTE")
	If @error Then Return 0
	For $i = 1 To $temp[0][0]
		$id_note = $temp[$i][0]
		If _EDITOR_GETEditSetting($id_note, 4) == '1' Then
			_NOTEEDIT_GUICreateControl($id_note)
		EndIf
	Next
EndFunc   ;==>_SETTING_NOTE_LoadStick
#EndRegion MỘT SỐ HÀM LOAD SETTING
