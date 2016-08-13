;_GUITKB.au3
Func _TKB_NewNhacNho()
	If Number($GUI_TKB[0]) <= 0 Then

	Local $GUI_Temp = _DisableGUI($GUITKB)
		If _TKB_ADD_TKB() Then _TKB_LoadDataMain()
			_EnableGUI($GUITKB, $GUI_Temp)
		Return 0
	EndIf
	
	Local $read = IniReadSection($Database, "TKB" & $GUI_TKB[1])
	If @error Then
		If _TKB_ADD_MON($GUI_TKB[1]) Then _TKB_LoadDataMain()
		Return 0
	EndIf
	Local $id_mon
	If $MAIN_tkb[0] > 0 Then
		$id_mon = StringSplit($MAIN_tkb[1], '@')[1]
		For $i = 1 To $MAIN_tkb[0]
			Local $read2 = StringSplit(_Iniread($Database, "TKB" & $GUI_TKB[1], StringSplit($MAIN_tkb[$i], '@')[1], ''), '|')
			If Number($read2[2]) * 60 + Number($read2[3]) >= @HOUR * 60 + @MIN Then
				$id_mon = StringSplit($MAIN_tkb[$i], '@')[1]
				ExitLoop
			EndIf
		Next
	Else
		$id_mon = $read[1][0]
	EndIf
	If _TKB_MON_ADD_NHACNHO($GUI_TKB[1], $id_mon) Then _TKB_LoadDataMain()
	
EndFunc   ;==>_TKB_NewNhacNho
Func _MoGUITKB()
	_GUITKB()
EndFunc   ;==>_MoGUITKB
Func _TKB_HideGUI()
	_TKB_LoadDataMain()
			_Effect_LoadGUI($GUITKB, False)
			GUIDelete($GUITKB2)
			GUIDelete($GUITKB)
EndFunc
Func _GUITKB($mamh = '')
	If $GUI_TKB[0] = 0 Then
		If Not _TKB_ADD_TKB() Then Return 0
	EndIf
	If IsHWnd($GUITKB) And WinExists($GUITKB) Then
		WinActivate($GUITKB)
		WinSetOnTop($GUITKB, '', 1)
		WinSetOnTop($GUITKB, '', 0)
		Return 0
	EndIf
	$GUITKB = GUICreate("Thời khóa biểu học tập", 822, 509, -1, -1, BitOR($WS_POPUP, $WS_BORDER), -1)
	GUISetBkColor(0xFFFFFF, $GUITKB)
	$TKB_ESC = GUICtrlCreateButton('',-1000,-1000)
	GUICtrlSetOnEvent(-1,'_TKB_HideGUI')
	Dim $TKB_AccelTable[1][2] = [["{ESC}", $TKB_ESC]]
	GUISetAccelerators($TKB_AccelTable)
	
	GUICtrlCreateLabel("", 0, 443, 824, 2)
	GUICtrlSetBkColor(-1, "0x0072C6")
	GUICtrlCreateLabel("", 0, 100, 824, 1)
	GUICtrlSetBkColor(-1, 0x808080)
	GUICtrlCreateLabel("", 0, 0, 824, 100)
	GUICtrlSetBkColor(-1, "0x0072C6")
	GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlCreateLabel("Thời khóa biểu học tập", 30, 16, 500, 33, $SS_CENTERIMAGE, $GUI_WS_EX_PARENTDRAG)
	GUICtrlSetFont(-1, 25, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$TBK_Button_dstkb[0] = GUICtrlCreateLabel('', 30, 60, 222, 28, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x0063B1")
	$TBK_Button_dstkb[1] = GUICtrlCreateLabel($ICON_ARROW_LEFT, 252, 60, 21, 28, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 10, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x0063B1")
	$TBK_Button_dstkb[2] = GUICtrlCreateLabel($ICON_ARROW_RIGHT, 273, 60, 21, 28, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 10, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x0063B1")
	$TBK_Button_dstkb[3] = GUICtrlCreateLabel($ICON_SETTING, 314, 60, 21, 28, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 10, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x0063B1")
	$TBK_Button_dstkb[4] = GUICtrlCreateLabel($ICON_ADD, 293, 60, 21, 28, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 10, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x0063B1")

	$TBK_Button1 = GUICtrlCreateLabel("THÊM MÔN HỌC", 601, 460, 133, 33, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 10, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x0072C6")

	$TBK_Button2 = GUICtrlCreateLabel("THÊM NHẮC NHỞ", 461, 460, 133, 33, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 10, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x0072C6")
	$TBK_Button3 = GUICtrlCreateLabel("THOÁT", 740, 460, 66, 33, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 10, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x0072C6")
	
	$TBK_Tab1 = GUICtrlCreateLabel("KHÓA BIỂU", 57, 445, 93, 37, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x0072C6")
	$TBK_Tab2 = GUICtrlCreateLabel("MÔN HỌC", 57 + 94, 445, 93, 37, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x0072C6")
	

	; GUI TKB
	_GUICtrl_OnHoverRegister($TBK_Tab1, "_TKBHover", "_TKBNormal", "_Nothing", "_TKBClick")
	_GUICtrl_OnHoverRegister($TBK_Tab2, "_TKBHover", "_TKBNormal", "_Nothing", "_TKBClick")
	
	_GUICtrl_OnHoverRegister($TBK_Button1, "_TKBHover", "_TKBNormal", "_Nothing", "_TKBClick")
	_GUICtrl_OnHoverRegister($TBK_Button2, "_TKBHover", "_TKBNormal", "_Nothing", "_TKBClick")
	_GUICtrl_OnHoverRegister($TBK_Button3, "_TKBHover", "_TKBNormal", "_Nothing", "_TKBClick")
	_GUICtrl_OnHoverRegister($TBK_Button_dstkb[0], "_TKBHover", "_TKBNormal", "_Nothing", "_TKBClick")
	_GUICtrl_OnHoverRegister($TBK_Button_dstkb[1], "_TKBHover", "_TKBNormal", "_Nothing", "_TKBClick")
	_GUICtrl_OnHoverRegister($TBK_Button_dstkb[2], "_TKBHover", "_TKBNormal", "_Nothing", "_TKBClick")
	_GUICtrl_OnHoverRegister($TBK_Button_dstkb[3], "_TKBHover", "_TKBNormal", "_Nothing", "_TKBClick")
	_GUICtrl_OnHoverRegister($TBK_Button_dstkb[4], "_TKBHover", "_TKBNormal", "_Nothing", "_TKBClick")
	WinSetTrans($GUITKB, '', 0)
	GUISetState(@SW_SHOW, $GUITKB)
	
	_GUITKB2($mamh)
	_Effect_LoadGUI($GUITKB)
EndFunc   ;==>_GUITKB
Func _GUITKB2($mamh = '')
	$GUITKB2 = GUICreate("Thời khóa biểu", 822, 342, 0, 101, $WS_POPUP, -1)
	_WinAPI_SetParent($GUITKB2, $GUITKB)
	GUICtrlCreateTabItem("tab0")
	GUISetBkColor(0xFFFFFF, $GUITKB2)
	_GUIScrollbars_Generate($GUITKB2, 0, 60 * 20)
	$GUITKB2_text_no = GUICtrlCreateLabel("Bạn không có môn học nào trong thời khóa biểu này!", 0, 135, 822, 75, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0x0072C6")
	GUICtrlSetBkColor(-1, "-2")
	
	GUICtrlCreateTabItem("tab1")
	
	
	If $mamh = '' Then
		_TKB2_LoadMon_TKB($GUI_TKB[1])
	Else
		_TKB2_LoadNhacNho($GUI_TKB[1], $mamh)
	EndIf
	GUISetState(@SW_SHOW, $GUITKB2)
EndFunc   ;==>_GUITKB2
Func _TKB2_LoadMon($ma_tkb, $type = 0)
	GUISetState(@SW_LOCK, $GUITKB2)
	GUICtrlSetColor($TBK_Tab2, "0xFFFFFF")
	GUICtrlSetBkColor($TBK_Tab2, "0x0072C6")
	GUICtrlSetColor($TBK_Tab1, "0x0072C6")
	GUICtrlSetBkColor($TBK_Tab1, "-2")
	_TKB2_DeleteOldControl()
	
	If $type = 1 Then
		GUICtrlSetData($TBK_Button_dstkb[0], StringSplit(_Iniread($Database, "TKB", $ma_tkb, ''), '|')[1])
		Return 0
	EndIf
	
	
	_GUIScrollbars_Generate($GUITKB2, 1000)
	_GUIScrollBars_SetScrollInfoPos($GUITKB2, $SB_HORZ, 0)
	_GUIScrollBars_SetScrollInfoPos($GUITKB2, $SB_VERT, 0)
	_GUIScrollBars_SetScrollInfoMax($GUITKB2, $SB_VERT, 0)
	
	$GUITKB_State = 2
	
	$TKB2_Mon_Control[0][0] = 0
	Local $read = IniReadSection($Database, "TKB" & $ma_tkb)
	
	If Not @error Then
		$TKB2_Mon_Control[0][0] = $read[0][0]
		GUISwitch($GUITKB2)
		For $i = 1 To $read[0][0]
			Local $control[5]
			Local $color = StringSplit(_Iniread($Database, "TKB" & $ma_tkb, $read[$i][0], ''), '|')[2]
			Local $number = 0, $number2 = 0
			Local $read_number = IniReadSection($Database, "TKB" & $ma_tkb & '-' & $read[$i][0])
			If Not @error Then
				$number = _TKB_GetNhacNho($ma_tkb, $read[$i][0])
				$number2 = $read_number[0][0]
			EndIf
			$control[0] = GUICtrlCreateLabel("", 29 + 235 * ($i - 1), 25, 215, 271, -1, -1)
			GUICtrlSetColor(-1, "0xFF8000")
			GUICtrlSetBkColor(-1, $color)
			_GUICtrl_OnHoverRegister($control[0], "_TKBHover", "_TKBNormal", "_Nothing", "_TKBClick")

			$control[1] = GUICtrlCreateLabel("[" & $read[$i][0] & "] " & StringSplit(_Iniread($Database, "TKB" & $ma_tkb, $read[$i][0], ''), '|')[1] & @CRLF & "Giảng viên: " & StringSplit(_Iniread($Database, "TKB" & $ma_tkb, $read[$i][0], ''), '|')[3], 49 + 235 * ($i - 1), 45, 172, 55, $SS_CENTER, -1)
			GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
			GUICtrlSetColor(-1, _EDITOR_ColorText($color))
			GUICtrlSetBkColor(-1, "-2")
			$control[2] = GUICtrlCreateLabel($number, 31 + 235 * ($i - 1), 143, 213, 83, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
			GUICtrlSetFont(-1, 50, 300, 0, "Segoe UI Light")
			GUICtrlSetColor(-1, _EDITOR_ColorText($color))
			GUICtrlSetBkColor(-1, "-2")
			$control[3] = GUICtrlCreateLabel("nhắc nhở khả dụng" & @CRLF & 'trong tổng ' & $number2 & ' nhăc nhở', 29 + 235 * ($i - 1), 229, 215, 40, $SS_CENTER, -1)
			GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
			GUICtrlSetColor(-1, _EDITOR_ColorText($color))
			GUICtrlSetBkColor(-1, "-2")
			$control[4] = GUICtrlCreateLabel("hiện có", 29 + 235 * ($i - 1), 128, 215, 25, $SS_CENTER, -1)
			GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
			GUICtrlSetColor(-1, _EDITOR_ColorText($color))
			GUICtrlSetBkColor(-1, "-2")
			$TKB2_Mon_Control[$i][0] = $control
			$TKB2_Mon_Control[$i][1] = $read[$i][0]

		Next
		_GUIScrollbars_Generate($GUITKB2, $TKB2_Mon_Control[0][0] * 235 + 29 * 2, 0)
	EndIf
	If $TKB2_Mon_Control[0][0] = 0 Then
		GUICtrlSetData($TBK_Button_dstkb[0], '(Không có thời khóa biểu)')
		GUICtrlSetState($TBK_Button2, $GUI_HIDE)
		GUICtrlSetData($TBK_Button1, 'THÊM KHÓA BIỂU')
		GUICtrlSetState($GUITKB2_text_no, $GUI_SHOW)
		_GUIScrollbars_Generate($GUITKB2, 0, 0)
	Else
		GUICtrlSetState($GUITKB2_text_no, $GUI_HIDE)
		GUICtrlSetData($TBK_Button_dstkb[0], StringSplit(_Iniread($Database, "TKB", $ma_tkb, ''), '|')[1])
		GUICtrlSetState($TBK_Button2, $GUI_SHOW)
		GUICtrlSetData($TBK_Button1, 'THÊM MÔN HỌC')
	EndIf
	
	GUISetState(@SW_UNLOCK, $GUITKB2)
	
EndFunc   ;==>_TKB2_LoadMon
Func _TKB2_LoadMon_TKB($ma_tkb, $type = 0)
	GUISetState(@SW_LOCK, $GUITKB2)
	GUICtrlSetColor($TBK_Tab1, "0xFFFFFF")
	GUICtrlSetBkColor($TBK_Tab1, "0x0072C6")
	GUICtrlSetColor($TBK_Tab2, "0x0072C6")
	GUICtrlSetBkColor($TBK_Tab2, "-2")
	_TKB2_DeleteOldControl()
	$GUITKB_State = 1
	If $GUI_TKB[0] > 0 Then
		GUICtrlSetData($TBK_Button_dstkb[0], StringSplit(_Iniread($Database, "TKB", $ma_tkb, ''), '|')[1])
		GUICtrlSetState($TBK_Button2, $GUI_SHOW)
		GUICtrlSetData($TBK_Button1, 'THÊM MÔN HỌC')
	Else
		GUICtrlSetData($TBK_Button_dstkb[0], '(Không có thời khóa biểu)')
		GUICtrlSetState($TBK_Button2, $GUI_HIDE)
		GUICtrlSetData($TBK_Button1, 'THÊM KHÓA BIỂU')
	EndIf
	If $type = 1 Then Return 0
	GUISwitch($GUITKB2)

	
	_GUIScrollBars_SetScrollInfoPos($GUITKB2, $SB_HORZ, 0)
	_GUIScrollBars_SetScrollInfoMax($GUITKB2, $SB_HORZ, 0)
	_GUIScrollBars_SetScrollInfoPos($GUITKB2, $SB_VERT, 0)
	_GUIScrollBars_SetScrollInfoMax($GUITKB2, $SB_VERT, 0)
	$GUITKB2_MonHoc[0][0] = 0
	$GUITKB2_text_Hour[24] = 0
	If $GUI_TKB[0] > 0 Then
		Local $read = IniReadSection($Database, "TKB" & $ma_tkb)
		If Not @error Then
			GUISwitch($GUITKB2)
			Local $hmax = -1, $hmin = 24, $hmax_to_hmin
			For $i = 1 To $read[0][0]
				Local $ma_mon_hoc = $read[$i][0]
				Local $read2 = StringSplit(_Iniread($Database, "TKB" & $ma_tkb, $ma_mon_hoc, ''), '|')
				For $j = $GUITKB_ADD_START To $read2[0]
					Local $read3 = StringSplit($read2[$j], '-')
					If $read3[0] > 5 Then
						$GUITKB2_MonHoc[0][0] += 1
						$GUITKB2_MonHoc[$GUITKB2_MonHoc[0][0]][1] = $ma_mon_hoc & '@' & $j
						If Number($read3[2]) < $hmin Then 
							$hmin = Number($read3[2])
						EndIf
						If Number($read3[4]) > $hmax Then
							
							$hmax = Number($read3[4])
							If Number($read3[5]) > 0 Then $hmax += 1
						EndIf
					Else
						_Msgbox(16 + 262144, 'Thông báo', 'Lỗi đọc thông tin môn học, mã lỗi 5, mã môn: ' & $ma_mon_hoc)
						Return 0
					EndIf
				Next
			Next
			
			$hmax_to_hmin = $hmax - $hmin
			If $hmax_to_hmin < 4 Then
				$hmax_to_hmin = 5
				$hmax = $hmin + $hmax_to_hmin
			EndIf
			_GUIScrollbars_Generate($GUITKB2, 0, 37 + 60 * ($hmax_to_hmin + 1)) ; tạo thanh cuộn
			; tạo lại các control cũ -------------------------------------------------------------------------------------------------------------------------
			Local $to_day_is = _DateToDayOfWeekISO(@YEAR, @MON, @MDAY)

			For $i = 0 To 6

				$GUITKB2_text_Date[$i] = GUICtrlCreateLabel(StringUpper(StringSplit($THU_TU_NGAY, '|')[$i + 1]), 60 + 109 * $i, 0, 108, 37, $SS_CENTER, -1)
				GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
				GUICtrlSetColor(-1, "0xFFFFFF")
				GUICtrlSetBkColor(-1, "0x0072C6")
				$GUITKB2_text_Dateline[$i] = GUICtrlCreateLabel('', 59 + 109 * $i, 0, 1, ($hmax_to_hmin + 1) * 61 + 38)
				GUICtrlSetBkColor(-1, 0x999999)
				Local $text = GUICtrlRead($GUITKB2_text_Date[$i])
				Local $text2 = StringSplit(_DateAdd('d', $i + 1 - $to_day_is, _NowCalcDate()), '/')
				GUICtrlSetData($GUITKB2_text_Date[$i], $text & @CRLF & $text2[3] & '/' & $text2[2])
			Next
			
			Local $control_pos = ControlGetPos($GUITKB2, '', $GUITKB2_text_Date[$to_day_is - 1])
			$GUITKB2_text_Date_today = GUICtrlCreateLabel("", $control_pos[0], 38, $control_pos[2], ($hmax_to_hmin + 1) * 61)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetBkColor(-1, 0x999999)
			$GUITKB2_text_Date_nen = GUICtrlCreateLabel("", 0, 0, 59, 37, $SS_CENTER, -1)
			GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
			GUICtrlSetColor(-1, "0xFFFFFF")
			GUICtrlSetBkColor(-1, "0x0072C6")
			; -------------------------------------------------------------------------------------------------------------------------
			; tạo môn học, giờ học
			$GUITKB2_text_Hour[24] = $hmax_to_hmin
			For $i = 0 To $hmax_to_hmin
				$GUITKB2_text_Hour[$i + 1] = GUICtrlCreateLabel($hmin + $i, 0, 38 + 61 * $i, 59, 60, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
				GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
				GUICtrlSetColor(-1, "0xFFFFFF")
				GUICtrlSetBkColor(-1, "0x0072C6")
				
				$GUITKB2_text_Hourline[$i + 1] = GUICtrlCreateLabel('', 0, 37 + 61 * $i, 850, 1)
				GUICtrlSetBkColor(-1, 0x999999)
			Next
			$GUITKB2_text_Hourline[$i + 1] = GUICtrlCreateLabel('', 0, 37 + 61 * $i, 850, 1)
			GUICtrlSetBkColor(-1, 0x999999)

			
			For $i = 1 To $GUITKB2_MonHoc[0][0]
				Local $ma_mon_hoc = StringSplit($GUITKB2_MonHoc[$i][1], '@')[1]
				Local $read2 = StringSplit(_Iniread($Database, "TKB" & $ma_tkb, $ma_mon_hoc, ''), '|')
				Local $read3 = StringSplit($read2[Number(StringSplit($GUITKB2_MonHoc[$i][1], '@')[2])], '-')
				Local $slot = Number($read3[1]) - 1
				$slot = $slot < 0 ? 0 : $slot
				Local $control_pos = ControlGetPos($GUITKB2, '', $GUITKB2_text_Date[$slot])
				Local $pos1 = 38 + Number($read3[2]) * 61 + Number($read3[3]) - $hmin * 61
				Local $pos2 = (Number($read3[4]) - Number($read3[2])) * 61 + Number($read3[5]) - Number($read3[3])
				$GUITKB2_MonHoc[$i][0] = GUICtrlCreateLabel("", $control_pos[0], $pos1, $control_pos[2], $pos2)
				GUICtrlSetData(-1, ' [' & $ma_mon_hoc & '] ' & $read2[1] & @CRLF & ' ' & $read2[3] & @CRLF & ' ' & $read3[2] & 'h:' & $read3[3] & ' đến ' & $read3[4] & 'h:' & $read3[5] & @CRLF & ' ' & $read3[6])
				GUICtrlSetBkColor(-1, $read2[2])
				GUICtrlSetFont(-1, 8, 400, 0, "Segoe UI")
				GUICtrlSetColor(-1, _EDITOR_ColorText($read2[2]))
				_GUICtrl_OnHoverRegister(-1, "_TKBHover", "_TKBNormal", "_Nothing", "_TKBClick")
			Next
		EndIf
	EndIf
	If $GUITKB2_MonHoc[0][0] = 0 Then
		For $i = 0 To 6
			GUICtrlSetState($GUITKB2_text_Date[$i], $GUI_HIDE)
			GUICtrlSetState($GUITKB2_text_Dateline[$i], $GUI_HIDE)
		Next
		GUICtrlSetState($GUITKB2_text_Date_today, $GUI_HIDE)
		GUICtrlSetState($GUITKB2_text_Date_nen, $GUI_HIDE)
		GUICtrlSetState($GUITKB2_text_no, $GUI_SHOW)
		_GUIScrollbars_Generate($GUITKB2, 0, 0)
	Else
		For $i = 0 To 6
			GUICtrlSetState($GUITKB2_text_Date[$i], $GUI_SHOW)
			GUICtrlSetState($GUITKB2_text_Dateline[$i], $GUI_SHOW)
		Next
		GUICtrlSetState($GUITKB2_text_Date_today, $GUI_SHOW)
		GUICtrlSetState($GUITKB2_text_Date_nen, $GUI_SHOW)
		GUICtrlSetState($GUITKB2_text_no, $GUI_HIDE)
		
	EndIf
	GUISetState(@SW_UNLOCK, $GUITKB2)
EndFunc   ;==>_TKB2_LoadMon_TKB
Func _TKB2_LoadNhacNho($ma_tkb, $ma_mon_hoc)
	GUISetState(@SW_LOCK, $GUITKB2)
	_TKB2_DeleteOldControl()
	_GUIScrollbars_Generate($GUITKB2, 1000)
	_GUIScrollBars_SetScrollInfoPos($GUITKB2, $SB_HORZ, 0)
	_GUIScrollBars_SetScrollInfoPos($GUITKB2, $SB_VERT, 0)
	_GUIScrollBars_SetScrollInfoMax($GUITKB2, $SB_VERT, 0)
	
	$GUITKB_State = 3
	$GUI_TKB[$GUI_TKB[0] + 1] = $ma_mon_hoc
	$TKB2_Mon_Control[0][0] = 0
	GUISwitch($GUITKB2)
	Local $color = StringSplit(_Iniread($Database, "TKB" & $ma_tkb, $ma_mon_hoc, ''), '|')[2]
	
	Local $read = IniReadSection($Database, "TKB" & $ma_tkb & '-' & $ma_mon_hoc)
	If Not @error Then
		$TKB2_Mon_Control[0][0] = $read[0][0]
		If $TKB2_Mon_Control[0][0] > 1 Then
			For $i = $read[0][0] - 1 To 1 Step -1 ; sắp xếp
				For $j = 1 To $i
					Local $read2 = StringSplit(_IniRead($Database, "TKB" & $ma_tkb & '-' & $ma_mon_hoc, $read[$j][0], ''), '|')
					Local $tach = StringSplit($read2[1], '/')
					Local $read3 = StringSplit(_IniRead($Database, "TKB" & $ma_tkb & '-' & $ma_mon_hoc, $read[$j + 1][0], ''), '|')
					Local $tach2 = StringSplit($read3[1], '/')
					If Number($read2[$read2[0]]) = 1 Or _DateDiff('d', _NowCalcDate(), $tach[3] & '/' & $tach[2] & '/' & $tach[1]) > _DateDiff('d', _NowCalcDate(), $tach2[3] & '/' & $tach2[2] & '/' & $tach2[1]) Then
						
						Local $temp = $read[$j][0]
						$read[$j][0] = $read[$j + 1][0]
						$read[$j + 1][0] = $temp
					EndIf
				Next
			Next
		EndIf
		
		
		For $i = 1 To $read[0][0]
			Local $read2 = StringSplit(_IniRead($Database, "TKB" & $ma_tkb & '-' & $ma_mon_hoc, $read[$i][0], ''), '|')
			Local $tach = StringSplit($read2[1], '/')
			If _DateDiff('d', _NowCalcDate(), $tach[3] & '/' & $tach[2] & '/' & $tach[1]) < 0 And Number($read2[2]) = 1 Then
				Local $temp = $read[$i][0]
				For $j = $i To $read[0][0] - 1
					$read[$j][0] = $read[$j + 1][0]
				Next
				$read[$read[0][0]][0] = $temp
				Local $read = _InIRead($Database, "TKB" & $ma_tkb & '-' & $ma_mon_hoc, $read[$i][0], '')
				_IniWrite($Database, "TKB" & $ma_tkb & '-' & $ma_mon_hoc, $read[$i][0], StringTrimRight($read, 1) & '1')
			EndIf
		Next
		For $i = 1 To $read[0][0]
			Local $control[5]
			Local $read2 = StringSplit(_IniRead($Database, "TKB" & $ma_tkb & '-' & $ma_mon_hoc, $read[$i][0], ''), '|')
			$control[4] = GUICtrlCreateLabel("", 29 + 235 * ($i - 1), 263, 215, 25, $SS_CENTER, -1)
			_GUICtrl_OnHoverRegister($control[4], "_TKBHover", "_TKBNormal", "_Nothing", "_TKBClick")
			
			$control[0] = GUICtrlCreateLabel("", 29 + 235 * ($i - 1), 25, 215, 271, -1, -1)
			GUICtrlSetColor(-1, "0xFF8000")
			GUICtrlSetBkColor(-1, $color)
			_GUICtrl_OnHoverRegister($control[0], "_TKBHover", "_TKBNormal", "_Nothing", "_TKBClick")
			$control[1] = GUICtrlCreateLabel(Number($read2[2]) = 0 ? "Nhắc nhở bài tập" & @CRLF & $read2[1] : "Nhắc nhở ngày thi" & @CRLF & $read2[1], 49 + 235 * ($i - 1), 40, 172, 41, $SS_CENTER, -1)
			GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
			GUICtrlSetColor(-1, _EDITOR_ColorText($color))
			GUICtrlSetBkColor(-1, "-2")
			$control[2] = GUICtrlCreateLabel(BinaryToString($read2[3], 4), 50 + 235 * ($i - 1), 100, 176, 139, $SS_CENTER, -1)
			GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
			GUICtrlSetColor(-1, _EDITOR_ColorText($color))
			GUICtrlSetBkColor(-1, "-2")
			
			$control[3] = GUICtrlCreateLabel(Number($read2[4]) = 0 ? "□ Đã hoàn thành" : "☑ Đã hoàn thành", 29 + 235 * ($i - 1), 263, 215, 25, $SS_CENTER, -1)
			GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
			GUICtrlSetColor(-1, _EDITOR_ColorText($color))
			GUICtrlSetBkColor(-1, "-2")
			GUICtrlSetCursor(-1, 0)
			If Number($read2[4]) = 1 Then
				For $j = 0 To UBound($control) - 1
					GUICtrlSetColor($control[$j], 0xFFFFFF)
					GUICtrlSetBkColor($control[$j], 0x808080)
				Next
			EndIf
			$TKB2_Mon_Control[$i][0] = $control
			$TKB2_Mon_Control[$i][1] = $read[$i][0] & '@' & $ma_mon_hoc

		Next
		_GUIScrollbars_Generate($GUITKB2, $TKB2_Mon_Control[0][0] * 235 + 29 * 2, 0)
	EndIf
	If $TKB2_Mon_Control[0][0] = 0 Then
		GUICtrlSetData($GUITKB2_text_no, '(Không có nhắc nhở nào)')
		GUICtrlSetState($GUITKB2_text_no, $GUI_SHOW)
		_GUIScrollbars_Generate($GUITKB2, 0, 0)
	Else
		GUICtrlSetState($GUITKB2_text_no, $GUI_HIDE)
	EndIf
	GUICtrlSetState($TBK_Button2, $GUI_HIDE)
	GUICtrlSetState($TBK_Button1, $GUI_SHOW)
	GUICtrlSetData($TBK_Button1, "THÊM NHẮC NHỞ")
	GUICtrlSetColor($TBK_Tab1, "0xFFFFFF")
	GUICtrlSetBkColor($TBK_Tab1, "0x0072C6")
	GUICtrlSetColor($TBK_Tab2, "0xFFFFFF")
	GUICtrlSetBkColor($TBK_Tab2, "0x0072C6")
	
	GUISetState(@SW_UNLOCK, $GUITKB2)
EndFunc   ;==>_TKB2_LoadNhacNho
Func _TKB_Load_DeffaultTKB()
	Local $read = IniReadSection($Database, "TKB")
	$GUI_TKB[0] = 1
	$GUI_TKB[1] = ''
	If Not @error Then
		For $i = 1 To $read[0][0]
			Local $tach = StringSplit(_Iniread($Database, "TKB", $read[$i][0], ''), '|')
			$GUI_TKB[0] += 1
			$GUI_TKB[$GUI_TKB[0]] = $read[$i][0]
			If Number($tach[2]) = 1 Then
				$GUI_TKB[0] -= 1
				$GUI_TKB[1] = $read[$i][0]
			EndIf
		Next
	EndIf
	If $GUI_TKB[0] = 1 And $GUI_TKB[1] == '' Then $GUI_TKB[0] = 0
	Return $GUI_TKB[1]
EndFunc   ;==>_TKB_Load_DeffaultTKB
Func _TKB_TaoMon()
	Local $GUI_Temp = _DisableGUI($GUITKB)
	If $GUITKB_State < 3 Then
		If _TKB_ADD_MON($GUI_TKB[1]) Then
			If $GUITKB_State = 1 Then
				_TKB2_LoadMon_TKB($GUI_TKB[1])
			ElseIf $GUITKB_State = 2 Then
				_TKB2_LoadMon($GUI_TKB[1])

			EndIf
		EndIf
	Else
		If _TKB_MON_ADD_NHACNHO($GUI_TKB[1], $GUI_TKB[$GUI_TKB[0] + 1]) Then _TKB2_LoadNhacNho($GUI_TKB[1], $GUI_TKB[$GUI_TKB[0] + 1])
	EndIf
	_EnableGUI($GUITKB, $GUI_Temp)
EndFunc   ;==>_TKB_TaoMon
Func _TKB2_DeleteOldControl()
	If $GUITKB_State = 1 Then
		GUICtrlDelete($GUITKB2_text_Date_today)
		GUICtrlDelete($GUITKB2_text_Date_nen)
		For $i = 0 To 6
			GUICtrlDelete($GUITKB2_text_Date[$i])
			GUICtrlDelete($GUITKB2_text_Dateline[$i])
		Next
		If Number($GUITKB2_MonHoc[0][0]) > 0 Then
			For $i = 1 To $GUITKB2_MonHoc[0][0]
				GUICtrlDelete($GUITKB2_MonHoc[$i][0])
			Next
			
		EndIf
		If Number($GUITKB2_text_Hour[24]) > 0 Then
			For $i = 0 To Number($GUITKB2_text_Hour[24])
				GUICtrlDelete($GUITKB2_text_Hour[$i + 1])
				GUICtrlDelete($GUITKB2_text_Hourline[$i + 1])
			Next
			GUICtrlDelete($GUITKB2_text_Hourline[$i])
		EndIf
	ElseIf $GUITKB_State = 2 Then
		If Number($TKB2_Mon_Control[0][0]) > 0 Then
			For $i = 1 To $TKB2_Mon_Control[0][0]
				Local $control = $TKB2_Mon_Control[$i][0]
				For $j = 0 To UBound($control) - 1
					GUICtrlDelete($control[$j])
				Next
			Next
			
		EndIf
		
	ElseIf $GUITKB_State = 3 Then
		If Number($TKB2_Mon_Control[0][0]) > 0 Then
			For $i = 1 To $TKB2_Mon_Control[0][0]
				Local $control = $TKB2_Mon_Control[$i][0]
				For $j = 0 To UBound($control) - 1
					GUICtrlDelete($control[$j])
				Next
			Next
			
		EndIf
		
	EndIf
EndFunc   ;==>_TKB2_DeleteOldControl

Func _TKB_SetMain()
	$ma_tkb = $GUI_TKB[1]
	
	
	If $MAIN_tkb[0] > 0 Then
		GUICtrlSetData($main_Tab2_menu1_tkb[4][2], "Tạo nhắc nhở")
		GUICtrlSetData($main_Tab1_menu3_button[0][1], 'TẠO NHẮC NHỞ')
		GUICtrlSetState($main_Tab1_menu2_nen, $GUI_DISABLE)
		GUICtrlSetData($main_Tab1_menu2_nen, '')
		For $i = 0 To 3
			GUICtrlSetState($main_Tab1_menu2_TKB[$i * 2], $GUI_SHOW)
			GUICtrlSetState($main_Tab1_menu2_TKB[$i * 2 + 1], $GUI_SHOW)
			if IsHWnd($WIDGET_TKB2) and BitAND(WinGetState($WIDGET_TKB2), 2) = 2 Then
			GUICtrlSetState($WIDGET2_menu2_TKB[$i * 2], $GUI_SHOW)
			GUICtrlSetState($WIDGET2_menu2_TKB[$i * 2 + 1], $GUI_SHOW)	
			EndIf
			If $i > $MAIN_tkb[0] - 1 Then

				GUICtrlSetData($main_Tab1_menu2_TKB[$i * 2 + 1], '')
				GUICtrlSetData($main_Tab1_menu2_TKB[$i * 2], '')
				If $i < 3 Then
					GUICtrlSetBkColor($main_Tab2_menu1_tkb[2 - $i][0], 0x008AF0)
					GUICtrlSetColor($main_Tab2_menu1_tkb[2 - $i][1], 0xFFFFFF)
					GUICtrlSetColor($main_Tab2_menu1_tkb[2 - $i][2], 0xFFFFFF)
					GUICtrlSetData($main_Tab2_menu1_tkb[2 - $i][1], '')
					GUICtrlSetData($main_Tab2_menu1_tkb[2 - $i][2], '')
				EndIf
				if IsHWnd($WIDGET_TKB2) and BitAND(WinGetState($WIDGET_TKB2), 2) = 2 Then
				GUICtrlSetData($WIDGET2_menu2_TKB[$i * 2 + 1], '')
				GUICtrlSetData($WIDGET2_menu2_TKB[$i * 2], '')
				GUICtrlSetBkColor($WIDGET2_menu2_TKB[$i * 2 + 1],-2)
				GUICtrlSetBkColor($WIDGET2_menu2_TKB[$i * 2],-2)
				EndIf
			Else

				Local $ma_mon_hoc = StringSplit($MAIN_tkb[$i + 1], '@')[1]
				Local $read2 = StringSplit(_Iniread($Database, "TKB" & $ma_tkb, $ma_mon_hoc, ''), '|')
				Local $read3 = StringSplit($read2[StringSplit($MAIN_tkb[$i + 1], '@')[2]], '-')
				If $read3[6] = '' Then $read3[6] = 'Môn học'
				GUICtrlSetData($main_Tab1_menu2_TKB[$i * 2 + 1], $read3[6] & @CRLF & $read2[1])
				GUICtrlSetData($main_Tab1_menu2_TKB[$i * 2], $read3[2] & ':' & $read3[3] & @CRLF & $read3[4] & ':' & $read3[5])
				if IsHWnd($WIDGET_TKB2) and BitAND(WinGetState($WIDGET_TKB2), 2) = 2 Then
				GUICtrlSetData($WIDGET2_menu2_TKB[$i * 2 + 1], $read3[6] & @CRLF & $read2[1])
				GUICtrlSetData($WIDGET2_menu2_TKB[$i * 2], $read3[2] & ':' & $read3[3] & @CRLF & $read3[4] & ':' & $read3[5])
				GUICtrlSetBkColor($WIDGET2_menu2_TKB[$i * 2 + 1],$read2[2])
				GUICtrlSetBkColor($WIDGET2_menu2_TKB[$i * 2],$read2[2])
				GUICtrlSetColor($WIDGET2_menu2_TKB[$i * 2 + 1],_EDITOR_ColorText($read2[2]))
				GUICtrlSetColor($WIDGET2_menu2_TKB[$i * 2],_EDITOR_ColorText($read2[2]))
				EndIf
				If $i < 3 Then
					GUICtrlSetBkColor($main_Tab2_menu1_tkb[2 - $i][0], $read2[2])
					GUICtrlSetData($main_Tab2_menu1_tkb[2 - $i][1], $read2[1])
					GUICtrlSetColor($main_Tab2_menu1_tkb[2 - $i][1], _EDITOR_ColorText($read2[2]))
					GUICtrlSetColor($main_Tab2_menu1_tkb[2 - $i][2], _EDITOR_ColorText($read2[2]))
					GUICtrlSetData($main_Tab2_menu1_tkb[2 - $i][2], $read3[2] & 'h:' & $read3[3] & ' - ' & $read3[4] & 'h:' & $read3[5] & @CRLF & $read3[6])
					$main_Tab2_menu1_tkb[2 - $i][3] = $ma_mon_hoc
				EndIf
				
			EndIf
		Next
				If $MAIN_tkb[0] > 4 Then
					if IsHWnd($WIDGET_TKB2) and BitAND(WinGetState($WIDGET_TKB2), 2) = 2 Then GUICtrlSetData($WIDGET2_menu2_tkbcount, 'và ' & $MAIN_tkb[0] - 4 & ' giờ học khác')
					GUICtrlSetData($main_Tab1_menu2_tkbcount, 'và ' & $MAIN_tkb[0] - 4 & ' giờ học khác')
				Else
					if IsHWnd($WIDGET_TKB2) and BitAND(WinGetState($WIDGET_TKB2), 2) = 2 Then GUICtrlSetData($WIDGET2_menu2_tkbcount, '')
					GUICtrlSetData($main_Tab1_menu2_tkbcount, '')
				EndIf
				
	Else
		If Number($GUI_TKB[0]) <= 0 Then
			GUICtrlSetData($main_Tab2_menu1_tkb[4][2], "Tạo thời khóa biểu")
			GUICtrlSetData($main_Tab1_menu3_button[0][1], 'TẠO KHÓA BIỂU')
		Else
			GUICtrlSetData($main_Tab2_menu1_tkb[4][2], "Tạo môn học")
			GUICtrlSetData($main_Tab1_menu3_button[0][1], 'TẠO MÔN HỌC')
		EndIf
		GUICtrlSetState($main_Tab1_menu2_nen, $GUI_ENABLE)
		GUICtrlSetData($main_Tab1_menu2_nen, 'Bạn không có giờ học nào!')
		For $i = 0 To 3
			if $i < 3 Then
					GUICtrlSetBkColor($main_Tab2_menu1_tkb[2 - $i][0], 0x008AF0)
					GUICtrlSetColor($main_Tab2_menu1_tkb[2 - $i][1], 0xFFFFFF)
					GUICtrlSetColor($main_Tab2_menu1_tkb[2 - $i][2], 0xFFFFFF)
					GUICtrlSetData($main_Tab2_menu1_tkb[2 - $i][1], '')
					GUICtrlSetData($main_Tab2_menu1_tkb[2 - $i][2], '')
			EndIf
			GUICtrlSetState($main_Tab1_menu2_TKB[$i * 2], $GUI_HIDE)
			GUICtrlSetState($main_Tab1_menu2_TKB[$i * 2 + 1], $GUI_HIDE)
			if IsHWnd($WIDGET_TKB2) and BitAND(WinGetState($WIDGET_TKB2), 2) = 2 Then 
			GUICtrlSetState($WIDGET2_menu2_TKB[$i * 2], $GUI_HIDE)
			GUICtrlSetState($WIDGET2_menu2_TKB[$i * 2 + 1], $GUI_HIDE)
			EndIf
		Next
	EndIf
EndFunc   ;==>_TKB_SetMain

Func _TKB_GetNhacNho($ma_tkb, $ma_mon_hoc)
	Local $tong = 0
	Local $read = IniReadSection($Database, "TKB" & $ma_tkb & '-' & $ma_mon_hoc)
	If Not @error Then
		For $i = 1 To $read[0][0]
			Local $read2 = StringSplit(_Iniread($Database, "TKB" & $ma_tkb & '-' & $ma_mon_hoc, $read[$i][0], ''), '|')
			Local $tach = StringSplit($read2[1], '/')
			If Not @error Then
				If $tach[0] > 2 Then
					If Number($read2[$read2[0]]) = 0 And _DateDiff('d', _NowCalcDate(), $tach[3] & '/' & $tach[2] & '/' & $tach[1]) >= 0 Then $tong += 1
				EndIf
			EndIf
		Next
	EndIf
	Return $tong
EndFunc   ;==>_TKB_GetNhacNho
Func _TKB_LoadDataMain($YEAR = @YEAR, $MON = @MON, $DAY = @MDAY)
	$ma_tkb = $GUI_TKB[1]
	$MAIN_tkb[0] = 0
	GUICtrlSetData($main_Tab2_menu1_Text1, '0')
	GUICtrlSetData($main_Tab2_menu1_Text3, '0')
	GUICtrlSetData($main_Tab2_menu1_Text2, 'Không có môn học nào trong thời khóa biểu')
	GUICtrlSetData($main_Tab2_menu1_Text4, 'Bạn không có nhắc nhở nào')
	Local $read = IniReadSection($Database, "TKB" & $ma_tkb)
	If Not @error Then
		Local $soluonggio = 0, $soluongnhac = 0
		GUICtrlSetData($main_Tab2_menu1_Text1, $read[0][0] > 9 ? $read[0][0] : '0' & $read[0][0])
		For $i = 1 To $read[0][0]
			Local $ma_mon_hoc = $read[$i][0]
			$soluongnhac += _TKB_GetNhacNho($ma_tkb, $ma_mon_hoc)
			Local $read2 = StringSplit(_Iniread($Database, "TKB" & $ma_tkb, $ma_mon_hoc, ''), '|')
			If Not @error Then
				For $j = $GUITKB_ADD_START To $read2[0]
					$soluonggio += 1
					Local $read3 = StringSplit($read2[$j], '-')
					If Number(_DateToDayOfWeekISO($YEAR, $MON, $DAY)) = Number($read3[1]) Then
						$MAIN_tkb[0] += 1
						$MAIN_tkb[$MAIN_tkb[0]] = $ma_mon_hoc & '@' & $j
					EndIf
				Next
			EndIf
		Next
		GUICtrlSetData($main_Tab2_menu1_Text2, 'môn học và ' & $soluonggio & ' tiết trong tuần')
		GUICtrlSetData($main_Tab2_menu1_Text3, $soluongnhac > 9 ? $soluongnhac : '0' & $soluongnhac)
		GUICtrlSetData($main_Tab2_menu1_Text4, 'nhắc nhở còn khả dụng trong các môn học')
		For $i = $MAIN_tkb[0] - 1 To 1 Step -1
			For $j = 1 To $i
				Local $time1 = Number(StringSplit(StringSplit(_Iniread($Database, "TKB" & $ma_tkb, StringSplit($MAIN_tkb[$j], '@')[1], ''), '|')[Number(StringSplit($MAIN_tkb[$j], '@')[2])], '-')[2])*60+  Number(StringSplit(StringSplit(_Iniread($Database, "TKB" & $ma_tkb, StringSplit($MAIN_tkb[$j], '@')[1], ''), '|')[Number(StringSplit($MAIN_tkb[$j], '@')[2])], '-')[3])
				Local $time2 = Number(StringSplit(StringSplit(_Iniread($Database, "TKB" & $ma_tkb, StringSplit($MAIN_tkb[$j + 1], '@')[1], ''), '|')[Number(StringSplit($MAIN_tkb[$j + 1], '@')[2])], '-')[2])*60 + Number(StringSplit(StringSplit(_Iniread($Database, "TKB" & $ma_tkb, StringSplit($MAIN_tkb[$j + 1], '@')[1], ''), '|')[Number(StringSplit($MAIN_tkb[$j + 1], '@')[2])], '-')[3])
				If $time1 > $time2 Then
					Local $temp = $MAIN_tkb[$j]
					$MAIN_tkb[$j] = $MAIN_tkb[$j + 1]
					$MAIN_tkb[$j + 1] = $temp
				EndIf
				
			Next
		Next

	EndIf
	
	_TKB_SetMain()
EndFunc   ;==>_TKB_LoadDataMain
