
Func _ADDEvent_ShowGUI($DAY = @MDAY, $MON = @MON, $YEAR = @YEAR, $HOUR = @HOUR, $MIN = @MIN, $ID_EVENT = '', $hGUI = '')
	Local $pos_x = -1, $pos_y = -1
	If IsHWnd($hGUI) Then
		Local $pos_GUI = WinGetPos($hGUI)
		$pos_x = $pos_GUI[0] + Int($pos_GUI[2] / 2 - 567 / 2)
		$pos_y = $pos_GUI[1] + Int($pos_GUI[3] / 2 - 471 / 2)
	EndIf
	$ADDEVENT_GUITemp = _DisableGUI($hGUI)
	$ADDEVENT_GUITemp2 = $hGUI
	$ADDEVENT_ID = $ID_EVENT = '' ? '' : $ID_EVENT
	$ADDEVENT_Color[0] = $ID_EVENT = '' ? 0x0072C6 : StringSplit($ADDEVENT_SETTING_COLOR, ',')[Number(_ADDEVENT_GetSetting($ID_EVENT, 10))]
	$ADDEVENT_Color[1] = _Change_Color_Editor($ADDEVENT_Color[0], 20)
	$MIN = Int($MIN / 30) * 30
	$MIN = $MIN = 60 ? 30 : $MIN
	$MIN = $MIN = 0 ? '00' : $MIN
	$GUIEventAdd = GUICreate($ID_EVENT = '' ? "Thêm một sự kiện" : _ADDEVENT_GetSetting($ID_EVENT, 1), 567, 436 + 35, $pos_x, $pos_y, $WS_POPUP, $WS_EX_TOPMOST)
	GUISetBkColor($ADDEVENT_Color[0], $GUIEventAdd)
	$ADDEVENT_Control_Color[21][0] = GUICtrlCreateLabel($ID_EVENT = '' ? "Thêm một sự kiện" : _ADDEVENT_GetSetting($ID_EVENT, 1), 20, 10, 413, 40, -1, -1)
	GUICtrlSetFont(-1, 22, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$ADDEVENT_Choose_Type[0] = GUICtrlCreateLabel("Một sự kiện", 17, 59, 104, 28, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 13, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	_GUICtrl_OnHoverRegister(-1, "_AddEventHover", "_AddEventNormal")

	;$ADDEVENT_Choose_Type[1] = GUICtrlCreateLabel("Một kì thi",130,59,104,28,BitOr($SS_CENTER,$SS_CENTERIMAGE),-1)
	;GUICtrlSetFont(-1,13,300,0,"Segoe UI Light")
	;GUICtrlSetColor(-1,"0xFFFFFF")
	;GUICtrlSetBkColor(-1,"-2")
	;_GUICtrl_OnHoverRegister(-1, "_AddEventHover", "_AddEventNormal")
	;$ADDEVENT_Choose_Type[2] = GUICtrlCreateLabel("Sinh nhật",244,59,104,28,BitOr($SS_CENTER,$SS_CENTERIMAGE),-1)
	;GUICtrlSetFont(-1,13,300,0,"Segoe UI Light")
	;GUICtrlSetColor(-1,"0xFFFFFF")
	;GUICtrlSetBkColor(-1,"-2")
	;_GUICtrl_OnHoverRegister(-1, "_AddEventHover", "_AddEventNormal")

	$ADDEVENT_Setting[1][0] = GUICtrlCreateInput($ID_EVENT = '' ? '' : _ADDEVENT_GetSetting($ID_EVENT, 1), 153, 201, 392, 22, -1, 0)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x0072C6")
	$ADDEVENT_Control_Color[2][0] = GUICtrlCreateLabel("Tiêu đề sự kiện:", 20, 201, 111, 25, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$ADDEVENT_Control_Color[3][0] = GUICtrlCreateLabel("", 153, 225, 396, 1, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetBkColor(-1, "0xFFFFFF")
	$ADDEVENT_Control_Color[4][0] = GUICtrlCreateLabel("Ngày diễn ra:", 21, 117, 111, 25, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	$ADDEVENT_Control_Color[5][0] = GUICtrlCreateLabel(":", 334, 154, 9, 25, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$ADDEVENT_Control_Color[6][0] = GUICtrlCreateLabel(":", 180, 154, 9, 25, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$ADDEVENT_Control_Color[7][0] = GUICtrlCreateLabel("đến", 250, 117, 26, 25, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	
	$ADDEVENT_Setting[3][0] = GUICtrlCreateLabel($ID_EVENT = '' ? $HOUR : StringSplit(_ADDEVENT_GetSetting($ID_EVENT, 7), ":")[1], 131, 154, 44, 25, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	_GUICtrl_OnHoverRegister(-1, "_AddEventHover", "_AddEventNormal", "_Nothing", "_AddEventClick")
	$ADDEVENT_Setting[11][0] = GUICtrlCreateLabel($ID_EVENT = '' ? $MIN : StringSplit(_ADDEVENT_GetSetting($ID_EVENT, 7), ":")[2], 189, 154, 45, 25, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	_GUICtrl_OnHoverRegister(-1, "_AddEventHover", "_AddEventNormal", "_Nothing", "_AddEventClick")

	$ADDEVENT_Setting[5][0] = GUICtrlCreateLabel($ID_EVENT = '' ? $HOUR : StringSplit(_ADDEVENT_GetSetting($ID_EVENT, 8), ":")[1], 285, 154, 44, 25, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	_GUICtrl_OnHoverRegister(-1, "_AddEventHover", "_AddEventNormal", "_Nothing", "_AddEventClick")
	$ADDEVENT_Setting[12][0] = GUICtrlCreateLabel($ID_EVENT = '' ? $MIN : StringSplit(_ADDEVENT_GetSetting($ID_EVENT, 8), ":")[2], 343, 154, 45, 25, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	_GUICtrl_OnHoverRegister(-1, "_AddEventHover", "_AddEventNormal", "_Nothing", "_AddEventClick")

	$ADDEVENT_Setting[2][0] = GUICtrlCreateLabel($ID_EVENT = '' ? $DAY & '/' & $MON & '/' & $YEAR : _ADDEVENT_GetSetting($ID_EVENT, 5), 132, 117, 107, 25, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	_GUICtrl_OnHoverRegister(-1, "_AddEventHover", "_AddEventNormal", "_Nothing", "_AddEventClick")
	$ADDEVENT_Setting[4][0] = GUICtrlCreateLabel($ID_EVENT = '' ? $DAY & '/' & $MON & '/' & $YEAR : _ADDEVENT_GetSetting($ID_EVENT, 6), 284, 117, 107, 25, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	_GUICtrl_OnHoverRegister(-1, "_AddEventHover", "_AddEventNormal", "_Nothing", "_AddEventClick")

	
	$ADDEVENT_Setting[6][0] = GUICtrlCreateLabel("Cả ngày", 407, 154, 138, 25, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, $ID_EVENT <> '' ? _ADDEVENT_GetSetting($ID_EVENT, 8) = "00:00" And _ADDEVENT_GetSetting($ID_EVENT, 8) = _ADDEVENT_GetSetting($ID_EVENT, 7) ? "0x008AF0" : -2 : -2)
	_GUICtrl_OnHoverRegister(-1, "_AddEventHover", "_AddEventNormal", "_Nothing", "_AddEventClick")
	
	$ADDEVENT_Setting[10][0] = GUICtrlCreateLabel($ID_EVENT = '' ? "Không lặp lại" : StringSplit($ADDEVENT_SETTING_REPEAT,'|')[Number(_ADDEVENT_GetSetting($ID_EVENT, 9))] , 407, 117, 138, 25, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_AddEventHover", "_AddEventNormal", "_Nothing", "_AddEventClick")
	
	$ADDEVENT_Control_Color[8][0] = GUICtrlCreateLabel("Mô tả sự kiện:", 21, 247, 111, 25, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$ADDEVENT_Setting[7][0] = GUICtrlCreateEdit($ID_EVENT = '' ? '' : _ADDEVENT_GetSetting($ID_EVENT, 2), 153, 251, 396, 53, BitOR($ES_AUTOVSCROLL, $ES_WANTRETURN, $WS_VSCROLL), $WS_EX_TRANSPARENT)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x0072C6")
	$ADDEVENT_Control_Color[11][0] = GUICtrlCreateLabel("", 153, 307, 396, 1, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetBkColor(-1, "0xFFFFFF")
	$ADDEVENT_Control_Color[12][0] = GUICtrlCreateLabel("Mức ưu tiên:", 20, 330, 91, 27, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$ADDEVENT_Setting[8][0] = GUICtrlCreateLabel($ID_EVENT = '' ? "Không" : StringSplit($ADDEVENT_PRIORITY,'|')[Number(_ADDEVENT_GetSetting($ID_EVENT, 3))], 131, 330, 165, 25, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	_GUICtrl_OnHoverRegister(-1, "_AddEventHover", "_AddEventNormal", "_Nothing", "_AddEventClick")
	$ADDEVENT_Control_Color[13][0] = GUICtrlCreateLabel("Nhắc nhở:", 303, 330, 77, 25, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	$ADDEVENT_Setting[9][0] = GUICtrlCreateLabel($ID_EVENT = '' ? "Không" : StringSplit($ADDEVENT_NHACNHO,'|')[Number(_ADDEVENT_GetSetting($ID_EVENT, 4))], 384, 330, 165, 25, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	_GUICtrl_OnHoverRegister(-1, "_AddEventHover", "_AddEventNormal", "_Nothing", "_AddEventClick")

	$ADDEVENT_Control_Color[14][0] = GUICtrlCreateLabel("Thời gian:", 20, 154, 111, 25, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$ADDEVENT_Control_Color[15][0] = GUICtrlCreateLabel("đến", 250, 154, 26, 25, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	
	$ADDEVENT_Control_Color[16][0] = GUICtrlCreateLabel("Màu sự kiện:", 20, 371, 91, 27, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	Local $color = '0x008AF0'
	If $ID_EVENT <> '' Then
		$color = StringSplit($ADDEVENT_SETTING_COLOR, ',')[Number(_ADDEVENT_GetSetting($ID_EVENT, 10))]
	EndIf
	$ADDEVENT_Setting[13][0] = GUICtrlCreateLabel($ID_EVENT = '' ? "Mặc định" : StringSplit($ADDEVENT_SETTING_COLORNAME,'|')[Number(_ADDEVENT_GetSetting($ID_EVENT, 10))] = '-1' ? "Mặc định" : StringSplit($ADDEVENT_SETTING_COLORNAME,'|')[Number(_ADDEVENT_GetSetting($ID_EVENT, 10))], 131, 371, 165, 25, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, $color)
	_GUICtrl_OnHoverRegister(-1, "_AddEventHover", "_AddEventNormal", "_Nothing", "_AddEventClick")

	$ADDEVENT_Control_Color[17][0] = GUICtrlCreateLabel("Biểu tượng", 303, 371, 77, 25, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$ADDEVENT_Setting[14][0] = GUICtrlCreateLabel($ID_EVENT = '' ? "" : _ADDEVENT_GetSetting($ID_EVENT, 11) = '-1' ? "" : _ADDEVENT_GetSetting($ID_EVENT, 11), 384, 371, 165, 25, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 600, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	_GUICtrl_OnHoverRegister(-1, "_AddEventHover", "_AddEventNormal", "_Nothing", "_AddEventClick")

	$ADDEVENT_Button[0] = GUICtrlCreateLabel($ID_EVENT = '' ? "ĐỒNG Ý" : "LƯU LẠI", 452, 395 + 35, 92, 28, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 13, 350, 0, "Segoe UI Semilight")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_AddEventHover", "_AddEventNormal")
	GUICtrlSetOnEvent(-1, '_ADDEVENT_AddEvent')
	$ADDEVENT_Button[1] = GUICtrlCreateLabel("HỦY BỎ", $ID_EVENT = '' ? 342 : 232, 395 + 35, 92, 28, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1) ;232
	GUICtrlSetFont(-1, 13, 350, 0, "Segoe UI Semilight")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetOnEvent(-1, '_ADDEVENT_HideGUI')
	_GUICtrl_OnHoverRegister(-1, "_AddEventHover", "_AddEventNormal")
	$ADDEVENT_Button[2] = GUICtrlCreateLabel("XÓA BỎ", 342, 395 + 35, 92, 28, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 13, 350, 0, "Segoe UI Semilight")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_AddEventHover", "_AddEventNormal", "_Nothing", "_AddEventClick")
	GUICtrlSetState(-1, $ID_EVENT = '' ? $GUI_HIDE : $GUI_SHOW)
	SetOnEventA($ADDEVENT_Setting[2][0], '_ADDEVENT_CHOOSEDATE', $ParamByVal, $ADDEVENT_Setting[2][0])
	SetOnEventA($ADDEVENT_Setting[4][0], '_ADDEVENT_CHOOSEDATE', $ParamByVal, $ADDEVENT_Setting[4][0])
	
	
	$ADDEVENT_Control_Color[1][1] = $ADDEVENT_Choose_Type[0]
	$ADDEVENT_Control_Color[2][1] = $ADDEVENT_Setting[3][0]
	$ADDEVENT_Control_Color[3][1] = $ADDEVENT_Setting[11][0]
	$ADDEVENT_Control_Color[4][1] = $ADDEVENT_Setting[5][0]
	$ADDEVENT_Control_Color[5][1] = $ADDEVENT_Setting[12][0]
	$ADDEVENT_Control_Color[6][1] = $ADDEVENT_Setting[2][0]
	$ADDEVENT_Control_Color[7][1] = $ADDEVENT_Setting[4][0] ; 6 0 cả ngày 10 0
	$ADDEVENT_Control_Color[8][1] = $ADDEVENT_Setting[8][0]
	$ADDEVENT_Control_Color[9][1] = $ADDEVENT_Setting[13][0]
	$ADDEVENT_Control_Color[10][1] = $ADDEVENT_Setting[14][0]
	$ADDEVENT_Control_Color[11][1] = $ADDEVENT_Setting[9][0]
	$ADDEVENT_Control_Color[0][1] = 11
	
	$ADDEVENT_Control_Color[1][0] = $ADDEVENT_Setting[1][0] ; 17
	$ADDEVENT_Control_Color[9][0] = $ADDEVENT_Control_Color[8][0]
	$ADDEVENT_Control_Color[10][0] = $ADDEVENT_Setting[7][0]
	$ADDEVENT_Control_Color[18][0] = $ADDEVENT_Button[0]
	$ADDEVENT_Control_Color[19][0] = $ADDEVENT_Button[1]
	$ADDEVENT_Control_Color[20][0] = $ADDEVENT_Button[2]
	$ADDEVENT_Control_Color[22][0] = $ADDEVENT_Setting[10][0]
	$ADDEVENT_Control_Color[23][0] = $ADDEVENT_Setting[6][0]
	$ADDEVENT_Control_Color[0][0] = 23
	_ADDEVENT_SetColor()
	WinSetTrans($GUIEventAdd, '', 0)
	GUISetState(@SW_SHOW, $GUIEventAdd)
	_Effect_LoadGUI($GUIEventAdd)
	
EndFunc   ;==>_ADDEvent_ShowGUI
Func _ADDEVENT_SetColor()
	GUISetState(@SW_LOCK, $GUIEventAdd)
	GUISetBkColor($ADDEVENT_Color[0], $GUIEventAdd)
	For $i = 0 To 1
		For $j = 1 To $ADDEVENT_Control_Color[0][$i]
			GUICtrlSetBkColor($ADDEVENT_Control_Color[$j][$i], $i = 0 ? -2 : $ADDEVENT_Color[1])
			GUICtrlSetColor($ADDEVENT_Control_Color[$j][$i], _EDITOR_ColorText($ADDEVENT_Color[0]))
		Next
	Next
	GUICtrlSetBkColor($ADDEVENT_Setting[1][0], $ADDEVENT_Color[0])
	GUICtrlSetBkColor($ADDEVENT_Setting[7][0], $ADDEVENT_Color[0])
	GUICtrlSetBkColor($ADDEVENT_Control_Color[3][0], _EDITOR_ColorText($ADDEVENT_Color[0]))
	GUICtrlSetBkColor($ADDEVENT_Control_Color[11][0], _EDITOR_ColorText($ADDEVENT_Color[0]))
	If GUICtrlRead($ADDEVENT_Setting[3][0]) = '00' And GUICtrlRead($ADDEVENT_Setting[5][0]) = '00' And GUICtrlRead($ADDEVENT_Setting[11][0]) = '00' And GUICtrlRead($ADDEVENT_Setting[12][0]) = '00' Then
		GUICtrlSetBkColor($ADDEVENT_Setting[6][0], $ADDEVENT_Color[1])
	EndIf
	GUISetState(@SW_UNLOCK, $GUIEventAdd)
EndFunc   ;==>_ADDEVENT_SetColor
Func _ADDEVENT_StringInSlot($text, $string, $split = '|')
	Local $temp = StringSplit($string, $split)
	If @error Then Return 1
	For $i = 1 To $temp[0]
		If $text = $temp[$i] Then Return $i
	Next
	Return 1
EndFunc   ;==>_ADDEVENT_StringInSlot
Func _ADDEVENT_HideGUI()
	_Effect_LoadGUI($GUIEventAdd, False)
	GUIDelete($GUIEventAdd)
	If $ADDEVENT_GUITemp2 <> '' Then
		_EnableGUI($ADDEVENT_GUITemp2, $ADDEVENT_GUITemp)
		WinSetOnTop($ADDEVENT_GUITemp2, '', 1)
		WinSetOnTop($ADDEVENT_GUITemp2, '', 0)
	EndIf
EndFunc   ;==>_ADDEVENT_HideGUI


Func _ADDEVENT_DeleteEvent($event_id)
	If $ADDEVENT_ID = '' Then Return 0
	If _Msgbox(262144 + 32 + 4, 'Thông báo', 'Bạn có chắc chắn muốn xóa sự kiện này?') = 6 Then
		_IniDelete($Database, 'EVENT', $ADDEVENT_ID)
		_Msgbox(262144 + 64, 'Thông báo', 'Đã xóa sự kiện')
		$ADDEVENT_ID = ''
		_ADDEVENT_RefeshGUILICH()
		_ADDEVENT_HideGUI()
	EndIf
EndFunc   ;==>_ADDEVENT_DeleteEvent
Func _ADDEVENT_RefeshGUILICH()
	If BitAND(WinGetState($GUILICH), 2) = 2 Then
		If _GUICtrlTab_GetCurFocus($LICH_TabCtrl) <> 1 Then
			_LICH_SetGUI($LICH_ChooseDate[0], $LICH_ChooseDate[1], $LICH_ChooseDate[2])
		Else
			_LICH_ShowEventTab($LICH_ChooseDate[2], $LICH_ChooseDate[0], $LICH_ChooseDate[1])
		EndIf
	EndIf
	If BitAND(WinGetState($GUIMAIN), 2) = 2 Then
		_MAIN_Tab4_ShowCalendar()
	EndIf
EndFunc   ;==>_ADDEVENT_RefeshGUILICH
Func _ADDEVENT_AddEvent()
	If _CompareTime(GUICtrlRead($ADDEVENT_Setting[2][0]), GUICtrlRead($ADDEVENT_Setting[4][0])) = 1 Then
		_Msgbox(262144 + 16, 'Thông báo', 'Ngày kết thúc sự kiện không được lớn hơn ngày bắt đầu')
	Else
		Local $time[4]
		$time[0] = Number($ADDEVENT_Setting[3][0])
		$time[1] = Number($ADDEVENT_Setting[11][0])
		$time[2] = Number($ADDEVENT_Setting[5][0])
		$time[3] = Number($ADDEVENT_Setting[12][0])
		
		If ($time[0] + $time[1] + $time[2] + $time[3] = 0) Or ($time[2] * 60 + $time[3] - $time[0] * 60 - $time[1] > 0) Or GUICtrlRead($ADDEVENT_Setting[2][0]) = GUICtrlRead($ADDEVENT_Setting[4][0]) Then
			If GUICtrlRead($ADDEVENT_Setting[1][0]) <> '' Then
				$ID_EVENT = $ADDEVENT_ID = '' ? _Random() : $ADDEVENT_ID
				If $ADDEVENT_ID = '' Then
					Do
						$ID_EVENT = _Random()
					Until _Iniread($Database, 'EVENT', $ID_EVENT, '') = ''
				EndIf
				_IniWrite($Database, 'EVENT', $ID_EVENT, '[' & GUICtrlRead($ADDEVENT_Setting[1][0]) & '] [' & GUICtrlRead($ADDEVENT_Setting[7][0]) & '] [' & _ADDEVENT_StringInSlot(GUICtrlRead($ADDEVENT_Setting[8][0]),$ADDEVENT_PRIORITY) & '] [' & _ADDEVENT_StringInSlot(GUICtrlRead($ADDEVENT_Setting[9][0]),$ADDEVENT_NHACNHO) & '] [' & GUICtrlRead($ADDEVENT_Setting[2][0]) & '] [' & GUICtrlRead($ADDEVENT_Setting[4][0]) & '] [' & GUICtrlRead($ADDEVENT_Setting[3][0]) & ':' & GUICtrlRead($ADDEVENT_Setting[11][0]) & '] [' & GUICtrlRead($ADDEVENT_Setting[5][0]) & ':' & GUICtrlRead($ADDEVENT_Setting[12][0]) & '] [' & _ADDEVENT_StringInSlot(GUICtrlRead($ADDEVENT_Setting[10][0]),$ADDEVENT_SETTING_REPEAT)  & '] [' & _ADDEVENT_StringInSlot(GUICtrlRead($ADDEVENT_Setting[13][0]),$ADDEVENT_SETTING_COLORNAME) & '] [' & GUICtrlRead($ADDEVENT_Setting[14][0]) & ']')
				_Msgbox(262144 + 64, 'Thông báo', $ADDEVENT_ID = '' ? 'Đã thêm sự kiện thành công' : 'Đã lưu lại sự kiện')
				_ADDEVENT_RefeshGUILICH()
				_ADDEVENT_HideGUI()
			Else
				_Msgbox(262144 + 16, 'Thông báo', 'Tiêu đề sự kiện không được bỏ trống')
			EndIf
		Else
			_Msgbox(262144 + 16, 'Thông báo', 'Giờ kết thúc không được nhỏ hơn giờ bắt đầu')
		EndIf
	EndIf
EndFunc   ;==>_ADDEVENT_AddEvent
Func _ADDEVENT_EditSetting($ID_EVENT, $setting_id, $value)
	Local $temp = _IniRead($Database, 'EVENT', $ID_EVENT, '')
	Local $temp2 = _StringBetween($temp, '[', ']')
	If @error Then
		_ADDEVENT_AddLostSetting($ID_EVENT)
		_ADDEVENT_EditSetting($ID_EVENT, $setting_id, $value)
		Return 0
	EndIf
	If UBound($temp2) < $ADDEVENT_SETTING_SLOT Then
		_ADDEVENT_AddLostSetting($ID_EVENT)
		_ADDEVENT_EditSetting($ID_EVENT, $setting_id, $value)
		Return 0
	EndIf
	Local $temp3 = StringSplit($setting_id, '|')
	Local $temp4 = StringSplit($value, '|')
	If $temp3[0] = $temp4[0] Then
		For $i = 1 To $temp3[0]
			$temp2[$i - 1] = $temp4[$i]
		Next
		Local $text = ''
		For $i = 0 To UBound($temp2) - 1
			$text &= '[' & $temp2[$i] & ']'
		Next
		_IniWrite($Database, 'EVENT', $ID_EVENT, $text)

	EndIf
	Return 0
EndFunc   ;==>_ADDEVENT_EditSetting
Func _ADDEVENT_GetSetting($ID_EVENT, $setting_id)
	If $ID_EVENT = '' Then Return 0
	Local $temp = _IniRead($Database, 'EVENT', $ID_EVENT, '')
	Local $temp2 = _StringBetween($temp, '[', ']')
	If @error Then
		_ADDEVENT_AddLostSetting($ID_EVENT)
		Return _ADDEVENT_GetSetting($ID_EVENT, $setting_id)
	EndIf
	If UBound($temp2) < $ADDEVENT_SETTING_SLOT Then
		_ADDEVENT_AddLostSetting($ID_EVENT)
		Return _ADDEVENT_GetSetting($ID_EVENT, $setting_id)
	EndIf
	Return String($temp2[$setting_id - 1])
EndFunc   ;==>_ADDEVENT_GetSetting
Func _ADDEVENT_AddLostSetting($ID_EVENT)
	Local $temp = _IniRead($Database, 'EVENT', $ID_EVENT, '')
	Local $temp2 = _StringBetween($temp, '[', ']')
	Local $text = ''
	If @error Then
		For $i = 1 To $ADDEVENT_SETTING_SLOT
			$text &= '[-1] '
		Next
	Else
		$text = $temp
		For $i = UBound($temp2) To $ADDEVENT_SETTING_SLOT
			$text &= '[-1] '
		Next
	EndIf
	_IniWrite($Database, 'EVENT', $ID_EVENT, $text)
EndFunc   ;==>_ADDEVENT_AddLostSetting
Func _ADDEVENT_CHOOSEDATE($control)
	GUISetState(@SW_DISABLE, $GUIEventAdd)
	Local $choose_date = _CHOOSEDATE_ShowGUI(@MON, @YEAR, 1, $GUIEventAdd)
	GUICtrlSetData($control, $choose_date)

	Local $time1 = StringSplit(GUICtrlRead($ADDEVENT_Setting[2][0]), '/')
	Local $time2 = StringSplit(GUICtrlRead($ADDEVENT_Setting[4][0]), '/')
	If _DateDiff('d', $time1[3] & '/' & $time1[2] & '/' & $time1[1], $time2[3] & '/' & $time2[2] & '/' & $time2[1]) <= 0 Then GUICtrlSetData($ADDEVENT_Setting[4][0], GUICtrlRead($ADDEVENT_Setting[2][0]))
	GUISetState(@SW_ENABLE, $GUIEventAdd)
	If GUICtrlRead($ADDEVENT_Setting[2][0]) <> GUICtrlRead($ADDEVENT_Setting[4][0]) Then GUICtrlSetData($ADDEVENT_Setting[10][0], 'Không lặp lại')
EndFunc   ;==>_ADDEVENT_CHOOSEDATE
Func _ADDEVENT_ChangeLabelSetting($Label, $Setting)
	Local $temp = StringSplit($Setting, '|')
	If @error Then Return 0
	For $i = 1 To $temp[0] - 1
		If GUICtrlRead($Label) == $temp[$i] Then
			GUICtrlSetData($Label, $temp[$i + 1])
			Return $i + 1
		EndIf
	Next
	GUICtrlSetData($Label, $temp[1])
	Return 1
EndFunc   ;==>_ADDEVENT_ChangeLabelSetting
