#include <GuiTab.au3>

;myControl.au3
;chứa các hàm tương tác với Control

#Region Hiệu ứng control, tab dựa vào SSCtrlHover_Register
Func _Set_SSCtrlHover() ; Set hover các control
	; trong GUIMAIN
	For $i = 1 To 5
		_GUICtrl_OnHoverRegister($main_Tab[$i], "_TabHover", "_TabNormal", "_TabClick")
	Next
	_GUICtrl_OnHoverRegister($main_Tab1_menu1[0], "_MenuMainHover", "_MenuMainNormal", "_Nothing", "_MenuLichClick")
	_GUICtrl_OnHoverRegister($main_Tab1_menu1_right[0], "_MenuMainHover", "_MenuMainNormal", "_Nothing", "_MenuLichClick")
	_GUICtrl_OnHoverRegister($main_Tab1_menu1_left[0], "_MenuMainHover", "_MenuMainNormal", "_Nothing", "_MenuLichClick")
	For $i = 0 To 5
		
		_GUICtrl_OnHoverRegister($main_Tab2_menu2_NOTEHover[$i], "_MenuMainHover", "_MenuMainNormal", "_MenuMain_NoteClick")
		If $i <= 3 Then
			_GUICtrl_OnHoverRegister($main_Tab1_menu2_TKBHover[$i], "_MenuMainHover", "_MenuMainNormal", "_Nothing", "_MenuMain4Click")
			If $i < 3 Then
				_GUICtrl_OnHoverRegister($main_Tab1_menu3_button[1][$i], "_MenuMainHover", "_MenuMainNormal")
				_GUICtrl_OnHoverRegister($main_Tab4_menu3_button[1][$i], "_MenuMainHover", "_MenuMainNormal")
				If $i > 0 Then _GUICtrl_OnHoverRegister($main_Tab2_menu3_button[1][$i], "_MenuMainHover", "_MenuMainNormal")

			EndIf
		EndIf
	Next
	_GUICtrl_OnHoverRegister($main_Tab1_menu2_arrow[0], "_MenuMainHover", "_MenuMainNormal")
	_GUICtrl_OnHoverRegister($main_Tab1_menu2_arrow[1], "_MenuMainHover", "_MenuMainNormal")
	_GUICtrl_OnHoverRegister($main_Tab2_menu2_arrow[0], "_MenuMainHover", "_MenuMainNormal")
	_GUICtrl_OnHoverRegister($main_Tab2_menu2_arrow[1], "_MenuMainHover", "_MenuMainNormal")
	_GUICtrl_OnHoverRegister($main_Tab2_menu1[0], "_MenuMainHover", "_MenuMainNormal")
	_GUICtrl_OnHoverRegister($main_menutop_exit, "_MenuNoteHover", "_MenuNoteNormal")
	_GUICtrl_OnHoverRegister($main_menutop_mini, "_MenuNoteHover", "_MenuNoteNormal")
	_GUICtrl_OnHoverRegister($main_Tab4_menu2_arrow[0], "_MenuMainHover", "_MenuMainNormal", "_Nothing", "_MenuLichClick")
	_GUICtrl_OnHoverRegister($main_Tab4_menu2_arrow[1], "_MenuMainHover", "_MenuMainNormal", "_Nothing", "_MenuLichClick")
	_GUICtrl_OnHoverRegister($main_Tab4_menu1_arrow[0], "_MenuMainHover", "_MenuMainNormal", "_Nothing", "_MenuLichClick")
	_GUICtrl_OnHoverRegister($main_Tab4_menu1_arrow[1], "_MenuMainHover", "_MenuMainNormal", "_Nothing", "_MenuLichClick")
	
	_GUICtrl_OnHoverRegister($main_Tab4_menu1_control[0][1], "_MenuMainHover", "_MenuMainNormal", "_Nothing", "_MenuLichClick")
	_GUICtrl_OnHoverRegister($main_Tab4_menu1_control[0][2], "_MenuMainHover", "_MenuMainNormal", "_Nothing", "_MenuLichClick")
	_GUICtrl_OnHoverRegister($main_Tab4_menu1_control[0][3], "_MenuMainHover", "_MenuMainNormal", "_Nothing", "_MenuLichClick")
	_GUICtrl_OnHoverRegister($main_Tab4_menu2_control[0], "_MenuMainHover", "_MenuMainNormal")

	_GUICtrl_OnHoverRegister($main_Tab2_menu1_tkb[0][0], "_MenuMain4Hover", "_MenuMain4Normal", "_Nothing", "_MenuMain4Click")
	_GUICtrl_OnHoverRegister($main_Tab2_menu1_tkb[1][0], "_MenuMain4Hover", "_MenuMain4Normal", "_Nothing", "_MenuMain4Click")
	_GUICtrl_OnHoverRegister($main_Tab2_menu1_tkb[2][0], "_MenuMain4Hover", "_MenuMain4Normal", "_Nothing", "_MenuMain4Click")
	_GUICtrl_OnHoverRegister($main_Tab2_menu1_tkb[3][0], "_MenuMain4Hover", "_MenuMain4Normal")
	_GUICtrl_OnHoverRegister($main_Tab2_menu1_tkb[4][0], "_MenuMain4Hover", "_MenuMain4Normal")
	; GUI NOTE
	_GUICtrl_OnHoverRegister($NOTE_Group[3][0], "_MenuNoteHover", "_MenuNoteNormal")
	
	; GUI LICH
	_GUICtrl_OnHoverRegister($LICH_Button[0][5], "_MenuLichHover", "_MenuLichNormal", "_Nothing", "_MenuLichClick")
	_GUICtrl_OnHoverRegister($LICH_Button[0][1], "_MenuLichHover", "_MenuLichNormal", "_Nothing", "_MenuLichClick")
	_GUICtrl_OnHoverRegister($LICH_Button[0][0], "_MenuLichHover", "_MenuLichNormal", "_Nothing", "_MenuLichClick")
	_GUICtrl_OnHoverRegister($LICH_Button[0][2], "_MenuLichHover", "_MenuLichNormal", "_Nothing", "_MenuLichClick")
	_GUICtrl_OnHoverRegister($LICH_Button[0][3], "_MenuLichHover", "_MenuLichNormal", "_Nothing", "_MenuLichClick")
	_GUICtrl_OnHoverRegister($LICH_Button[0][4], "_MenuLichHover", "_MenuLichNormal", "_Nothing", "_MenuLichClick")
	_GUICtrl_OnHoverRegister($LICH_Menu_Mon[0], "_MenuLichHover", "_MenuLichNormal")
	_GUICtrl_OnHoverRegister($LICH_Menu_Mon[1], "_MenuLichHover", "_MenuLichNormal")
	_GUICtrl_OnHoverRegister($LICH_Menu_Mon[2], "_MenuLichHover", "_MenuLichNormal")

	_GUICtrl_OnHoverRegister($LICH_Button2[0], "_MenuLichHover", "_MenuLichNormal", "_Nothing", "_LICH2Click")
	_GUICtrl_OnHoverRegister($LICH_Button2[1], "_MenuLichHover", "_MenuLichNormal")
	_GUICtrl_OnHoverRegister($LICH_Button2[2], "_MenuLichHover", "_MenuLichNormal")
	

EndFunc   ;==>_Set_SSCtrlHover
; Các func trả về của SSCtrlHover


Func _MainSettingClick($iCtrlID)
	Switch $iCtrlID
		Case $MAINSETTING_Note2, $MAINSETTING_Note1, $MAINSETTING_TKB1, $MAINSETTING_TKB2
			If StringLeft(GUICtrlRead($iCtrlID), 1) = '☑' Then
				GUICtrlSetData($iCtrlID, "□" & StringTrimLeft(GUICtrlRead($iCtrlID), 1))
			Else
				GUICtrlSetData($iCtrlID, "☑" & StringTrimLeft(GUICtrlRead($iCtrlID), 1))
			EndIf
			If $iCtrlID = $MAINSETTING_TKB1 Or $iCtrlID = $MAINSETTING_TKB2 Then _LoadWidget()
			_Setting_Save()
		Case ($MAIN_Tab5_Control[2])[0]
			_GUIScrollBars_SetScrollInfoPos($MAIN_SETTING, $SB_VERT, 0)
			For $i = 0 To 3
				GUICtrlSetBkColor(($MAIN_Tab5_Control[2])[$i], '-2')
				GUICtrlSetColor(($MAIN_Tab5_Control[2])[$i], '0xFFFFFF')
			Next
			GUICtrlSetBkColor(($MAIN_Tab5_Control[2])[0], '0xFFFFFF')
			GUICtrlSetColor(($MAIN_Tab5_Control[2])[0], '0x008AF0')
			_GUICtrlTab_SetCurFocus($MAINSETTING_Tab, 0)
		Case ($MAIN_Tab5_Control[2])[1]
			_GUIScrollBars_SetScrollInfoPos($MAIN_SETTING, $SB_VERT, 0)
			For $i = 0 To 3
				GUICtrlSetBkColor(($MAIN_Tab5_Control[2])[$i], '-2')
				GUICtrlSetColor(($MAIN_Tab5_Control[2])[$i], '0xFFFFFF')
			Next
			GUICtrlSetBkColor(($MAIN_Tab5_Control[2])[1], '0xFFFFFF')
			GUICtrlSetColor(($MAIN_Tab5_Control[2])[1], '0x008AF0')
			_GUICtrlTab_SetCurFocus($MAINSETTING_Tab, 1)
		Case ($MAIN_Tab5_Control[2])[2]
			_GUIScrollBars_SetScrollInfoPos($MAIN_SETTING, $SB_VERT, 0)
			For $i = 0 To 3
				GUICtrlSetBkColor(($MAIN_Tab5_Control[2])[$i], '-2')
				GUICtrlSetColor(($MAIN_Tab5_Control[2])[$i], '0xFFFFFF')
			Next
			GUICtrlSetBkColor(($MAIN_Tab5_Control[2])[2], '0xFFFFFF')
			GUICtrlSetColor(($MAIN_Tab5_Control[2])[2], '0x008AF0')
			_GUICtrlTab_SetCurFocus($MAINSETTING_Tab, 2)
		Case ($MAIN_Tab5_Control[2])[3]
			_GUIScrollBars_SetScrollInfoPos($MAIN_SETTING, $SB_VERT, 0)
			For $i = 0 To 3
				GUICtrlSetBkColor(($MAIN_Tab5_Control[2])[$i], '-2')
				GUICtrlSetColor(($MAIN_Tab5_Control[2])[$i], '0xFFFFFF')
			Next
			GUICtrlSetBkColor(($MAIN_Tab5_Control[2])[3], '0xFFFFFF')
			GUICtrlSetColor(($MAIN_Tab5_Control[2])[3], '0x008AF0')
			_GUICtrlTab_SetCurFocus($MAINSETTING_Tab, 3)
			
		Case $MAINSETTING_Control4
			If StringLeft(GUICtrlRead($MAINSETTING_Control4), 1) = '☑' Then
				GUICtrlSetData($MAINSETTING_Control4, "□ Khởi động chương trình cùng hệ thống")
				_IniWrite($Database, "Pro5", "Startup", 0)
				FileDelete(@StartupDir & '\Startup.lnk')
			Else
				GUICtrlSetData($MAINSETTING_Control4, "☑ Khởi động chương trình cùng hệ thống")
				_IniWrite($Database, "Pro5", "Startup", 1)
				FileCreateShortcut(@ScriptDir&'\Startup.exe', @StartupDir & '\Startup.lnk')
			EndIf
			
		Case $MAINSETTING_Control1
			_ADDEVENT_ChangeLabelSetting($iCtrlID, '3|4|5|6|7|8|9|10')
			_IniWrite($Database, "Pro5", "Setting_Setting_1", GUICtrlRead($MAINSETTING_Control1))
		Case $MAINSETTING_Control2
			_ADDEVENT_ChangeLabelSetting($iCtrlID, '3|4|5|6|7|8|9|10')
			_IniWrite($Database, "Pro5", "Setting_Setting_2", GUICtrlRead($MAINSETTING_Control2))
		Case $MAINSETTING_Control3
			_ADDEVENT_ChangeLabelSetting($iCtrlID, 'Không mờ|Mờ 20%|Mờ 40%|Mờ 60%|Mờ 80%')
			_IniWrite($Database, "Pro5", "Setting_Setting_3", _ADDEVENT_StringInSlot(GUICtrlRead($MAINSETTING_Control3), 'Không mờ|Mờ 20%|Mờ 40%|Mờ 60%|Mờ 80%'))
		Case Else
			For $i = 0 To 17
				If $iCtrlID = $MAINSETTING_Control[$i] Then
					Switch Mod($i, 3)
						Case 0
							_ADDEVENT_ChangeLabelSetting($iCtrlID, 'Ctrl|Shift|Tắt')
							If GUICtrlRead($iCtrlID) = 'Tắt' Then
								GUICtrlSetState($MAINSETTING_Control[$i + 1], $GUI_HIDE)
								GUICtrlSetState($MAINSETTING_Control[$i + 2], $GUI_HIDE)
							Else
								GUICtrlSetState($MAINSETTING_Control[$i + 1], $GUI_SHOW)
								GUICtrlSetState($MAINSETTING_Control[$i + 2], $GUI_HIDE)
								GUICtrlSetData($MAINSETTING_Control[$i + 1], 'Bấm chọn')
								GUICtrlSetData($MAINSETTING_Control[$i + 2], 'Bấm chọn')
							EndIf
							_IniWrite($Database, "Pro5", "Setting_Hotkey_" & Int($i / 3) & '_' & Mod($i, 3), GUICtrlRead($MAINSETTING_Control[$i]))
						Case 1
							Local $text = ''
							For $j = 65 To 90
								
								Local $flag = True
								For $k = 1 To 17 Step 3
									If $i = $k Then ContinueLoop
									If GUICtrlRead($MAINSETTING_Control[$k - 1]) == GUICtrlRead($MAINSETTING_Control[$i - 1]) And Chr($j) == GUICtrlRead($MAINSETTING_Control[$k]) And BitAND(GUICtrlGetState($MAINSETTING_Control[$k]), $GUI_SHOW) = $GUI_SHOW Then
										$flag = False
										ExitLoop
									EndIf
								Next
								If $flag Then $text = $text = '' ? Chr($j) : $text & '|' & Chr($j)
							Next
							_ADDEVENT_ChangeLabelSetting($iCtrlID, 'Alt|' & $text)
							If GUICtrlRead($iCtrlID) <> 'Alt' Then
								GUICtrlSetState($MAINSETTING_Control[$i + 1], $GUI_HIDE)
							Else
								GUICtrlSetState($MAINSETTING_Control[$i + 1], $GUI_SHOW)
								GUICtrlSetData($MAINSETTING_Control[$i + 1], 'Bấm chọn')
							EndIf
							_IniWrite($Database, "Pro5", "Setting_Hotkey_" & Int($i / 3) & '_' & Mod($i, 3), GUICtrlRead($MAINSETTING_Control[$i]))
						Case 2
							Local $text = ''
							For $j = 65 To 90
								Local $flag = True
								For $k = 2 To 17 Step 3
									If $i = $k Then ContinueLoop
									If GUICtrlRead($MAINSETTING_Control[$k - 1]) == GUICtrlRead($MAINSETTING_Control[$i - 1]) And GUICtrlRead($MAINSETTING_Control[$k - 2]) == GUICtrlRead($MAINSETTING_Control[$i - 2]) And Chr($j) == GUICtrlRead($MAINSETTING_Control[$k]) And BitAND(GUICtrlGetState($MAINSETTING_Control[$k]), $GUI_SHOW) = $GUI_SHOW Then
										$flag = False
										ExitLoop
									EndIf
								Next
								If $flag Then $text = $text = '' ? Chr($j) : $text & '|' & Chr($j)
							Next
							_ADDEVENT_ChangeLabelSetting($iCtrlID, $text)
							_IniWrite($Database, "Pro5", "Setting_Hotkey_" & Int($i / 3) & '_' & Mod($i, 3), GUICtrlRead($MAINSETTING_Control[$i]))
					EndSwitch
				EndIf
			Next
			
	EndSwitch
EndFunc   ;==>_MainSettingClick
Func _MainSettingHover($iCtrlID)
	GUICtrlSetColor($iCtrlID, "0x008AF0")
	GUICtrlSetBkColor($iCtrlID, "0xFFFFFF")
EndFunc   ;==>_MainSettingHover
Func _MainSettingNormal($iCtrlID)
	GUICtrlSetColor($iCtrlID, "0xFFFFFF")
	GUICtrlSetBkColor($iCtrlID, "0x008AF0")
EndFunc   ;==>_MainSettingNormal
Func _TrayMenuClick($iCtrlID)
	$TrayMenuTimer = -1
	_TrayMenuGUI_Del()
	Switch $iCtrlID
		Case $TrayMenu_Control[0][0]
			_MAIN_Show()
		Case $TrayMenu_Control[1][0]
			_NOTE_NewNote()
		Case $TrayMenu_Control[2][0]
			_TKB_NewNhacNho()
		Case $TrayMenu_Control[3][0]
			_exit()
	EndSwitch
	
EndFunc   ;==>_TrayMenuClick
Func _TrayMenuHover($iCtrlID)
	$TrayMenuTimer = TimerInit()
	For $i = 0 To 3
		If $iCtrlID = $TrayMenu_Control[$i][0] Then
			GUICtrlSetBkColor($iCtrlID, "0xFFFFFF")
			GUICtrlSetColor($TrayMenu_Control[$i][1], 0x008AF0)
			GUICtrlSetColor($TrayMenu_Control[$i][2], 0x008AF0)
			Return 0
		EndIf
	Next
EndFunc   ;==>_TrayMenuHover
Func _TrayMenuNormal($iCtrlID)
	$TrayMenuTimer = TimerInit()
	For $i = 0 To 3
		If $iCtrlID = $TrayMenu_Control[$i][0] Then
			GUICtrlSetBkColor($iCtrlID, "0x008AF0")
			GUICtrlSetColor($TrayMenu_Control[$i][1], 0xFFFFFF)
			GUICtrlSetColor($TrayMenu_Control[$i][2], 0xFFFFFF)
			Return 0
		EndIf
	Next
EndFunc   ;==>_TrayMenuNormal
Func _MainTab5Click($iCtrlID)
	Local $control = $MAIN_Tab5_Control[0]
	Switch $iCtrlID
		Case ($MAIN_Tab5_Control[1])[1]
			ShellExecute('http://www.opdo.vn/p/ong-gop-cho-tac-gia.html')
		Case $control[2]
			ShellExecute('http://hi.opdo.vn')
		Case $control[3]
			ShellExecute('http://fb.com/nanozip95')
		Case $control[4]
			ShellExecute(@ScriptDir&'\help.chm')
		Case $control[5]
			if _Msgbox(48+4,'Thông báo','Bạn có muốn kiểm tra cập nhật?') = 6 Then
				if _CheckUpdate() Then

					$ver = IniRead(@TempDir&'\update.ini','Update','Version',$VERSION)
					if _Msgbox(48+4,'Thông báo','Có bản cập nhật mới '&$ver&', bạn có muốn mở trang tải về?') = 6 Then
						$link = IniRead(@TempDir&'\update.ini','Update','Link','http://opdo.vn')
						ShellExecute($link)
					EndIf
					Else
					_Msgbox(64,'Thông báo','Bạn đang dùng phiên bản mới nhất!')
				EndIf
			EndIf
		Case $control[7]
			_Msgbox(64, 'OnEventFunc', 'Thanks to Martin Gibson (martin)')
		Case $control[8]
			_Msgbox(64, 'StringSize', 'Thanks to Melba23 (AutoIT Forum)')
		Case $control[9]
			_Msgbox(64, 'GUIScrollbars_Ex', 'Thanks to Melba23 (AutoIT Forum)')
		Case $control[10]
			_Msgbox(64, 'GUICtrlOnHover', "Thanks to G.Sandler a.k.a MrCreatoR (CreatoR's Lab, www.creator-lab.ucoz.ru, www.autoit-script.ru)")
		Case $control[11]
			_Msgbox(64, 'Tks to', "Icons - Thanks to Yashied (AutoIT Forum)"&@CRLF&'Font Awesome - Thanks to fontawesome.io')
	EndSwitch
EndFunc   ;==>_MainTab5Click
Func _MainTab5Hover($iCtrlID)
	Switch $iCtrlID
		Case $MAIN_Tab5_Button[1], $MAIN_Tab5_Button[2], $MAIN_Tab5_Button[3]
			For $i = 1 To 3
				If $iCtrlID = $MAIN_Tab5_Button[$i] Then
					If $MAIN_Tab5_Button[0] <> $i Then
						GUICtrlSetColor($iCtrlID, "0x0072C6")
						GUICtrlSetBkColor($iCtrlID, "0xFFFFFF")
					EndIf
					ExitLoop
				EndIf
			Next
		Case Else
			GUICtrlSetColor($iCtrlID, "0xFFFFFF")
			GUICtrlSetBkColor($iCtrlID, "0x008AF0")

	EndSwitch
EndFunc   ;==>_MainTab5Hover
Func _MainTab5Normal($iCtrlID)
	Switch $iCtrlID
		Case $MAIN_Tab5_Button[1], $MAIN_Tab5_Button[2], $MAIN_Tab5_Button[3]
			For $i = 1 To 3
				If $iCtrlID = $MAIN_Tab5_Button[$i] Then
					If $MAIN_Tab5_Button[0] <> $i Then
						GUICtrlSetColor($iCtrlID, "0xFFFFFF")
						GUICtrlSetBkColor($iCtrlID, "-2")
					EndIf
					ExitLoop
				EndIf
			Next
		Case Else
			GUICtrlSetColor($iCtrlID, "0x0072C6")
			GUICtrlSetBkColor($iCtrlID, "0xFFFFFF")
	EndSwitch
EndFunc   ;==>_MainTab5Normal

Func _Notification_Click($iCtrlID)
	For $i = 1 To Number($NOTIFI_GUI[0])
		Local $control = $NOTIFI_GUI[$i]
		If IsArray($control) Then
			If $iCtrlID = $control[3] Then
				_Notification_DelGUI($i)
			ElseIf $iCtrlID = $control[1] Or $iCtrlID = $control[2] Then
				Local $id = StringSplit($control[5], '@')[2]
				If Number(StringSplit($control[5], '@')[1]) = 1 Then
					_GUITKB($id)
				ElseIf Number(StringSplit($control[5], '@')[1]) = 0 Then
					
					_LICH_ShowEventTab(StringSplit(_ADDEVENT_GetSetting($id, 5), '/')[1], StringSplit(_ADDEVENT_GetSetting($id, 5), '/')[2], StringSplit(_ADDEVENT_GetSetting($id, 5), '/')[3])
				ElseIf Number(StringSplit($control[5], '@')[1]) = 3 Then
					ShellExecute(StringSplit($control[5], '@')[2])
				EndIf
			EndIf
		EndIf
	Next
EndFunc   ;==>_Notification_Click
Func _MenuMain4Click($iCtrlID)
	For $i = 0 To 3
		If $i < 3 Then
			If $iCtrlID = $main_Tab2_menu1_tkb[2 - $i][0] Then
				If $MAIN_tkb[0] >= $i + 1 Then
					Local $GUI_Temp = _DisableGUI($GUIMAIN)
					If _TKB_ADD_MON($GUI_TKB[1], $main_Tab2_menu1_tkb[2 - $i][3]) Then _TKB_LoadDataMain()
					_EnableGUI($GUIMAIN, $GUI_Temp)
					Return 1
				EndIf
			EndIf
		EndIf
		If $iCtrlID = $main_Tab1_menu2_TKBHover[$i] And Number($MAIN_tkb[0]) > $i Then
			
			_GUITKB()
			Return 0
		EndIf
	Next
	

	
EndFunc   ;==>_MenuMain4Click
Func _MenuMain4Hover($iCtrlID)
	For $i = 0 To 4
		If $i < 3 Then
			If $iCtrlID = $main_Tab2_menu1_tkb[2 - $i][0] Then
				If $MAIN_tkb[0] >= $i + 1 Then
					Local $read = StringSplit(_InIRead($Database, "TKB" & $GUI_TKB[1], $main_Tab2_menu1_tkb[2 - $i][3], ''), '|')
					Local $color = _Change_Color_Editor($read[2], 20)
					GUICtrlSetBkColor($iCtrlID, $color)
				EndIf
				Return 0
			EndIf
		Else
			If $iCtrlID = $main_Tab2_menu1_tkb[$i][0] Then
				GUICtrlSetBkColor($iCtrlID, 0xFFFFFF)
				GUICtrlSetColor($main_Tab2_menu1_tkb[$i][1], 0x008AF0)
				GUICtrlSetColor($main_Tab2_menu1_tkb[$i][2], 0x008AF0)
				Return 0
			EndIf
		EndIf
	Next
EndFunc   ;==>_MenuMain4Hover
Func _MenuMain4Normal($iCtrlID)
	For $i = 0 To 4
		If $i < 3 Then
			If $iCtrlID = $main_Tab2_menu1_tkb[2 - $i][0] Then
				If $MAIN_tkb[0] >= $i + 1 Then
					Local $read = StringSplit(_InIRead($Database, "TKB" & $GUI_TKB[1], $main_Tab2_menu1_tkb[2 - $i][3], ''), '|')
					Local $color = $read[2]
					GUICtrlSetBkColor($iCtrlID, $color)
				EndIf
				Return 0
			EndIf
		Else
			If $iCtrlID = $main_Tab2_menu1_tkb[$i][0] Then
				GUICtrlSetBkColor($iCtrlID, 0x008AF0)
				GUICtrlSetColor($main_Tab2_menu1_tkb[$i][1], 0xFFFFFF)
				GUICtrlSetColor($main_Tab2_menu1_tkb[$i][2], 0xFFFFFF)
				Return 0
			EndIf
		EndIf
	Next
EndFunc   ;==>_MenuMain4Normal

Func _TKBClick($iCtrlID)
	Switch $iCtrlID
		Case $TBK_Tab1
			If $GUITKB_State <> 1 Then
				If $GUI_TKB[0] > 0 Then _TKB2_LoadMon_TKB($GUI_TKB[1])
			EndIf
		Case $TBK_Tab2
			If $GUITKB_State <> 2 Then
				If $GUI_TKB[0] > 0 Then _TKB2_LoadMon($GUI_TKB[1])
			EndIf
			
		Case $TBK_Button_dstkb[1]
			If $GUI_TKB[1] == '' Or $GUITKB_State > 2 Then Return 0
			Local $temp = $GUI_TKB[$GUI_TKB[0]]
			For $i = $GUI_TKB[0] To 2 Step -1
				$GUI_TKB[$i] = $GUI_TKB[$i - 1]
			Next
			$GUI_TKB[1] = $temp
			If $GUITKB_State = 1 Then
				_TKB2_LoadMon_TKB($GUI_TKB[1])
			ElseIf $GUITKB_State = 2 Then
				_TKB2_LoadMon($GUI_TKB[1])
			EndIf
			_TKB_LoadDataMain()
		Case $TBK_Button_dstkb[2]
			If $GUI_TKB[1] == '' Or $GUITKB_State > 2 Then Return 0
			Local $temp = $GUI_TKB[1]
			For $i = 1 To $GUI_TKB[0] - 1
				$GUI_TKB[$i] = $GUI_TKB[$i + 1]
			Next
			$GUI_TKB[$GUI_TKB[0]] = $temp
			If $GUITKB_State = 1 Then
				_TKB2_LoadMon_TKB($GUI_TKB[1])
			ElseIf $GUITKB_State = 2 Then
				_TKB2_LoadMon($GUI_TKB[1])
			EndIf
			_TKB_LoadDataMain()
		Case $TBK_Button_dstkb[4]
			If $GUI_TKB[1] == '' Or $GUITKB_State > 2 Then Return 0
			If _TKB_ADD_TKB() = 1 Then
				
				$GUI_TKB[0] += 1
				For $i = $GUI_TKB[0] To 2 Step -1
					$GUI_TKB[$i] = $GUI_TKB[$i - 1]
				Next
				Local $read = IniReadSection($Database, 'TKB')
				$GUI_TKB[1] = $read[$read[0][0]][0]
				If $GUITKB_State = 1 Then
					_TKB2_LoadMon_TKB($GUI_TKB[1])
				ElseIf $GUITKB_State = 2 Then
					_TKB2_LoadMon($GUI_TKB[1])
				EndIf
				_TKB_LoadDataMain()
			EndIf
			
		Case $TBK_Button_dstkb[3], $TBK_Button_dstkb[0]
			If $GUI_TKB[1] == '' Or $GUITKB_State > 2 Then Return 0
			Local $temp = _TKB_ADD_TKB($GUI_TKB[1])
			If $temp = 1 Then
				If $GUITKB_State = 1 Then
					_TKB2_LoadMon_TKB($GUI_TKB[1], 1)
				ElseIf $GUITKB_State = 2 Then
					_TKB2_LoadMon($GUI_TKB[1], 1)
				EndIf
				_TKB_LoadDataMain()
			ElseIf $temp = 2 Then
				If $GUITKB_State = 1 Then
					_TKB2_LoadMon_TKB($GUI_TKB[1])
				ElseIf $GUITKB_State = 2 Then
					_TKB2_LoadMon($GUI_TKB[1])
				EndIf
				_TKB_LoadDataMain()
			EndIf
		Case $TBK_Button2
			If $GUI_TKB[0] > 0 And $GUITKB_State < 2 Then
				Local $read = IniReadSection($Database, "TKB" & $GUI_TKB[1])
				If Not @error Then
					Local $GUI_Temp = _DisableGUI($GUITKB)
					If $read[0][0] > 0 Then _TKB_MON_ADD_NHACNHO($GUI_TKB[1], $read[1][0])
					_EnableGUI($GUITKB, $GUI_Temp)
				EndIf
			EndIf
		Case $TBK_Button1
			Local $GUI_Temp = _DisableGUI($GUITKB)
			If $GUITKB_State = 3 Then
				Local $read = IniReadSection($Database, "TKB" & $GUI_TKB[1])
				If Not @error Then
					If $read[0][0] > 0 Then
						If _TKB_MON_ADD_NHACNHO($GUI_TKB[1], $GUI_TKB[$GUI_TKB[0] + 1]) Then _TKB2_LoadNhacNho($GUI_TKB[1], $GUI_TKB[$GUI_TKB[0] + 1])
					EndIf
				EndIf
			Else
				
				If $GUI_TKB[0] > 0 Then
					_TKB_TaoMon()
				Else
					If _TKB_ADD_TKB() = 1 Then
						
						$GUI_TKB[0] += 1
						For $i = $GUI_TKB[0] To 2 Step -1
							$GUI_TKB[$i] = $GUI_TKB[$i - 1]
						Next
						Local $read = IniReadSection($Database, 'TKB')
						$GUI_TKB[1] = $read[$read[0][0]][0]
						If $GUITKB_State = 1 Then
							_TKB2_LoadMon_TKB($GUI_TKB[1])
						ElseIf $GUITKB_State = 2 Then
							_TKB2_LoadMon($GUI_TKB[1])
						EndIf
						_TKB_LoadDataMain()
					EndIf
				EndIf
			EndIf
			_EnableGUI($GUITKB, $GUI_Temp)
		Case $TBK_Button3
			_TKB_HideGUI()
		Case Else
			For $i = 1 To $TKB2_Mon_Control[0][0]
				Local $control = $TKB2_Mon_Control[$i][0]
				If IsArray($control) Then
					If $iCtrlID = $control[0] Then
						If $GUITKB_State = 2 Then
							
							_TKB2_LoadNhacNho($GUI_TKB[1], $TKB2_Mon_Control[$i][1])
						ElseIf $GUITKB_State = 3 Then
							Local $GUI_Temp = _DisableGUI($GUITKB)
							Local $ma_mon_hoc = StringSplit($TKB2_Mon_Control[$i][1], '@')[2]
							If _TKB_MON_ADD_NHACNHO($GUI_TKB[1], $ma_mon_hoc, StringSplit($TKB2_Mon_Control[$i][1], '@')[1]) Then _TKB2_LoadNhacNho($GUI_TKB[1], $ma_mon_hoc)
							_EnableGUI($GUITKB, $GUI_Temp)
						EndIf
						Return 0
					EndIf
					If $GUITKB_State > 2 Then
						If $iCtrlID = $control[4] Then
							If StringLeft(GUICtrlRead($control[3]), 1) = '□' Then
								GUICtrlSetData($control[3], '☑' & StringTrimLeft(GUICtrlRead($control[3]), 1))
								For $j = 0 To UBound($control) - 1
									GUICtrlSetColor($control[$j], 0xFFFFFF)
									GUICtrlSetBkColor($control[$j], 0x808080)
								Next
								Local $read = _InIRead($Database, "TKB" & $GUI_TKB[1] & '-' & StringSplit($TKB2_Mon_Control[$i][1], '@')[2], StringSplit($TKB2_Mon_Control[$i][1], '@')[1], '')
								_IniWrite($Database, "TKB" & $GUI_TKB[1] & '-' & StringSplit($TKB2_Mon_Control[$i][1], '@')[2], StringSplit($TKB2_Mon_Control[$i][1], '@')[1], StringTrimRight($read, 1) & '1')
							Else
								GUICtrlSetData($control[3], '□' & StringTrimLeft(GUICtrlRead($control[3]), 1))
								Local $read = StringSplit(_InIRead($Database, "TKB" & $GUI_TKB[1], StringSplit($TKB2_Mon_Control[$i][1], '@')[2], ''), '|')
								Local $color = $read[2]
								
								For $j = 0 To UBound($control) - 1
									GUICtrlSetColor($control[$j], _EDITOR_ColorText($color))
									If $j > 0 Then
										GUICtrlSetBkColor($control[$j], '-2')
									Else
										GUICtrlSetBkColor($control[$j], $color)
									EndIf
								Next
								Local $read = _InIRead($Database, "TKB" & $GUI_TKB[1] & '-' & StringSplit($TKB2_Mon_Control[$i][1], '@')[2], StringSplit($TKB2_Mon_Control[$i][1], '@')[1], '')
								_IniWrite($Database, "TKB" & $GUI_TKB[1] & '-' & StringSplit($TKB2_Mon_Control[$i][1], '@')[2], StringSplit($TKB2_Mon_Control[$i][1], '@')[1], StringTrimRight($read, 1) & '0')
							EndIf
							Return 0
						EndIf
					EndIf
					
				EndIf
			Next
			For $i = 1 To $GUITKB2_MonHoc[0][0]
				If $iCtrlID = $GUITKB2_MonHoc[$i][0] Then
					Local $GUI_Temp = _DisableGUI($GUITKB)
					If _TKB_ADD_MON($GUI_TKB[1], StringSplit($GUITKB2_MonHoc[$i][1], '@')[1]) Then _TKB2_LoadMon_TKB($GUI_TKB[1])
					_EnableGUI($GUITKB, $GUI_Temp)
					Return 0
				EndIf
			Next
	EndSwitch
EndFunc   ;==>_TKBClick
Func _TKBHover($iCtrlID)
	Switch $iCtrlID
		Case $TBK_Tab1
			If $GUITKB_State <> 1 And $GUITKB_State < 3 Then
				GUICtrlSetColor($iCtrlID, "0xFFFFFF")
				GUICtrlSetBkColor($iCtrlID, "0x0072C6")
			EndIf
		Case $TBK_Tab2
			If $GUITKB_State <> 2 And $GUITKB_State < 3 Then
				GUICtrlSetColor($iCtrlID, "0xFFFFFF")
				GUICtrlSetBkColor($iCtrlID, "0x0072C6")
			EndIf
			
		Case $TBK_Button_dstkb[1], $TBK_Button_dstkb[2], $TBK_Button_dstkb[3], $TBK_Button_dstkb[4], $TBK_Button_dstkb[0]
			GUICtrlSetColor($iCtrlID, "0x0063B1")
			GUICtrlSetBkColor($iCtrlID, "0xFFFFFF")
		Case $TBK_Button1, $TBK_Button2, $TBK_Button3
			GUICtrlSetBkColor($iCtrlID, "0x0063B1")
		Case Else
			For $i = 1 To $TKB2_Mon_Control[0][0]
				Local $control = $TKB2_Mon_Control[$i][0]
				If IsArray($control) Then
					If $iCtrlID = $control[0] Or ($GUITKB_State = 3 And $iCtrlID = $control[4]) Then
						If $GUITKB_State = 2 Then
							Local $read = StringSplit(_InIRead($Database, "TKB" & $GUI_TKB[1], $TKB2_Mon_Control[$i][1], ''), '|')
							Local $color = _Change_Color_Editor($read[2], 20)
							GUICtrlSetBkColor($control[0], $color)
						ElseIf $GUITKB_State = 3 Then
							If StringLeft(GUICtrlRead($control[3]), 1) = '□' Then
								Local $read = StringSplit(_InIRead($Database, "TKB" & $GUI_TKB[1], StringSplit($TKB2_Mon_Control[$i][1], '@')[2], ''), '|')
								Local $color = _Change_Color_Editor($read[2], 20)
								GUICtrlSetBkColor($control[0], $color)
							EndIf
						EndIf
						Return 0
					EndIf
				EndIf
			Next
			For $i = 1 To $GUITKB2_MonHoc[0][0]
				If $iCtrlID = $GUITKB2_MonHoc[$i][0] Then
					Local $read = StringSplit(_InIRead($Database, "TKB" & $GUI_TKB[1], StringSplit($GUITKB2_MonHoc[$i][1], '@')[1], ''), '|')
					Local $color = _Change_Color_Editor($read[2], 20)
					GUICtrlSetBkColor($iCtrlID, $color)
					Return 0
				EndIf
			Next
	EndSwitch
EndFunc   ;==>_TKBHover
Func _TKBNormal($iCtrlID)
	Switch $iCtrlID
		Case $TBK_Tab1
			If $GUITKB_State <> 1 And $GUITKB_State < 3 Then
				GUICtrlSetColor($iCtrlID, "0x0072C6")
				GUICtrlSetBkColor($iCtrlID, "-2")
			EndIf
		Case $TBK_Tab2
			If $GUITKB_State <> 2 And $GUITKB_State < 3 Then
				GUICtrlSetColor($iCtrlID, "0x0072C6")
				GUICtrlSetBkColor($iCtrlID, "-2")
			EndIf
			
		Case $TBK_Button_dstkb[1], $TBK_Button_dstkb[2], $TBK_Button_dstkb[3], $TBK_Button_dstkb[4], $TBK_Button_dstkb[0]
			GUICtrlSetColor($iCtrlID, "0xFFFFFF")
			GUICtrlSetBkColor($iCtrlID, "0x0063B1")
		Case $TBK_Button1, $TBK_Button2, $TBK_Button3
			GUICtrlSetColor($iCtrlID, "0xFFFFFF")
			GUICtrlSetBkColor($iCtrlID, "0x0072C6")
		Case Else
			For $i = 1 To $TKB2_Mon_Control[0][0]
				Local $control = $TKB2_Mon_Control[$i][0]
				If $iCtrlID = $control[0] Or ($GUITKB_State = 3 And $iCtrlID = $control[4]) Then
					If $GUITKB_State = 2 Then
						Local $read = StringSplit(_InIRead($Database, "TKB" & $GUI_TKB[1], $TKB2_Mon_Control[$i][1], ''), '|')
						Local $color = $read[2]
						GUICtrlSetBkColor($control[0], $color)
					ElseIf $GUITKB_State = 3 Then
						If StringLeft(GUICtrlRead($control[3]), 1) = '□' Then
							Local $read = StringSplit(_InIRead($Database, "TKB" & $GUI_TKB[1], StringSplit($TKB2_Mon_Control[$i][1], '@')[2], ''), '|')
							Local $color = $read[2]
							GUICtrlSetBkColor($control[0], $color)
						EndIf
					EndIf
					Return 0
				EndIf
			Next
			
			For $i = 1 To $GUITKB2_MonHoc[0][0]
				If $iCtrlID = $GUITKB2_MonHoc[$i][0] Then
					Local $read = StringSplit(_InIRead($Database, "TKB" & $GUI_TKB[1], StringSplit($GUITKB2_MonHoc[$i][1], '@')[1], ''), '|')
					Local $color = $read[2]
					GUICtrlSetBkColor($iCtrlID, $color)
					Return 0
				EndIf
			Next
	EndSwitch
EndFunc   ;==>_TKBNormal

#cs BỎ
	;Func _ChooseDateHover($iCtrlID)
	;	GUICtrlSetBkColor($iCtrlID, "0x008AF0")

	;EndFunc   ;==>_ChooseDateHover
	;Func _ChooseDateNormal($iCtrlID)
	;	GUICtrlSetBkColor($iCtrlID, "-2")

	;EndFunc   ;==>_ChooseDateNormal
	Func _ChooseDateClick($iCtrlID)
	Switch $iCtrlID
	Case $CHOOSEDATE_Label[1]
	_CHOOSEDATE_Pre()
	Case $CHOOSEDATE_Label[2]
	_CHOOSEDATE_Next()
	Case $CHOOSEDATE_Date[7 * 6]
	$CHOOSEDATE_choose[1] = @YEAR
	$CHOOSEDATE_choose[0] = @MON
	$CHOOSEDATE_choose[2] = @MDAY
	Case $CHOOSEDATE_Label[0]
	If $CHOOSEDATE_Tab = 0 Then
	_CHOOSEDATE_ChooseTab(1)
	ElseIf $CHOOSEDATE_Tab = 1 Then
	_CHOOSEDATE_ChooseTab(2)
	EndIf
	Case $CHOOSEDATE_Mon[12]
	$CHOOSEDATE_choose[0] = @MON
	If $CHOOSEDATE_type = 1 Then
	_CHOOSEDATE_ChooseTab()
	Else
	$CHOOSEDATE_choose[2] = -1
	EndIf
	Case $CHOOSEDATE_Year[12]
	$CHOOSEDATE_choose[1] = @YEAR
	_CHOOSEDATE_ChooseTab(1)

	Case Else
	For $i = 0 To 11

	If $iCtrlID = $CHOOSEDATE_Mon[$i] Then
	$CHOOSEDATE_choose[0] = $i + 1
	If $CHOOSEDATE_type = 1 Then
	_CHOOSEDATE_ChooseTab()
	Else
	$CHOOSEDATE_choose[2] = -1
	EndIf
	Return 0
	EndIf
	If $iCtrlID = $CHOOSEDATE_Year[$i] Then
	$CHOOSEDATE_choose[1] = GUICtrlRead($CHOOSEDATE_Year[$i])
	_CHOOSEDATE_ChooseTab(1)
	Return 0
	EndIf

	Next
	If GUICtrlRead($iCtrlID) <> '' Then $CHOOSEDATE_choose[2] = GUICtrlRead($iCtrlID)
	EndSwitch

	EndFunc   ;==>_ChooseDateClick
#ce
Func _AddEventHover($iCtrlID)
	Switch $iCtrlID
		Case $ADDEVENT_Button[0], $ADDEVENT_Button[1], $ADDEVENT_Button[2]
			GUICtrlSetBkColor($iCtrlID, $ADDEVENT_Color[1])
		Case $ADDEVENT_Choose_Type[0], $ADDEVENT_Choose_Type[1], $ADDEVENT_Choose_Type[2]
			If $iCtrlID <> $ADDEVENT_Choose_Type[$ADDEVENT_type] Then GUICtrlSetBkColor($iCtrlID, $ADDEVENT_Color[1])
		Case $ADDEVENT_Setting[14][0]
			GUICtrlSetFont($iCtrlID, 12, 600, 0, "FontAwesome")
		Case Else
			GUICtrlSetFont($iCtrlID, 12, 600, 0, "Segoe UI")

	EndSwitch
EndFunc   ;==>_AddEventHover
Func _AddEventNormal($iCtrlID)
	Switch $iCtrlID
		Case $ADDEVENT_Button[0], $ADDEVENT_Button[1], $ADDEVENT_Button[2]
			GUICtrlSetBkColor($iCtrlID, "-2")
		Case $ADDEVENT_Choose_Type[0], $ADDEVENT_Choose_Type[1], $ADDEVENT_Choose_Type[2]
			If $iCtrlID <> $ADDEVENT_Choose_Type[$ADDEVENT_type] Then GUICtrlSetBkColor($iCtrlID, "-2")
		Case $ADDEVENT_Setting[14][0]
			GUICtrlSetFont($iCtrlID, 12, 400, 0, "FontAwesome")
		Case Else
			GUICtrlSetFont($iCtrlID, 12, 400, 0, "Segoe UI")

	EndSwitch
EndFunc   ;==>_AddEventNormal
Func _AddEventClick($iCtrlID)
	Switch $iCtrlID
		Case $ADDEVENT_Button[2]
			If $ADDEVENT_ID <> '' Then _ADDEVENT_DeleteEvent($ADDEVENT_ID)
		Case $ADDEVENT_Setting[13][0]
			Local $slot = _ADDEVENT_ChangeLabelSetting($iCtrlID, $ADDEVENT_SETTING_COLORNAME)
			;Local $slot = _ADDEVENT_StringInSlot(GUICtrlRead($iCtrlID),'Mặc định|Đỏ|Cam|Vàng|Lục|Lam|Tím|Trắng|Đen|Xám')
			Local $color = StringSplit($ADDEVENT_SETTING_COLOR, ',')
			GUICtrlSetBkColor($iCtrlID, $color[$slot])
			GUICtrlSetColor($iCtrlID, _EDITOR_ColorText($color[$slot]))
			$ADDEVENT_Color[0] = $color[$slot]
			$ADDEVENT_Color[1] = _Change_Color_Editor($ADDEVENT_Color[0], 20)
			_ADDEVENT_SetColor()
		Case $ADDEVENT_Setting[14][0]
			_ADDEVENT_ChangeLabelSetting($iCtrlID, $ADDEVENT_SETTING_ICON)
		Case $ADDEVENT_Setting[6][0]
			GUICtrlSetData($ADDEVENT_Setting[3][0], '00')
			GUICtrlSetData($ADDEVENT_Setting[5][0], '00')
			GUICtrlSetData($ADDEVENT_Setting[11][0], '00')
			GUICtrlSetData($ADDEVENT_Setting[12][0], '00')
			If GUICtrlRead($ADDEVENT_Setting[3][0]) = '00' And GUICtrlRead($ADDEVENT_Setting[5][0]) = '00' And GUICtrlRead($ADDEVENT_Setting[11][0]) = '00' And GUICtrlRead($ADDEVENT_Setting[12][0]) = '00' Then
				GUICtrlSetBkColor($ADDEVENT_Setting[6][0], $ADDEVENT_Color[1])
			EndIf
		Case $ADDEVENT_Setting[8][0]
			_ADDEVENT_ChangeLabelSetting($iCtrlID, $ADDEVENT_PRIORITY)
			
		Case $ADDEVENT_Setting[9][0]
			_ADDEVENT_ChangeLabelSetting($iCtrlID, $ADDEVENT_NHACNHO)
		Case $ADDEVENT_Setting[10][0]
			If GUICtrlRead($ADDEVENT_Setting[2][0]) == GUICtrlRead($ADDEVENT_Setting[4][0]) Then _ADDEVENT_ChangeLabelSetting($iCtrlID, $ADDEVENT_SETTING_REPEAT)
		Case $ADDEVENT_Setting[3][0], $ADDEVENT_Setting[5][0]
			
			_ADDEVENT_ChangeLabelSetting($iCtrlID, '00|01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23')
			If GUICtrlRead($ADDEVENT_Setting[3][0]) = '00' And GUICtrlRead($ADDEVENT_Setting[11][0]) = '00' And GUICtrlRead($ADDEVENT_Setting[5][0]) = '00' And GUICtrlRead($ADDEVENT_Setting[12][0]) = '00' Then
				GUICtrlSetBkColor($ADDEVENT_Setting[6][0], "0x008AF0")
			Else
				GUICtrlSetBkColor($ADDEVENT_Setting[6][0], "-2")
			EndIf
		Case $ADDEVENT_Setting[11][0], $ADDEVENT_Setting[12][0]
			_ADDEVENT_ChangeLabelSetting($iCtrlID, '00|30')
			If GUICtrlRead($ADDEVENT_Setting[3][0]) = '00' And GUICtrlRead($ADDEVENT_Setting[11][0]) = '00' And GUICtrlRead($ADDEVENT_Setting[5][0]) = '00' And GUICtrlRead($ADDEVENT_Setting[12][0]) = '00' Then
				GUICtrlSetBkColor($ADDEVENT_Setting[6][0], "0x008AF0")
			Else
				GUICtrlSetBkColor($ADDEVENT_Setting[6][0], "-2")
			EndIf
	EndSwitch
EndFunc   ;==>_AddEventClick

Func _EditorHover($iCtrlID, $iHoverMode)
	If $iHoverMode = 1 Then
		GUICtrlSetBkColor($iCtrlID, _Change_Color_Editor(GUICtrlGetBkColor($iCtrlID), -40))
	Else
		GUICtrlSetBkColor($iCtrlID, '-2')
	EndIf
EndFunc   ;==>_EditorHover
Func _EditorNormal($iCtrlID)
	GUICtrlSetBkColor($iCtrlID, '-2')
EndFunc   ;==>_EditorNormal
Func _Editor2Hover($iCtrlID)
	GUICtrlSetBkColor($iCtrlID, _Change_Color_Editor(GUICtrlGetBkColor($iCtrlID), 40))
EndFunc   ;==>_Editor2Hover
Func _Nothing() ; hàm trời đánh =))
EndFunc   ;==>_Nothing
Func OnPrimaryDown_Func(ByRef $control)
	$iLasthGUI[0][0] = $control[0][0]
	$iLasthGUI[16][0] = $control[16][0]
	$iLasthGUI[7][3] = $control[7][3]
	$iLastCtrlID = $control[5][3]
	$iPressed = 1
	$iLastiMouse = MouseGetPos()
EndFunc   ;==>OnPrimaryDown_Func
Func OnPrimaryUp_Func($hWndGUI, $MsgID)
	$iPressed = 0
EndFunc   ;==>OnPrimaryUp_Func
Func OnPrimaryUp_Func_2($iCtrlID)
	$iPressed = 0
EndFunc   ;==>OnPrimaryUp_Func_2
Func _MenuLichHover($iCtrlID)
	Switch $iCtrlID
		Case $LICH_Button2[0], $LICH_Button2[1], $LICH_Button2[2]
			GUICtrlSetBkColor($iCtrlID, '0x008AF0')
		Case $LICH_Menu_Mon[0], $LICH_Menu_Mon[1], $LICH_Menu_Mon[2]
			$flag_LichSlider = True
			$time_LichSlider_Wait = 100
			If $iCtrlID = $LICH_Menu_Mon[0] Then
				$item_move_LichSlider = 0
			ElseIf $iCtrlID = $LICH_Menu_Mon[1] Then
				$item_move_LichSlider = 1
			ElseIf $iCtrlID = $LICH_Menu_Mon[2] Then
				$item_move_LichSlider = 2
			EndIf
			
			
		Case $LICH_Button[0][0]
			GUICtrlSetBkColor($iCtrlID, "0xFFFFFF")
			GUICtrlSetColor($LICH_Button[1][0], "0x008AF0")
			GUICtrlSetColor($LICH_Button[2][0], "0x008AF0")
		Case $LICH_Button[0][1]
			GUICtrlSetBkColor($iCtrlID, "0xFFFFFF")
			GUICtrlSetColor($LICH_Button[1][1], "0x008AF0")
			GUICtrlSetColor($LICH_Button[2][1], "0x008AF0")
		Case $LICH_Button[0][5]
			GUICtrlSetBkColor($iCtrlID, "0xFFFFFF")
			GUICtrlSetColor($LICH_Button[1][5], "0x008AF0")
			GUICtrlSetColor($LICH_Button[2][5], "0x008AF0")
			GUICtrlSetColor($LICH_Button[3][5], "0x008AF0")
		Case Else
			
			For $i = 0 To 7 * 6 - 1
				If $i > 1 And $i < 5 And $iCtrlID = $LICH_Button[0][$i] Then
					Local $color = StringSplit($ADDEVENT_SETTING_COLOR, ',')[Number(_ADDEVENT_GetSetting($LICH_Button[4][$i], 10))]
					$color = $color = '0x008AF0' ? '0xFFFFFF' : $color
					GUICtrlSetBkColor($iCtrlID, $color)
					
					GUICtrlSetColor($LICH_Button[1][$i], _EDITOR_ColorText($color, 1, "0x008AF0"))
					GUICtrlSetColor($LICH_Button[2][$i], _EDITOR_ColorText($color, 1, "0x008AF0"))
					GUICtrlSetColor($LICH_Button[3][$i], _EDITOR_ColorText($color, 1, "0x008AF0"))

					Return 0
				EndIf
				Local $control_temp = $LICH_Control[$i]
				If $iCtrlID = $control_temp[0] Then
					GUICtrlSetBkColor($iCtrlID, "0x008AF0")
					If Number(GUICtrlRead($control_temp[1])) = @MDAY And $LICH_ChooseDate[0] = @MON And $LICH_ChooseDate[1] = @YEAR Then
						GUICtrlSetColor($control_temp[1], "0xFFFFFF")
						GUICtrlSetColor($control_temp[2], "0xFFFFFF")
						GUICtrlSetColor($control_temp[3], "0xFFFFFF")
					EndIf
					Return 0
				EndIf
			Next
	EndSwitch
EndFunc   ;==>_MenuLichHover
Func _MenuLichClick($iCtrlID)
	Switch $iCtrlID
		Case $main_Tab1_menu1[0]
			If $MAIN_Tab4_NextEvent[0] > 0 Then
				Local $time1 = StringSplit(_ADDEVENT_GetSetting($main_Tab1_Event[1], 5), '/')
				_LICH_ShowEventTab($time1[1], $time1[2], $time1[3])
			EndIf
		Case $main_Tab1_menu1_right[0]
			_MAIN_Tab1_SetEventCalendar(1)
		Case $main_Tab1_menu1_left[0]
			_MAIN_Tab1_SetEventCalendar(-1)
			
		Case $main_Tab4_menu1_arrow[0]
			_MAIN_Tab4_SetEventCalendar(-1)
			If $MAIN_Tab4_NextEvent[0] > 0 Then
				$color = StringSplit($ADDEVENT_SETTING_COLOR, ',')[Number(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[1], 10))]
			Else
				$color = 0x808080
			EndIf
			GUICtrlSetBkColor($main_Tab4_menu1_arrow[2], _Change_Color_Editor($color, 20))
		Case $main_Tab4_menu1_arrow[1]
			_MAIN_Tab4_SetEventCalendar(1)
			If $MAIN_Tab4_NextEvent[0] > 0 Then
				$color = StringSplit($ADDEVENT_SETTING_COLOR, ',')[Number(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[1], 10))]
			Else
				$color = 0x808080
			EndIf
			GUICtrlSetBkColor($main_Tab4_menu1_arrow[3], _Change_Color_Editor($color, 20))
		Case $main_Tab4_menu2_arrow[0]
			_MAIN_Tab4_SetCalendar(-1)
		Case $main_Tab4_menu2_arrow[1]
			_MAIN_Tab4_SetCalendar(1)
		Case $LICH_Button[0][1]
			If $LICH_ChooseDate[2] <> -1 Then
				_LICH_AddEvent(GUICtrlRead(($LICH_Control[$LICH_ChooseDate[2]])[1]), $LICH_ChooseDate[0], $LICH_ChooseDate[1])
			Else
				_LICH_AddEvent()
			EndIf
		Case Else
			For $i = 0 To 7 * 6 - 1
				If $i > 0 And $i < 4 Then
					If $iCtrlID = $main_Tab4_menu1_control[0][$i] Then
						_MAIN_Tab4_ClickEvent($i)
						Return 0
					EndIf
				EndIf
				If $i > 1 And $i < 5 And $iCtrlID = $LICH_Button[0][$i] Then
					_LICH_AddEvent(-1, -1, -1, $LICH_Button[4][$i])
					Return 0
				EndIf
				Local $control_temp = $LICH_Control[$i]
				If $iCtrlID = $control_temp[0] And GUICtrlRead($control_temp[1]) <> '' Then
					If $LICH_ChooseDate[2] <> -1 Then
						
						Local $control_temp2 = $LICH_Control[$LICH_ChooseDate[2]]
						GUICtrlSetBkColor($control_temp2[0], "-2")
						If Number(GUICtrlRead($control_temp2[1])) = @MDAY And $LICH_ChooseDate[0] = @MON And $LICH_ChooseDate[1] = @YEAR Then
							GUICtrlSetBkColor($control_temp2[0], '0xFFFFFF')
							GUICtrlSetColor($control_temp2[1], '0x008AF0')
							GUICtrlSetColor($control_temp2[2], '0x008AF0')
							GUICtrlSetColor($control_temp2[3], '0x008AF0')
						EndIf
					EndIf
					
					$LICH_ChooseDate[2] = $LICH_ChooseDate[2] <> $i ? $i : -1
					If $LICH_ChooseDate[2] = -1 Then
						_LICH_ShowEventDate()
					Else
						GUICtrlSetBkColor($iCtrlID, "0x008AF0")
						If Number(GUICtrlRead($control_temp[1])) = @MDAY And $LICH_ChooseDate[0] = @MON And $LICH_ChooseDate[1] = @YEAR Then
							GUICtrlSetColor($control_temp[1], '0xFFFFFF')
							GUICtrlSetColor($control_temp[2], '0xFFFFFF')
							GUICtrlSetColor($control_temp[3], '0xFFFFFF')
						EndIf
						_LICH_ShowEventDate(GUICtrlRead($control_temp[1]))
					EndIf
					Return 0
				EndIf
			Next
	EndSwitch
EndFunc   ;==>_MenuLichClick
Func _MenuLichNormal($iCtrlID)
	Switch $iCtrlID
		Case $LICH_Button2[0], $LICH_Button2[1], $LICH_Button2[2]
			GUICtrlSetBkColor($iCtrlID, '-2')
		Case $LICH_Menu_Mon[0], $LICH_Menu_Mon[1], $LICH_Menu_Mon[2]
			GUICtrlSetBkColor($LICH_Menu_Mon[3], '0x008AF0')
			GUICtrlSetBkColor($iCtrlID, '-2')
			$time_LichSlider_Wait = 500
			$time_LichSlider = TimerInit()
			$item_move_LichSlider = -1
			$flag_LichSlider = True
			
		Case $LICH_Button[0][0]
			GUICtrlSetBkColor($iCtrlID, "-2")
			GUICtrlSetColor($LICH_Button[1][0], "0xFFFFFF")
			GUICtrlSetColor($LICH_Button[2][0], "0xFFFFFF")
		Case $LICH_Button[0][1]
			GUICtrlSetBkColor($iCtrlID, "-2")
			GUICtrlSetColor($LICH_Button[1][1], "0xFFFFFF")
			GUICtrlSetColor($LICH_Button[2][1], "0xFFFFFF")
		Case $LICH_Button[0][5]
			GUICtrlSetBkColor($iCtrlID, "-2")
			GUICtrlSetColor($LICH_Button[1][5], "0xFFFFFF")
			GUICtrlSetColor($LICH_Button[2][5], "0xFFFFFF")
			GUICtrlSetColor($LICH_Button[3][5], "0xFFFFFF")
		Case Else
			For $i = 0 To 7 * 6 - 1
				If $i > 1 And $i < 5 And $iCtrlID = $LICH_Button[0][$i] Then
					GUICtrlSetColor($LICH_Button[1][$i], "0xFFFFFF")
					GUICtrlSetColor($LICH_Button[2][$i], "0xFFFFFF")
					GUICtrlSetColor($LICH_Button[3][$i], "0xFFFFFF")
					GUICtrlSetBkColor($iCtrlID, '-2')
					Return 0
				EndIf
				Local $control_temp = $LICH_Control[$i]
				If $iCtrlID = $control_temp[0] And Number($LICH_ChooseDate[2]) <> $i Then
					GUICtrlSetBkColor($iCtrlID, "-2")
					If Number(GUICtrlRead($control_temp[1])) = @MDAY And $LICH_ChooseDate[0] = @MON And $LICH_ChooseDate[1] = @YEAR Then
						GUICtrlSetBkColor($control_temp[0], '0xFFFFFF')
						GUICtrlSetColor($control_temp[1], '0x008AF0')
						GUICtrlSetColor($control_temp[2], '0x008AF0')
						GUICtrlSetColor($control_temp[3], '0x008AF0')
					EndIf
					Return 0
				EndIf
			Next
			
	EndSwitch
EndFunc   ;==>_MenuLichNormal
Func _LICH2Hover($iCtrlID)
	For $i = 1 To $LICH2_Control[0][0]
		If $iCtrlID = ($LICH2_Control[$i][0])[0] Then
			Local $color = StringSplit($ADDEVENT_SETTING_COLOR, ',')[Number(_ADDEVENT_GetSetting($LICH2_Control[$i][1], 10))]
			GUICtrlSetBkColor($iCtrlID, _Change_Color_Editor($color, 20))
			Return 0
		EndIf
	Next
EndFunc   ;==>_LICH2Hover
Func _LICH2Normal($iCtrlID)
	For $i = 1 To $LICH2_Control[0][0]
		If $iCtrlID = ($LICH2_Control[$i][0])[0] Then
			Local $color = StringSplit($ADDEVENT_SETTING_COLOR, ',')[Number(_ADDEVENT_GetSetting($LICH2_Control[$i][1], 10))]
			GUICtrlSetBkColor($iCtrlID, $color)
			Return 0
		EndIf
	Next
EndFunc   ;==>_LICH2Normal
Func _LICH2Click($iCtrlID)
	For $i = 1 To $LICH2_Control[0][0]
		If $iCtrlID = ($LICH2_Control[$i][0])[0] Then
			_LICH_AddEvent(-1, -1, -1, $LICH2_Control[$i][1])
			Return 0
		EndIf
	Next
	
	If $iCtrlID = $LICH_Button2[0] Then _LICH_AddEvent($LICH_ChooseDate[2], $LICH_ChooseDate[0], $LICH_ChooseDate[1])
EndFunc   ;==>_LICH2Click

Func _MenuNoteHover($iCtrlID)
	Switch $iCtrlID
		Case $NOTE_Group[1][0], $NOTE_Close, $main_menutop_exit, $main_menutop_mini
			GUICtrlSetColor($iCtrlID, 0xCCFFCC)
		Case $NOTE_Group[2][1], $NOTE_Group[3][1], $NOTE_Group[4][1], $NOTE_Group[5][1]
			GUICtrlSetBkColor($iCtrlID, '-2')
		Case $NOTE_Group[3][0]
			GUICtrlSetBkColor($NOTE_Group[4][0], '0x008AF0')
			GUICtrlSetBkColor($NOTE_Group[5][0], '0x008AF0')
		Case Else
			For $i = 1 To $NOTE_ListNote[0]
				Local $control_temp = $NOTE_ListNote[$i]
				If UBound($control_temp) < 5 Then Return 0
				If $iCtrlID = $control_temp[5] Then
					Local $g_Color = String(_EDITOR_GETEditSetting($NOTE_ListNote_ID[$i], 9)) <> '-1' ? String(_EDITOR_GETEditSetting($NOTE_ListNote_ID[$i], 9)) : 0x008AF0
					GUICtrlSetBkColor($control_temp[1], _Change_Color_Editor($g_Color, 60))
					GUICtrlSetBkColor($control_temp[2], _Change_Color_Editor($g_Color, 60))
					GUICtrlSetBkColor($control_temp[3], _Change_Color_Editor($g_Color, 30))
					GUICtrlSetBkColor($control_temp[4], _Change_Color_Editor($g_Color, 30))
				EndIf
			Next
	EndSwitch
EndFunc   ;==>_MenuNoteHover
Func _MenuNoteNormal($iCtrlID)
	Switch $iCtrlID
		Case $NOTE_Group[1][0], $NOTE_Close, $main_menutop_exit, $main_menutop_mini
			GUICtrlSetColor($iCtrlID, 0xFFFFFF)
		Case $NOTE_Group[2][1], $NOTE_Group[3][1], $NOTE_Group[4][1], $NOTE_Group[5][1]
			GUICtrlSetBkColor($iCtrlID, '0x0072C6')
		Case $NOTE_Group[3][0]
			GUICtrlSetBkColor($NOTE_Group[4][0], '-2')
			GUICtrlSetBkColor($NOTE_Group[5][0], '-2')
		Case Else
			For $i = 1 To $NOTE_ListNote[0]
				Local $control_temp = $NOTE_ListNote[$i]
				If UBound($control_temp) < 5 Then Return 0
				If $iCtrlID = $control_temp[5] Then
					Local $g_Color = String(_EDITOR_GETEditSetting($NOTE_ListNote_ID[$i], 9)) <> '-1' ? String(_EDITOR_GETEditSetting($NOTE_ListNote_ID[$i], 9)) : 0x008AF0
					GUICtrlSetBkColor($control_temp[1], _Change_Color_Editor($g_Color, 30))
					GUICtrlSetBkColor($control_temp[2], _Change_Color_Editor($g_Color, 30))
					GUICtrlSetBkColor($control_temp[3], _Change_Color_Editor($g_Color, 10))
					GUICtrlSetBkColor($control_temp[4], _Change_Color_Editor($g_Color, 10))
				EndIf
			Next
	EndSwitch
EndFunc   ;==>_MenuNoteNormal
Func _MenuMainHover($iCtrlID)
	Switch $iCtrlID
		
		Case $main_Tab4_menu1_control[0][1], $main_Tab4_menu1_control[0][2], $main_Tab4_menu1_control[0][3]
			For $i = 1 To 3
				If $iCtrlID = $main_Tab4_menu1_control[0][$i] Then
					Local $color
					If $MAIN_Tab4_NextEvent[0] > 0 Then
						$color = StringSplit($ADDEVENT_SETTING_COLOR, ',')[Number(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$i], 10))]
					Else
						$color = 0x808080
					EndIf
					GUICtrlSetBkColor($iCtrlID, _Change_Color_Editor($color, 20))
					If $i >= 2 Then
						Local $time1 = StringSplit(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$i], 5), '/')
						Local $day_left = _DateDiff('d', _NowCalcDate(), $time1[3] & '/' & $time1[2] & '/' & $time1[1])
						GUICtrlSetData($main_Tab4_menu1_control[1][$i], '⏰')
						GUICtrlSetData($main_Tab4_menu1_control[2][$i], Number($day_left) = 0 ? "Sự kiện diễn ra hôm nay" : $day_left & ' ngày nữa diễn ra sự kiện')
					EndIf
					Return 0
				EndIf
			Next
		Case $main_Tab4_menu2_control[0]
			GUICtrlSetBkColor($main_Tab4_menu2_control[5], '0x0063B1')
			GUICtrlSetBkColor($iCtrlID, '0x008AF0')
			GUICtrlSetStyle($main_Tab4_menu2_control[4], 0)
		Case $main_Tab2_menu1[0]
			GUICtrlSetBkColor($iCtrlID, '0x008AF0')
			GUICtrlSetStyle($main_Tab2_menu1[1], $SS_WHITEFRAME)
		Case $main_Tab1_menu1[0]
			If $MAIN_Tab4_NextEvent[0] > 0 Then
				Local $color = StringSplit($ADDEVENT_SETTING_COLOR, ',')[Number(_ADDEVENT_GetSetting($main_Tab1_Event[1], 10))]
				GUICtrlSetBkColor($main_Tab1_menu1_Text[2], $color)
				GUICtrlSetColor($main_Tab1_menu1_Text[2], _EDITOR_ColorText($color))
			EndIf
			GUICtrlSetStyle($main_Tab1_menu1[1], $SS_WHITEFRAME)
			GUICtrlSetBkColor($main_Tab1_menu1_Text, '-2')
		Case $main_Tab1_menu1_right[0]
			GUICtrlSetBkColor($main_Tab1_menu1_right[1], '0x008AF0')
		Case $main_Tab1_menu1_left[0]
			GUICtrlSetBkColor($main_Tab1_menu1_left[1], '0x008AF0')
		Case $main_Tab4_menu1_arrow[0], $main_Tab4_menu1_arrow[1]
			For $i = 0 To 1
				If $iCtrlID = $main_Tab4_menu1_arrow[$i] Then
					Local $color
					If $MAIN_Tab4_NextEvent[0] > 0 Then
						$color = StringSplit($ADDEVENT_SETTING_COLOR, ',')[Number(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[1], 10))]
					Else
						$color = 0x808080
					EndIf
					GUICtrlSetBkColor($main_Tab4_menu1_arrow[$i + 2], _Change_Color_Editor($color, 20))
					Return 0
				EndIf
			Next

		Case $main_Tab4_menu2_arrow[0], $main_Tab4_menu2_arrow[1]
			GUICtrlSetBkColor($iCtrlID, '0x008AF0')
		Case $main_Tab1_menu2_arrow[0], $main_Tab1_menu2_arrow[1], $main_Tab2_menu2_arrow[0], $main_Tab2_menu2_arrow[1]
			GUICtrlSetBkColor($iCtrlID, '0x0072C6')
		Case Else
			For $i = 0 To 5
				
				If $iCtrlID = $main_Tab2_menu2_NOTEHover[$i] Then
					GUICtrlSetBkColor($main_Tab2_menu2_NOTE[$i * 2], '0x008AF0')
					GUICtrlSetBkColor($main_Tab2_menu2_NOTE[$i * 2 + 1], '0x008AF0')
					GUICtrlSetBkColor($iCtrlID, '0x0072C6')
					Return 0
				EndIf
				If $i <= 3 Then
					If $iCtrlID = $main_Tab1_menu2_TKBHover[$i] And Number($MAIN_tkb[0]) > $i Then
						Local $color = StringSplit(_InIRead($Database, "TKB" & $GUI_TKB[1], StringSplit($MAIN_tkb[$i + 1], '@')[1], ''), '|')[2]
						GUICtrlSetBkColor($main_Tab1_menu2_TKB[$i * 2], $color)
						GUICtrlSetBkColor($main_Tab1_menu2_TKB[$i * 2 + 1], $color)
						GUICtrlSetBkColor($iCtrlID, 0x008AF0)
						Return 0
					EndIf
				EndIf
				If $i < 3 Then
					If $iCtrlID = $main_Tab1_menu3_button[1][$i] Then
						GUICtrlSetBkColor($main_Tab1_menu3_button[0][$i], '0x008AF0')
						GUICtrlSetBkColor($main_Tab1_menu3_button[2][$i], '0x008AF0')
						Return 0
					ElseIf $iCtrlID = $main_Tab4_menu3_button[1][$i] Then
						GUICtrlSetBkColor($main_Tab4_menu3_button[0][$i], '0x008AF0')
						GUICtrlSetBkColor($main_Tab4_menu3_button[2][$i], '0x008AF0')
						Return 0
					EndIf
					If $i > 0 Then
						If $iCtrlID = $main_Tab2_menu3_button[1][$i] Then
							GUICtrlSetBkColor($main_Tab2_menu3_button[0][$i], '0x008AF0')
							GUICtrlSetBkColor($main_Tab2_menu3_button[2][$i], '0x008AF0')
							Return 0
						EndIf

					EndIf
				EndIf
			Next
			
	EndSwitch
	
	Return 0
EndFunc   ;==>_MenuMainHover
Func _MenuMainNormal($iCtrlID)
	Switch $iCtrlID
		Case $main_Tab4_menu1_control[0][1], $main_Tab4_menu1_control[0][2], $main_Tab4_menu1_control[0][3]
			For $i = 1 To 3
				If $iCtrlID = $main_Tab4_menu1_control[0][$i] Then
					If $MAIN_Tab4_NextEvent[0] > 0 Then
						$color = StringSplit($ADDEVENT_SETTING_COLOR, ',')[Number(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$i], 10))]
					Else
						$color = 0x808080
					EndIf
					GUICtrlSetBkColor($iCtrlID, $color)
					If $i >= 2 Then
						
						GUICtrlSetData($main_Tab4_menu1_control[1][$i], _ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$i], 11))
						GUICtrlSetData($main_Tab4_menu1_control[2][$i], _ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$i], 1))
					EndIf
					Return 0
				EndIf
			Next
		Case $main_Tab4_menu2_control[0]
			GUICtrlSetBkColor($main_Tab4_menu2_control[5], '0x008AF0')
			GUICtrlSetBkColor($iCtrlID, '-2')
			GUICtrlSetStyle($main_Tab4_menu2_control[4], $SS_WHITEFRAME)
		Case $main_Tab2_menu1[0]
			GUICtrlSetBkColor($iCtrlID, '-2')
			GUICtrlSetStyle($main_Tab2_menu1[1], 0)
		Case $main_Tab1_menu1[0]
			GUICtrlSetBkColor($main_Tab1_menu1_Text[2], "0x008AF0")
			GUICtrlSetColor($main_Tab1_menu1_Text[2], "0xFFFFFF")
			GUICtrlSetStyle($main_Tab1_menu1[1], 0)
			GUICtrlSetBkColor($main_Tab1_menu1_Text, '0x008AF0')
		Case $main_Tab1_menu1_right[0]
			GUICtrlSetBkColor($main_Tab1_menu1_right[1], '-2')
		Case $main_Tab1_menu1_left[0]
			GUICtrlSetBkColor($main_Tab1_menu1_left[1], '-2')
		Case $main_Tab4_menu1_arrow[0], $main_Tab4_menu1_arrow[1]
			For $i = 0 To 1
				If $iCtrlID = $main_Tab4_menu1_arrow[$i] Then
					GUICtrlSetBkColor($main_Tab4_menu1_arrow[$i + 2], -2)
					Return 0
				EndIf
			Next
		Case $main_Tab1_menu2_arrow[0], $main_Tab1_menu2_arrow[1], $main_Tab2_menu2_arrow[0], $main_Tab2_menu2_arrow[1], $main_Tab4_menu2_arrow[0], $main_Tab4_menu2_arrow[1]
			GUICtrlSetBkColor($iCtrlID, '-2')
		Case Else
			For $i = 0 To 5
				
				If $iCtrlID = $main_Tab2_menu2_NOTEHover[$i] Then
					GUICtrlSetBkColor($main_Tab2_menu2_NOTE[$i * 2], '0x0072C6')
					GUICtrlSetBkColor($main_Tab2_menu2_NOTE[$i * 2 + 1], '0x0072C6')
					GUICtrlSetBkColor($iCtrlID, '-2')
					Return 0
				EndIf
				If $i <= 3 Then
					If $iCtrlID = $main_Tab1_menu2_TKBHover[$i] Then
						GUICtrlSetBkColor($main_Tab1_menu2_TKB[$i * 2], '0x0072C6')
						GUICtrlSetBkColor($main_Tab1_menu2_TKB[$i * 2 + 1], '0x0072C6')
						GUICtrlSetBkColor($iCtrlID, '-2')
						Return 0
					EndIf
				EndIf
				If $i < 3 Then
					If $iCtrlID = $main_Tab1_menu3_button[1][$i] Then
						GUICtrlSetBkColor($main_Tab1_menu3_button[0][$i], '-2')
						GUICtrlSetBkColor($main_Tab1_menu3_button[2][$i], '-2')
						Return 0
					ElseIf $iCtrlID = $main_Tab4_menu3_button[1][$i] Then
						GUICtrlSetBkColor($main_Tab4_menu3_button[0][$i], '-2')
						GUICtrlSetBkColor($main_Tab4_menu3_button[2][$i], '-2')
						Return 0
					EndIf
					If $i > 0 Then
						If $iCtrlID = $main_Tab2_menu3_button[1][$i] Then
							GUICtrlSetBkColor($main_Tab2_menu3_button[0][$i], '-2')
							GUICtrlSetBkColor($main_Tab2_menu3_button[2][$i], '-2')
							Return 0
						EndIf
						
					EndIf
				EndIf
			Next
	EndSwitch
	
	
	Return 0
EndFunc   ;==>_MenuMainNormal
Func _TabNormal($iCtrlID)
	If $iCtrlID <> $main_Tab[Number($main_Tab[0])]Then
		GUICtrlSetFont($iCtrlID, 15, 300, 0, "Segoe UI")
		$flag_TabSlider = True
		$time_TabSlider = TimerInit()
		$item_move_TabSlider = $main_Tab[Number($main_Tab[0])]
	EndIf
	Return 0
EndFunc   ;==>_TabNormal
Func _TabHover($iCtrlID)
	If $iCtrlID <> $main_Tab[Number($main_Tab[0])]Then
		GUICtrlSetFont($iCtrlID, 15, 700, 0, "Segoe UI")
		$flag_TabSlider = True
		$time_TabSlider = TimerInit()
		$item_move_TabSlider = $iCtrlID
	EndIf
	Return 0
EndFunc   ;==>_TabHover
Func _TabClick($iCtrlID)
	Switch $iCtrlID
		Case $main_Tab[1]
			_Tab_Swich(1)
		Case $main_Tab[2]
			_Tab_Swich(2)
		Case $main_Tab[3]
			_Tab_Swich(3)
		Case $main_Tab[4]
			$MAIN_Tab4_Date[3] = @YEAR
			$MAIN_Tab4_Date[2] = @MON
			$MAIN_Tab4_Date[1] = @MDAY
			_MAIN_Tab4_SetCalendar()
			_Tab_Swich(4)

		Case $main_Tab[5]
			_Tab_Swich(5)
	EndSwitch
	Return 0
EndFunc   ;==>_TabClick
Func _LogoClick()
	If $flag_Logo Then
		$time_Logo = TimerInit()
		$flag_Logo = False
		_MoveLogo()

	EndIf
EndFunc   ;==>_LogoClick
; func chạy logo
Func _MoveLogo($flag = True)
	Local $a = $flag == True ? 390 : 60
	Local $b = $flag == True ? 60 : 390
	Local $c = $flag == True ? -15 : 15

	For $i = $a To $b Step $c
		Sleep(1)
		GUICtrlSetPos($main_Logo, $i)
		GUICtrlSetPos($main_Title[2], $i - 230)
	Next
	If $flag = False Then
		For $i = 0 To 2
			GUICtrlSetState($main_Title[$i], $GUI_HIDE)
		Next
	EndIf
	If $flag Then
		For $i = 0 To 2
			GUICtrlSetState($main_Title[$i], $GUI_SHOW)
		Next
	EndIf
EndFunc   ;==>_MoveLogo
; func chạy tab slider
Func _MoveTabSlider($iCtrlID)
	Local $speed = 20
	Local $pos1 = ControlGetPos($GUIMAIN, '', $iCtrlID)
	Local $pos2 = ControlGetPos($GUIMAIN, '', $main_TabSlider)
	Local $step = $pos1[0] > $pos2[0] ? $speed : -$speed
	For $i = $pos2[0] To $pos1[0] Step $step
		Sleep(1)
		Local $pos3 = ControlGetPos($GUIMAIN, '', $main_TabSlider)
		If Not $flag_TabSlider Then
			Return 0
		EndIf
		GUICtrlSetPos($main_TabSlider, $i)
	Next
	GUICtrlSetPos($main_TabSlider, $pos1[0])
EndFunc   ;==>_MoveTabSlider
#EndRegion Hiệu ứng control, tab dựa vào SSCtrlHover_Register

#Region Các hàm liên quan tới dữ liệu
Func _InIRead($file, $sec, $key, $value)
	If IniRead($file, $sec, $key, $value) = $value Then Return $value
	Return _HexToString(IniRead($file, $sec, $key, $value))
EndFunc   ;==>_InIRead
Func _IniWrite($file, $sec, $key, $value)
	Return IniWrite($file, $sec, $key, _StringToHex($value))
EndFunc   ;==>_IniWrite
Func _IniDelete($file, $sec, $key = '')
	
	If $key = '' Then
		Return 0
	Else
		Return IniDelete($file, $sec, $key)
	EndIf
	
EndFunc   ;==>_IniDelete
#EndRegion Các hàm liên quan tới dữ liệu

#Region Một số func chức năng khác
; GUICtrlGetBkColor tks to guinness (AutoIT Forum). https://www.autoitscript.com/forum/topic/125676-guigetbkcolor-get-the-background-color-of-the-gui/
Func GUICtrlGetBkColor($hWnd)
	If Not IsHWnd($hWnd) Then
		$hWnd = GUICtrlGetHandle($hWnd)
	EndIf
	Local $hDC = _WinAPI_GetDC($hWnd)
	Local $iColor = _WinAPI_GetPixel($hDC, 0, 0)
	_WinAPI_ReleaseDC($hWnd, $hDC)
	Return '0x' & Hex($iColor, 6)
EndFunc   ;==>GUICtrlGetBkColor
Func _Change_Color_Editor($color, $flag = 0, $type = 1)
	Local $cRed = _ColorGetRed($color)
	Local $cGreen = _ColorGetGreen($color)
	Local $cBlue = _ColorGetBlue($color)
	
	$cRed = $cRed - $flag <= 0 ? 0 : $cRed - $flag
	$cGreen = $cGreen - $flag <= 0 ? 0 : $cGreen - $flag
	$cBlue = $cBlue - $flag <= 0 ? 0 : $cBlue - $flag
	Local $iColor[3] = [$cRed, $cGreen, $cBlue]
	If $type Then
		Return "0x" & Hex(_ColorSetRGB($iColor), 6)
	Else
		Return _ColorSetCOLORREF($iColor)
	EndIf
EndFunc   ;==>_Change_Color_Editor
Func _EDITOR_ColorText($color, $type = 1, $color1 = '', $color2 = '')
	Local $cRed = _ColorGetRed($color)
	Local $cGreen = _ColorGetGreen($color)
	Local $cBlue = _ColorGetBlue($color)
	Local $flag = 0
	If $cRed >= 170 Then $flag += 1
	If $cGreen >= 170 Then $flag += 1
	If $cBlue >= 170 Then $flag += 1
	If $flag > 1 Then
		Local $iColor[3] = [0, 0, 0]
		If $color1 <> '' Then Return $color1
	Else
		Local $iColor[3] = [255, 255, 255]
		If $color2 <> '' Then Return $color2
	EndIf
	
	If $type Then
		Return "0x" & Hex(_ColorSetRGB($iColor), 6)
	Else
		Return _ColorSetCOLORREF($iColor)
	EndIf
EndFunc   ;==>_EDITOR_ColorText
Func _SlitTime($time, $return = 0, $flag = 1)
	;Flag = 1 YYYYMMDDHHMMSS
	;Flag = 2 dd/mm/yyyy
	; return = 0: return lại format dd/mm/yyy
	; return = 1, 2, 3: return lại day, mon, year
	Local $y, $m, $d
	If $flag = 1 Then
		$y = StringLeft($time, 4)
		$m = StringMid($time, 5, 2)
		$d = StringMid($time, 7, 2)
		If $return = 0 Then
			If $y = '' And $m = '' And $d = '' Then Return 'hôm nay'
			If $y = @YEAR And $m = @MON And $d = @MDAY Then Return 'hôm nay'
			If $y = @YEAR And $m = @MON And $d = @MDAY - 1 Then Return 'hôm qua'
		EndIf
	ElseIf $flag = 2 Then
		Local $temp = StringSplit($time, '/')
		If @error Then Return 0
		If $temp[0] < 3 Then Return 0
		$y = $temp[3]
		$m = $temp[2]
		$d = $temp[1]
	EndIf
	
	If $return = 0 Then
		Return $d & '/' & $m & '/' & $y
	ElseIf $return = 1 Then
		Return Number($d)
	ElseIf $return = 2 Then
		Return Number($m)
	ElseIf $return = 3 Then
		Return Number($y)
	EndIf
EndFunc   ;==>_SlitTime
Func _CompareTime($time1, $time2, $flag = 2)
	Local $y1, $y2, $m1, $m2, $d1, $d2
	$y1 = _SlitTime($time1, 3, $flag)
	$y2 = _SlitTime($time2, 3, $flag)
	$m1 = _SlitTime($time1, 2, $flag)
	$m2 = _SlitTime($time2, 2, $flag)
	$d1 = _SlitTime($time1, 1, $flag)
	$d2 = _SlitTime($time2, 1, $flag)
	If $y1 > $y2 Then Return 1
	If $y2 > $y1 Then Return 2
	If $m1 > $m2 Then Return 1
	If $m2 > $m1 Then Return 2
	If $d1 > $d2 Then Return 1
	If $d2 > $d1 Then Return 2
	Return 0
EndFunc   ;==>_CompareTime
Func _Random()
	Return Chr(Random(65, 90, 1)) & Random(1000, 1000000, 1) & Chr(Random(65, 90, 1)) & Random(1000, 1000000, 1) & Chr(Random(65, 90, 1))
EndFunc   ;==>_Random

Func _Mini()
	GUISetState(@SW_MINIMIZE, $GUIMAIN)
EndFunc   ;==>_Mini
#EndRegion Một số func chức năng khác
