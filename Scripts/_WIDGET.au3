;_WIDGET.au3
Global $WIDGET_TKB1,$WIDGET_TKB2
Global $WIDGET2_menu2_TKB[8],$WIDGET2_menu2_TKBHover[4],$WIDGET2_menu2_nen,$WIDGET2_menu2_tkb_text,$WIDGET2_menu2_arrow[2],$WIDGET2_menu2_tkbcount

Func _WIDGET_TKB2()
if IsHWnd($WIDGET_TKB2) Then GUIDelete($WIDGET_TKB2)
	
	Global $WIDGET_TKB2 = GUICreate("WIDGET", 238, 167+34*2, _IniRead($Database,'WIDGET','WIDGET2_X',-1), _IniRead($Database,'WIDGET','WIDGET2_Y',-1), $WS_POPUP, $WS_EX_TOOLWINDOW)
	$WIDGET2_menu2_tkb_text = GUICtrlCreateLabel("Môn học hôm nay", 0, 0, 238, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), $GUI_WS_EX_PARENTDRAG)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")

	$WIDGET2_menu2_nen = GUICtrlCreateLabel("", 0, 296-261, 238, 167, BitOR($SS_CENTER, $SS_CENTERIMAGE), $GUI_WS_EX_PARENTDRAG)
	GUICtrlSetBkColor(-1, "0x008AF0")
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")

	$WIDGET2_menu2_TKBHover[0] = GUICtrlCreateLabel("", 0, 296-261, 238, 42, $SS_CENTER, -1)
	GUICtrlSetBkColor(-1, "-2")
	$WIDGET2_menu2_TKBHover[1] = GUICtrlCreateLabel("", 0, 338-261, 238, 42, $SS_CENTER, -1)
	GUICtrlSetBkColor(-1, "-2")
	$WIDGET2_menu2_TKBHover[2] = GUICtrlCreateLabel("", 0, 380-261, 238, 42, $SS_CENTER, -1)
	GUICtrlSetBkColor(-1, "-2")
	$WIDGET2_menu2_TKBHover[3] = GUICtrlCreateLabel("", 0, 422-261, 238, 42, $SS_CENTER, -1)
	GUICtrlSetBkColor(-1, "-2")


	
	$WIDGET2_menu2_TKB[0] = GUICtrlCreateLabel("", 0, 296-261, 46, 41, $SS_CENTER, -1)
	$WIDGET2_menu2_TKB[1] = GUICtrlCreateLabel("", 372 - 325, 296-261, 191, 41, $SS_CENTER, -1)
	$WIDGET2_menu2_TKB[2] = GUICtrlCreateLabel("", 0, 338-261, 46, 41, $SS_CENTER, -1)
	$WIDGET2_menu2_TKB[3] = GUICtrlCreateLabel("", 372 - 325, 338-261, 191, 41, $SS_CENTER, -1)
	$WIDGET2_menu2_TKB[4] = GUICtrlCreateLabel("", 0, 380-261, 46, 41, $SS_CENTER, -1)
	$WIDGET2_menu2_TKB[5] = GUICtrlCreateLabel("", 372 - 325, 380-261, 191, 41, $SS_CENTER, -1)
	$WIDGET2_menu2_TKB[6] = GUICtrlCreateLabel("", 0, 422-261, 46, 41, $SS_CENTER, -1)
	$WIDGET2_menu2_TKB[7] = GUICtrlCreateLabel("", 372 - 325, 422-261, 191, 41, $SS_CENTER, -1)
	For $i = 0 To 7
		GUICtrlSetFont($WIDGET2_menu2_TKB[$i], 11, 400, 0, "Segoe UI")
		GUICtrlSetColor($WIDGET2_menu2_TKB[$i], "0xFFFFFF")
		GUICtrlSetBkColor($WIDGET2_menu2_TKB[$i], "0x0072C6")
	Next

	GUICtrlCreateLabel("", 0, 464-261, 238, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetState(-1, BitOR($GUI_SHOW, $GUI_DISABLE))
	GUICtrlSetBkColor(-1, "0x008AF0")

	$WIDGET2_menu2_arrow[0] = GUICtrlCreateLabel($ICON_ARROW_LEFT, 0, 464-261, 31, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetState(-1, $GUI_SHOW)
	GUICtrlSetFont(-1, 12, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	GUICtrlSetOnEvent(-1, '_WIDGET2_TKB_Pre')
	$WIDGET2_menu2_arrow[1] = GUICtrlCreateLabel($ICON_ARROW_RIGHT, 532 - 325, 464-261, 31, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetState(-1, $GUI_SHOW)
	GUICtrlSetFont(-1, 12, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	GUICtrlSetOnEvent(-1, '_WIDGET2_TKB_Next')
	$WIDGET2_menu2_tkbcount = GUICtrlCreateLabel("", 361 - 325, 464-261, 171, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetState(-1, $GUI_SHOW)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister($WIDGET2_menu2_arrow[0], "_WIDGET2Hover", "_WIDGET2Normal")
	_GUICtrl_OnHoverRegister($WIDGET2_menu2_arrow[1], "_WIDGET2Hover", "_WIDGET2Normal")
	GUISetOnEvent($GUI_EVENT_PRIMARYUP, '_WIDGET_Save')
	GUISetState(@SW_SHOW,$WIDGET_TKB2)
	_TKB_SetMain()
EndFunc
Func _WIDGET2Hover($iCtrlID)
		GUICtrlSetBkColor($iCtrlID, '0x0072C6')
EndFunc

Func _WIDGET2Normal($iCtrlID)
	GUICtrlSetBkColor($iCtrlID, '0x008AF0')
EndFunc

Func _WIDGET_TKB1()
	Local $NUMBER = 0
	Local $ma_tkb = $GUI_TKB[1]
	Local $WIDGET_MonHoc[100][7]
	If $ma_tkb = '' Then
		_Msgbox(16, 'Thông báo', 'Bạn chưa có thời khóa biểu để bật widget')
		Return
	EndIf
	Local $read = IniReadSection($Database, "TKB" & $ma_tkb)
	If Not @error Then
		For $i = 1 To $read[0][0]
			Local $ma_mon_hoc = $read[$i][0]
			Local $read2 = StringSplit(_Iniread($Database, "TKB" & $ma_tkb, $ma_mon_hoc, ''), '|')
			For $j = $GUITKB_ADD_START To $read2[0]
				Local $read3 = StringSplit($read2[$j], '-')
				If $read3[0] > 5 Then
					$WIDGET_MonHoc[0][Number($read3[1]) - 1] += 1
					$WIDGET_MonHoc[$WIDGET_MonHoc[0][Number($read3[1]) - 1]][Number($read3[1]) - 1] = $ma_mon_hoc & '@' & $j & '@' & StringToBinary($read2[1]&@CRLF&$read3[2]&'h:'&$read3[3]&' đến '&$read3[4]&'h:'&$read3[5]&@CRLF&'Tại '&$read3[6],4)&'@'&$read2[2]
				Else
					_Msgbox(16 + 262144, 'Thông báo', 'Lỗi đọc thông tin môn học, mã lỗi 5, mã môn: ' & $ma_mon_hoc)
					Return 0
				EndIf
			Next
		Next
	EndIf
	For $i = 0 To 6
		If Number($WIDGET_MonHoc[0][$i]) > $NUMBER Then $NUMBER = Number($WIDGET_MonHoc[0][$i])
		For $j = Number($WIDGET_MonHoc[0][$i])-1 To 2 Step -1
			For $k = 1 To $j-1
				
				Local $ma_mon_hoc = StringSplit($WIDGET_MonHoc[$k][$i], '@')[1]
				Local $read = StringSplit(_Iniread($Database, "TKB" & $ma_tkb, $ma_mon_hoc, ''), '|')
				Local $tach1 = StringSplit($read[Number(StringSplit($WIDGET_MonHoc[$k][$i], '@')[2])], '-')
				Local $ma_mon_hoc2 = StringSplit($WIDGET_MonHoc[$k + 1][$i], '@')[1]
				Local $read = StringSplit(_Iniread($Database, "TKB" & $ma_tkb, $ma_mon_hoc2, ''), '|')
				Local $tach2 = StringSplit($read[Number(StringSplit($WIDGET_MonHoc[$k+1][$i], '@')[2])], '-')
				If Number($tach1[2]) * 60 + Number($tach1[3]) > Number($tach2[2]) * 60 + Number($tach2[3]) Then
					Local $temp = $WIDGET_MonHoc[$k][$i]
					$WIDGET_MonHoc[$k][$i] = $WIDGET_MonHoc[$k + 1][$i]
					$WIDGET_MonHoc[$k + 1][$i] = $temp
				EndIf
			Next
		Next
	Next
	$NUMBER+=2
	$NUMBER = $NUMBER < 6 ? 6 : $NUMBER
	if IsHWnd($WIDGET_TKB1) Then GUIDelete($WIDGET_TKB1)
	$WIDGET_TKB1 = GUICreate("WIDGET", 28 + 46 * 7, 55 + 24 * $NUMBER, _IniRead($Database,'WIDGET','WIDGET1_X',-1), _IniRead($Database,'WIDGET','WIDGET1_Y',-1), $WS_POPUP, $WS_EX_TOOLWINDOW)
	GUISetBkColor(0x0072C6, $WIDGET_TKB1)

	GUICtrlCreateLabel("THỜI KHÓA BIỂU", 0, 10, 28 + 46 * 7, 25, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("", 10, 41, 2, 24 * $NUMBER, $SS_CENTER, -1)
	GUICtrlSetBkColor(-1, "0xFFFFFF")
	For $i = 0 to 6
		For $j = 1 to Number($WIDGET_MonHoc[0][$i])
			GUICtrlCreateLabel(StringSplit($WIDGET_MonHoc[$j][$i],'@')[1] , 12 + 47 * $i, 42+24*$j, 47, 23, $SS_CENTER+$SS_CENTERIMAGE, $GUI_WS_EX_PARENTDRAG)
			GUICtrlSetFont(-1, 8, 400, 0, "Segoe UI")
			GUICtrlSetColor(-1,_EDITOR_ColorText(StringSplit($WIDGET_MonHoc[$j][$i],'@')[4]))
			GUICtrlSetBkColor(-1, StringSplit($WIDGET_MonHoc[$j][$i],'@')[4])
			GUICtrlSetTip(-1,BinaryToString(StringSplit($WIDGET_MonHoc[$j][$i],'@')[3],4))
		Next
	Next
	For $i = 0 To $NUMBER

		If $i <= 6 Then
			GUICtrlCreateLabel(StringSplit('Hai,Ba,Tư,Năm,Sáu,Bảy,CN', ',')[$i + 1], 12 + 47 * $i, 41, 47, 24, $SS_CENTER+$SS_CENTERIMAGE, $GUI_WS_EX_PARENTDRAG)
			GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI Semibold")
			GUICtrlSetColor(-1, "0x0072C6")
			GUICtrlSetBkColor(-1, "0xFFFFFF")
			GUICtrlCreateLabel("", (13 + 46) + 47 * $i, 41, 2, 24 * $NUMBER, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
			GUICtrlSetBkColor(-1, "0xFFFFFF")
		EndIf
		GUICtrlCreateLabel("", 10, 41 + 24 * $i, 46 * 7 + 11, 2, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
		GUICtrlSetBkColor(-1, "0xFFFFFF")

	Next

	GUICtrlCreateLabel('',0,0,28 + 46 * 7, 55 + 24 * $NUMBER,-1,$GUI_WS_EX_PARENTDRAG)
	GUICtrlSetBkColor(-1, "-2")


	GUISetOnEvent($GUI_EVENT_PRIMARYUP, '_WIDGET_Save')
	GUISetState(@SW_SHOW, $WIDGET_TKB1)
EndFunc   ;==>_WIDGET_TKB1
Func _LoadWidget()
	if IsHWnd($WIDGET_TKB1) And WinExists($WIDGET_TKB1) Then GUIDelete($WIDGET_TKB1)
	if IsHWnd($WIDGET_TKB2) And WinExists($WIDGET_TKB2) Then GUIDelete($WIDGET_TKB2)
	if Number(_IniRead($Database, "Pro5", "TKB1",0)) = 1 Then _WIDGET_TKB1()
	if Number(_IniRead($Database, "Pro5", "TKB2",0)) = 1 Then _WIDGET_TKB2()
EndFunc
Func _WIDGET_Save($hWndGUI, $MsgID)
	if IsHWnd($WIDGET_TKB1) And WinExists($WIDGET_TKB1) Then
		Local $pos = WinGetPos($WIDGET_TKB1)
		_IniWrite($Database,'WIDGET','WIDGET1_X',$pos[0])
		_IniWrite($Database,'WIDGET','WIDGET1_Y',$pos[1])
	EndIf
	if IsHWnd($WIDGET_TKB2) And WinExists($WIDGET_TKB2) Then
		Local $pos = WinGetPos($WIDGET_TKB2)
		_IniWrite($Database,'WIDGET','WIDGET2_X',$pos[0])
		_IniWrite($Database,'WIDGET','WIDGET2_Y',$pos[1])
	EndIf
	
EndFunc