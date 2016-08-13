;TKB_ADD.au3
Global $ADDTKB_State = 0;

#Region --- ADD TKB --------------
Func _TKB_ADD_TKB($id = '')
	$ADDTKB_State = 1
	Local $GUITKB_ADD, $GUITKB_ADD_Input, $GUITKB_ADD_Deffault, $GUITKB_ADD_Title
	$GUITKB_ADD = GUICreate("Thời khóa biểu", 354, 209, -1, -1, $WS_POPUP, $WS_EX_TOPMOST)
	GUISetBkColor(0x0072C6, $GUITKB_ADD)
	GUICtrlCreateLabel($id = '' ? "Thêm thời khóa biểu" : "Sửa thời khóa biểu", 20, 13, 209, 36, -1, $GUI_WS_EX_PARENTDRAG)
	GUICtrlSetFont(-1, 15, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$GUITKB_ADD_Title = GUICtrlCreateLabel("Tên thời khóa biểu", 19, 63, 113, 21, -1, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$GUITKB_ADD_Input = GUICtrlCreateInput($id = '' ? "" : StringSplit(_Iniread($Database, "TKB", $id, ''), '|')[1], 20, 90, 319, 25, -1, 0)
	GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x0072C6")
	GUICtrlCreateLabel("", 20, 117, 319, 2, -1, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0xFFFFFF")
	$GUITKB_ADD_Deffault = GUICtrlCreateLabel("☐ Đây là thời khóa biểu mặc định", 19, 134, 320, 21, -1, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetOnEvent(-1, "_ADDTKB_SetDeffault")
	GUICtrlSetCursor(-1, 0)
	If $id <> '' Then
		If Number(StringSplit(_Iniread($Database, "TKB", $id, ''), '|')[2]) = 1 Then GUICtrlSetData($GUITKB_ADD_Deffault, '☒ Đây là thời khóa biểu mặc định')
	ElseIf Number($GUI_TKB[0]) = 0 Then
		GUICtrlSetData($GUITKB_ADD_Deffault, '☒ Đây là thời khóa biểu mặc định')
	EndIf
	$GUITKB_ADD_Button1 = GUICtrlCreateLabel("Đồng ý", 270, 170, 67, 30, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetOnEvent(-1, "_ADDTKB_DongY")
	$GUITKB_ADD_Button2 = GUICtrlCreateLabel("Hủy bỏ", 192, 170, 67, 30, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetOnEvent(-1, "_ADDTKB_HuyBo")
	$GUITKB_ADD_Button3 = GUICtrlCreateLabel("Xóa bỏ", 192 - (270 - 192), 170, 67, 30, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetOnEvent(-1, "_ADDTKB_Xoa")
	If $id == '' Then GUICtrlSetState($GUITKB_ADD_Button3, $GUI_HIDE)
	GUISetState(@SW_SHOW, $GUITKB_ADD)
	_ControlHover(2, $GUITKB_ADD, $GUITKB_ADD_Button1)
	_ControlHover(2, $GUITKB_ADD, $GUITKB_ADD_Button2)
	_ControlHover(2, $GUITKB_ADD, $GUITKB_ADD_Button3)
	While ($ADDTKB_State >= 1)
		Sleep(1)
		If Not WinActive($GUITKB_ADD) Then WinActivate($GUITKB_ADD)
		If $ADDTKB_State = 2 Then
			If GUICtrlRead($GUITKB_ADD_Input) = '' Then
				_Msgbox(16 + 262144, "Thông báo", "Vui lòng nhập tên thời khóa biểu")
			Else
				If $id = '' Then
					Do
						$id = Random(1, 1000, 1) & Chr(Random(65, 90, 1)) & Random(9, 9999, 1) & Chr(Random(65, 90, 1))
					Until _IniRead($Database, 'TKB', $id, '') = ''
				EndIf
				Local $deffault
				Local $flag = False
				If StringLeft(GUICtrlRead($GUITKB_ADD_Deffault), 1) == '☐' Then
					$deffault = '0'
					Local $read = IniReadSection($Database, 'TKB')
					If Not @error Then
						
						For $i = 1 To $read[0][0]
							If $read[$i][0] == $id Then ContinueLoop
							If Number(StringSplit(_Iniread($Database, "TKB", $read[$i][0], ''), '|')[2]) = 1 Then
								$flag = True
								ExitLoop
							EndIf
						Next

					EndIf
				Else
					$flag = True
					$deffault = '1'
					Local $read = IniReadSection($Database, 'TKB')
					If Not @error Then
						For $i = 1 To $read[0][0]
							If $read[$i][0] == $id Then ContinueLoop
							_Iniwrite($Database, 'TKB', $read[$i][0], StringSplit(_Iniread($Database, "TKB", $read[$i][0], ''), '|')[1] & '|0')
						Next
					EndIf
					
				EndIf
				If Not $flag Then
					_Msgbox(16 + 262144, "Thông báo", "Bạn phải thiết lập thời khóa biểu mặc định")
				Else
					
					
					_Iniwrite($Database, 'TKB', $id, GUICtrlRead($GUITKB_ADD_Input) & '|' & $deffault)
					_Msgbox(64 + 262144, "Thông báo", "Đã lưu thành công")
					GUIDelete($GUITKB_ADD)
					Return 1
				EndIf
			EndIf
			$ADDTKB_State = 1
		ElseIf $ADDTKB_State = 3 Then
			If Number($GUI_TKB[0]) > 0 Then
				If StringLeft(GUICtrlRead($GUITKB_ADD_Deffault), 1) == '☐' Then
					GUICtrlSetData($GUITKB_ADD_Deffault, '☒ Đây là thời khóa biểu mặc định')
				Else
					GUICtrlSetData($GUITKB_ADD_Deffault, '☐ Đây là thời khóa biểu mặc định')
				EndIf
			EndIf
			$ADDTKB_State = 1
		ElseIf $ADDTKB_State = 4 Then
			If $id <> '' Then
				If _Msgbox(32 + 262144 + 4, 'Thông báo', 'Bạn có muốn xóa thời khóa biểu này?') = 6 Then
					Local $flag = False
					If Number(StringSplit(_Iniread($Database, "TKB", $id, ''), '|')[2]) = 1 Then $flag = True
					IniDelete($Database, "TKB" & $id)
					IniDelete($Database, "TKB", $id)
					Local $read = IniReadSection($Database, 'TKB')
					If Not @error And $flag Then
						If $read[0][0] > 0 Then
							_Iniwrite($Database, 'TKB', $read[1][0], StringSplit(_Iniread($Database, "TKB", $read[1][0], ''), '|')[1] & '|1')
						EndIf
					EndIf
					_Msgbox(64 + 262144, 'Thông báo', 'Đã xóa thời khóa biểu thành công')
					_TKB_Load_DeffaultTKB()
					GUIDelete($GUITKB_ADD)
					Return 2
				EndIf
			EndIf
			
		EndIf
		If _ControlHover(0, $GUITKB_ADD) Then
			$control = @extended
			Switch $control
				Case $GUITKB_ADD_Button1, $GUITKB_ADD_Button2, $GUITKB_ADD_Button3
					GUICtrlSetColor($control, "0x0072C6")
					GUICtrlSetBkColor($control, "0xFFFFFF")
			EndSwitch

		Else
			$control = @extended
			Switch $control
				Case $GUITKB_ADD_Button1, $GUITKB_ADD_Button2, $GUITKB_ADD_Button3
					GUICtrlSetColor($control, "0xFFFFFF")
					GUICtrlSetBkColor($control, "-2")
			EndSwitch

		EndIf
	WEnd
	GUIDelete($GUITKB_ADD)
	Return 0
EndFunc   ;==>_TKB_ADD_TKB

Func _ADDTKB_SetDeffault()
	$ADDTKB_State = 3
EndFunc   ;==>_ADDTKB_SetDeffault
Func _ADDTKB_Xoa()
	$ADDTKB_State = 4
EndFunc   ;==>_ADDTKB_Xoa
Func _ADDTKB_DongY()
	$ADDTKB_State = 2
EndFunc   ;==>_ADDTKB_DongY
Func _ADDTKB_HuyBo()
	$ADDTKB_State = -1
EndFunc   ;==>_ADDTKB_HuyBo
#EndRegion --- ADD TKB --------------
Func _SoSanh_KhoangThoiGian($hour1, $min1, $hour2, $min2, $hour3, $min3, $hour4, $min4)
	$time_a_1 = Number($hour1) * 60 + Number($min1)
	$time_a_2 = Number($hour2) * 60 + Number($min2)
	$time_b_1 = Number($hour3) * 60 + Number($min3)
	$time_b_2 = Number($hour4) * 60 + Number($min4)
	If ($time_a_1 = $time_b_1 And $time_a_2 = $time_b_2) Then Return True
	If ($time_a_1 < $time_b_1 And $time_a_2 > $time_b_1) Or ($time_a_1 < $time_b_2 And $time_a_2 > $time_b_2) Then Return True
	If ($time_b_1 < $time_a_1 And $time_b_2 > $time_a_1) Or ($time_b_1 < $time_a_2 And $time_b_2 > $time_a_2) Then Return True
	Return False
EndFunc   ;==>_SoSanh_KhoangThoiGian

;_TKB_ADD_MON('450X5229I','TEST1')
Func _TKB_ADD_MON($ma_tkb, $ma_mon_hoc = '')
	Local $GUITKB_MON_temp[50][6], $GUITKB_MON_Choose = 1, $thongtin_ma_mh, $GUITKB_Color[3], $GUITKB_Temp_Control[13]
	Local $GUITKB_ADD_Input1, $GUITKB_ADD_Input2, $GUITKB_ADD_Input3, $GUITKB_ADD_Input4
	
	$GUITKB_MON_temp[0][0] = 1
	$GUITKB_MON_temp[1][0] = 'Thứ hai'
	$GUITKB_MON_temp[1][1] = '00'
	$GUITKB_MON_temp[1][2] = '00'
	$GUITKB_MON_temp[1][3] = '00'
	$GUITKB_MON_temp[1][4] = '00'
	$GUITKB_MON_temp[1][5] = ''
	$ADDTKB_State = 1
	If $ma_mon_hoc <> '' Then
		Local $thongtin_ma_mh = StringSplit(_Iniread($Database, "TKB" & $ma_tkb, $ma_mon_hoc, ''), '|')
		If Not @error Then
			If $thongtin_ma_mh[0] > 2 Then
				$GUITKB_MON_temp[0][0] = $thongtin_ma_mh[0] - $GUITKB_ADD_START + 1
				For $i = $GUITKB_ADD_START To $thongtin_ma_mh[0]
					Local $read = StringSplit($thongtin_ma_mh[$i], '-')
					If $read[0] > 5 Then
						$GUITKB_MON_temp[$i - $GUITKB_ADD_START + 1][0] = $read[1]
						$GUITKB_MON_temp[$i - $GUITKB_ADD_START + 1][1] = $read[2]
						$GUITKB_MON_temp[$i - $GUITKB_ADD_START + 1][2] = $read[3]
						$GUITKB_MON_temp[$i - $GUITKB_ADD_START + 1][3] = $read[4]
						$GUITKB_MON_temp[$i - $GUITKB_ADD_START + 1][4] = $read[5]
						$GUITKB_MON_temp[$i - $GUITKB_ADD_START + 1][5] = $read[6]
					Else
						_Msgbox(16 + 262144, 'Thông báo', 'Lỗi đọc thông tin môn học, mã lỗi 5, mã môn: ' & $ma_mon_hoc)
						Return 0
					EndIf
				Next
			Else
				_Msgbox(16 + 262144, 'Thông báo', 'Lỗi đọc thông tin môn học, mã lỗi 3, mã môn: ' & $ma_mon_hoc)
				Return 0
			EndIf
		Else
			_Msgbox(16 + 262144, 'Thông báo', 'Lỗi đọc thông tin môn học, mã lỗi 4, mã môn: ' & $ma_mon_hoc & @CRLF & _Iniread($Database, "TKB" & $ma_tkb, $ma_mon_hoc, ''))
			Return 0
		EndIf
	EndIf
	$GUITKB_Color[0] = $ma_mon_hoc <> '' ? $thongtin_ma_mh[2] : '0x0072C6'
	$GUITKB_Color[1] = _Change_Color_Editor($GUITKB_Color[0], 20)
	$GUITKB_Color[2] = _EDITOR_ColorText($GUITKB_Color[0])
	$GUITKB_ADD = GUICreate($ma_mon_hoc <> '' ? 'Sửa môn học' : "Thêm môn học", 356, 433, -1, -1, $WS_POPUP, $WS_EX_TOPMOST)
	GUISetBkColor($GUITKB_Color[0], $GUITKB_ADD)
	$GUITKB_Temp_Control[0] = GUICtrlCreateLabel($ma_mon_hoc <> '' ? 'Sửa môn học' : "Thêm môn học", 20, 13, 209, 36, -1, $GUI_WS_EX_PARENTDRAG)
	GUICtrlSetFont(-1, 15, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")
	$GUITKB_Temp_Control[1] = GUICtrlCreateLabel("Tên môn học:", 20, 52, 113, 21, -1, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")
	$GUITKB_Temp_Control[2] = GUICtrlCreateLabel("Mã môn học:", 20, 120, 113, 21, -1, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")
	$GUITKB_Temp_Control[3] = GUICtrlCreateLabel("Thời gian học:", 20, 213 + 60, 89, 21, -1, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")
	$GUITKB_Temp_Control[4] = GUICtrlCreateLabel("Màu môn học:", 20, 355, 89, 21, -1, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")
	$GUITKB_Temp_Control[5] = GUICtrlCreateLabel("Địa điểm:", 22, 321, 89, 21, -1, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")
	$GUITKB_Temp_Control[6] = GUICtrlCreateLabel("Giảng viên:", 20, 186, 113, 21, -1, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")



	$GUITKB_Temp_Control[7] = GUICtrlCreateLabel("", 20, 106, 319, 2, -1, -1) ; line
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])
	$GUITKB_Temp_Control[8] = GUICtrlCreateLabel("", 20, 174, 319, 2, -1, -1) ; line
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])
	$GUITKB_Temp_Control[9] = GUICtrlCreateLabel("", 20, 240, 319, 2, -1, -1) ; line
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])
	$GUITKB_Temp_Control[10] = GUICtrlCreateLabel("", 130, 342, 200, 1, -1, -1) ; line
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])
	
	$GUITKB_Temp_Control[11] = GUICtrlCreateLabel(":", 212 + 25, 227 + 60, 5, 24, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[0])
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])
	$GUITKB_Temp_Control[12] = GUICtrlCreateLabel(":", 271 + 25, 227 + 60, 5, 24, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[0])
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])




	$GUITKB_ADD_Input1 = GUICtrlCreateInput($ma_mon_hoc <> '' ? $thongtin_ma_mh[1] : '', 20, 81, 319, 25, -1, 0) ; input
	GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, $GUITKB_Color[0])
	$GUITKB_ADD_Input2 = GUICtrlCreateInput($ma_mon_hoc, 20, 149, 319, 25, $ES_UPPERCASE, 0)
	GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, $GUITKB_Color[0])
	GUICtrlSetLimit(-1, 8)
	$GUITKB_ADD_Input3 = GUICtrlCreateInput($ma_mon_hoc <> '' ? $thongtin_ma_mh[3] : '', 20, 215, 319, 25, -1, 0)
	GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, $GUITKB_Color[0])
	$GUITKB_ADD_Input4 = GUICtrlCreateInput("", 130, 321, 200, 16, -1, 0)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, $GUITKB_Color[0])

	$GUITKB_MON_Button1 = GUICtrlCreateLabel("Đồng ý", 268, 395, 67, 30, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")
	$GUITKB_MON_Button2 = GUICtrlCreateLabel("Hủy bỏ", 190, 395, 67, 30, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetOnEvent(-1, '_ADDTKB_HuyBo')
	$GUITKB_MON_Button3 = GUICtrlCreateLabel("Xóa bỏ", 112, 395, 67, 30, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")
	If $ma_mon_hoc = '' Then GUICtrlSetState(-1, $GUI_HIDE)
	_ControlHover(2, $GUITKB_ADD, $GUITKB_MON_Button1)
	_ControlHover(2, $GUITKB_ADD, $GUITKB_MON_Button2)
	_ControlHover(2, $GUITKB_ADD, $GUITKB_MON_Button3)


	
	Local $GUITKB_MON_Buoi[13]
	$GUITKB_MON_Buoi[0] = GUICtrlCreateLabel("1", 129, 196 + 60, 24, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 10, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, $GUITKB_Color[0])
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])
	$GUITKB_MON_Buoi[1] = GUICtrlCreateLabel("+", 154, 196 + 60, 24, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 10, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, $GUITKB_Color[0])
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])
	$GUITKB_MON_Buoi[2] = GUICtrlCreateLabel("1", 179, 196 + 60, 24, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 10, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, $GUITKB_Color[0])
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])
	$GUITKB_MON_Buoi[3] = GUICtrlCreateLabel("2", 204, 196 + 60, 24, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 10, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, $GUITKB_Color[0])
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])
	$GUITKB_MON_Buoi[4] = GUICtrlCreateLabel("1", 229, 196 + 60, 24, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 10, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, $GUITKB_Color[0])
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])
	$GUITKB_MON_Buoi[5] = GUICtrlCreateLabel("2", 254, 196 + 60, 24, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 10, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, $GUITKB_Color[0])
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])
	$GUITKB_MON_Buoi[6] = GUICtrlCreateLabel("1", 279, 196 + 60, 24, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 10, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, $GUITKB_Color[0])
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])
	$GUITKB_MON_Buoi[7] = GUICtrlCreateLabel("2", 304, 196 + 60, 24, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 10, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, $GUITKB_Color[0])
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])
	$GUITKB_MON_Buoi[8] = GUICtrlCreateLabel("Thứ hai", 129, 227 + 60, 80, 24, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1) ; state = 3
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[0])
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])


	$GUITKB_MON_Buoi[9] = GUICtrlCreateLabel("00", 212, 227 + 60, 25, 24, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[0])
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])
	$GUITKB_MON_Buoi[10] = GUICtrlCreateLabel("00", 212 + 25 + 1 + 3 + 1, 227 + 60, 27, 24, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[0])
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])


	$GUITKB_MON_Buoi[11] = GUICtrlCreateLabel("00", 271, 227 + 60, 25, 24, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[0])
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])
	$GUITKB_MON_Buoi[12] = GUICtrlCreateLabel("00", 271 + 25 + 1 + 3 + 1, 227 + 60, 27, 24, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[0])
	GUICtrlSetBkColor(-1, $GUITKB_Color[2])


	$GUITKB_MON_Mau = GUICtrlCreateLabel($GUITKB_Color[0], 129, 355, 199, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE), $WS_EX_STATICEDGE)
	GUICtrlSetColor(-1, $GUITKB_Color[0])
	GUICtrlSetBkColor(-1, $GUITKB_Color[0])
	_ControlHover(2, $GUITKB_ADD, $GUITKB_MON_Mau)

	If $ma_mon_hoc <> '' Then
		If $GUITKB_MON_temp[0][0] <= 7 Then
			For $j = 0 To 7
				If $j <= $GUITKB_MON_temp[0][0] Then
					GUICtrlSetState($GUITKB_MON_Buoi[$j], $GUI_SHOW)
					GUICtrlSetData($GUITKB_MON_Buoi[$j], $j + 1)
				Else
					GUICtrlSetState($GUITKB_MON_Buoi[$j], $GUI_HIDE)
				EndIf
			Next
			GUICtrlSetData($GUITKB_MON_Buoi[$GUITKB_MON_temp[0][0]], '+')
			;ControlClick($GUITKB_ADD,"",$GUITKB_MON_Buoi[0])
		Else
			GUICtrlSetData($GUITKB_MON_Buoi[7], '+')
			GUICtrlSetData($GUITKB_MON_Buoi[6], '>')
			GUICtrlSetData($GUITKB_MON_Buoi[0], '<')
			For $j = 1 To 5
				GUICtrlSetData($GUITKB_MON_Buoi[$j], $j)
			Next
			;ControlClick($GUITKB_ADD,"",$GUITKB_MON_Buoi[1])
		EndIf
		GUICtrlSetData($GUITKB_MON_Buoi[8], $GUITKB_MON_temp[1][0])
		GUICtrlSetData($GUITKB_MON_Buoi[9], $GUITKB_MON_temp[1][1])
		GUICtrlSetData($GUITKB_MON_Buoi[10], $GUITKB_MON_temp[1][2])
		GUICtrlSetData($GUITKB_MON_Buoi[11], $GUITKB_MON_temp[1][3])
		GUICtrlSetData($GUITKB_MON_Buoi[12], $GUITKB_MON_temp[1][4])
		GUICtrlSetData($GUITKB_ADD_Input4, $GUITKB_MON_temp[1][5])
	EndIf
	For $i = 0 To UBound($GUITKB_MON_Buoi) - 1
		_ControlHover(2, $GUITKB_ADD, $GUITKB_MON_Buoi[$i])
		If $i > 1 And $i < 8 And $ma_mon_hoc = '' Then GUICtrlSetState($GUITKB_MON_Buoi[$i], $GUI_HIDE)
		If $i < 8 Then
			GUICtrlSetBkColor($GUITKB_MON_Buoi[$i], $GUITKB_Color[2])
			GUICtrlSetColor($GUITKB_MON_Buoi[$i], $GUITKB_Color[0])
			If String(GUICtrlRead($GUITKB_MON_Buoi[$i])) == String($GUITKB_MON_Choose) Then
				GUICtrlSetBkColor($GUITKB_MON_Buoi[$i], $GUITKB_Color[1])
				GUICtrlSetColor($GUITKB_MON_Buoi[$i], $GUITKB_Color[2])
			EndIf
		EndIf
	Next
	GUISetState(@SW_SHOW, $GUITKB_ADD)

	
	While ($ADDTKB_State > 0)

		Sleep(1)
		If Not WinActive($GUITKB_ADD) Then WinActivate($GUITKB_ADD)
		If _ControlHover(1, $GUITKB_ADD) Then
			$control = @extended
			Switch $control
				Case $GUITKB_MON_Button3
					If $ma_mon_hoc <> '' Then
						If _Msgbox(32 + 262144 + 4, 'Thông báo', 'Bạn có muốn xóa môn học này?') = 6 Then
							IniDelete($Database, "TKB" & $ma_tkb, $ma_mon_hoc)
							_Msgbox(64 + 262144, 'Thông báo', 'Đã xóa môn học thành công')

							GUIDelete($GUITKB_ADD)
							Return 1
						EndIf
					EndIf
				Case $GUITKB_MON_Mau
					Local $color = _ChooseColor(2, 0x008AF0, 2, $GUITKB_ADD)
					If Not @error Then
						GUICtrlSetColor($control, $color)
						GUICtrlSetBkColor($control, $color)
						GUICtrlSetData($GUITKB_MON_Mau, $color)


						$GUITKB_Color[0] = $color
						$GUITKB_Color[1] = _Change_Color_Editor($GUITKB_Color[0], 20)
						$GUITKB_Color[2] = _EDITOR_ColorText($GUITKB_Color[0])
						GUISetBkColor($GUITKB_Color[0], $GUITKB_ADD)
						For $i = 0 To UBound($GUITKB_MON_Buoi) - 1
							GUICtrlSetColor($GUITKB_MON_Buoi[$i], $GUITKB_Color[0])
							GUICtrlSetBkColor($GUITKB_MON_Buoi[$i], $GUITKB_Color[2])
							If $i <= 8 Then
								
								
								If String(GUICtrlRead($GUITKB_MON_Buoi[$i])) == String($GUITKB_MON_Choose) Then
									GUICtrlSetBkColor($GUITKB_MON_Buoi[$i], $GUITKB_Color[1])
									GUICtrlSetColor($GUITKB_MON_Buoi[$i], $GUITKB_Color[2])
								EndIf

							EndIf
						Next
						For $i = 0 To UBound($GUITKB_Temp_Control) - 1
							GUICtrlSetColor($GUITKB_Temp_Control[$i], $GUITKB_Color[2])
							If $i > 6 Then GUICtrlSetBkColor($GUITKB_Temp_Control[$i], $GUITKB_Color[2])
							If $i > 8 Then GUICtrlSetColor($GUITKB_Temp_Control[$i], $GUITKB_Color[0])
						Next
						
						GUICtrlSetColor($GUITKB_ADD_Input1, $GUITKB_Color[2])
						GUICtrlSetBkColor($GUITKB_ADD_Input1, $GUITKB_Color[0])
						GUICtrlSetColor($GUITKB_ADD_Input2, $GUITKB_Color[2])
						GUICtrlSetBkColor($GUITKB_ADD_Input2, $GUITKB_Color[0])
						GUICtrlSetColor($GUITKB_ADD_Input3, $GUITKB_Color[2])
						GUICtrlSetBkColor($GUITKB_ADD_Input3, $GUITKB_Color[0])
						GUICtrlSetColor($GUITKB_ADD_Input4, $GUITKB_Color[2])
						GUICtrlSetBkColor($GUITKB_ADD_Input4, $GUITKB_Color[0])
						GUICtrlSetColor($GUITKB_MON_Button2, $GUITKB_Color[2])
						GUICtrlSetColor($GUITKB_MON_Button1, $GUITKB_Color[2])
						GUICtrlSetColor($GUITKB_MON_Button3, $GUITKB_Color[2])
					EndIf

				Case $GUITKB_MON_Button1
					If GUICtrlRead($GUITKB_ADD_Input1) <> '' And GUICtrlRead($GUITKB_ADD_Input2) <> '' Then
						$GUITKB_MON_temp[$GUITKB_MON_Choose][5] = GUICtrlRead($GUITKB_ADD_Input4)
						Local $flag_temp = True, $text_temp = '', $flag = False
						Local $flag2_temp = True
						Local $read = IniReadSection($Database, "TKB" & $ma_tkb)
						
						If @error Then $flag2_temp = False

						If $flag_temp Then
							For $k = 1 To $GUITKB_MON_temp[0][0]
								$text_temp = $text_temp & '|' & $GUITKB_MON_temp[$k][0] & '-' & $GUITKB_MON_temp[$k][1] & '-' & $GUITKB_MON_temp[$k][2] & '-' & $GUITKB_MON_temp[$k][3] & '-' & $GUITKB_MON_temp[$k][4] & '-' & $GUITKB_MON_temp[$k][5]
								If Number($GUITKB_MON_temp[$k][1]) * 60 + Number($GUITKB_MON_temp[$k][2]) >= Number($GUITKB_MON_temp[$k][3]) * 60 + Number($GUITKB_MON_temp[$k][4]) Then
									_Msgbox(16 + 262144, 'Thông báo', 'Buổi học ' & $k & ' có giờ bắt đầu và kết thúc không hợp lệ')
									$flag_temp = False
									ExitLoop
								Else
									If $flag2_temp Then
										For $i = 1 To $read[0][0]
											Local $tach = StringSplit(_Iniread($Database, "TKB" & $ma_tkb, $read[$i][0], ''), '|')
											If $ma_mon_hoc <> '' And $read[$i][0] = $ma_mon_hoc Then ContinueLoop
											If Not @error Then
												For $j = $GUITKB_ADD_START To $tach[0]
													Local $tach2 = StringSplit($tach[$j], '-')
													If $tach2[0] < 6 Then
														_Msgbox(16 + 262144, 'Thông báo', 'Lỗi đọc thông tin môn học, mã lỗi 1, mã môn: ' & $read[$i][0])
														$flag_temp = False
														ExitLoop
													EndIf
													If $tach2[1] = $GUITKB_MON_temp[$k][0] Then
														If _SoSanh_KhoangThoiGian($tach2[2], $tach2[3], $tach2[4], $tach2[5], $GUITKB_MON_temp[$k][1], $GUITKB_MON_temp[$k][2], $GUITKB_MON_temp[$k][3], $GUITKB_MON_temp[$k][4]) Then
															_Msgbox(16 + 262144, 'Thông báo', 'Buổi học ' & $k & ' có giờ học trùng với môn khác, bạn có thể tạo các thời khóa biểu khác nhau để lưu các giờ học trùng nhau')
															$flag_temp = False
															ExitLoop
														EndIf
													EndIf
												Next
												If $flag_temp = False Then ExitLoop
											Else
												_Msgbox(16 + 262144, 'Thông báo', 'Lỗi đọc thông tin môn học, mã lỗi 2, mã môn: ' & $read[$i][0])
												$flag_temp = False
												ExitLoop
											EndIf
										Next
									EndIf
									For $i = 1 To $k - 1
										If $GUITKB_MON_temp[$i][0] = $GUITKB_MON_temp[$k][0] Then
											If _SoSanh_KhoangThoiGian($GUITKB_MON_temp[$i][1], $GUITKB_MON_temp[$i][2], $GUITKB_MON_temp[$i][3], $GUITKB_MON_temp[$i][4], $GUITKB_MON_temp[$k][1], $GUITKB_MON_temp[$k][2], $GUITKB_MON_temp[$k][3], $GUITKB_MON_temp[$k][4]) Then
												_Msgbox(16 + 262144, 'Thông báo', 'Buổi học ' & $k & ' có giờ học trùng với buổi ' & $i & ', bạn có thể tạo các thời khóa biểu khác nhau để lưu các giờ học trùng nhau')
												$flag_temp = False
												ExitLoop
											EndIf
										EndIf
									Next
								EndIf
								If $flag_temp = False Then ExitLoop
							Next
						EndIf
						Local $ma_mon_hoc_cu = $ma_mon_hoc
						$ma_mon_hoc = GUICtrlRead($GUITKB_ADD_Input2)
						If $flag_temp And $ma_mon_hoc_cu <> $ma_mon_hoc Then
							If _Iniread($Database, "TKB" & $ma_tkb, $ma_mon_hoc, '') <> '' Then
								_Msgbox(16 + 262144, 'Thông báo', 'Mã môn học đã tồn tại, vui lòng dùng mã khác')
								$flag_temp = False
							EndIf
						EndIf
						
						If $flag_temp Then
							If $ma_mon_hoc_cu <> '' Then IniDelete($Database, "TKB" & $ma_tkb, $ma_mon_hoc_cu)
							_Iniwrite($Database, "TKB" & $ma_tkb, $ma_mon_hoc, GUICtrlRead($GUITKB_ADD_Input1) & '|' & GUICtrlRead($GUITKB_MON_Mau) & '|' & GUICtrlRead($GUITKB_ADD_Input3) & $text_temp)
							_Msgbox(64 + 262144, 'Thông báo', 'Đã lưu thành công môn học!')

							GUIDelete($GUITKB_ADD)
							Return 1
						EndIf
					Else
						_Msgbox(16 + 262144, 'Thông báo', 'Vui lòng nhập đầy đủ thông tin trên')
					EndIf

				Case $GUITKB_MON_Buoi[8]
					_ADDEVENT_ChangeLabelSetting($GUITKB_MON_Buoi[8], 'Thứ hai|Thứ ba|Thứ tư|Thứ năm|Thứ sáu|Thứ bảy|Chủ nhật')
					$GUITKB_MON_temp[$GUITKB_MON_Choose][0] = String(GUICtrlRead($GUITKB_MON_Buoi[8]))
				Case $GUITKB_MON_Buoi[9], $GUITKB_MON_Buoi[11]
					_ADDEVENT_ChangeLabelSetting($control, '00|01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23')
					$GUITKB_MON_temp[$GUITKB_MON_Choose][1] = String(GUICtrlRead($GUITKB_MON_Buoi[9]))
					$GUITKB_MON_temp[$GUITKB_MON_Choose][3] = String(GUICtrlRead($GUITKB_MON_Buoi[11]))
				Case $GUITKB_MON_Buoi[10], $GUITKB_MON_Buoi[12]
					_ADDEVENT_ChangeLabelSetting($control, '00|05|10|15|20|25|30|35|40|45|50|55')
					$GUITKB_MON_temp[$GUITKB_MON_Choose][2] = String(GUICtrlRead($GUITKB_MON_Buoi[10]))
					$GUITKB_MON_temp[$GUITKB_MON_Choose][4] = String(GUICtrlRead($GUITKB_MON_Buoi[12]))
				Case Else
					For $i = 0 To 7
						If $control = $GUITKB_MON_Buoi[$i] Then
							$GUITKB_MON_temp[$GUITKB_MON_Choose][5] = GUICtrlRead($GUITKB_ADD_Input4)
							If GUICtrlRead($GUITKB_MON_Buoi[$i]) == '+' Then
								$GUITKB_MON_temp[0][0] += 1
								$GUITKB_MON_Choose = $GUITKB_MON_temp[0][0]
								If $GUITKB_MON_temp[0][0] <= 7 Then
									GUICtrlSetData($GUITKB_MON_Buoi[$i], $GUITKB_MON_temp[0][0])
									GUICtrlSetData($GUITKB_MON_Buoi[$i + 1], '+')
									GUICtrlSetState($GUITKB_MON_Buoi[$i + 1], $GUI_SHOW)
								Else
									GUICtrlSetData($GUITKB_MON_Buoi[0], '<')
									GUICtrlSetData($GUITKB_MON_Buoi[$i - 1], '>')
									For $j = 1 To $i - 2
										GUICtrlSetData($GUITKB_MON_Buoi[$j], $GUITKB_MON_temp[0][0] - 5 + $j)
									Next

								EndIf
								$GUITKB_MON_temp[$GUITKB_MON_temp[0][0]][0] = 'Thứ hai'
								$GUITKB_MON_temp[$GUITKB_MON_temp[0][0]][1] = $GUITKB_MON_temp[$GUITKB_MON_temp[0][0] - 1][1]
								$GUITKB_MON_temp[$GUITKB_MON_temp[0][0]][2] = $GUITKB_MON_temp[$GUITKB_MON_temp[0][0] - 1][2]
								$GUITKB_MON_temp[$GUITKB_MON_temp[0][0]][3] = $GUITKB_MON_temp[$GUITKB_MON_temp[0][0] - 1][3]
								$GUITKB_MON_temp[$GUITKB_MON_temp[0][0]][4] = $GUITKB_MON_temp[$GUITKB_MON_temp[0][0] - 1][4]
								$GUITKB_MON_temp[$GUITKB_MON_temp[0][0]][5] = $GUITKB_MON_temp[$GUITKB_MON_temp[0][0] - 1][5]
								GUICtrlSetData($GUITKB_MON_Buoi[8], $GUITKB_MON_temp[$GUITKB_MON_temp[0][0]][0])
								GUICtrlSetData($GUITKB_MON_Buoi[9], $GUITKB_MON_temp[$GUITKB_MON_temp[0][0]][1])
								GUICtrlSetData($GUITKB_MON_Buoi[10], $GUITKB_MON_temp[$GUITKB_MON_temp[0][0]][2])
								GUICtrlSetData($GUITKB_MON_Buoi[11], $GUITKB_MON_temp[$GUITKB_MON_temp[0][0]][3])
								GUICtrlSetData($GUITKB_MON_Buoi[12], $GUITKB_MON_temp[$GUITKB_MON_temp[0][0]][4])
								GUICtrlSetData($GUITKB_ADD_Input4, $GUITKB_MON_temp[$GUITKB_MON_temp[0][0] - 1][5])
							ElseIf GUICtrlRead($GUITKB_MON_Buoi[$i]) == '<' Then
								Local $number_temp = Number(GUICtrlRead($GUITKB_MON_Buoi[5]))
								If $number_temp - 4 > 1 Then
									For $j = 5 To 1 Step -1
										$number_temp -= 1
										GUICtrlSetData($GUITKB_MON_Buoi[$j], $number_temp)
									Next
								EndIf
							ElseIf GUICtrlRead($GUITKB_MON_Buoi[$i]) == '>' Then
								Local $number_temp = Number(GUICtrlRead($GUITKB_MON_Buoi[1]))
								If $number_temp + 4 < $GUITKB_MON_temp[0][0] Then
									For $j = 1 To 5
										$number_temp += 1
										GUICtrlSetData($GUITKB_MON_Buoi[$j], $number_temp)
									Next
								EndIf
							Else
								If Number(GUICtrlRead($GUITKB_MON_Buoi[$i])) <> $GUITKB_MON_Choose Then
									$GUITKB_MON_Choose = Number(GUICtrlRead($GUITKB_MON_Buoi[$i]))
									GUICtrlSetData($GUITKB_MON_Buoi[8], $GUITKB_MON_temp[$GUITKB_MON_Choose][0])
									GUICtrlSetData($GUITKB_MON_Buoi[9], $GUITKB_MON_temp[$GUITKB_MON_Choose][1])
									GUICtrlSetData($GUITKB_MON_Buoi[10], $GUITKB_MON_temp[$GUITKB_MON_Choose][2])
									GUICtrlSetData($GUITKB_MON_Buoi[11], $GUITKB_MON_temp[$GUITKB_MON_Choose][3])
									GUICtrlSetData($GUITKB_MON_Buoi[12], $GUITKB_MON_temp[$GUITKB_MON_Choose][4])
									GUICtrlSetData($GUITKB_ADD_Input4, $GUITKB_MON_temp[$GUITKB_MON_Choose][5])
								ElseIf $GUITKB_MON_temp[0][0] > 1 Then
									If _Msgbox(262144 + 32 + 4, 'Thông báo', 'Bạn có muốn xóa buổi học ' & $GUITKB_MON_Choose & '?') = 6 Then
										$GUITKB_MON_temp[$GUITKB_MON_Choose][0] = ''
										For $j = $GUITKB_MON_Choose To $GUITKB_MON_temp[0][0]
											If $GUITKB_MON_temp[$j][0] = '' Then
												$GUITKB_MON_temp[$j][0] = $GUITKB_MON_temp[$j + 1][0]
												$GUITKB_MON_temp[$j][1] = $GUITKB_MON_temp[$j + 1][1]
												$GUITKB_MON_temp[$j][2] = $GUITKB_MON_temp[$j + 1][2]
												$GUITKB_MON_temp[$j][3] = $GUITKB_MON_temp[$j + 1][3]
												$GUITKB_MON_temp[$j][4] = $GUITKB_MON_temp[$j + 1][4]
												$GUITKB_MON_temp[$j + 1][0] = ''
											EndIf
										Next
										$GUITKB_MON_Choose = 1
										$GUITKB_MON_temp[0][0] -= 1
										If $GUITKB_MON_temp[0][0] <= 7 Then
											For $j = 0 To 7
												If $j <= $GUITKB_MON_temp[0][0] Then
													GUICtrlSetState($GUITKB_MON_Buoi[$j], $GUI_SHOW)
													GUICtrlSetData($GUITKB_MON_Buoi[$j], $j + 1)
												Else
													GUICtrlSetState($GUITKB_MON_Buoi[$j], $GUI_HIDE)
												EndIf
											Next
											GUICtrlSetData($GUITKB_MON_Buoi[$GUITKB_MON_temp[0][0]], '+')
											;ControlClick($GUITKB_ADD,"",$GUITKB_MON_Buoi[0])
										Else
											GUICtrlSetData($GUITKB_MON_Buoi[7], '+')
											GUICtrlSetData($GUITKB_MON_Buoi[6], '>')
											GUICtrlSetData($GUITKB_MON_Buoi[0], '<')
											For $j = 1 To 5
												GUICtrlSetData($GUITKB_MON_Buoi[$j], $j)
											Next
											;ControlClick($GUITKB_ADD,"",$GUITKB_MON_Buoi[1])
										EndIf
										GUICtrlSetData($GUITKB_MON_Buoi[8], $GUITKB_MON_temp[1][0])
										GUICtrlSetData($GUITKB_MON_Buoi[9], $GUITKB_MON_temp[1][1])
										GUICtrlSetData($GUITKB_MON_Buoi[10], $GUITKB_MON_temp[1][2])
										GUICtrlSetData($GUITKB_MON_Buoi[11], $GUITKB_MON_temp[1][3])
										GUICtrlSetData($GUITKB_MON_Buoi[12], $GUITKB_MON_temp[1][4])
										GUICtrlSetData($GUITKB_ADD_Input4, $GUITKB_MON_temp[1][5])
									EndIf
								EndIf
								
							EndIf
							For $j = 0 To 7

								If $i == $j Then ContinueLoop
								GUICtrlSetBkColor($GUITKB_MON_Buoi[$j], $GUITKB_Color[2])
								GUICtrlSetColor($GUITKB_MON_Buoi[$j], $GUITKB_Color[0])
								If String(GUICtrlRead($GUITKB_MON_Buoi[$j])) == String($GUITKB_MON_Choose) Then
									GUICtrlSetBkColor($GUITKB_MON_Buoi[$j], $GUITKB_Color[1])
									GUICtrlSetColor($GUITKB_MON_Buoi[$j], $GUITKB_Color[2])
								EndIf
							Next
							ExitLoop
						EndIf
					Next
			EndSwitch
		EndIf
		
		If _ControlHover(0, $GUITKB_ADD) Then
			$control = @extended
			Switch $control
				Case $GUITKB_MON_Button1, $GUITKB_MON_Button2, $GUITKB_MON_Button3
					GUICtrlSetColor($control, $GUITKB_Color[0])
					GUICtrlSetBkColor($control, $GUITKB_Color[2])
				Case $GUITKB_MON_Mau
					GUICtrlSetBkColor($GUITKB_MON_Mau, $GUITKB_Color[1])
					GUICtrlSetColor($GUITKB_MON_Mau, $GUITKB_Color[1])
				Case Else
					For $var In $GUITKB_MON_Buoi
						If $var = $control Then
							If String(GUICtrlRead($control)) <> String($GUITKB_MON_Choose) Then
								GUICtrlSetColor($control, $GUITKB_Color[2])
								GUICtrlSetBkColor($control, $GUITKB_Color[1])
							EndIf
						EndIf
					Next
			EndSwitch

		Else
			$control = @extended
			Switch $control
				Case $GUITKB_MON_Mau
					GUICtrlSetBkColor($GUITKB_MON_Mau, $GUITKB_Color[0])
					GUICtrlSetColor($GUITKB_MON_Mau, $GUITKB_Color[0])
				Case $GUITKB_MON_Button1, $GUITKB_MON_Button2, $GUITKB_MON_Button3
					GUICtrlSetColor($control, $GUITKB_Color[2])
					GUICtrlSetBkColor($control, "-2")
				Case Else
					For $var In $GUITKB_MON_Buoi
						If $var = $control Then
							If String(GUICtrlRead($control)) <> String($GUITKB_MON_Choose) Then
								GUICtrlSetColor($control, $GUITKB_Color[0])
								GUICtrlSetBkColor($control, $GUITKB_Color[2])
							EndIf
						EndIf
					Next

			EndSwitch

		EndIf
		
	WEnd

	GUIDelete($GUITKB_ADD)
	Return 0
EndFunc   ;==>_TKB_ADD_MON
;_TKB_MON_ADD_NHACNHO('375W8465T','UNITY','UG769L48163Z')
Func _TKB_MON_ADD_NHACNHO($ma_tkb, $ma_mon_hoc, $ma_nhac_nho = '')
	$ADDTKB_State = 1
	Local $GUITKB_Color[3], $GUITKB_Button1, $GUITKB_Button2, $GUITKB_Input1, $GUITKB_Input2, $GUITKB_Input3, $GUITKB_Input4, $GUITKB_Input5, $GUITKB_Temp_Control[6]
	Local $thongtin_ma_mh = StringSplit(_Iniread($Database, "TKB" & $ma_tkb, $ma_mon_hoc, ''), '|')
	If @error Or $thongtin_ma_mh[0] < 4 Then Exit
	Local $thongtin_nn = StringSplit(_Iniread($Database, "TKB" & $ma_tkb & '-' & $ma_mon_hoc, $ma_nhac_nho, ''), '|')
	$GUITKB_Color[0] = $thongtin_ma_mh[2] : '0x0072C6'
	$GUITKB_Color[1] = _Change_Color_Editor($GUITKB_Color[0], 20)
	$GUITKB_Color[2] = _EDITOR_ColorText($GUITKB_Color[0])
	$GUITKB_ADD = GUICreate($ma_nhac_nho = '' ? "Thêm nhắc nhở" : "Xem nhắc nhở", 356, 345, -1, -1, $WS_POPUP, $WS_EX_TOPMOST)
	GUISetBkColor($GUITKB_Color[0], $GUITKB_ADD)
	$GUITKB_Temp_Control[0] = GUICtrlCreateLabel($ma_nhac_nho = '' ? "Thêm nhắc nhở" : "Xem nhắc nhở", 20, 13, 209, 36, -1, -1)
	GUICtrlSetFont(-1, 15, 400, 0, "Segoe UI")
	GUICtrlSetColor($GUITKB_Temp_Control[0], $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")
	$GUITKB_Temp_Control[1] = GUICtrlCreateLabel("Nhắc nhở của:", 19, 60, 86, 21, -1, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")
	$GUITKB_Button1 = GUICtrlCreateLabel("Đồng ý", 271, 307, 67, 30, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")
	$GUITKB_Button2 = GUICtrlCreateLabel("Hủy bỏ", 195, 307, 67, 30, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")
	$GUITKB_Temp_Control[2] = GUICtrlCreateLabel("Mô tả nhắc nhở:", 18, 185, 128, 21, -1, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")
	$GUITKB_Input5 = GUICtrlCreateEdit($ma_nhac_nho = '' ? "" : BinaryToString($thongtin_nn[3], 4), 19, 210, 319, 78, BitOR($ES_AUTOVSCROLL, $ES_WANTRETURN, $WS_VSCROLL), $WS_EX_TRANSPARENT)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor($GUITKB_Input5, $GUITKB_Color[2])
	GUICtrlSetBkColor($GUITKB_Input5, $GUITKB_Color[0])
	GUICtrlSetLimit($GUITKB_Input5, 300)

	$GUITKB_Temp_Control[3] = GUICtrlCreateLabel("Nhắc ngày:", 19, 94, 86, 21, -1, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetState(-1, $GUI_FOCUS)
	$GUITKB_Input2 = GUICtrlCreateLabel($ma_nhac_nho = '' ? "Chọn ngày" : $thongtin_nn[1], 112, 94, 222, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, $GUITKB_Color[1])
	$GUITKB_Input1 = GUICtrlCreateLabel($thongtin_ma_mh[1], 112, 60, 222, 21, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, $GUITKB_Color[1])
	$GUITKB_Temp_Control[4] = GUICtrlCreateLabel("", 19, 290, 319, 2, -1, -1)
	GUICtrlSetBkColor($GUITKB_Temp_Control[4], $GUITKB_Color[2])
	$GUITKB_Temp_Control[5] = GUICtrlCreateLabel("Nhắc nhở về:", 18, 131, 86, 21, -1, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")
	$GUITKB_Input3 = GUICtrlCreateLabel("☐ Một ngày thi hay kiểm tra", 110, 131, 217, 21, -1, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetCursor(-1, 0)
	$GUITKB_Input4 = GUICtrlCreateLabel("☒ Một bài tập, bài thuyết trình", 110, 158, 217, 21, -1, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, $GUITKB_Color[2])
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetCursor(-1, 0)
	If $ma_nhac_nho <> '' Then
		If Number($thongtin_nn[2]) = 1 Then
			GUICtrlSetData($GUITKB_Input3, "☒ Một ngày thi hay kiểm tra")
			GUICtrlSetData($GUITKB_Input4, "☐ Một bài tập, bài thuyết trình")
		EndIf
	EndIf

	_ControlHover(2, $GUITKB_ADD, $GUITKB_Input1)
	_ControlHover(2, $GUITKB_ADD, $GUITKB_Input2)
	_ControlHover(2, $GUITKB_ADD, $GUITKB_Button1)
	_ControlHover(2, $GUITKB_ADD, $GUITKB_Button2)
	_ControlHover(2, $GUITKB_ADD, $GUITKB_Input3)
	_ControlHover(2, $GUITKB_ADD, $GUITKB_Input4)
	GUISetState(@SW_SHOW, $GUITKB_ADD)
	While $ADDTKB_State > 0
		Sleep(10)
		If Not WinActive($GUITKB_ADD) Then WinActivate($GUITKB_ADD)
		If _ControlHover(1, $GUITKB_ADD) Then
			$control = @extended
			Switch $control
				Case $GUITKB_Input1
					Local $read = IniReadSection($Database, "TKB" & $ma_tkb)
					If @error Then ExitLoop
					For $i = 1 To $read[0][0]
						If $read[$i][0] = $ma_mon_hoc Then
							If $i = $read[0][0] Then $i = 0
							$ma_mon_hoc = $read[$i + 1][0]
							ExitLoop
						EndIf
					Next
					Local $thongtin_ma_mh = StringSplit(_Iniread($Database, "TKB" & $ma_tkb, $ma_mon_hoc, ''), '|')

					If @error Or $thongtin_ma_mh[0] < 4 Then Exit
					$GUITKB_Color[0] = $thongtin_ma_mh[2] : '0x0072C6'
					$GUITKB_Color[1] = _Change_Color_Editor($GUITKB_Color[0], 20)
					$GUITKB_Color[2] = _EDITOR_ColorText($GUITKB_Color[0])
					GUICtrlSetData($GUITKB_Input1, $thongtin_ma_mh[1])
					GUICtrlSetData($GUITKB_Input2, 'Chọn ngày')
					GUISetBkColor($GUITKB_Color[0], $GUITKB_ADD)
					GUICtrlSetColor($GUITKB_Input1, $GUITKB_Color[0])
					GUICtrlSetBkColor($GUITKB_Input1, $GUITKB_Color[2])
					GUICtrlSetColor($GUITKB_Input2, $GUITKB_Color[2])
					GUICtrlSetBkColor($GUITKB_Input2, $GUITKB_Color[1])
					GUICtrlSetColor($GUITKB_Input3, $GUITKB_Color[2])
					GUICtrlSetColor($GUITKB_Input4, $GUITKB_Color[2])
					GUICtrlSetColor($GUITKB_Input5, $GUITKB_Color[2])
					GUICtrlSetBkColor($GUITKB_Input5, $GUITKB_Color[0])
					GUICtrlSetColor($GUITKB_Button1, $GUITKB_Color[2])
					GUICtrlSetColor($GUITKB_Button2, $GUITKB_Color[2])
					For $i = 0 To UBound($GUITKB_Temp_Control) - 1
						GUICtrlSetColor($GUITKB_Temp_Control[$i], $GUITKB_Color[2])
					Next
					GUICtrlSetBkColor($GUITKB_Temp_Control[4], $GUITKB_Color[2])

				Case $GUITKB_Button1
					Local $flag = True
					If StringSplit(GUICtrlRead($GUITKB_Input2), '/')[0] < 3 Then
						_Msgbox(16 + 262144, 'Thông báo', 'Bạn chưa chọn ngày nhắc nhở')
						$flag = False
					EndIf
					If $ma_nhac_nho = '' Then
						Do
							$ma_nhac_nho = Chr(Random(65, 90, 1)) & Chr(Random(65, 90, 1)) & Random(100, 999, 1) & Chr(Random(65, 90, 1)) & Random(10000, 99999, 1) & Chr(Random(65, 90, 1))
						Until _Iniread($Database, "TKB" & $ma_tkb & '-' & $ma_mon_hoc, $ma_nhac_nho, '') = ''
					EndIf
					If $flag Then
						Local $chon = 0
						If StringLeft(GUICtrlRead($GUITKB_Input4), 1) = '☐' Then $chon = 1
						_Iniwrite($Database, "TKB" & $ma_tkb & '-' & $ma_mon_hoc, $ma_nhac_nho, GUICtrlRead($GUITKB_Input2) & '|' & $chon & '|' & StringToBinary(GUICtrlRead($GUITKB_Input5), 4) & '|0')
						_Msgbox(64 + 262144, 'Thông báo', 'Đã lưu nhắc nhở thành công!')
						GUIDelete($GUITKB_ADD)
						Return 1
					EndIf
				Case $GUITKB_Button2
					$ADDTKB_State = 0
				Case $GUITKB_Input2
					Local $ngay = _CHOOSEDATE_ShowGUI(@MON, @YEAR, 1, $GUITKB_ADD)
					GUICtrlSetColor($GUITKB_Input2, $GUITKB_Color[2])
					GUICtrlSetBkColor($GUITKB_Input2, $GUITKB_Color[1])
					_ControlHover(2, $GUITKB_ADD, $GUITKB_Input1)
					_ControlHover(2, $GUITKB_ADD, $GUITKB_Input2)
					_ControlHover(2, $GUITKB_ADD, $GUITKB_Button1)
					_ControlHover(2, $GUITKB_ADD, $GUITKB_Button2)
					_ControlHover(2, $GUITKB_ADD, $GUITKB_Input3)
					_ControlHover(2, $GUITKB_ADD, $GUITKB_Input4)
					Local $flag = False
					Local $tach = StringSplit($ngay, '/')
	
					If _DateDiff('d', _NowCalcDate(), $tach[3] & '/' & $tach[2] & '/' & $tach[1]) < 0 Then $flag = False
					If $flag Then
						GUICtrlSetData($GUITKB_Input2, $ngay)
					EndIf
				Case $GUITKB_Input3, $GUITKB_Input4
					If StringLeft(GUICtrlRead($control), 1) = '☐' Then
						GUICtrlSetData($control, '☒' & StringTrimLeft(GUICtrlRead($control), 1))
						If $control = $GUITKB_Input3 Then
							GUICtrlSetData($GUITKB_Input4, '☐' & StringTrimLeft(GUICtrlRead($GUITKB_Input4), 1))
						Else
							GUICtrlSetData($GUITKB_Input3, '☐' & StringTrimLeft(GUICtrlRead($GUITKB_Input3), 1))
						EndIf
					EndIf
			EndSwitch
		EndIf
		
		If _ControlHover(0, $GUITKB_ADD) Then
			$control = @extended
			Switch $control
				Case $GUITKB_Button1, $GUITKB_Button2
					GUICtrlSetBkColor($control, $GUITKB_Color[2])
					GUICtrlSetColor($control, $GUITKB_Color[0])
				Case $GUITKB_Input1, $GUITKB_Input2
					GUICtrlSetBkColor($control, $GUITKB_Color[2])
					GUICtrlSetColor($control, $GUITKB_Color[0])
			EndSwitch
		Else
			$control = @extended
			Switch $control
				Case $GUITKB_Button1, $GUITKB_Button2
					GUICtrlSetBkColor($control, '-2')
					GUICtrlSetColor($control, $GUITKB_Color[2])

				Case $GUITKB_Input1, $GUITKB_Input2
					GUICtrlSetBkColor($control, $GUITKB_Color[1])
					GUICtrlSetColor($control, $GUITKB_Color[2])
			EndSwitch
			
		EndIf
	WEnd
	GUIDelete($GUITKB_ADD)
	Return 0
EndFunc   ;==>_TKB_MON_ADD_NHACNHO
