;_Notification.au3
Global $NOTIFI_GUI[10], $NOTIFI_DS[100]


;_Notification_GUI(1,'375W8465T@UNITY@FB804U39422I')
;
Func _Load_Notification()
	; read tkb
	Local $read = IniReadSection($Database, "TKB" & $GUI_TKB[1])
	If Not @error Then
		For $i = 1 To $read[0][0]
			Local $ma_mon_hoc = $read[$i][0]
			Local $read2 = IniReadSection($Database, "TKB" & $GUI_TKB[1] & '-' & $ma_mon_hoc)
			If Not @error Then
				For $j = 1 To $read2[0][0]
					Local $tach = StringSplit(_Iniread($Database, "TKB" & $GUI_TKB[1] & '-' & $ma_mon_hoc, $read2[$j][0], ''), '|')
					If Number($tach[$tach[0]]) = 0 Then
						Local $time = _DateDiff('d', _NowCalc(), StringSplit($tach[1], '/')[3] & '/' & StringSplit($tach[1], '/')[2] & '/' & StringSplit($tach[1], '/')[1])
						;$time = 0
						If $time >= 0 Then
							If $time = 0 Then
								_Notification_GUI(1, $GUI_TKB[1] & '@' & $ma_mon_hoc & '@' & $read2[$j][0])
							ElseIf $time = 7 Then
								If Number($tach[3]) = 0 Then _Notification_GUI(1, $GUI_TKB[1] & '@' & $ma_mon_hoc & '@' & $read2[$j][0])
							ElseIf $time = 5 Then
								_Notification_GUI(1, $GUI_TKB[1] & '@' & $ma_mon_hoc & '@' & $read2[$j][0])
							ElseIf $time = 3 Then
								_Notification_GUI(1, $GUI_TKB[1] & '@' & $ma_mon_hoc & '@' & $read2[$j][0])
							EndIf
						EndIf
					EndIf
				Next
			EndIf
		Next
	EndIf
	For $i = 1 To $MAIN_Tab4_NextEvent[0]
		Local $time = _DateDiff('d', _NowCalc(), StringSplit(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$i], 5), '/')[3] & '/' & StringSplit(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$i], 5), '/')[2] & '/' & StringSplit(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$i], 5), '/')[1])
		If $time > 0 Then
			Local $slot = Number(StringSplit('0,30,7,3,2,1', ',')[Number(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$i], 4))])
			;$slot = $time
			If $slot > 0 Then
				If $slot - $time = 0 Then
					_Notification_GUI(0, $MAIN_Tab4_NextEvent[$i])
				ElseIf $time = 14 Then
					If Number(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$i], 3)) = 4 Then _Notification_GUI(0, $MAIN_Tab4_NextEvent[$i])
				ElseIf $time = 7 Then
					If Number(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$i], 3)) >= 3 Then _Notification_GUI(0, $MAIN_Tab4_NextEvent[$i])
				ElseIf $time = 5 Then
					If Number(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$i], 3)) >= 2 Then _Notification_GUI(0, $MAIN_Tab4_NextEvent[$i])
				ElseIf $time < 2 Then
					If Number(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$i], 3)) >= 1 Then _Notification_GUI(0, $MAIN_Tab4_NextEvent[$i])
				EndIf
			EndIf
			
		EndIf
	Next
EndFunc   ;==>_Load_Notification

Func _Notification_GUI($type, $id, $tao = 0, $text = '', $title = '', $icon = '') ; 1 mon, 2 tkb
	If $tao = 0 Then
		$NOTIFI_DS[0] += 1
		$NOTIFI_DS[$NOTIFI_DS[0]] = $id & '|' & $type
		Return 0
	EndIf
	Local $color = 0x0072C6, $color1 = _Change_Color_Editor($color, 20)
	If $text = '' Then
		If $type = 1 Then
			Local $thongtin_ma_mh = StringSplit(_Iniread($Database, "TKB" & StringSplit($id, '@')[1], StringSplit($id, '@')[2], ''), '|')
			Local $thongtin_nn = StringSplit(_Iniread($Database, "TKB" & StringSplit($id, '@')[1] & '-' & StringSplit($id, '@')[2], StringSplit($id, '@')[3], ''), '|')
			$color = $thongtin_ma_mh[2]
			$color1 = _Change_Color_Editor($color, 20)
			If Number($thongtin_nn[2]) = 0 Then
				$title = "Bài tập môn " & $thongtin_ma_mh[1]
				$icon = ''
			Else
				$title = "Kiểm tra môn " & $thongtin_ma_mh[1]
				$icon = ''
			EndIf
			Local $time = _DateDiff('d', _NowCalc(), StringSplit($thongtin_nn[1], '/')[3] & '/' & StringSplit($thongtin_nn[1], '/')[2] & '/' & StringSplit($thongtin_nn[1], '/')[1])
			If Number($time) = 0 Then
				$text = 'Sự kiện diễn ra hôm nay'
			Else
				$text = 'Còn ' & $time & ' ngày nữa!'
			EndIf
			$id = StringSplit($id, '@')[2]
		Else
			$color = StringSplit($ADDEVENT_SETTING_COLOR, ',')[_ADDEVENT_GetSetting($id, 10)]
			$color1 = _Change_Color_Editor($color, 20)
			
			$title = _ADDEVENT_GetSetting($id, 1)
			$icon = _ADDEVENT_GetSetting($id, 11)
			Local $time = _DateDiff('d', _NowCalc(), StringSplit(_ADDEVENT_GetSetting($id, 5), '/')[3] & '/' & StringSplit(_ADDEVENT_GetSetting($id, 5), '/')[2] & '/' & StringSplit(_ADDEVENT_GetSetting($id, 5), '/')[1])
			If Number($time) = 0 Then
				$text = 'Sự kiện diễn ra hôm nay'
			Else
				$text = 'Còn ' & $time & ' ngày nữa!'
			EndIf
			
		EndIf
	EndIf
	Local $control[6]
	$control[0] = GUICreate("Notification", 319, 55, @DesktopWidth + 10, @DesktopHeight - 50 - 55 - Number($NOTIFI_GUI[0]) * 60, $WS_POPUP, BitOR($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW))
	GUICtrlCreateLabel($icon, 0, 0, 53, 55, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 20, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, _EDITOR_ColorText($color))
	GUICtrlSetBkColor(-1, $color1)
	$control[1] = GUICtrlCreateLabel($title, 54, 0, 244, 27, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, _EDITOR_ColorText($color))
	GUICtrlSetBkColor(-1, $color)
	$control[2] = GUICtrlCreateLabel($text, 54, 27, 244, 28, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($color))
	GUICtrlSetBkColor(-1, $color)
	$control[3] = GUICtrlCreateLabel("", 298, 0, 23, 65, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 13, 600, 0, "FontAwesome")
	GUICtrlSetColor(-1, _EDITOR_ColorText($color))
	GUICtrlSetBkColor(-1, $color)
	_GUICtrl_OnHoverRegister($control[3], "_Nothing", "_Nothing", "_Nothing", "_Notification_Click")
	_GUICtrl_OnHoverRegister($control[1], "_Nothing", "_Nothing", "_Nothing", "_Notification_Click")
	_GUICtrl_OnHoverRegister($control[2], "_Nothing", "_Nothing", "_Nothing", "_Notification_Click")

	$control[4] = TimerInit()
	$control[5] = $type & '@' & $id
	WinSetTrans($control[0],'',$SETTING_POPUP_TRANS)
	GUISetState(@SW_SHOW, $control[0])
	For $i = @DesktopWidth + 10 To @DesktopWidth - 5 - 319 Step -10
		WinMove($control[0], '', $i, Default)
		Sleep(5)
	Next
	$NOTIFI_GUI[0] += 1
	$NOTIFI_GUI[$NOTIFI_GUI[0]] = $control
EndFunc   ;==>_Notification_GUI

Func _Notification_DelGUI($id)
	Local $control = $NOTIFI_GUI[$id]
	For $i = @DesktopWidth - 5 - 319 To @DesktopWidth + 10 Step 10
		WinMove($control[0], '', $i, Default)
		Sleep(5)
	Next
	GUIDelete($control[0])
	$NOTIFI_GUI[$id] = ''
	For $j = $id To $NOTIFI_GUI[0] - 1
		$NOTIFI_GUI[$j] = $NOTIFI_GUI[$j + 1]
	Next
	$NOTIFI_GUI[0] -= 1
	For $i = 5 To 60 Step 5
		For $j = $id To $NOTIFI_GUI[0]
			Local $control = $NOTIFI_GUI[$j]
			Local $pos_temp = WinGetPos($control[0], '')
			WinMove($control[0], '', Default, $pos_temp[1] + 5)
		Next
		Sleep(3)
	Next

EndFunc   ;==>_Notification_DelGUI
