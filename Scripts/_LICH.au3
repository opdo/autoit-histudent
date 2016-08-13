;_LICH.au3
#include <Date.au3>
Global $LICH_number_day, $LICH_number_week
Global $LICH_Control[7 * 6]
Global $LICH_ButtonPlus_Effect[3]
Global $LICH_ChooseDate[2]
Global $GUILich3, $GUILich4, $GUILich2, $GUILich, $GUILich5
Global $LICH_Event[50][7 * 6]

$GUILich = GUICreate("Lịch biểu của bạn", 965, 623 + 91, -1, -1, BitOR($WS_POPUP, $WS_BORDER), -1)
GUISetBkColor(0x0072C6, $GUILich)
GUICtrlCreateLabel("Lịch biểu của bạn", 0, 0, 961, 73, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 30, 300, 0, "Segoe UI Light")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlSetOnEvent(-1, '_LICH_ShowMenu')

GUICtrlCreateLabel("", 0, 82, 969, 54, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xD1D1D1")
GUICtrlSetBkColor(-1, "0x008AF0")
GUICtrlSetState(-1, $GUI_DISABLE)
Global $LICH_menu_mon[3]
$LICH_menu_mon[0] = GUICtrlCreateLabel("Tháng mười hai 2016", 364, 89, 230, 38, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 17, 600, 0, "Segoe UI Semibold")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlSetOnEvent(-1, '_LICH_MenuChooseDate')
$LICH_menu_mon[2] = GUICtrlCreateLabel("Tháng mười một", 594, 89, 172, 38, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xD1D1D1")
GUICtrlSetBkColor(-1, "-2")
GUICtrlSetOnEvent(-1, '_LICH_MenuNext')
$LICH_menu_mon[1] = GUICtrlCreateLabel("Tháng mười một", 192, 89, 172, 38, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xD1D1D1")
GUICtrlSetBkColor(-1, "-2")
GUICtrlSetOnEvent(-1, '_LICH_MenuPre')
$LICH_button_plus = GUICtrlCreatePic(@DesktopDir & '\test.bmp', 445, 540 + 91, 72, 72)
_SetImage(-1, @ScriptDir & '\Images\add.png')
GUICtrlSetOnEvent(-1, '_LICH_ShowMenu')
GUICtrlCreateLabel("◀", 161, 89, 31, 38, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI Symbol")
GUICtrlSetColor(-1, "0xD1D1D1")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel("▶", 766, 89, 31, 38, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI Symbol")
GUICtrlSetColor(-1, "0xD1D1D1")
GUICtrlSetBkColor(-1, "-2")


;_GUILich_ShowGUI()
;_GUILICH_ShowDayEvent()
Func _GUILICH_ShowDayEvent()
	$GUILich5 = GUICreate("GUILich", 965, 471, 0, 170, $WS_POPUP, -1)
	_WinAPI_SetParent($GUILich5, $GUILich) ; real parent <3
	GUISetBkColor(0x0072C6, $GUILich5)
	GUICtrlCreateLabel("Cả ngày", 0, 1, 63, 92, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	GUICtrlCreateLabel("0", 0, 93, 63, 60, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("", 63, 121, 972, 1, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetState(-1, BitOR($GUI_SHOW, $GUI_DISABLE))
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0xFFFFFF")
	GUICtrlCreateLabel("1", 0, 153, 63, 60, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("2", 0, 213, 63, 60, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("", 63, 181, 972, 1, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetState(-1, BitOR($GUI_SHOW, $GUI_DISABLE))
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x0072C6")
	GUISetState(@SW_HIDE, $GUILich2)
	GUISetState(@SW_SHOW, $GUILich5)

EndFunc   ;==>_GUILICH_ShowDayEvent
Func _LICH_MenuNext()
	If $LICH_ChooseDate[0] = 12 Then
		$LICH_ChooseDate[0] = 1
		$LICH_ChooseDate[1] += 1
	Else
		$LICH_ChooseDate[0] += 1
	EndIf
	_LICH_SetMon($LICH_ChooseDate[0], $LICH_ChooseDate[1])
EndFunc   ;==>_LICH_MenuNext
Func _LICH_MenuPre()
	If $LICH_ChooseDate[0] = 1 Then
		$LICH_ChooseDate[0] = 12
		$LICH_ChooseDate[1] -= 1
	Else
		$LICH_ChooseDate[0] -= 1
	EndIf
	_LICH_SetMon($LICH_ChooseDate[0], $LICH_ChooseDate[1])
EndFunc   ;==>_LICH_MenuPre
Func _LICH_MenuChooseDate()
	GUISetState(@SW_DISABLE, $GUILich)
	Local $date = _CHOOSEDATE_ShowGUI(@MON, @YEAR, 0)
	Local $temp = StringSplit($date, '/')
	_LICH_SetMon($temp[2], $temp[3])
	GUISetState(@SW_ENABLE, $GUILich)
EndFunc   ;==>_LICH_MenuChooseDate
Func _LICH_ShowMenu()
	$LICH_ButtonPlus_Effect[2] = True
	If Not IsHWnd($GUILich4) Then
		$GUILich4 = GUICreate("GUILich", 965, 714, -1, -1, $WS_POPUP, $WS_EX_TOOLWINDOW)
		GUISetBkColor(0xC0C0C0, $GUILich4)
		WinSetTrans($GUILich4, '', 110)
		;GUISetOnEvent($GUI_EVENT_PRIMARYDOWN,'_LICH_HideMenu',$GUILich4)
		$GUILich3 = GUICreate("GUILich", 965, 714, -1, -1, $WS_POPUP, BitOR($WS_EX_LAYERED, $WS_EX_TOOLWINDOW))
		GUICtrlCreatePic(@DesktopDir & '\test.bmp', 0, 0, 0, 0)
		GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateLabel("Trở lại", 363, 491, 232, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
		GUICtrlSetFont(-1, 14, 300, 0, "Segoe UI Light")
		GUICtrlSetColor(-1, "0xFFFFFF")
		GUICtrlSetBkColor(-1, "0x008AF0")
		GUICtrlSetOnEvent(-1, '_LICH_HideMenu')
		GUICtrlCreateLabel("Thoát", 363, 535, 232, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
		GUICtrlSetFont(-1, 14, 300, 0, "Segoe UI Light")
		GUICtrlSetColor(-1, "0xFFFFFF")
		GUICtrlSetBkColor(-1, "0x008AF0")
		GUICtrlCreateLabel("Thêm một sự kiện", 363, 399, 232, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
		GUICtrlSetFont(-1, 14, 300, 0, "Segoe UI Light")
		GUICtrlSetColor(-1, "0xFFFFFF")
		GUICtrlSetBkColor(-1, "0x008AF0")
		GUICtrlSetOnEvent(-1, '_LICH_AddEvent')
		GUICtrlCreateLabel("Thêm một ngày thi", 363, 446, 232, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
		GUICtrlSetFont(-1, 14, 300, 0, "Segoe UI Light")
		GUICtrlSetColor(-1, "0xFFFFFF")
		GUICtrlSetBkColor(-1, "0x008AF0")
	EndIf
	WinSetOnTop($GUILich4, '', 1)
	WinSetOnTop($GUILich3, '', 1)
	WinSetOnTop($GUILich4, '', 0)
	WinSetOnTop($GUILich3, '', 0)
	WinSetTrans($GUILich4, '', 0)
	GUISetState(@SW_SHOW, $GUILich4)
	GUISetState(@SW_DISABLE, $GUILich4)
	GUISetState(@SW_SHOW, $GUILich3)
	_Effect_LoadGUI($GUILich4, True, 130, -5)
EndFunc   ;==>_LICH_ShowMenu
Func _LICH_AddEvent()
	_ADDEvent_ShowGUI()
EndFunc   ;==>_LICH_AddEvent
Func _LICH_HideMenu()
	$LICH_ButtonPlus_Effect[2] = False
	_Effect_LoadGUI($GUILich4, False, 140)
	GUISetState(@SW_HIDE, $GUILich4)
	GUISetState(@SW_HIDE, $GUILich3)
EndFunc   ;==>_LICH_HideMenu
Func _LICH_NumberToMon($number)
	If $number > 12 Or $number < 1 Then Return 'Tháng xàm'
	Local $temp = StringSplit('một,hai,ba,tư,năm,sáu,bảy,tám,chín,mười,mười một,mười hai', ',')
	Return 'Tháng ' & $temp[$number]
EndFunc   ;==>_LICH_NumberToMon
Func _LICH_Effect_ButtonPlus($flag = True)
	; flag true: lên, false: xuống
	Local $iA, $iB, $iStep
	$iA = $flag ? 600 + 91 : 550 + 91
	$iB = $flag ? 550 + 91 : 600 + 91
	$iStep = $flag ? -2 : 2
	
	GUICtrlSetPos($LICH_button_plus, Default, $iA)
	For $i = $iA To $iB Step $iStep
		GUICtrlSetPos($LICH_button_plus, Default, $i)
		Sleep(10)
	Next
	GUICtrlSetPos($LICH_button_plus, Default, $iB)
	If $flag = False Then $LICH_ButtonPlus_Effect[0] = False
EndFunc   ;==>_LICH_Effect_ButtonPlus
Func _GUILich_ShowGUI($MON = @MON, $YEAR = @YEAR)
	$LICH_ButtonPlus_Effect[0] = False
	$LICH_ButtonPlus_Effect[2] = False
	$LICH_ChooseDate[0] = @MON
	$LICH_ChooseDate[1] = @YEAR
	WinSetTrans($GUILich, '', 0)
	GUISetState(@SW_SHOW, $GUILich)
	If Not IsHWnd($GUILich2) Then
		$GUILich2 = GUICreate("GUILich", 965, 440 + 91, 0, 72 + 54, $WS_POPUP, -1, $GUILich)
		_WinAPI_SetParent($GUILich2, $GUILich) ; real parent <3
		GUISetBkColor(0x0072C6, $GUILich2)
		_LICH_Create_OLichControl()
	EndIf
	_LICH_SetMon($MON, $YEAR)
	GUISetState(@SW_SHOW, $GUILich2)
	WinSetTrans($GUILich, '', 255)
	$LICH_ButtonPlus_Effect[0] = True
	$LICH_ButtonPlus_Effect[1] = TimerInit()
EndFunc   ;==>_GUILich_ShowGUI
Func _LICH_SetMon($MON = @MON, $YEAR = @YEAR)
	_LICH_GETEVENT_MON($MON, $YEAR) ; khởi tạo lấy thông tin sự kiện
	GUICtrlSetData($LICH_menu_mon[0], _LICH_NumberToMon($MON) & ' ' & $YEAR)
	GUICtrlSetData($LICH_menu_mon[1], $MON = 1 ? _LICH_NumberToMon(12) & ' ' & Number($YEAR) - 1 : _LICH_NumberToMon($MON - 1))
	GUICtrlSetData($LICH_menu_mon[2], $MON = 12 ? _LICH_NumberToMon(1) & ' ' & Number($YEAR) + 1 : _LICH_NumberToMon($MON + 1))
	
	$LICH_number_day = _DateDaysInMonth($YEAR, $MON)
	If @error Then Return 0
	$LICH_number_week = _DateToDayOfWeek($YEAR, $MON, $LICH_number_day)
	If @error Then Return 0
	$LICH_number_week = $LICH_number_week = 1 ? 6 : $LICH_number_week - 2
	; chuyển về dạng: 0 là thứ 2, 6 là chủ nhật
	Local $number_date = 0
	For $i = 0 To 7 * 6 - 1
		Local $control_temp = $LICH_Control[$i]
		For $j = 2 To 4
			GUICtrlSetData($control_temp[$j], '')
			GUICtrlSetBkColor($control_temp[$j], -2)
			GUICtrlSetColor($control_temp[$j], 0xFFFFFF)
		Next
		
		If ($i < 7 And $i < $LICH_number_week) Or $number_date + 1 > $LICH_number_day Then
			For $j = 0 To UBound($control_temp) - 1
				GUICtrlSetData($control_temp[$j], '')
				If $j <> 0 Then GUICtrlSetBkColor($control_temp[$j], "-2")
			Next
		Else
			
			$number_date += 1
			GUICtrlSetData($control_temp[1], $number_date)
			If $LICH_Event[0][$number_date] <> 0 Then
				; code
				
				If $LICH_Event[0][$number_date] > 3 Then
					GUICtrlSetData($control_temp[2], '  ' & _ADDEVENT_GetSetting($LICH_Event[1][$number_date], 11) & ' ' & _ADDEVENT_GetSetting($LICH_Event[1][$number_date], 1))
					_LICH_AddColorEvent($control_temp[2], $LICH_Event[1][$number_date])
					
					GUICtrlSetData($control_temp[3], '  ' & _ADDEVENT_GetSetting($LICH_Event[2][$number_date], 11) & ' ' & _ADDEVENT_GetSetting($LICH_Event[2][$number_date], 1))
					_LICH_AddColorEvent($control_temp[3], $LICH_Event[2][$number_date])
					
					
					GUICtrlSetData($control_temp[4], '  Và ' & $LICH_Event[0][$number_date] - 4 & ' sự kiện khác')
				Else
					For $j = 1 To $LICH_Event[0][$number_date]
						GUICtrlSetData($control_temp[4 - $j + 1], '  ' & _ADDEVENT_GetSetting($LICH_Event[$j][$number_date], 11) & ' ' & _ADDEVENT_GetSetting($LICH_Event[$j][$number_date], 1))
						_LICH_AddColorEvent($control_temp[4 - $j + 1], $LICH_Event[$j][$number_date])
					Next
				EndIf
			EndIf
			
		EndIf
	Next
EndFunc   ;==>_LICH_SetMon
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
Func _LICH_GETEVENT_MON($MON, $YEAR)
	For $i = 0 To 7 * 6 - 1
		$LICH_Event[0][$i] = 0
	Next
	Local $temp = IniReadSection($Database, 'EVENT')
	If Not @error Then
		For $i = 1 To $temp[0][0]
			Local $date1 = _ADDEVENT_GetSetting($temp[$i][0], 5)
			Local $date2 = _ADDEVENT_GetSetting($temp[$i][0], 6)
			Local $temp1 = StringSplit($date1, '/')
			Local $temp2 = StringSplit($date2, '/')
			
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

EndFunc   ;==>_LICH_GETEVENT_MON
Func _LICH_GETEVENT($date)
	Local $id_event[50]
	$id_event[0] = 0
	Local $temp = IniReadSection($Database, 'EVENT')
	If Not @error Then
		For $i = 1 To $temp[0][0]
			Local $date1 = _ADDEVENT_GetSetting($temp[$i][0], 5)
			Local $date2 = _ADDEVENT_GetSetting($temp[$i][0], 6)
			If _CompareTime($date1, $date) <> 1 And _CompareTime($date, $date2) <> 1 Then
				$id_event[0] += 1
				$id_event[$id_event[0]] = $temp[$i][0]
			EndIf
		Next
	EndIf
	Return $id_event
EndFunc   ;==>_LICH_GETEVENT
Func _LICH_AddColorEvent($control, $id_event)
	Local $slot = _ADDEVENT_StringInSlot(_ADDEVENT_GetSetting($id_event, 10), 'Mặc định|Đỏ|Cam|Vàng|Lục|Lam|Tím|Trắng|Đen|Xám')
	Local $color = StringSplit('0x008AF0,0xFF0000,0xFF6600,0xFFFF00,0x00FF00,0x0000FF,0x800080,0xFFFFFF,0x000000,0x808080', ',')
	If $slot <> 1 Then
		GUICtrlSetBkColor($control, $color[$slot])
		GUICtrlSetColor($control, _EDITOR_ColorText($color[$slot]))
	EndIf
EndFunc   ;==>_LICH_AddColorEvent

Func _LICH_Create_OLich($id)
	Local $pos_x = Mod($id, 7) * 133
	Local $pos_y = Int($id / 7) * 76
	Local $control[5]
	$control[0] = GUICtrlCreateLabel("", 14 + $pos_x, 69 + $pos_y, 132, 75, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x0072C6")
	_GUICtrl_OnHoverRegister(-1, "_MenuLichHover", "_MenuLichNormal")
	$control[1] = GUICtrlCreateLabel("", 23 + $pos_x, 69 + $pos_y, 114, 24, BitOR($SS_RIGHT, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 15, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$control[2] = GUICtrlCreateLabel("16", 14 + $pos_x, 95 + $pos_y, 132, 16, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 10, 300, 0, "Segoe UI Light")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetColor(-1, "0xFFFFFF")
	$control[3] = GUICtrlCreateLabel("16", 14 + $pos_x, 95 + 16 + $pos_y, 132, 16, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 10, 300, 0, "Segoe UI Light")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetColor(-1, "0xFFFFFF")
	$control[4] = GUICtrlCreateLabel("16", 14 + $pos_x, 95 + 16 * 2 + $pos_y, 132, 16, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 10, 300, 0, "Segoe UI Light")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetColor(-1, "0xFFFFFF")

	Return $control
EndFunc   ;==>_LICH_Create_OLich
Func _LICH_Create_OLichControl()
	GUISwitch($GUILich2)
	GUICtrlCreateLabel("", 12, 40, 934, 486, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlSetFont(-1, 12, 600, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	GUICtrlCreateLabel("THỨ BA", 147, 42, 132, 26, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("THỨ TƯ", 280, 42, 132, 26, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("THỨ NĂM", 413, 42, 132, 26, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("THỨ SÁU", 546, 42, 132, 26, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("THỨ BẢY", 679, 42, 132, 26, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("CHỦ NHẬT", 812, 42, 132, 26, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("THỨ HAI", 14, 42, 132, 26, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	For $i = 0 To 7 * 6 - 1
		$LICH_Control[$i] = _LICH_Create_OLich($i)
	Next
EndFunc   ;==>_LICH_Create_OLichControl
