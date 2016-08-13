#include <GuiScrollBars.au3>
#cs
	_NOTE.au3
	GUI NOTE - Ghi chú
	MỘT NOTE SẼ ĐC LƯU VỚI QUY TẮC
	1, CÓ 1 ID NOTE RIÊNG
	2, LƯU TẠI $DIR_NOTE VỚI TÊN ID
	3, LƯU CÁC SETTING CỦA NOTE ĐÓ VỚI KEY = ID NOTE, VALUE = SETTING STRUCT
	SETTING STRUCT: [1 name] [2 on top] [3 đánh dấu] [4 stick] [5 gui_w] [6 gui_h] [7 gui_x] [8 gui_y]  [9 color] [10 trans] [11 YDAY]

	MỘT NOTE BỊ DELETE SẼ
	1, BACKUP 7 NGÀY TRONG $DIR_NOTE\Temp
	2, XÓA KEY KHỎI NOTE, CHUYỂN VỀ NOTE_TEMP
	3, PHẦN MỀM HỖ TRỢ PHỤC HỘI NGAY TẠI ĐIỂM XÓA
#ce
Global $NOTE_button_new[3], $NOTE_Effect_Search[2], $NOTE_input_search[2], $NOTE_ChooseList[2]
Global Const $NOTE_NUMBER = 100
Global $NOTE_ListNote[$NOTE_NUMBER], $NOTE_ListNote_ID[$NOTE_NUMBER]
Global $NOTE_Group[20][2]
Global $AC_SRC_ALPHA = 1
Dim $NOTE_Y = 30
#Region GUI NOTE

Global $NOTEGUI = GUICreate("Danh sách ghi chú", 606, 498 + $NOTE_Y + 5, -1, -1, BitOR($WS_POPUP, $WS_BORDER), -1)
GUISetBkColor(0x0072C6, $NOTEGUI)
	$NOTE_ESC = GUICtrlCreateButton('',-1000,-1000)
	GUICtrlSetOnEvent(-1,'_NOTE_HIDEGUI')
	Dim $NOTE_AccelTable[1][2] = [["{ESC}", $NOTE_ESC]]
	GUISetAccelerators($NOTE_AccelTable)
	
GUICtrlCreateLabel("", 0, 0, 613, 87 + $NOTE_Y, -1, -1)
GUICtrlSetState(-1, BitOR($GUI_SHOW, $GUI_DISABLE))
GUICtrlSetBkColor(-1, "0x0072C6")
; title
GUICtrlCreateLabel("", 0, 0, 613, 45, -1, $GUI_WS_EX_PARENTDRAG)
GUICtrlSetBkColor(-1, "0x0072C6")
GUICtrlCreateLabel("Danh sách ghi chú của bạn", 22, 5, 400, 45, $SS_CENTERIMAGE, 0)
GUICtrlSetFont(-1, 20, 300, 0, "Segoe UI Light")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")

; input
$NOTE_Group[1][0] = GUICtrlCreateLabel("", 373, 31 + $NOTE_Y, 33, 33, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 18, 400, 0, "FontAwesome")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "0x008AF0")
GUICtrlSetOnEvent(-1, '_NOTE_Search_Click')
_GUICtrl_OnHoverRegister(-1, "_MenuNoteHover", "_MenuNoteNormal")
$NOTE_Group[2][0] = GUICtrlCreateInput("", 19, 31 + $NOTE_Y, 354, 33, -1, 0)
GUICtrlSetFont(-1, 16, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "0x008AF0")
GUICtrlSetOnEvent(-1, '_NOTE_Search')
; group 1
$NOTE_Group[3][0] = GUICtrlCreateLabel("", 441 - 10, 31 + $NOTE_Y, 143, 33, $SS_WHITEFRAME, -1)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
GUICtrlSetOnEvent(-1, '_NOTE_NewNote')
$NOTE_Group[4][0] = GUICtrlCreateLabel("GHI CHÚ MỚI", 472 - 10, 32 + $NOTE_Y, 111, 31, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
$NOTE_Group[5][0] = GUICtrlCreateLabel($ICON_NOTE, 442 - 10, 32 + $NOTE_Y, 32, 31, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 12, 400, 0, "FontAwesome")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
$NOTE_Group[0][0] = 5
; group 2
$NOTE_Group[6][1] = GUICtrlCreateLabel("", 0, 27 + $NOTE_Y, 613, 42, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetState(-1, BitOR($GUI_SHOW, $GUI_DISABLE))
GUICtrlSetBkColor(-1, "0x008AF0")
$NOTE_Group[2][1] = GUICtrlCreateLabel("ĐÁNH DẤU", 368, 35 + $NOTE_Y, 78, 26, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 9, 700, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "0x0072C6")
_GUICtrl_OnHoverRegister(-1, "_MenuNoteHover", "_MenuNoteNormal")
SetOnEventA(-1, '_NOTE_TopMenu', $ParamByVal, 3)
$NOTE_Group[3][1] = GUICtrlCreateLabel("XÓA", 447, 35 + $NOTE_Y, 45, 26, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 9, 700, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "0x0072C6")
_GUICtrl_OnHoverRegister(-1, "_MenuNoteHover", "_MenuNoteNormal")
SetOnEventA(-1, '_NOTE_TopMenu', $ParamByVal, 2)
$NOTE_Group[4][1] = GUICtrlCreateLabel("CHỌN NHIỀU", 493, 35 + $NOTE_Y, 90, 26, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 9, 700, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "0x0072C6")
SetOnEventA(-1, '_NOTE_TopMenu', $ParamByVal, 1)
_GUICtrl_OnHoverRegister(-1, "_MenuNoteHover", "_MenuNoteNormal")
$NOTE_Group[5][1] = GUICtrlCreateLabel("MỞ", 322, 35 + $NOTE_Y, 45, 26, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 9, 700, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "0x0072C6")
_GUICtrl_OnHoverRegister(-1, "_MenuNoteHover", "_MenuNoteNormal")
SetOnEventA(-1, '_NOTE_TopMenu', $ParamByVal, 4)
$NOTE_Group[1][1] = GUICtrlCreateLabel("Bạn đã chọn 3 ghi chú. Bạn có thể", 52, 27 + $NOTE_Y, 380, 42, $SS_CENTERIMAGE, -1)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")

$NOTE_Group[0][1] = 6

; bot line
GUICtrlCreateLabel("", 0, 477 + $NOTE_Y, 613, 29, -1, -1)
GUICtrlSetState(-1, BitOR($GUI_SHOW, $GUI_DISABLE))
GUICtrlSetBkColor(-1, "0x0072C6")
; menu close
Global $NOTE_Close = GUICtrlCreateLabel("ĐÓNG LẠI", 524, 477 + $NOTE_Y, 75, 26, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
GUICtrlSetFont(-1, 10, 700, 0, "Segoe UI")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetBkColor(-1, "-2")
_GUICtrl_OnHoverRegister(-1, "_MenuNoteHover", "_MenuNoteNormal")
GUICtrlSetOnEvent(-1, '_NOTE_HIDEGUI')
; child GUI
Global $NOTEGUI2 = GUICreate("NOTEGUI2", 606, 390, 0, 87 + $NOTE_Y, $WS_POPUP, -1)
GUISetBkColor(0xFFFFFF, $NOTEGUI2)
_WinAPI_SetParent($NOTEGUI2, $NOTEGUI) ; real parent <3

Global $NOTEGUI2_Text = GUICtrlCreateLabel("Không tìm thấy ghi chú nào" & @CRLF & 'Hãy viết ghi chú mới!', 0, 130, 599, 99, $SS_CENTER)
GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
GUICtrlSetBkColor(-1, "-2")
#EndRegion GUI NOTE

Func _NOTE_ShowGUI()
	If BitAND(WinGetState($NOTEGUI), 2) = 2 Then ; nếu đã mở rồi

		WinSetOnTop($NOTEGUI, '', 1)
		WinSetOnTop($NOTEGUI, '', 0)
		Return 0
	Else
		Local $pos_GUI = WinGetPos($NOTEGUI)
		Local $pos_x = Int(@DesktopWidth / 2 - $pos_GUI[2] / 2)
		Local $pos_y = Int(@DesktopHeight / 2 - $pos_GUI[3] / 2)
		WinMove($NOTEGUI, '', $pos_x, $pos_y)
	EndIf
	_NOTE_ChangeGroup()
	WinSetTrans($NOTEGUI, '', 255)
	GUISetState(@SW_SHOW, $NOTEGUI2)
	GUISetState(@SW_SHOW, $NOTEGUI)
	_NOTE_RefeshNote()
EndFunc   ;==>_NOTE_ShowGUI
Func _NOTE_HIDEGUI()
	_NOTE_DELETE_LIST()
	GUICtrlSetState($NOTEGUI2_Text, $GUI_SHOW)
	$NOTE_ListNote[0] = 0
	$NOTE_ChooseList[0] = ''
	_Effect_LoadGUI($NOTEGUI, False, 0, 5)
	GUISetState(@SW_HIDE, $NOTEGUI)
	GUISetState(@SW_HIDE, $NOTEGUI2)
	If BitAND(WinGetState($GUIMAIN), 2) = 2 Then _MAIN_NOTE_SetList()
EndFunc   ;==>_NOTE_HIDEGUI

Func _NOTE_CheckList_Favorite($list, $flag = '')
	; check xem trong list chọn đc đánh dấu hết hay ko?
	; trả về true hoặc false
	Local $temp = _StringBetween($list, '[', ']')
	If Not @error Then
		For $i = 0 To UBound($temp) - 1
			Local $id_note = $NOTE_ListNote_ID[$temp[$i]]
			If String($flag) == '' Then
				If _EDITOR_GETEditSetting($id_note, 3) = '0' Then Return False
			Else
				_EDITOR_EditSetting($id_note, 3, $flag)
				Local $text = IniRead($Database, 'NOTE', $id_note, '')
				IniDelete($Database, 'NOTE', $id_note)
				IniWrite($Database, 'NOTE', $id_note, $text)
			EndIf
		Next
		Return True
	EndIf
	Return False
EndFunc   ;==>_NOTE_CheckList_Favorite
Func _NOTE_CREATE_LIST($title = '')
	_GUIScrollBars_SetScrollInfoPos($NOTEGUI2, $SB_VERT, 0)
	$NOTE_ListNote[0] = 0
	_GUIScrollBars_SetScrollInfoMax($NOTEGUI2, $SB_VERT, 0)
	Local $temp = IniReadSection($Database, "NOTE")
	If @error Then
		GUICtrlSetState($NOTEGUI2_Text, $GUI_SHOW)
		Return 0
	EndIf
	Local $number_note = 0
	
	For $i = 1 To $temp[0][0] ; đếm só lượng
		$id_note = $temp[$i][0]
		If StringInStr(_EDITOR_GETEditSetting($id_note, 1), $title) > 0 Or $title = '' Then $number_note += 1
	Next
	Local $scroll_size = (Int(($number_note - 1) / 2) + 1) * 85 + 20
	If $scroll_size > 390 Then _GUIScrollbars_Generate($NOTEGUI2, 0, $scroll_size)
	; tạo list cho đánh dấu trước
	For $i = $temp[0][0] To 1 Step -1
		$id_note = $temp[$i][0]
		If _EDITOR_GETEditSetting($id_note, 3) == '1' Then
			If StringInStr(_EDITOR_GETEditSetting($id_note, 1), $title) > 0 Or $title = '' Then
				$NOTE_ListNote[0] += 1
				$NOTE_ListNote_ID[$NOTE_ListNote[0]] = $id_note
				$NOTE_ListNote[$NOTE_ListNote[0]] = _NOTE_Create_Note($NOTE_ListNote[0], $id_note)
			EndIf
		EndIf
	Next
	; y chang
	For $i = $temp[0][0] To 1 Step -1
		$id_note = $temp[$i][0]
		If _EDITOR_GETEditSetting($id_note, 3) == '0' Then
			If StringInStr(_EDITOR_GETEditSetting($id_note, 1), $title) > 0 Or $title = '' Then
				$NOTE_ListNote[0] += 1
				$NOTE_ListNote_ID[$NOTE_ListNote[0]] = $id_note
				$NOTE_ListNote[$NOTE_ListNote[0]] = _NOTE_Create_Note($NOTE_ListNote[0], $id_note)
			EndIf
		EndIf
	Next
	
	
	
	If $NOTE_ListNote[0] = 0 Then
		GUICtrlSetState($NOTEGUI2_Text, $GUI_SHOW)
	Else
		GUICtrlSetState($NOTEGUI2_Text, $GUI_HIDE)
	EndIf
	
EndFunc   ;==>_NOTE_CREATE_LIST
Func _NOTE_DELETE_LIST()
	For $i = 1 To $NOTE_ListNote[0]
		Local $control_temp = $NOTE_ListNote[$i]
		For $j = 1 To UBound($control_temp) - 1
			GUICtrlDelete($control_temp[$j])
		Next
		
		$NOTE_ListNote[$i] = -1
	Next
EndFunc   ;==>_NOTE_DELETE_LIST
Func _NOTE_Search_Click()
	If GUICtrlRead($NOTE_Group[1][0]) == '' Then
		GUICtrlSetData($NOTE_Group[2][0], '')
		_MoveSearchIcon(True)
		GUICtrlSetData($NOTE_Group[1][0], '')
		_NOTE_RefeshNote('', False)
		_MoveSearchIcon(False)
	Else
		_NOTE_Search()
	EndIf
EndFunc   ;==>_NOTE_Search_Click
Func _NOTE_Search()
	Local $text = GUICtrlRead($NOTE_Group[2][0])
	If $text <> '' Then
		_MoveSearchIcon(True)
		GUICtrlSetData($NOTE_Group[1][0], '')
		_NOTE_RefeshNote($text)
		_MoveSearchIcon(False)
	EndIf
EndFunc   ;==>_NOTE_Search
Func _NOTE_NewNote()
	_NOTEEDIT_GUICreateControl()
	If BitAND(WinGetState($NOTEGUI), 2) = 2 Then _NOTE_RefeshNote()
	GUICtrlSetData($main_Tab2_menu1_Text[0], Number(GUICtrlRead($main_Tab2_menu1_Text[0])) + 1)
EndFunc   ;==>_NOTE_NewNote
Func _NOTE_TopMenu($id = 1, $flag = False)
	; id menu top:	1 - Bỏ chọn : flag = true: bỏ chọn trực tiếp
	;				2 - Xóa
	;				3 - Đánh dấu
	;				4 - Còn lại
	Switch $id
		Case 3
			
			GUICtrlSetState($NOTE_Group[2][1], $GUI_HIDE)
			GUICtrlSetState($NOTE_Group[5][1], $GUI_HIDE)
			GUICtrlSetState($NOTE_Group[4][1], $GUI_HIDE)
			GUICtrlSetData($NOTE_Group[3][1], 'ĐÓNG')
			If GUICtrlRead($NOTE_Group[2][1]) == 'ĐÁNH DẤU' Then
				If $NOTE_ChooseList[0] <> '' Then
					Local $temp = _StringBetween($NOTE_ChooseList[0], '[', ']')
					GUICtrlSetData($NOTE_Group[1][1], 'Bạn đã đánh dấu ' & UBound($temp) & ' ghi chú. Bạn có thể')
					_NOTE_CheckList_Favorite($NOTE_ChooseList[0], 1)
				EndIf
			Else
				If $NOTE_ChooseList[0] <> '' Then
					Local $temp = _StringBetween($NOTE_ChooseList[0], '[', ']')
					GUICtrlSetData($NOTE_Group[1][1], 'Bạn hủy đánh dấu ' & UBound($temp) & ' ghi chú. Bạn có thể')
					_NOTE_CheckList_Favorite($NOTE_ChooseList[0], 0)
				EndIf
			EndIf
			_NOTE_DeSeclect()
			_NOTE_RefeshNote('', False)
			
		Case 2
			If GUICtrlRead($NOTE_Group[3][1]) == 'XÓA' Then
				If $NOTE_ChooseList[0] <> '' Then
					Local $temp = _StringBetween($NOTE_ChooseList[0], '[', ']')
					If Not @error Then
						$NOTE_ChooseList[1] = ''
						Local $number_del = 0
						For $i = 0 To UBound($temp) - 1
							$note_id = $NOTE_ListNote_ID[$temp[$i]]
							If WinExists("OPHi Student@Note" & $note_id) Then
								_Msgbox(16, 'OPHi Student', 'Không thể xóa ghi chú "' & _EDITOR_GETEditSetting($note_id, 1) & '", vui lòng tắt ghi chú trước khi xóa')
							Else
								$number_del += 1
								$NOTE_ChooseList[1] &= '[' & $NOTE_ListNote_ID[$temp[$i]] & ']'
								DirCreate($Note_Dir & '\Temp')
								FileMove($Note_Dir & '\' & $note_id & '.rtf', $Note_Dir & '\Temp\' & $note_id & '.temp', 1)
								Local $old_setting = _IniRead($Database, 'NOTE', $note_id, '')
								_Iniwrite($Database, "TempNote", $note_id, $old_setting)
								IniDelete($Database, 'NOTE', $note_id)
							EndIf

							;end
						Next
						If $number_del <> 0 Then
							_NOTE_RefeshNote('', False)
							GUICtrlSetState($NOTE_Group[2][1], $GUI_HIDE)
							GUICtrlSetState($NOTE_Group[5][1], $GUI_HIDE)
							GUICtrlSetData($NOTE_Group[1][1], 'Bạn đã xóa ' & $number_del & '/' & UBound($temp) & ' ghi chú. Bạn có thể')
							GUICtrlSetData($NOTE_Group[4][1], 'KHÔI PHỤC')
							GUICtrlSetData($NOTE_Group[3][1], 'ĐÓNG')
							_NOTE_SomeEffect(1, True)
						EndIf
					EndIf
				EndIf
			ElseIf GUICtrlRead($NOTE_Group[3][1]) == 'ĐÓNG' Then
				_NOTE_ChangeGroup()
			EndIf
		Case 4
			Local $temp = _StringBetween($NOTE_ChooseList[0], '[', ']')
			If Not @error Then
				If UBound($temp) = 1 Then
					
					_NOTEEDIT_GUICreateControl($NOTE_ListNote_ID[$temp[0]])
				EndIf

			EndIf
			_NOTE_TopMenu(1, True)
		Case 1
			If GUICtrlRead($NOTE_Group[4][1]) == 'BỎ CHỌN' Or $flag == True Then
				_NOTE_DeSeclect()
				If $flag = True Then
					_NOTE_ChangeGroup()
				Else
					_NOTE_ChangeGroup(0, False, True)
				EndIf
				GUICtrlSetData($NOTE_Group[4][1], "CHỌN NHIỀU")
			ElseIf GUICtrlRead($NOTE_Group[4][1]) == 'CHỌN NHIỀU' Then
				GUICtrlSetData($NOTE_Group[4][1], "BỎ CHỌN")
			ElseIf GUICtrlRead($NOTE_Group[4][1]) == 'KHÔI PHỤC' Then
				If $NOTE_ChooseList[1] <> '' Then
					Local $temp = _StringBetween($NOTE_ChooseList[1], '[', ']')
					If Not @error Then
						Local $number_restore = 0
						For $i = 0 To UBound($temp) - 1
							$note_id = $temp[$i]
							If _IniRead($Database, 'TempNote', $note_id, '') <> '' And FileExists($Note_Dir & '\Temp\' & $note_id & '.temp') And Not FileExists($Note_Dir & '\' & $note_id & '.rtf') Then
								FileMove($Note_Dir & '\Temp\' & $note_id & '.temp', $Note_Dir & '\' & $note_id & '.rtf')
								Local $old_setting = _IniRead($Database, 'TempNote', $note_id, '')
								_Iniwrite($Database, "NOTE", $note_id, $old_setting)
								IniDelete($Database, 'TempNote', $note_id)
								$number_restore += 1
							EndIf
						Next
						_NOTE_RefeshNote('', False)
						GUICtrlSetState($NOTE_Group[2][1], $GUI_HIDE)
						GUICtrlSetState($NOTE_Group[5][1], $GUI_HIDE)
						GUICtrlSetState($NOTE_Group[4][1], $GUI_HIDE)
						GUICtrlSetData($NOTE_Group[1][1], 'Khôi phục thành công ' & $number_restore & '/' & UBound($temp) & ' ghi chú. Bạn có thể')
						GUICtrlSetData($NOTE_Group[3][1], 'ĐÓNG')
					EndIf
				EndIf
			EndIf
	EndSwitch
EndFunc   ;==>_NOTE_TopMenu
Func _NOTE_DeSeclect()
	Local $temp = _StringBetween($NOTE_ChooseList[0], '[', ']')
	If Not @error Then
		For $i = 0 To UBound($temp) - 1
			Local $control_temp = $NOTE_ListNote[$temp[$i]]
			GUICtrlSetBkColor($control_temp[5], -2)
		Next
	EndIf
	$NOTE_ChooseList[0] = ''
EndFunc   ;==>_NOTE_DeSeclect
Func _NOTE_RefeshNote($title = '', $flag = False, $effect = True)
	; flag = true: bật hiệu ứng chuyển trạng thái
	;GUISetBkColor(0xFFFFFF, $NOTEGUI)
	If $effect = True Then _Effect_LoadGUI($NOTEGUI2, False)
	_NOTE_DELETE_LIST()
	If $title == '' And $flag = True Then _NOTE_ChangeGroup() ; set về trạng thái tìm kiếm ban đầu
	$NOTE_ListNote[0] = 0
	$NOTE_ChooseList[0] = ''
	GUISwitch($NOTEGUI2)
	_NOTE_CREATE_LIST($title)
	If $effect = True Then _Effect_LoadGUI($NOTEGUI2, True)
	;GUISetBkColor(0x0072C6, $NOTEGUI)
EndFunc   ;==>_NOTE_RefeshNote
Func _NOTE_SomeEffect($id_group, $style)
	Local $temp_pos[20]
	For $i = 1 To $NOTE_Group[0][$id_group]
		Local $temp = ControlGetPos($NOTEGUI, '', $NOTE_Group[$i][$id_group])
		If $style = True Then
			GUICtrlSetPos($NOTE_Group[$i][$id_group], Default, $temp[1] - 20 * 4)
			$temp_pos[$i] = $temp[1] - 20 * 4
		Else

			$temp_pos[$i] = $temp[1]
		EndIf
		

	Next
	For $i = 1 To 20
		For $j = 1 To $NOTE_Group[0][$id_group]
			If $style = False Then
				$temp_pos[$j] -= 4
			Else
				$temp_pos[$j] += 4
			EndIf
			GUICtrlSetPos($NOTE_Group[$j][$id_group], Default, $temp_pos[$j])
		Next
		Sleep(1)
	Next
EndFunc   ;==>_NOTE_SomeEffect
Func _NOTE_ChangeGroup($id = 0, $flag = False, $flag2 = False)
	; id: id của group
	; $flag : update group (true) hay change group (false)
	; $flag2: ko đổi trá trị của input
	If $id = 1 And $flag == False Then ; trả về deffault
		GUICtrlSetData($NOTE_Group[2][1], "ĐÁNH DẤU")
		GUICtrlSetData($NOTE_Group[4][1], "CHỌN NHIỀU")
		GUICtrlSetData($NOTE_Group[3][1], 'XÓA')
	EndIf
	If $id = 0 And $flag2 == False Then
		GUICtrlSetData($NOTE_Group[1][0], '')
		GUICtrlSetData($NOTE_Group[2][0], '')
	EndIf
	
	If $flag = False Then
		For $i = 0 To 1
			For $j = 1 To $NOTE_Group[0][$i]
				If $i = $id Then
					GUICtrlSetState($NOTE_Group[$j][$i], $GUI_SHOW)
				Else
					GUICtrlSetState($NOTE_Group[$j][$i], $GUI_HIDE)
				EndIf
			Next
		Next
		_NOTE_SomeEffect($id, True)
	Else
		
		Local $iSoluong = _StringBetween($NOTE_ChooseList[0], "[", "]")
		If @error Then
			_NOTE_ChangeGroup()
			Return 0
		EndIf
		If _NOTE_CheckList_Favorite($NOTE_ChooseList[0]) Then
			GUICtrlSetData($NOTE_Group[2][1], "BỎ DẤU")
		Else
			GUICtrlSetData($NOTE_Group[2][1], "ĐÁNH DẤU")
		EndIf
		GUICtrlSetData($NOTE_Group[1][1], 'Bạn đã chọn ' & UBound($iSoluong) & ' ghi chú. Bạn có thể')
		If UBound($iSoluong) > 1 Then
			GUICtrlSetState($NOTE_Group[5][1], $GUI_HIDE)
		Else
			GUICtrlSetState($NOTE_Group[5][1], $GUI_SHOW)
		EndIf
	EndIf
EndFunc   ;==>_NOTE_ChangeGroup
Func _NOTE_Create_Note($id = 0, $id_note = 0, $left = -1, $top = -1) ; tạo list note
	; nếu xảy ra lỗi gì, xin vui lòng liên hệ _NOTE_DELETE_LIST
	; Liên quan _NOTE_RESET
	Local $g_Color = String(_EDITOR_GETEditSetting($id_note, 9)) <> '-1' ? String(_EDITOR_GETEditSetting($id_note, 9)) : 0x008AF0
	Local $sFilePath = $Note_Dir & '\' & $id_note & '.rtf'
	$left = $left = -1 ? Mod($id - 1, 2) * 267 : $left
	$top = $top = -1 ? Int(($id - 1) / 2) * 85 : $top
	Local $control[6]
	$control[0] = $id
	$control[5] = GUICtrlCreateLabel("", 35 + $left, 16 + $top, 252, 78)
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_MenuNoteHover", "_MenuNoteNormal")
	$control[1] = GUICtrlCreateLabel(_EDITOR_GETEditSetting($id_note, 1), 65 + $left, 18 + $top, 220, 29, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, _Change_Color_Editor($g_Color, 30))
	$control[2] = GUICtrlCreateLabel($ICON_NOTESTICK, 37 + $left, 18 + $top, 28, 29, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, _Change_Color_Editor($g_Color, 30))
	If _EDITOR_GETEditSetting($id_note, 3) == '0' Then GUICtrlSetData($control[2], $ICON_NOTE)
	$control[3] = GUICtrlCreateLabel("", 37 + $left, 47 + $top, 15, 45, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, _Change_Color_Editor($g_Color, 10))
	$control[4] = GUICtrlCreateLabel("Tạo vào " & _SlitTime(FileGetTime($sFilePath, $FT_CREATED, 1)) & @CRLF & "Chỉnh sửa lần cuối " & _SlitTime(FileGetTime($sFilePath, $FT_MODIFIED, 1)), 52 + $left, 47 + $top, 233, 45, -1, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, _Change_Color_Editor($g_Color, 10))
	SetOnEventA($control[5], '_NOTE_ChooseNote', $ParamByVal, $control)
	Return $control
EndFunc   ;==>_NOTE_Create_Note
Func _NOTE_RESET($id_note)
	Local $id_control = 0
	If Number($NOTE_ListNote[0]) > 0 Then
		For $i = 1 To $NOTE_ListNote[0]
			If String($id_note) = String($NOTE_ListNote_ID[$i]) Then
				$id_control = $i
				ExitLoop
			EndIf
		Next
		If $id_control <> 0 Then
			Local $control = $NOTE_ListNote[$id_control]
			Local $sFilePath = $Note_Dir & '\' & $id_note & '.rtf'
			Local $g_Color = String(_EDITOR_GETEditSetting($id_note, 9)) <> '-1' ? String(_EDITOR_GETEditSetting($id_note, 9)) : 0x008AF0
			GUICtrlSetData($control[1], _EDITOR_GETEditSetting($id_note, 1))
			If _EDITOR_GETEditSetting($id_note, 3) == '0' Then
				GUICtrlSetData($control[2], '')
			Else
				GUICtrlSetData($control[2], '')
			EndIf
			GUICtrlSetData($control[4], "Tạo vào " & _SlitTime(FileGetTime($sFilePath, $FT_CREATED, 1)) & @CRLF & "Chỉnh sửa lần cuối " & _SlitTime(FileGetTime($sFilePath, $FT_MODIFIED, 1)))
			GUICtrlSetBkColor($control[1], _Change_Color_Editor($g_Color, 30))
			GUICtrlSetBkColor($control[2], _Change_Color_Editor($g_Color, 30))
			GUICtrlSetBkColor($control[3], _Change_Color_Editor($g_Color, 10))
			GUICtrlSetBkColor($control[4], _Change_Color_Editor($g_Color, 10))
			
			GUICtrlSetColor($control[1], _EDITOR_ColorText($g_Color))
			GUICtrlSetColor($control[2], _EDITOR_ColorText($g_Color))
			GUICtrlSetColor($control[3], _EDITOR_ColorText($g_Color))
			GUICtrlSetColor($control[4], _EDITOR_ColorText($g_Color))
			
		EndIf
	EndIf
EndFunc   ;==>_NOTE_RESET
Func _NOTE_ChooseNote(ByRef $control)
	If GUICtrlRead($NOTE_Group[4][1]) == 'CHỌN NHIỀU' Then
		Local $temp = _StringBetween($NOTE_ChooseList[0], '[', ']')
		If Not @error Then
			If UBound($temp) > 1 Then Return 0
			Local $control_temp = $NOTE_ListNote[$temp[0]]
			If UBound($control_temp) < 5 Then Return 0
			If $control_temp[5] == $control[5] Then
				GUICtrlSetBkColor($control[5], -2)
				$NOTE_ChooseList[0] = ''
				_NOTE_ChangeGroup(0, False, True)
				Return 0
			Else
				GUICtrlSetBkColor($control_temp[5], -2)
			EndIf
		EndIf
		
		
		GUICtrlSetBkColor($control[5], 0x000000)
		If $NOTE_ChooseList[0] = '' Then _NOTE_ChangeGroup(1)
		$NOTE_ChooseList[0] = '[' & $control[0] & ']'
		_NOTE_ChangeGroup(1, True)
		
		
		Return 0
	EndIf
	
	If StringInStr($NOTE_ChooseList[0], '[' & $control[0] & ']') > 0 Then
		GUICtrlSetBkColor($control[5], -2)
		$NOTE_ChooseList[0] = StringReplace($NOTE_ChooseList[0], '[' & $control[0] & ']', '')
		If $NOTE_ChooseList[0] = '' Then
			_NOTE_ChangeGroup(0, False, True)
		Else
			_NOTE_ChangeGroup(1, True)
		EndIf
	Else
		GUICtrlSetBkColor($control[5], 0x000000)
		If $NOTE_ChooseList[0] = '' Then _NOTE_ChangeGroup(1)
		$NOTE_ChooseList[0] &= '[' & $control[0] & ']'
		_NOTE_ChangeGroup(1, True)
	EndIf
EndFunc   ;==>_NOTE_ChooseNote
