;_CHOOSEDATE.au3


Func _CHOOSEDATE_ShowGUI($MON = @MON, $YEAR = @YEAR, $type = 1, $hGUI = '')
	; type = 1: cho chọn ngày, 0 chỉ chọn tháng và năm
	ReDim $cHoverID[2]
	Local $pos_x = -1, $pos_y = -1
	If IsHWnd($hGUI) Then
		Local $pos_GUI = WinGetPos($hGUI)
		$pos_x = $pos_GUI[0] + Int($pos_GUI[2] / 2 - 249 / 2)
		$pos_y = $pos_GUI[1] + Int($pos_GUI[3] / 2 - 227 / 2)
	EndIf
	
	$CHOOSEDATE_type = $type
	$CHOOSEDATE_choose[0] = $MON
	$CHOOSEDATE_choose[1] = $YEAR
	$CHOOSEDATE_choose[2] = 0
	$CHOOSEDATE_Tab = $CHOOSEDATE_type == 1 ? 0 : 1
	If IsHWnd($CHOOSEDATE) Then Return 0
	$CHOOSEDATE = GUICreate("Chọn lịch", 249, 227, $pos_x, $pos_y, BitOR($WS_POPUP, $WS_BORDER), BitOR($WS_EX_TOOLWINDOW, $WS_EX_TOPMOST))
	GUISetBkColor(0x0072C6, $CHOOSEDATE)
	$CHOOSEDATE_Label[0] = GUICtrlCreateLabel("Tháng hai, 2016", 31, 10, 188, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	_ControlHover(2, $CHOOSEDATE, $CHOOSEDATE_Label[0])

	$CHOOSEDATE_Label[1] = GUICtrlCreateLabel("<", 4, 10, 27, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	_ControlHover(2, $CHOOSEDATE, $CHOOSEDATE_Label[1])

	$CHOOSEDATE_Label[2] = GUICtrlCreateLabel(">", 219, 10, 27, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	_ControlHover(2, $CHOOSEDATE, $CHOOSEDATE_Label[2])

	$CHOOSEDATE_TabCtrl = GUICtrlCreateTab(-100, -100, 0, 0)
	GUICtrlCreateTabItem("tab0") ; TAB0==========================================
	GUICtrlCreateLabel("Hai", 11, 50, 32, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("Ba", 43, 50, 32, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("Tư", 75, 50, 32, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("Năm", 107, 50, 32, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("Sáu", 139, 50, 32, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("Bảy", 171, 50, 32, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("CN", 203, 50, 32, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	
	For $i = 0 To 7 * 6 - 1
		Local $pos_x = Mod($i, 7) * 32
		Local $pos_y = Int($i / 7) * 20
		$CHOOSEDATE_Date[$i] = GUICtrlCreateLabel('', 11 + $pos_x, 70 + $pos_y, 32, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
		GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
		GUICtrlSetColor(-1, "0xFFFFFF")
		GUICtrlSetBkColor(-1, "-2")
		_ControlHover(2, $CHOOSEDATE, $CHOOSEDATE_Date[$i])
	Next
	Local $number_week_today = _DateToDayOfWeek(@YEAR, @MON, @MDAY)
	$number_week_today = $number_week_today = 1 ? 6 : $number_week_today - 2
	$CHOOSEDATE_Date[7 * 6] = GUICtrlCreateLabel("Hôm nay " & _CHOOSEDATE_DateToString($number_week_today + 1) & " " & @MDAY & "/" & @MON & "/" & @YEAR, 4, 200, 242, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	_ControlHover(2, $CHOOSEDATE, $CHOOSEDATE_Date[7 * 6])
	GUICtrlCreateTabItem("tab1") ; TAB1==========================================
	$CHOOSEDATE_Mon[0] = GUICtrlCreateLabel(_LICH_NumberToMon(1), 2, 56, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Mon[1] = GUICtrlCreateLabel(_LICH_NumberToMon(2), 83, 56, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Mon[2] = GUICtrlCreateLabel(_LICH_NumberToMon(3), 164, 56, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Mon[3] = GUICtrlCreateLabel(_LICH_NumberToMon(4), 2, 90, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Mon[4] = GUICtrlCreateLabel(_LICH_NumberToMon(5), 83, 90, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Mon[5] = GUICtrlCreateLabel(_LICH_NumberToMon(6), 164, 90, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Mon[6] = GUICtrlCreateLabel(_LICH_NumberToMon(7), 2, 124, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Mon[7] = GUICtrlCreateLabel(_LICH_NumberToMon(8), 83, 124, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Mon[8] = GUICtrlCreateLabel(_LICH_NumberToMon(9), 164, 124, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Mon[9] = GUICtrlCreateLabel(_LICH_NumberToMon(10), 2, 158, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Mon[10] = GUICtrlCreateLabel(_LICH_NumberToMon(11), 83, 158, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Mon[11] = GUICtrlCreateLabel(_LICH_NumberToMon(12), 164, 158, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Mon[12] = GUICtrlCreateLabel("Hôm nay là " & _LICH_NumberToMon(@MON), 4, 200, 242, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateTabItem("tab2") ; TAB2==========================================
	$CHOOSEDATE_Year[0] = GUICtrlCreateLabel($CHOOSEDATE_choose[1], 2, 56, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Year[1] = GUICtrlCreateLabel($CHOOSEDATE_choose[1] + 1, 83, 56, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Year[2] = GUICtrlCreateLabel($CHOOSEDATE_choose[1] + 2, 164, 56, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Year[3] = GUICtrlCreateLabel($CHOOSEDATE_choose[1] + 3, 2, 90, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Year[4] = GUICtrlCreateLabel($CHOOSEDATE_choose[1] + 4, 83, 90, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Year[5] = GUICtrlCreateLabel($CHOOSEDATE_choose[1] + 5, 164, 90, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Year[6] = GUICtrlCreateLabel($CHOOSEDATE_choose[1] + 6, 2, 124, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Year[7] = GUICtrlCreateLabel($CHOOSEDATE_choose[1] + 7, 83, 124, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Year[8] = GUICtrlCreateLabel($CHOOSEDATE_choose[1] + 8, 164, 124, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Year[9] = GUICtrlCreateLabel($CHOOSEDATE_choose[1] + 9, 2, 158, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Year[10] = GUICtrlCreateLabel($CHOOSEDATE_choose[1] + 10, 83, 158, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Year[11] = GUICtrlCreateLabel($CHOOSEDATE_choose[1] + 11, 164, 158, 81, 34, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$CHOOSEDATE_Year[12] = GUICtrlCreateLabel("Hôm nay là năm " & @YEAR, 4, 200, 242, 24, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	For $i = 0 To 12
		_ControlHover(2, $CHOOSEDATE, $CHOOSEDATE_Year[$i])
		_ControlHover(2, $CHOOSEDATE, $CHOOSEDATE_Mon[$i])
	Next
	_CHOOSEDATE_SetData($MON, $YEAR)
	WinSetTrans($CHOOSEDATE, '', 0)
	GUISetState(@SW_SHOW, $CHOOSEDATE)
	_Effect_LoadGUI($CHOOSEDATE)
	_GUICtrlTab_SetCurFocus($CHOOSEDATE_TabCtrl, $CHOOSEDATE_Tab)

	While String($CHOOSEDATE_choose[2]) == '0'
		Sleep(10)
		If Not WinActive($CHOOSEDATE) Then WinActivate($CHOOSEDATE)
		$Over = _ControlHover(0, $CHOOSEDATE)
		If $Over = 1 Then
			GUICtrlSetBkColor(@extended, "0x008AF0")
		Else
			GUICtrlSetBkColor(@extended, "-2")
		EndIf
		$Click = _ControlHover(1, $CHOOSEDATE)
		If $Click = 1 Then
			$iCtrlID = @extended
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
					Local $flag = True
					For $i = 0 To 11

						If $iCtrlID = $CHOOSEDATE_Mon[$i] Then
							$CHOOSEDATE_choose[0] = $i + 1
							If $CHOOSEDATE_type = 1 Then
								_CHOOSEDATE_ChooseTab()
							Else
								$CHOOSEDATE_choose[2] = -1
							EndIf
							$flag = False
							ExitLoop
						EndIf
						If $flag And $iCtrlID = $CHOOSEDATE_Year[$i] Then
							$CHOOSEDATE_choose[1] = GUICtrlRead($CHOOSEDATE_Year[$i])
							_CHOOSEDATE_ChooseTab(1)
							$flag = False
							ExitLoop
						EndIf
						
					Next
					If $flag And GUICtrlRead($iCtrlID) <> '' Then $CHOOSEDATE_choose[2] = GUICtrlRead($iCtrlID)
			EndSwitch
		EndIf
	WEnd
	GUIDelete($CHOOSEDATE)
	
	Return $CHOOSEDATE_choose[2] & '/' & $CHOOSEDATE_choose[0] & '/' & $CHOOSEDATE_choose[1]
EndFunc   ;==>_CHOOSEDATE_ShowGUI
Func _CHOOSEDATE_Next()
	If $CHOOSEDATE_Tab = 0 Then
		
		If $CHOOSEDATE_choose[0] = 12 Then
			$CHOOSEDATE_choose[0] = 1
			$CHOOSEDATE_choose[1] += 1
		Else
			$CHOOSEDATE_choose[0] += 1
		EndIf
	ElseIf $CHOOSEDATE_Tab = 1 Then
		$CHOOSEDATE_choose[1] = $CHOOSEDATE_choose[1] > 2110 ? $CHOOSEDATE_choose[1] : $CHOOSEDATE_choose[1] + 1
	Else
		$CHOOSEDATE_choose[1] = $CHOOSEDATE_choose[1] > 2110 ? $CHOOSEDATE_choose[1] : $CHOOSEDATE_choose[1] + 12
	EndIf
	_CHOOSEDATE_SetData($CHOOSEDATE_choose[0], $CHOOSEDATE_choose[1])
EndFunc   ;==>_CHOOSEDATE_Next
Func _CHOOSEDATE_Pre()
	If $CHOOSEDATE_Tab = 0 Then
		If $CHOOSEDATE_choose[0] = 1 Then
			$CHOOSEDATE_choose[0] = 12
			$CHOOSEDATE_choose[1] -= 1
		Else
			$CHOOSEDATE_choose[0] -= 1
		EndIf
	ElseIf $CHOOSEDATE_Tab = 1 Then
		$CHOOSEDATE_choose[1] = $CHOOSEDATE_choose[1] < 1900 ? $CHOOSEDATE_choose[1] : $CHOOSEDATE_choose[1] - 1
	Else
		$CHOOSEDATE_choose[1] = $CHOOSEDATE_choose[1] < 1900 ? $CHOOSEDATE_choose[1] : $CHOOSEDATE_choose[1] - 12
	EndIf
	_CHOOSEDATE_SetData($CHOOSEDATE_choose[0], $CHOOSEDATE_choose[1])
EndFunc   ;==>_CHOOSEDATE_Pre
Func _CHOOSEDATE_ChooseTab($tab = 0)
	$CHOOSEDATE_Tab = $tab
	_GUICtrlTab_SetCurFocus($CHOOSEDATE_TabCtrl, $CHOOSEDATE_Tab)
	_CHOOSEDATE_SetData($CHOOSEDATE_choose[0], $CHOOSEDATE_choose[1])
EndFunc   ;==>_CHOOSEDATE_ChooseTab
Func _CHOOSEDATE_SetData($MON, $YEAR)
	If $CHOOSEDATE_Tab = 0 Then
		Local $number_day = _DateDaysInMonth($YEAR, $MON)
		Local $number_week = _DateToDayOfWeek($YEAR, $MON, 1)
		Local $number_date = 0
		$number_week = $number_week = 1 ? 6 : $number_week - 2
		For $i = 0 To 7 * 6 - 1
			If ($i < 7 And $i < $number_week) Or $number_date + 1 > $number_day Then
				GUICtrlSetData($CHOOSEDATE_Date[$i], '')
			Else
				$number_date += 1
				GUICtrlSetData($CHOOSEDATE_Date[$i], $number_date)
			EndIf
		Next
		GUICtrlSetData($CHOOSEDATE_Label[0], _LICH_NumberToMon($MON) & ', ' & $YEAR)
	ElseIf $CHOOSEDATE_Tab = 1 Then
		GUICtrlSetData($CHOOSEDATE_Label[0], 'Năm ' & $YEAR)
	ElseIf $CHOOSEDATE_Tab = 2 Then
		GUICtrlSetData($CHOOSEDATE_Label[0], $YEAR & ' - ' & $YEAR + 11)
		For $i = 0 To 11
			GUICtrlSetData($CHOOSEDATE_Year[$i], $CHOOSEDATE_choose[1] + $i)
		Next
	EndIf
	
EndFunc   ;==>_CHOOSEDATE_SetData
Func _CHOOSEDATE_DateToString($date)
	Local $temp = StringSplit('thứ hai,thứ ba,thứ tư,thứ năm,thứ sáu,thứ bảy,chủ nhật', ',')
	If $temp[0] < $date Then Return 'thứ nhảm'
	Return $temp[$date]
EndFunc   ;==>_CHOOSEDATE_DateToString
