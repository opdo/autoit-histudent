;_LICH_NEW.au3
#include <Date.au3>
Global $GUILICH, $GUILICH2, $LICH_Menu_Mon[6], $LICH_Control[7 * 6], $LICH_TabCtrl
Global $LICH_number_day, $LICH_number_week
Global $LICH_ChooseDate[3] ; 0 là tháng, 1 là năm, 2 là ngày (tính theo stt ID control)
Global $LICH_Event[50][7 * 6]
Global $LICH_Button[5][6], $LICH_Button2[3]
Global $LICH2_Control[100][2]
#Region GUI LICH
$GUILICH = GUICreate("Lịch biểu của bạn", 865, 656, -1, -1, BitOR($WS_POPUP, $WS_BORDER), -1)
GUISetBkColor(0x0063B1, $GUILICH)
	$LICH_ESC = GUICtrlCreateButton('',-1000,-1000)
	GUICtrlSetOnEvent(-1,'_LICH_HideGUI')
	Dim $LICH_AccelTable[1][2] = [["{ESC}", $LICH_ESC]]
	GUISetAccelerators($LICH_AccelTable)
	
GUICtrlCreateLabel("Lịch biểu của bạn", 0, 0, 865, 73, BitOR($SS_CENTER, $SS_CENTERIMAGE), $GUI_WS_EX_PARENTDRAG)
GUICtrlSetFont(-1, 30, 300, 0, "Segoe UI Light")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
$LICH_Menu_Mon[3] = GUICtrlCreateLabel("", 0, 87, 865, 38, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetBkColor(-1, "0x008AF0")
GUICtrlSetState(-1, $GUI_DISABLE)
$LICH_Menu_Mon[0] = GUICtrlCreateLabel("Tháng mười hai 2016", 315, 87, 230, 38, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 14, 600, 0, "Segoe UI Semibold")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlSetOnEvent(-1, '_LICH_MenuChooseDate')
$LICH_Menu_Mon[2] = GUICtrlCreateLabel("Tháng mười một", 545, 87, 172, 38, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0x9DD8FF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlSetOnEvent(-1, '_LICH_MenuNext')
$LICH_Menu_Mon[5] = GUICtrlCreateLabel($ICON_ARROW_RIGHT, 717, 87, 31, 38, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 13, 400, 0, "FontAwesome")
GUICtrlSetColor(-1, "0x9DD8FF")
GUICtrlSetBkColor(-1, "-2")
$LICH_Menu_Mon[1] = GUICtrlCreateLabel("Tháng mười một", 143, 87, 172, 38, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0x9DD8FF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlSetOnEvent(-1, '_LICH_MenuPre')
$LICH_Menu_Mon[4] = GUICtrlCreateLabel($ICON_ARROW_LEFT, 112, 87, 31, 38, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 13, 400, 0, "FontAwesome")
GUICtrlSetColor(-1, "0x9DD8FF")
GUICtrlSetBkColor(-1, "-2")
;tab 1
$LICH_TabCtrl = GUICtrlCreateTab(0, 0)
GUICtrlCreateTabItem("tab0")
GUICtrlCreateLabel("Thứ hai", 38, 149, 111, 29, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel("Thứ ba", 150, 149, 111, 29, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel("Thứ tư", 261, 149, 111, 29, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel("Thứ năm", 373, 149, 111, 29, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel("Thứ sáu", 485, 149, 111, 29, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel("Thứ bảy", 597, 149, 111, 29, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel("Chủ nhật", 709, 149, 111, 29, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel("", 45, 538, 775, 1, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1) ; nền dưới
GUICtrlSetBkColor(-1, "0x9DD8FF")
GUICtrlCreateLabel("", 45, 186, 775, 1, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1) ; dấu ngăn cách
GUICtrlSetBkColor(-1, "0x9DD8FF")
$LICH_Button[0][0] = GUICtrlCreateLabel("", 0 + 145 * 4, 538, 145, 119, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlSetOnEvent(-1, '_LICH_HideGUI')
$LICH_Button[1][0] = GUICtrlCreateLabel("↩", 0 + 145 * 4, 556, 145, 53, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 30, 400, 0, "FontAwesome")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
$LICH_Button[2][0] = GUICtrlCreateLabel("Thoát ra", 0 + 145 * 4, 596, 145, 45, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
$LICH_Button[0][1] = GUICtrlCreateLabel("", 0 + 145 * 5, 538, 145, 119, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
$LICH_Button[1][1] = GUICtrlCreateLabel("", 0 + 145 * 5, 556, 145, 53, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 30, 400, 0, "FontAwesome")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
$LICH_Button[2][1] = GUICtrlCreateLabel("Sự kiện mới", 0 + 145 * 5, 596, 145, 45, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
For $i = 2 To 5
	$LICH_Button[0][$i] = GUICtrlCreateLabel("", 0 + 145 * ($i - 2), 538, 145, 119, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$LICH_Button[1][$i] = GUICtrlCreateLabel("", 0 + 145 * ($i - 2), 565, 145, 53, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 25, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$LICH_Button[2][$i] = GUICtrlCreateLabel("Còn n ghi chú", 0 + 145 * ($i - 2), 620, 145, 40, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 8.5, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$LICH_Button[3][$i] = GUICtrlCreateLabel("Xem tất cả", 0 + 145 * ($i - 2), 542, 145, 35, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	For $j = 0 To 3
		GUICtrlSetState($LICH_Button[$j][$i], $GUI_HIDE)
	Next
Next
GUICtrlSetOnEvent($LICH_Button[0][5],'_LICH_Button_XemEvent')

For $i = 0 To 7 * 6 - 1
	$LICH_Control[$i] = _LICH_Create_Control($i)
Next

; tab 2
GUICtrlCreateTabItem("tab1")
$LICH_Button2[0] = GUICtrlCreateLabel("", 648, 610, 205, 33, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel("THÊM MỘT SỰ KIỆN", 684, 610, 169, 33, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel($ICON_EVENT, 648, 610, 39, 33, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 13, 400, 0, "FontAwesome")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
$LICH_Button2[1] = GUICtrlCreateLabel("", 446, 610, 184, 33, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetBkColor(-1, "-2")
GUICtrlSetOnEvent(-1,'_LICH2_Button_XemLichThang')
GUICtrlCreateLabel("XEM LỊCH THÁNG", 482, 610, 148, 33, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel('', 443, 610, 39, 33, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 13, 400, 0, "FontAwesome")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
$LICH_Button2[2] = GUICtrlCreateLabel("", 282, 610, 142, 33, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetBkColor(-1, "-2")
GUICtrlSetOnEvent(-1,'_LICH_HideGUI')
GUICtrlCreateLabel("THOÁT RA", 318, 610, 106, 33, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel("❌", 279, 610, 39, 33, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 13, 400, 0, "FontAwesome")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
#EndRegion GUI LICH

Func _ShowGUI_LICH() ; deffault
	Local $pos_GUI = WinGetPos($GUILICH)
	Local $pos_x = Int(@DesktopWidth / 2 - $pos_GUI[2] / 2)
	Local $pos_y = Int(@DesktopHeight / 2 - $pos_GUI[3] / 2)
	WinMove($GUILICH, '', $pos_x, $pos_y)
	_LICH_SetGUI()
	WinMove($GUILICH,'',Int(@DesktopWidth/2-865/2),Int(@DesktopHeight/2-656/2))
	GUISetState(@SW_SHOW, $GUILICH)

EndFunc   ;==>_ShowGUI_LICH
#Region LICH2 Func
Func _LICH_ShowEventTab($DATE, $MON, $YEAR)
	$LICH_ChooseDate[1] = $YEAR
	$LICH_ChooseDate[0] = $MON
	$LICH_ChooseDate[2] = $DATE
	if Not BitAnd(WinGetState($GUILICH),2) = 2 Then GUISetState(@SW_SHOW, $GUILICH)
	if _GUICtrlTab_GetCurFocus($LICH_TabCtrl) <> 1 then _GUICtrlTab_SetCurFocus($LICH_TabCtrl, 1)
	If Not IsHWnd($GUILICH2) Then
		$GUILICH2 = GUICreate("Lịch biểu của bạn", 865, 465, 0, 126, $WS_POPUP, -1)
		_WinAPI_SetParent($GUILICH2, $GUILICH)
		GUISetBkColor(0x0063B1, $GUILICH2)
		GUICtrlCreateLabel("Cả ngày", 0, 0, 72, 110, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
		GUICtrlSetFont(-1, 12, 600, 0, "Segoe UI Semibold")
		GUICtrlSetColor(-1, "0xFFFFFF")
		GUICtrlSetBkColor(-1, "0x008AF0")
		For $i = 0 To 23
			GUICtrlCreateLabel($i, 0, 111 + 111 * $i, 72, 110, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
			GUICtrlSetFont(-1, 12, 600, 0, "Segoe UI Semibold")
			GUICtrlSetColor(-1, "0xFFFFFF")
			GUICtrlSetBkColor(-1, "0x008AF0")
			GUICtrlCreateLabel("", 72, 109 + 111 * $i, 800, 2, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
			GUICtrlSetBkColor(-1, "0x008AF0")
		Next
		GUICtrlCreateLabel("", 72, 109 + 111 * 24, 800, 2, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
		GUICtrlSetBkColor(-1, "0x008AF0")
		_GUIScrollbars_Generate($GUILICH2, 0, 111 * 25)
	EndIf
	; ---------------
	; set lại menu mon
	GUICtrlSetData($LICH_Menu_Mon[0], $DATE & '/' & $MON & '/' & $YEAR)
	Local $Date_temp = $DATE + 1, $Mon_temp = $MON, $Year_temp = $YEAR
	If $Date_temp > _DateDaysInMonth($Year_temp, $Mon_temp) Then
		$Date_temp = 1
		$Mon_temp += 1
		If $Mon_temp > 12 Then
			$Mon_temp = 1
			$Year_temp += 1
		EndIf
	EndIf
	Local $text = ''
	If $Year_temp <> $YEAR Then
		$text = _CHOOSEDATE_DateToString(_DateToDayOfWeekISO($Year_temp, $Mon_temp, $Date_temp)) & ', ' & $Date_temp & '/' & $Mon_temp & '/' & $Year_temp
		Else
		$text = _CHOOSEDATE_DateToString(_DateToDayOfWeekISO($Year_temp, $Mon_temp, $Date_temp)) & ', ' & $Date_temp & '/' & $Mon_temp
	EndIf
	GUICtrlSetData($LICH_Menu_Mon[2], $text)
	Local $Date_temp = $DATE - 1, $Mon_temp = $MON, $Year_temp = $YEAR
	If $Date_temp < 1 Then
		
		$Mon_temp -= 1
		If $Mon_temp < 1 Then
			$Mon_temp = 12
			$Year_temp -= 1
		EndIf
		$Date_temp = _DateDaysInMonth($Year_temp, $Mon_temp)
	EndIf
	Local $text = ''
	If $Year_temp <> $YEAR Then
		$text = _CHOOSEDATE_DateToString(_DateToDayOfWeekISO($Year_temp, $Mon_temp, $Date_temp)) & ', ' & $Date_temp & '/' & $Mon_temp & '/' & $Year_temp
		Else
		$text = _CHOOSEDATE_DateToString(_DateToDayOfWeekISO($Year_temp, $Mon_temp, $Date_temp)) & ', ' & $Date_temp & '/' & $Mon_temp
	EndIf
	GUICtrlSetData($LICH_Menu_Mon[1], $text)
	; xóa các control cũ
	For $i = 1 To $LICH2_Control[0][0]
		If IsArray($LICH2_Control[$i][0]) Then _LICH2_Delete_Control($i)
	Next
	$LICH2_Control[0][0] = 0
	; -------------------------------------------
	If Not IsHWnd($GUILICH2) Then Return 0
	_GUIScrollBars_SetScrollInfoPos($GUILICH2, $SB_VERT, 0)
	_LICH_GETEVENT_MON($MON, $YEAR, $DATE)
	Local $Max_Title = _LICH2_Get_MaxTitle($DATE)
	Local $y_min = 10000
	For $i = 1 To $LICH2_Control[0][0]
		$HOUR1 = Number(StringSplit(_ADDEVENT_GetSetting($LICH2_Control[$i][1], 7), ':')[1])
		$MIN1 = Number(StringSplit(_ADDEVENT_GetSetting($LICH2_Control[$i][1], 7), ':')[2])
		$HOUR2 = Number(StringSplit(_ADDEVENT_GetSetting($LICH2_Control[$i][1], 8), ':')[1])
		$MIN2 = Number(StringSplit(_ADDEVENT_GetSetting($LICH2_Control[$i][1], 8), ':')[2])
		If _ADDEVENT_GetSetting($LICH2_Control[$i][1], 5) <> _ADDEVENT_GetSetting($LICH2_Control[$i][1], 6) Then
			If Number(StringSplit(_ADDEVENT_GetSetting($LICH2_Control[$i][1], 5), '/')[1]) = Number($DATE) Then
				$HOUR2 = 24
				$MIN2 = 00
			ElseIf Number(StringSplit(_ADDEVENT_GetSetting($LICH2_Control[$i][1], 6), '/')[1]) = Number($DATE) Then
				$HOUR1 = 0
				$MIN1 = 0
			Else
				$HOUR1 = 0
				$MIN1 = 0
				$HOUR2 = 0
				$MIN2 = 0
			EndIf
		EndIf
		$LICH2_Control[$i][0] = _LICH2_Create_Control($HOUR1, $HOUR2, $MIN1, $MIN2, Int(780 / $Max_Title), $LICH2_Control[$i][1], $DATE)
		$y_min = ($HOUR1 + 1) * 111 + ($MIN1 / 30) * 55.5 < $y_min ? ($HOUR1 + 1) * 111 + ($MIN1 / 30) * 55.5 : $y_min
		If $HOUR1 = 0 And $MIN1 = $HOUR1 And $HOUR1 = $HOUR2 And $HOUR1 = $MIN2 Then $y_min = 0
	Next
	
	$y_min = $y_min = 10000? 0 : $y_min
	Local $pos =  ($y_min*_GUIScrollBars_GetScrollRange ( $GUILICH2, $SB_VERT)[1])/(111*25)

	WinSetTrans($GUILICH2,'',0)
	GUISetState(@SW_SHOW, $GUILICH2)
	WinSetOnTop($GUILICH,'',1)
	WinSetOnTop($GUILICH,'',0)
	_Effect_LoadGUI($GUILICH2,True,0,-5)
	For $i  =1 To Round($pos) Step Int($pos/20) < 1 ? 1 : Int($pos/20)
		_GUIScrollBars_SetScrollInfoPos($GUILICH2, $SB_VERT,$i)
		Sleep(10)
	Next
	_GUIScrollBars_SetScrollInfoPos($GUILICH2, $SB_VERT,Round($pos))
EndFunc   ;==>_LICH_ShowEventTab

Func _LICH2_Get_MaxTitle($DATE) ; gọi trong _LICH2_ShowEvent
	Local $MaxTitle = 0, $MaxAllDay = 0
	For $i = 1 To $LICH2_Control[0][0]
		
		If _ADDEVENT_GetSetting($LICH2_Control[$i][1], 7) = _ADDEVENT_GetSetting($LICH2_Control[$i][1], 8) And _ADDEVENT_GetSetting($LICH2_Control[$i][1], 7) = '00:00' Then
			$MaxAllDay += 1
			ContinueLoop
		EndIf
		Local $j = 1, $max = 1
		Local $time_a_1 = Number(StringSplit(_ADDEVENT_GetSetting($LICH2_Control[$i][1], 7), ':')[1]) * 60 + Number(StringSplit(_ADDEVENT_GetSetting($LICH2_Control[$i][1], 7), ':')[2])
		Local $time_a_2 = Number(StringSplit(_ADDEVENT_GetSetting($LICH2_Control[$i][1], 8), ':')[1]) * 60 + Number(StringSplit(_ADDEVENT_GetSetting($LICH2_Control[$i][1], 8), ':')[2])
		; ------------------------------
		
		If _ADDEVENT_GetSetting($LICH2_Control[$i][1], 5) = _ADDEVENT_GetSetting($LICH2_Control[$i][1], 6) Then
			If _ADDEVENT_GetSetting($LICH2_Control[$i][1], 7) = _ADDEVENT_GetSetting($LICH2_Control[$i][1], 8) Then
				$time_a_1 = 0
				$time_a_2 = 999999999
			EndIf
		Else
			If Number(StringSplit(_ADDEVENT_GetSetting($LICH2_Control[$i][1], 5), '/')[1]) = Number($DATE) Then
				$time_a_2 = 999999999
			ElseIf Number(StringSplit(_ADDEVENT_GetSetting($LICH2_Control[$i][1], 6), '/')[1]) = Number($DATE) Then
				$time_a_1 = 0
			Else
				$time_a_1 = 0
				$time_a_2 = 999999999
			EndIf
		EndIf
		
		; ------------------------------
		While 1
			If ($i = $j) Or (_ADDEVENT_GetSetting($LICH2_Control[$j][1], 7) = _ADDEVENT_GetSetting($LICH2_Control[$j][1], 8) And _ADDEVENT_GetSetting($LICH2_Control[$j][1], 7) = '00:00') Then
				$j += 1
				If $j > $LICH2_Control[0][0] Then ExitLoop
			Else
				Local $time_b_1 = Number(StringSplit(_ADDEVENT_GetSetting($LICH2_Control[$j][1], 7), ':')[1]) * 60 + Number(StringSplit(_ADDEVENT_GetSetting($LICH2_Control[$j][1], 7), ':')[2])
				Local $time_b_2 = Number(StringSplit(_ADDEVENT_GetSetting($LICH2_Control[$j][1], 8), ':')[1]) * 60 + Number(StringSplit(_ADDEVENT_GetSetting($LICH2_Control[$j][1], 8), ':')[2])
				; ------------------------------
				
				If _ADDEVENT_GetSetting($LICH2_Control[$j][1], 5) = _ADDEVENT_GetSetting($LICH2_Control[$j][1], 6) Then
					If _ADDEVENT_GetSetting($LICH2_Control[$j][1], 7) = _ADDEVENT_GetSetting($LICH2_Control[$j][1], 8) Then
						$time_b_1 = 0
						$time_b_2 = 999999999
					EndIf
				Else
					If Number(StringSplit(_ADDEVENT_GetSetting($LICH2_Control[$j][1], 5), '/')[1]) = Number($DATE) Then
						$time_b_2 = 999999999
					ElseIf Number(StringSplit(_ADDEVENT_GetSetting($LICH2_Control[$j][1], 6), '/')[1]) = Number($DATE) Then
						$time_b_1 = 0
					Else
						$time_b_1 = 0
						$time_b_2 = 999999999
					EndIf
				EndIf
				
				; ------------------------------
				If ($time_a_1 <= $time_b_1 And $time_a_2 >= $time_b_1) Or ($time_a_1 <= $time_b_2 And $time_a_2 >= $time_b_2) Then 
					$time_a_1 = $time_b_1
					$time_a_2 = $time_b_2
					$max += 1
				EndIf
				$j += 1
				If $j > $LICH2_Control[0][0] Then ExitLoop
			EndIf

		WEnd
		
		$MaxTitle = $MaxTitle < $max ? $max : $MaxTitle
	Next
	Return $MaxTitle > $MaxAllDay ? $MaxTitle : $MaxAllDay
EndFunc   ;==>_LICH2_Get_MaxTitle
Func _LICH2_Delete_Control($id)
	Local $control = $LICH2_Control[$id][0]
	$LICH2_Control[$id][0] = ''
	For $i = 0 To UBound($control) - 1
		GUICtrlDelete($control[$i])
	Next
EndFunc   ;==>_LICH2_Delete_Control
Func _LICH2_Create_Control($HOUR1, $HOUR2, $MIN1, $MIN2, $W, $EVENT_ID, $DATE) ; tính theo stt $LICH2_Control
	GUISwitch($GUILICH2)
	Local $control[6]
	Local $Y = ($HOUR1 + 1) * 111 + ($MIN1 / 30) * 55.5
	Local $H = ((($HOUR2 * 60 + $MIN2) - ($HOUR1 * 60 + $MIN1)) / 30) * 55.5
	Local $X = 1
	If $HOUR1 = 0 And $MIN1 = $HOUR1 And $HOUR1 = $HOUR2 And $HOUR1 = $MIN2 Then
		$H = 110
		$Y = 0
	EndIf
	if number($LICH2_Control[0][0]) > 0 then
	For $i = 1 To $LICH2_Control[0][0]
		If Not IsArray($LICH2_Control[$i][0]) Then ExitLoop
		
		Local $temp_pos = ControlGetPos($GUILICH2, '', ($LICH2_Control[$i][0])[0])
		If Not @error Then
		If ($temp_pos[1] <= $Y And $temp_pos[1] + $temp_pos[3] >= $Y) Or ($temp_pos[1] >= $Y And $temp_pos[1] <= $Y + $H) Then
			While 1
				If $temp_pos[0] = $X + 72 Then
					$X += $W
				Else
					ExitLoop
				EndIf
			WEnd

		EndIf
		EndIf
	Next
	EndIf
	Local $color = StringSplit($ADDEVENT_SETTING_COLOR, ',')[Number(_ADDEVENT_GetSetting($EVENT_ID, 10))]
	$control[0] = GUICtrlCreateLabel("", 72 + $X, $Y, $W, $H, -1, -1) ; 796
	GUICtrlSetBkColor(-1, $color)
	_GUICtrl_OnHoverRegister($control[0], "_LICH2Hover", "_LICH2Normal","_Nothing","_LICH2Click")
	Local $sIcon = _ADDEVENT_GetSetting($EVENT_ID, 11)
	$sIcon = $sIcon = '-1' ? '🚩' : $sIcon
	$control[1] = GUICtrlCreateLabel($sIcon, 91 + $X, $Y + 12, 35, 21, -1, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, _EDITOR_ColorText($color))
	GUICtrlSetBkColor(-1, "-2")
	$control[2] = GUICtrlCreateLabel(_ADDEVENT_GetSetting($EVENT_ID, 1), 111 + $X, $Y + 12, $W - 90, 21, -1, -1)
	GUICtrlSetFont(-1, 11, 600, 0, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($color))
	GUICtrlSetBkColor(-1, "-2")
	Local $sTime
	If _ADDEVENT_GetSetting($EVENT_ID, 5) = _ADDEVENT_GetSetting($EVENT_ID, 6) Then
		$sTime = 'Từ ' & _ADDEVENT_GetSetting($EVENT_ID, 7) & ' đến ' & _ADDEVENT_GetSetting($EVENT_ID, 8)
		if _ADDEVENT_GetSetting($EVENT_ID, 7) = _ADDEVENT_GetSetting($EVENT_ID, 8) Then $sTime = 'Cả ngày'
	Else
		If Number(StringSplit(_ADDEVENT_GetSetting($EVENT_ID, 5), '/')[1]) = Number($DATE) Then
			$sTime = 'Từ ' & _ADDEVENT_GetSetting($EVENT_ID, 7) & ' đến hết ngày'
		ElseIf Number(StringSplit(_ADDEVENT_GetSetting($EVENT_ID, 6), '/')[1]) = Number($DATE) Then
			$sTime = 'Từ 00:00 đến ' & _ADDEVENT_GetSetting($EVENT_ID, 8)
		EndIf
	EndIf
	$sTime = $sTime = '' ? 'Cả ngày' : $sTime
	$control[5] = GUICtrlCreateLabel('⏰', 91 + $X, $Y + 33, 35, 21)
	GUICtrlSetFont(-1, 11, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, _EDITOR_ColorText($color))
	GUICtrlSetBkColor(-1, "-2")
	
	$control[3] = GUICtrlCreateLabel($sTime, 111 + $X, $Y + 33, $W - 40, 21)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($color))
	GUICtrlSetBkColor(-1, "-2")
	$control[4] = GUICtrlCreateLabel('Mô tả: ' & _ADDEVENT_GetSetting($EVENT_ID, 2), 91 + $X, $Y + 53, $W - 40, $H - 63, -1, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($color))
	GUICtrlSetBkColor(-1, "-2")
	If $W < 100 Then
		GUICtrlSetState($control[1], $GUI_HIDE)
		GUICtrlSetState($control[2], $GUI_HIDE)
		GUICtrlSetState($control[3], $GUI_HIDE)
		GUICtrlSetState($control[4], $GUI_HIDE)
	EndIf
	If $H < 106 Then GUICtrlSetState($control[4], $GUI_HIDE)
	Return $control
EndFunc   ;==>_LICH2_Create_Control
#EndRegion LICH2 Func

#Region Button Event
Func _LICH_HideGUI()
	If IsHWnd($GUILICH2) and WinExists($GUILICH2) Then GUIDelete($GUILICH2)
	if BitAnd(WinGetState($GUIMAIN),2) = 2 then _MAIN_Tab4_ShowCalendar()
	_GUICtrlTab_SetCurFocus($LICH_TabCtrl,0)
	GUISetState(@SW_HIDE,$GUILICH)
EndFunc
Func _LICH_Button_XemEvent()
	 _LICH_ShowEventTab(GUICtrlRead(($LICH_Control[$LICH_ChooseDate[2]])[1]), $LICH_ChooseDate[0],$LICH_ChooseDate[1])
EndFunc
Func _LICH2_Button_XemLichThang()
	_Effect_LoadGUI($GUILICH2,False,0,5)
	
	_LICH_SetGUI($LICH_ChooseDate[0],$LICH_ChooseDate[1])
EndFunc
Func _LICH_AddEvent($DAY = @MDAY, $MON = @MON, $YEAR = @YEAR, $id = '')
	_ADDEvent_ShowGUI($DAY, $MON, $YEAR, @HOUR, @MIN, $id,$GUILICH)
EndFunc   ;==>_LICH_AddEvent
Func _LICH_ShowEventDate($DATE = -1)
	For $i = 2 To 5
		For $j = 0 To 3
			GUICtrlSetState($LICH_Button[$j][$i], $GUI_HIDE)
		Next
	Next
	
	If $DATE = -1 Then Return 0
	
	If Number($LICH_Event[0][$DATE]) > 0 Then
		If Number($LICH_Event[0][$DATE]) > 3 Then
			Local $i = 1, $j = 1
			While 1
				If _ADDEVENT_GetSetting($LICH_Event[$i][$DATE], 3) < _ADDEVENT_GetSetting($LICH_Event[$i + 1][$DATE], 3) Then
					Local $trao_doi = $LICH_Event[$i][$DATE]
					$LICH_Event[$i][$DATE] = $LICH_Event[$i + 1][$DATE]
					$LICH_Event[$i + 1][$DATE] = $trao_doi
				Else
					$i += 1
					If $i >= Number($LICH_Event[0][$DATE]) Then
						$i = 1
						$j += 1
						If $j >= Number($LICH_Event[0][$DATE]) Then ExitLoop
					EndIf
				EndIf
			WEnd
		EndIf
		
		GUICtrlSetData($LICH_Button[2][5], 'Xem tất cả ' & $LICH_Event[0][$DATE] & ' sự kiện')
		For $i = 0 To 3
			GUICtrlSetState($LICH_Button[$i][5], $GUI_SHOW)
		Next
		Local $event_number = 0
		For $i = 4 To 2 Step -1
			$event_number += 1

			Local $event_icon = _ADDEVENT_GetSetting($LICH_Event[$event_number][$DATE], 11)
			GUICtrlSetData($LICH_Button[1][$i], $event_icon = '-1' ? '🚩' : $event_icon)
			
			
			$LICH_Button[4][$i] = $LICH_Event[$event_number][$DATE]
			
			Local $event_title = _ADDEVENT_GetSetting($LICH_Event[$event_number][$DATE], 1)
			Local $event_time_line1, $event_time_line2
			If _ADDEVENT_GetSetting($LICH_Event[$event_number][$DATE], 5) = _ADDEVENT_GetSetting($LICH_Event[$event_number][$DATE], 6) Then
				Local $event_time_temp = StringSplit(_ADDEVENT_GetSetting($LICH_Event[$event_number][$DATE], 5), '/')
				If $event_time_temp[1] = @MDAY And $event_time_temp[2] = @MON And $event_time_temp[3] = @YEAR Then
					$event_time_line1 = 'Sự kiện hôm nay'
				Else
					$event_time_line1 = _ADDEVENT_GetSetting($LICH_Event[$event_number][$DATE], 5)
				EndIf
				If _ADDEVENT_GetSetting($LICH_Event[$event_number][$DATE], 7) = _ADDEVENT_GetSetting($LICH_Event[$event_number][$DATE], 8) Then
					$event_time_line2 = 'Cả ngày'
				Else
					$event_time_line2 = 'lúc ' & _ADDEVENT_GetSetting($LICH_Event[$event_number][$DATE], 7) & ' đến ' & _ADDEVENT_GetSetting($LICH_Event[$event_number][$DATE], 8)
				EndIf
			Else
				$event_time_line1 = _ADDEVENT_GetSetting($LICH_Event[$event_number][$DATE], 5) & ' đến ' & _ADDEVENT_GetSetting($LICH_Event[$event_number][$DATE], 6)
				If Number(StringSplit(_ADDEVENT_GetSetting($LICH_Event[$event_number][$DATE], 5), '/')[1]) = Number($DATE) Then
					$event_time_line2 = 'lúc ' & _ADDEVENT_GetSetting($LICH_Event[$event_number][$DATE], 7) & ' đến ' & _ADDEVENT_GetSetting($LICH_Event[$event_number][$DATE], 6)
				ElseIf Number(StringSplit(_ADDEVENT_GetSetting($LICH_Event[$event_number][$DATE], 6), '/')[1]) = Number($DATE) Then
					$event_time_line2 = 'từ 00:00 đến ' & _ADDEVENT_GetSetting($LICH_Event[$event_number][$DATE], 8)
				Else
					$event_time_line2 = 'Cả ngày'
				EndIf
				
			EndIf
			GUICtrlSetData($LICH_Button[3][$i], $event_title)
			Local $size = _StringSize($event_title, 12, 400, 2, "Segoe UI", 140)
	
			For $j = 12 To 5 Step -0.5
				$size = _StringSize($size[0], $j, 400, 2, "Segoe UI", 140)
				If Not @error And ($size[1]*2 <= 36 or $size[3] < 36) then
					GUICtrlSetFont($LICH_Button[3][$i],$j, 400, 0, "Segoe UI")
					GUICtrlSetData($LICH_Button[3][$i], $size[0])
					ExitLoop
				EndIf
			Next
			GUICtrlSetData($LICH_Button[2][$i], $event_time_line1 & @CRLF & $event_time_line2)
			
			For $j = 0 To 3
				GUICtrlSetState($LICH_Button[$j][$i], $GUI_SHOW)
			Next
			If $event_number >= Number($LICH_Event[0][$DATE]) Then ExitLoop
		Next
		
	EndIf
	
EndFunc   ;==>_LICH_ShowEventDate

Func _LICH_MenuChooseDate()
	Local $GUI_Temp = _DisableGUI($GUILICH)
	If _GUICtrlTab_GetCurFocus($LICH_TabCtrl) = 0 Then
		Local $DATE = _CHOOSEDATE_ShowGUI(@MON, @YEAR, 0,$GUILICH)
		Local $temp = StringSplit($DATE, '/')
		_LICH_SetGUI($temp[2], $temp[3])
	Else
		Local $DATE = _CHOOSEDATE_ShowGUI(@MON,@YEAR,1,$GUILICH)
		Local $temp = StringSplit($DATE, '/')
		_LICH_ShowEventTab($temp[1], $temp[2], $temp[3])
	EndIf
	_EnableGUI($GUILICH,$GUI_Temp)
EndFunc   ;==>_LICH_MenuChooseDate

Func _LICH_MenuNext()
	If _GUICtrlTab_GetCurFocus($LICH_TabCtrl) = 0 Then
		If $LICH_ChooseDate[0] = 12 Then
			$LICH_ChooseDate[0] = 1
			$LICH_ChooseDate[1] += 1
		Else
			$LICH_ChooseDate[0] += 1
		EndIf
		_LICH_SetGUI($LICH_ChooseDate[0], $LICH_ChooseDate[1])
	Else
		$LICH_ChooseDate[2] += 1
		If $LICH_ChooseDate[2] > _DateDaysInMonth($LICH_ChooseDate[1], $LICH_ChooseDate[0]) Then
			$LICH_ChooseDate[2] = 1
			$LICH_ChooseDate[0] += 1
			If $LICH_ChooseDate[0] > 12 Then
				$LICH_ChooseDate[0] = 1
				$LICH_ChooseDate[1] += 1
			EndIf
		EndIf
		_LICH_ShowEventTab($LICH_ChooseDate[2], $LICH_ChooseDate[0], $LICH_ChooseDate[1])
	EndIf
EndFunc   ;==>_LICH_MenuNext
Func _LICH_MenuPre()
	If _GUICtrlTab_GetCurFocus($LICH_TabCtrl) = 0 Then
		If $LICH_ChooseDate[0] = 1 Then
			$LICH_ChooseDate[0] = 12
			$LICH_ChooseDate[1] -= 1
		Else
			$LICH_ChooseDate[0] -= 1
		EndIf
		_LICH_SetGUI($LICH_ChooseDate[0], $LICH_ChooseDate[1])
	Else
		$LICH_ChooseDate[2] -= 1
		If $LICH_ChooseDate[2] < 1 Then
			
			$LICH_ChooseDate[0] -= 1
			If $LICH_ChooseDate[0] < 1 Then
				$LICH_ChooseDate[0] = 12
				$LICH_ChooseDate[1] -= 1
			EndIf
			$LICH_ChooseDate[2] = _DateDaysInMonth($LICH_ChooseDate[1], $LICH_ChooseDate[0])
		EndIf
		_LICH_ShowEventTab($LICH_ChooseDate[2], $LICH_ChooseDate[0], $LICH_ChooseDate[1])
	EndIf
EndFunc   ;==>_LICH_MenuPre

#EndRegion Button Event

#Region stuff
Func _LICH_SetGUI($MON = @MON, $YEAR = @YEAR, $SHOW_EVENT_DAY = -1)
	
	$LICH_ChooseDate[0] = $MON
	$LICH_ChooseDate[1] = $YEAR
	
	GUISetState(@SW_LOCK, $GUILICH)
	$LICH_ChooseDate[2] = -1

	_LICH_GETEVENT_MON($MON, $YEAR)

	GUICtrlSetData($LICH_Menu_Mon[0], _LICH_NumberToMon($MON) & ' ' & $YEAR)
	GUICtrlSetData($LICH_Menu_Mon[1], $MON = 1 ? _LICH_NumberToMon(12) & ' ' & Number($YEAR) - 1 : _LICH_NumberToMon($MON - 1))
	GUICtrlSetData($LICH_Menu_Mon[2], $MON = 12 ? _LICH_NumberToMon(1) & ' ' & Number($YEAR) + 1 : _LICH_NumberToMon($MON + 1))
	
	$LICH_number_day = _DateDaysInMonth($YEAR, $MON)
	If @error Then Return 0
	$LICH_number_week = _DateToDayOfWeekISO($YEAR, $MON, 1)
	If @error Then Return 0
	$LICH_number_week -= 1
	; chuyển về dạng: 0 là thứ 2, 6 là chủ nhật
	Local $number_date = 0
	For $i = 0 To 7 * 6 - 1
		Local $control_temp = $LICH_Control[$i]
		For $j = 0 To 3
			GUICtrlSetData($control_temp[$j], '')
			GUICtrlSetBkColor($control_temp[$j], -2)
			GUICtrlSetColor($control_temp[$j], 0xFFFFFF)
		Next
		
		If $i >= $LICH_number_week And $number_date < $LICH_number_day Then
			$number_date += 1
			If $number_date = @MDAY And $MON = @MON And $YEAR = @YEAR Then
				GUICtrlSetBkColor($control_temp[0], '0xFFFFFF')
				GUICtrlSetColor($control_temp[1], '0x008AF0')
				GUICtrlSetColor($control_temp[2], '0x008AF0')
				GUICtrlSetColor($control_temp[3], '0x008AF0')
			EndIf
			GUICtrlSetData($control_temp[1], $number_date)
			If Number($LICH_Event[0][$number_date]) > 0 Then
				Local $sIcon = _ADDEVENT_GetSetting($LICH_Event[Random(1, Number($LICH_Event[0][$number_date]), 1)][$number_date], 11)
				$sIcon = $sIcon = '-1' ? '' : $sIcon
				GUICtrlSetData($control_temp[2], $sIcon)
				GUICtrlSetData($control_temp[3], $LICH_Event[0][$number_date] & ' sự kiện')
			EndIf
			
		EndIf
	Next
	If Number($SHOW_EVENT_DAY) = -1 Then
		_LICH_ShowEventDate()
	Else
		_MenuLichClick(($LICH_Control[$SHOW_EVENT_DAY])[0])
	EndIf
	GUISetState(@SW_UNLOCK, $GUILICH)
	WinSetOnTop($GUILICH,'',1)
	WinSetOnTop($GUILICH,'',0)
	if _GUICtrlTab_GetCurFocus($LICH_TabCtrl) <> 0 then _GUICtrlTab_SetCurFocus($LICH_TabCtrl, 0)
EndFunc   ;==>_LICH_SetGUI
Func _LICH_Compare_Mon($date1, $date2)
	Local $temp1 = StringSplit($date1, '/')
	Local $temp2 = StringSplit($date2, '/')
	If $temp1[0] <> $temp2[0] Or $temp1[0] > 2 Then Return 0
	If Number($temp1[2]) > Number($temp2[2]) Then Return 1
	If Number($temp1[2]) < Number($temp2[2]) Then Return 2
	If Number($temp1[1]) > Number($temp2[1]) Then Return 1
	If Number($temp1[1]) < Number($temp2[1]) Then Return 2
	Return 0
EndFunc   ;==>_LICH_Compare_Mon
Func _LICH_GETEVENT_MON($MON, $YEAR, $DATE = -1,$Return_type = -1)
	If $Return_type = 1  then $MAIN_Tab4_NextEvent[0] = 0
	For $i = 0 To 7 * 6 - 1
		$LICH_Event[0][$i] = 0
	Next
	Local $temp = IniReadSection($Database, 'EVENT')
	If Not @error Then
		For $i = $temp[0][0] To 1 Step -1
			If $temp[$i][0] = '' Then ContinueLoop
			Local $date1 = _ADDEVENT_GetSetting($temp[$i][0], 5)
			Local $date2 = _ADDEVENT_GetSetting($temp[$i][0], 6)
			Local $temp1 = StringSplit($date1, '/')
			Local $temp2 = StringSplit($date2, '/')
			If UBound($temp1) < 3 Or UBound($temp2) < 3 Then
				_Inidelete($Database, 'EVENT', $temp[$i][0])
				_Msgbox(16, 'Thông báo', 'ID EVENT ' & $temp[$i][0] & ' đã bị xóa do không hợp lệ')
				Return 0
			EndIf
			
			Local $temp3 = _ADDEVENT_GetSetting($temp[$i][0], 9)
			If $temp3 > 2 Then
				If $temp3 = 3 Then
					
					; lặp lại hằng tháng
					$LICH_Event[0][$temp1[1]] += 1
					$LICH_Event[$LICH_Event[0][$temp1[1]]][$temp1[1]] = $temp[$i][0]
					ContinueLoop
				ElseIf $temp3 = 4 Then
					Local $DateToDayOfWeek = _DateToDayOfWeek($temp1[3], $temp1[2], $temp1[1])
					
					For $j = 1 To _DateDaysInMonth($YEAR, $MON)
						If _DateToDayOfWeek($YEAR, $MON, $j) = $DateToDayOfWeek Then
							$LICH_Event[0][$j] += 1
							$LICH_Event[$LICH_Event[0][$j]][$j] = $temp[$i][0]
						EndIf
					Next
				ElseIf $temp3 = 5 Then
					For $j = 1 To _DateDaysInMonth($YEAR, $MON)
						$LICH_Event[0][$j] += 1
						$LICH_Event[$LICH_Event[0][$j]][$j] = $temp[$i][0]
					Next
				EndIf
				If $Return_type = 1  then
				$MAIN_Tab4_NextEvent[0]+=1
				$MAIN_Tab4_NextEvent[$MAIN_Tab4_NextEvent[0]] = $temp[$i][0]
				EndIf
				ContinueLoop
			ElseIf $temp3 = 2 Then
				$temp2[3] = $YEAR
				$temp1[3] = $YEAR
			EndIf
			If _DateDiff ( 'd', _NowCalcDate(), $temp1[3]&'/'&$temp1[2]&'/'&$temp1[1] ) >= 0 and $Return_type = 1 Then
				$MAIN_Tab4_NextEvent[0]+=1
				$MAIN_Tab4_NextEvent[$MAIN_Tab4_NextEvent[0]] = $temp[$i][0]
			EndIf
			Local $flag = True
			If _LICH_Compare_Mon($MON & '/' & $YEAR, $temp1[2] & '/' & $temp1[3]) = 2 Then $flag = False
			If _LICH_Compare_Mon($MON & '/' & $YEAR, $temp2[2] & '/' & $temp2[3]) = 1 Then $flag = False
		
			If $flag Then
				Local $number_end, $number_start
				
				If _LICH_Compare_Mon($MON & '/' & $YEAR, $temp1[2] & '/' & $temp1[3]) <> 0 Then
					$number_start = 1
				Else
					$number_start = Number($temp1[1])
				EndIf
				If _LICH_Compare_Mon($MON & '/' & $YEAR, $temp2[2] & '/' & $temp2[3]) <> 0 Then
					$number_end = _DateDaysInMonth($YEAR, $MON)
				Else
					$number_end = Number($temp2[1])
				EndIf

				For $j = $number_start To $number_end
					$LICH_Event[0][$j] += 1
					$LICH_Event[$LICH_Event[0][$j]][$j] = $temp[$i][0]
				Next
			EndIf
		Next
	EndIf
	If $DATE <> -1 Then
		$LICH2_Control[0][0] = Number($LICH_Event[0][$DATE])
		For $i = 1 To $LICH_Event[0][$DATE]
			$LICH2_Control[$i][1] = $LICH_Event[$i][$DATE]
		Next
	EndIf
EndFunc   ;==>_LICH_GETEVENT_MON

Func _LICH_Create_Control($id)
	Local $pos_x = Mod($id, 7) * 113
	Local $pos_y = Int($id / 7) * 57

	Local $control[4]
	$control[0] = GUICtrlCreateLabel("", 38 + $pos_x, 190 + $pos_y, 112, 56, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_MenuLichHover", "_MenuLichNormal", "_Nothing", "_MenuLichClick")
	$control[1] = GUICtrlCreateLabel("", 85 + $pos_x, 194 + $pos_y, 27, 28, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1) ; text date number
	GUICtrlSetFont(-1, 18, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$control[2] = GUICtrlCreateLabel("", 46 + $pos_x, 220 + $pos_y, 18, 25, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1) ; icon
	GUICtrlSetFont(-1, 11, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$control[3] = GUICtrlCreateLabel("", 67 + $pos_x, 220 + $pos_y, 80, 25, $SS_CENTERIMAGE, -1) ; text
	GUICtrlSetFont(-1, 10, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	Return $control
EndFunc   ;==>_LICH_Create_Control

Func _LICH_NumberToMon($number)
	If $number > 12 Or $number < 1 Then Return 'Tháng xàm'
	Local $temp = StringSplit('một,hai,ba,tư,năm,sáu,bảy,tám,chín,mười,mười một,mười hai', ',')
	Return 'Tháng ' & $temp[$number]
EndFunc   ;==>_LICH_NumberToMon
#EndRegion stuff
