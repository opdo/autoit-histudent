#cs
	_EDITOR.au3
	Editor là giao diện soạn thảo Note
	Chỉ cần gọi hàm với tham số ID NOTE nếu có, không cần làm gì thêm
	_GUICtrlRichEdit_InsertBitmap tks to UEZ (AutoIT Forum)
#ce
Func _NOTEEDIT_GUICreateControl($id_note = 0) ; lúc NOTEEDIT, lúc EDITOR, lúc _EDITOR, kệ cha nó đi :v
	If String($id_note) = '0' Then
		Do
			$id_note = _Random()
		Until String($id_note) <> '0' And _Iniread($Database, 'NOTE', $id_note, '') = ''
		_IniWrite($Database, 'NOTE', $id_note, '[Ghi chú mới của bạn] [0] [0] [0] [-1] [-1] [-1] [-1] [0x008AF0] [255] [' & @YDAY & ']')
		;  Nhớ sửa $NOTE_SETTING_SLOT nếu sửa cái này
	EndIf
	
	If WinExists("OPHi Student@Note" & $id_note) Then
		WinSetOnTop("OPHi Student@Note" & $id_note, '', 1)
		If _EDITOR_GETEditSetting($id_note, 2) <> '1' Then WinSetOnTop("OPHi Student@Note" & $id_note, '', 0)
		Return 0
	EndIf
	Local $control[20][10]
	$g_Color = String(_EDITOR_GETEditSetting($id_note, 9)) <> '-1' ? String(_EDITOR_GETEditSetting($id_note, 9)) : 0x008AF0
	$control[2][0] = 3 ; số lượng slot 1, cũng chả hiểu sao làm vậy :v ko khoa học
	$control[0][0] = GUICreate("OPHi Student@Note" & $id_note, 570, 521, -1, -1, BitOR($WS_SIZEBOX, $WS_POPUP), $WS_EX_TOOLWINDOW)
	GUISetBkColor($g_Color, $control[0][0])
	$control[4][0] = GUICtrlCreateLabel("", 0, 0, 578, 91, -1, -1)
	GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlSetBkColor(-1, _Change_Color_Editor($g_Color, 40))
	GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
	$control[5][0] = GUICtrlCreateLabel(0, 0, 0, 0, 0) ; lưu dữ liệu chọn tab, lý do tại sao lưu dữ liệu kiểu sh!t này, là tại vì thích :v thế thôi
	GUICtrlSetState(-1, $GUI_HIDE)
	
	$control[16][0] = GUICtrlCreateLabel($id_note, 0, 0, 0, 0) ; lưu dữ liệu id note
	GUICtrlSetState(-1, $GUI_HIDE)
	Local $trans = String(_EDITOR_GETEditSetting($id_note, 10)) <> '-1' ? String(_EDITOR_GETEditSetting($id_note, 10)) : 255
	; các menu trên top
	$control[11][0] = GUICtrlCreateLabel("", 500, 0, 20, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1) ; stick
	GUICtrlSetTip(-1,'Đánh dấu ghi chú')
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_EditorHover", "_EditorNormal")
	GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
	$control[12][0] = GUICtrlCreateLabel("", 546, 0, 20, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1) ; exit
	GUICtrlSetTip(-1,'Tắt ghi chú')
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_EditorHover", "_EditorNormal")
	GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
	$control[13][0] = GUICtrlCreateLabel("", 475, 0, 20, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1) ; on top
	GUICtrlSetTip(-1,'On top')
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_EditorHover", "_EditorNormal")
	GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
	$control[14][0] = GUICtrlCreateLabel("", 523, 0, 20, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1) ; format
	GUICtrlSetTip(-1,'Thiết lập & định dạng')
	GUICtrlSetBkColor(-1, '-2')
	_GUICtrl_OnHoverRegister(-1, "_EditorHover", "_EditorNormal")
	GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
	GUICtrlCreateLabel("", 0, 0, 568, 30, -1, $GUI_WS_EX_PARENTDRAG)
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetResizing(-1, $GUI_DOCKAUTO)

	; RICH EDIT CONTROL ==================================== IMPORTANT ==========================
	$control[6][0] = _GUICtrlRichEdit_Create($control[0][0], '', 0, 140, 570, 358, BitOR($ES_NOHIDESEL, $WS_VSCROLL, $ES_AUTOVSCROLL, $ES_MULTILINE), 0)
	_GUICtrlRichEdit_SetRECT($control[6][0], 20, 20)
	_GUICtrlRichEdit_SetBkColor($control[6][0], _Change_Color_Editor($g_Color, 0, 0))
	$a = FileRead($Note_Dir & '\' & $id_note & '.rtf')
	;_GUICtrlRichEdit_StreamFromFile($control[6][0],$Note_Dir&'\'&$id_note&'.rtf')
	_GUICtrlRichEdit_AppendText($control[6][0], $a)
	If @error Then
		_GUICtrlRichEdit_SetFont($control[6][0], 10, "Tahoma")
		_GUICtrlRichEdit_SetCharColor($control[6][0], _Change_Color_Editor(_EDITOR_ColorText($g_Color), 0, 0))
		If @error Then
			_Msgbox(16, 'Thông báo', 'Có lỗi trong quá trình truy xuất dữ liệu' & @CRLF & 'Hãy thử chạy lại OPHi Student bằng quyền admin' & @CRLF & 'Mã lỗi: ' & @error)
			Exit
		EndIf
	EndIf
	; input note title
	$control[3][0] = GUICtrlCreateInput(_EDITOR_GETEditSetting($id_note, 1), 7, 17, 548, 38, Default, 0)
	GUICtrlSetFont(-1, 20, 400, 0, "Segoe UI")
	GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, _Change_Color_Editor($g_Color, 40))
	
	; ba cái "cờ nhôn" (clone) này phục vụ cho mục đích hiệu ứng button
	$control[7][0] = GUICtrlCreateLabel($ICON_STICK, 500, 0, 20, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
	If String(_EDITOR_GETEditSetting($id_note, 4)) = '1' Then ; apply setting note (if exist)
		GUICtrlSetBkColor(-1, _Change_Color_Editor($g_Color))
	Else
		GUICtrlSetBkColor(-1, "-2")
	EndIf
	$control[8][0] = GUICtrlCreateLabel("", 546, 0, 20, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
	$control[9][0] = GUICtrlCreateLabel($ICON_ONTOP, 475, 0, 20, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
	If String(_EDITOR_GETEditSetting($id_note, 2)) = '1' Then ; apply setting note (if exist)
		GUICtrlSetBkColor(-1, _Change_Color_Editor($g_Color))
		WinSetOnTop($control[0][0], '', 1)
	Else
		GUICtrlSetBkColor(-1, "-2")
	EndIf
	$control[10][0] = GUICtrlCreateLabel($ICON_RURLE, 523, 0, 20, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "FontAwesome")
	GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, _Change_Color_Editor($g_Color, 0))
	$control[1][0] = 16
	; wait, khu vực của mấy control $control[*][1] :3
	; chứa chấp mấy cái control menu tab
	$control[2][1] = GUICtrlCreateLabel("", 0, 70, 107, 23, $SS_CENTER, -1) ; định dạng
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_EditorHover", "_EditorNormal")
	$control[3][1] = GUICtrlCreateLabel("", 107, 70, 107, 23, $SS_CENTER, -1) ; thiết lập
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_EditorHover", "_EditorNormal")
	$control[4][1] = GUICtrlCreateLabel("", 500, 70, 73, 23, $SS_CENTER, -1) ; ẩn
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_EditorHover", "_EditorNormal")
	$control[5][1] = GUICtrlCreateLabel("", 214, 70, 107, 23, $SS_CENTER, -1); đánh dấu
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_EditorHover", "_EditorNormal")
	$control[6][1] = GUICtrlCreateLabel("", 321, 70, 107, 23, $SS_CENTER, -1)
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_EditorHover", "_EditorNormal")
	
	$control[7][1] = GUICtrlCreateLabel("ĐỊNH DẠNG", 0, 70, 107, 23, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, "-2")
	$control[8][1] = GUICtrlCreateLabel("THIẾT LẬP", 107, 70, 107, 23, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, "-2")
	$control[9][1] = GUICtrlCreateLabel("ẨN", 500, 70, 73, 23, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, "-2")
	$control[10][1] = GUICtrlCreateLabel("ĐÁNH DẤU", 214, 70, 107, 23, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, "-2")
	If String(_EDITOR_GETEditSetting($id_note, 4)) = '1' Then GUICtrlSetData($control[10][1], "BỎ DẤU")
	$control[11][1] = GUICtrlCreateLabel("CHIA SẺ", 321, 70, 107, 23, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, "-2")
	$control[0][1] = 11
	For $i = 1 To $control[0][1]
		GUICtrlSetResizing($control[$i][1], $GUI_DOCKAUTO)
	Next
	; menu trong tab 1
	$control[14][2] = GUICtrlCreateCombo("", 13, 103, 138, 23, $CBS_DROPDOWNLIST, -1)
	GUICtrlSetData(-1, "Arial|Tahoma|Times New Roman|Segoe UI|VNI-Times", "Tahoma")
	GUICtrlSetFont(-1, 9, 400, 0, "Segoe UI")
	$control[1][2] = GUICtrlCreateCombo("", 154, 103, 56, 23, $CBS_DROPDOWNLIST, -1)
	GUICtrlSetData(-1, "5|7|9|10|11|12|13|15|17|19|21|23|25|27|31|35|40", "10")
	GUICtrlSetFont(-1, 9, 400, 0, "Segoe UI")
	$control[2][2] = GUICtrlCreateLabel("", 217, 103, 23, 23, BitOR($SS_CENTER, $SS_CENTERIMAGE), $WS_EX_STATICEDGE)
	GUICtrlSetBkColor(-1, "0x000000")
	GUICtrlSetTip(-1,'Màu chữ')
	$control[3][2] = GUICtrlCreateLabel("A", 246, 103, 23, 23, BitOR($SS_CENTER, $SS_CENTERIMAGE), $WS_EX_STATICEDGE)
	GUICtrlSetFont(-1, 12, 700, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x400040")
	GUICtrlSetTip(-1,'Màu nền chữ')
	$control[4][2] = GUICtrlCreateLabel("I", 311, 103, 23, 23, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1) ; in nghiêng
	GUICtrlSetFont(-1, 12, 600, 2, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetTip(-1,'In nghiêng')
	_GUICtrl_OnHoverRegister(-1, "_Editor2Hover", "_EditorNormal")
	$control[5][2] = GUICtrlCreateLabel("B", 288, 103, 23, 23, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1) ; im đậm
	GUICtrlSetFont(-1, 12, 700, 0, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetTip(-1,'In đậm')
	_GUICtrl_OnHoverRegister(-1, "_Editor2Hover", "_EditorNormal")
	$control[6][2] = GUICtrlCreateLabel("U", 334, 103, 23, 23, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1) ; gạch chân
	GUICtrlSetFont(-1, 12, 600, 4, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetTip(-1,'Gạch chân')
	_GUICtrl_OnHoverRegister(-1, "_Editor2Hover", "_EditorNormal")
	$control[7][2] = GUICtrlCreateLabel("", 420, 103, 23, 23, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 600, 0, "FontAwesome")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetTip(-1,'Căn phải')
	_GUICtrl_OnHoverRegister(-1, "_Editor2Hover", "_EditorNormal")
	$control[8][2] = GUICtrlCreateLabel("", 397, 103, 23, 23, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 600, 0, "FontAwesome")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetTip(-1,'Căn giữa')
	_GUICtrl_OnHoverRegister(-1, "_Editor2Hover", "_EditorNormal")
	$control[9][2] = GUICtrlCreateLabel("", 374, 103, 23, 23, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 600, 0, "FontAwesome")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetTip(-1,'Căn trái')
	_GUICtrl_OnHoverRegister(-1, "_Editor2Hover", "_EditorNormal")
	$control[10][2] = GUICtrlCreateLabel("CHÈN HÌNH", 458, 103, 91, 23, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_Editor2Hover", "_EditorNormal")
	$control[11][2] = GUICtrlCreateLabel("", 279, 103, 1, 23, $SS_WHITERECT, -1)
	GUICtrlSetBkColor(-1, "-2")
	$control[12][2] = GUICtrlCreateLabel("", 448, 103, 1, 23, $SS_WHITERECT, -1)
	GUICtrlSetBkColor(-1, "-2")
	$control[13][2] = GUICtrlCreateLabel("", 367, 103, 1, 23, $SS_WHITERECT, -1)
	GUICtrlSetBkColor(-1, "-2")
	$control[0][2] = 14
	; menu trong tab 2
	$control[1][3] = GUICtrlCreateLabel("TRONG SUỐT", 271, 103, 101, 23, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_Editor2Hover", "_EditorNormal")
	$control[2][3] = GUICtrlCreateLabel("STICK NOTE", 152, 103, 93, 23, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_Editor2Hover", "_EditorNormal")
	$control[3][3] = GUICtrlCreateLabel("NOTE COLOR", 14, 103, 119, 23, BitOR($SS_CENTER, $SS_CENTERIMAGE), $WS_EX_STATICEDGE)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, _EDITOR_ColorText($g_Color))
	GUICtrlSetBkColor(-1, $g_Color)
	GUICtrlSetTip(-1,'Màu ghi chú')
	$control[4][3] = GUICtrlCreateLabel("", 256, 103, 1, 23, $SS_WHITERECT, -1)
	GUICtrlSetBkColor(-1, "-2")
	$control[6][3] = GUICtrlCreateLabel("", 145, 103, 1, 23, $SS_WHITERECT, -1)
	GUICtrlSetBkColor(-1, "-2")
	Local $pos_x = 157 - ($trans / 250) * 157
	$pos_x = $pos_x < 0 ? 0 : $pos_x
	$pos_x = $pos_x > 157 ? 157 : $pos_x

	$control[5][3] = GUICtrlCreateLabel("", 390 + $pos_x, 106, 10, 17)
	GUICtrlSetBkColor(-1, _EDITOR_ColorText($g_Color))

	$control[7][3] = GUICtrlCreateLabel("", 390, 114, 157, 2)
	GUICtrlSetState(-1, BitOR($GUI_SHOW, $GUI_DISABLE))
	GUICtrlSetBkColor(-1, _EDITOR_ColorText($g_Color))
	$control[0][3] = 7
	
	For $id = 2 To $control[2][0]
		For $i = 1 To $control[0][$id]
			GUICtrlSetResizing($control[$i][$id], $GUI_DOCKAUTO)
			GUICtrlSetState($control[$i][$id], $GUI_HIDE)
		Next
	Next

	; set event click
	; thanh trượt nè
	GUISetOnEvent($GUI_EVENT_PRIMARYUP, 'OnPrimaryUp_Func')
	_GUICtrl_OnHoverRegister($control[5][3], '_Nothing', '_Nothing', '_Nothing', 'OnPrimaryUp_Func_2')
	SetOnEventA($control[5][3], 'OnPrimaryDown_Func', $ParamByVal, $control)
	; click vào các menu tab
	SetOnEventA($control[2][1], '_EDITOR_MenuClick', $ParamByVal, $control, $ParamByVal, 2)
	SetOnEventA($control[3][1], '_EDITOR_MenuClick', $ParamByVal, $control, $ParamByVal, 3)
	SetOnEventA($control[5][1], '_EDITOR_MenuTop', $ParamByVal, $control, $ParamByVal, 3)
	SetOnEventA($control[4][1], '_EDITOR_HideAll', $ParamByVal, $control)
	SetOnEventA($control[14][2], '_EDITOR_SetFont', $ParamByVal, $control)
	SetOnEventA($control[1][2], '_EDITOR_SetFont', $ParamByVal, $control, $ParamByVal, True)
	SetOnEventA($control[4][2], '_EDITOR_SetAttributes', $ParamByVal, $control, $ParamByVal, 'it') ; in nghiêng
	SetOnEventA($control[5][2], '_EDITOR_SetAttributes', $ParamByVal, $control, $ParamByVal, 'bo')
	SetOnEventA($control[6][2], '_EDITOR_SetAttributes', $ParamByVal, $control, $ParamByVal, 'un')
	SetOnEventA($control[7][2], '_EDITOR_SetAlignment', $ParamByVal, $control, $ParamByVal, 'r')
	SetOnEventA($control[8][2], '_EDITOR_SetAlignment', $ParamByVal, $control, $ParamByVal, 'c')
	SetOnEventA($control[9][2], '_EDITOR_SetAlignment', $ParamByVal, $control, $ParamByVal, 'l')
	SetOnEventA($control[2][2], '_EDITOR_SetColor', $ParamByVal, $control)
	SetOnEventA($control[3][2], '_EDITOR_SetColor', $ParamByVal, $control, $ParamByVal, True)
	SetOnEventA($control[10][2], '_EDITOR_InsertPic', $ParamByVal, $control)
	SetOnEventA($control[3][3], '_EDITOR_SetColor_Skin', $ParamByVal, $control)
	; các menu trên top
	SetOnEventA($control[12][0], '_EDITOR_MenuTop', $ParamByVal, $control, $ParamByVal, 0)
	SetOnEventA($control[14][0], '_EDITOR_MenuTop', $ParamByVal, $control, $ParamByVal, 1)
	SetOnEventA($control[13][0], '_EDITOR_MenuTop', $ParamByVal, $control, $ParamByVal, 2)
	SetOnEventA($control[11][0], '_EDITOR_MenuTop', $ParamByVal, $control, $ParamByVal, 3)

	; tự resize
	SetOnEventA($GUI_EVENT_RESIZED, 'EDITOR_GUI_Resize', $ParamByVal, $control[0][0], $ParamByVal, $control, $ParamByVal, True)
	SetOnEventA($GUI_EVENT_PRIMARYDOWN, '_EDITOR_AutoSave', $ParamByVal, $control[0][0], $ParamByVal, $control)

	; set hot key
	if _IniRead($Database, "Pro5", "Note2",1) =1 then 
	Dim $AccelKeys[6][2] = [['^r', $control[7][2]], ['^j', $control[8][2]], ['^l', $control[9][2]], ['^b', $control[5][2]], ['^i', $control[4][2]], ['^u', $control[6][2]]]
	GUISetAccelerators($AccelKeys, $control[0][0])
	EndIf
	EDITOR_GUI_Resize(0, $control)

	WinSetTrans($control[0][0], '', 0)
	GUISetState(@SW_SHOW, $control[0][0])
	

	If String(_EDITOR_GETEditSetting($id_note, 5)) <> '-1' Then
		_WinAPI_MoveWindow($control[0][0], _EDITOR_GETEditSetting($id_note, 7), _EDITOR_GETEditSetting($id_note, 8), _EDITOR_GETEditSetting($id_note, 5), _EDITOR_GETEditSetting($id_note, 6))
		EDITOR_GUI_Resize(0, $control, True)
	EndIf
	WinSetTrans($control[0][0], '', $trans)
	
	Return $control
EndFunc   ;==>_NOTEEDIT_GUICreateControl
#Region Hàm chức năng của EDITOR Note
; auto save ==============================================================================================
Func _EDITOR_AutoSave($nothing, ByRef $control) ; tại sao có $nothing????? kệ nó đê :v
	Local $hGUI = WinGetPos($nothing)
	If @error Then Return 0
	$id_note = GUICtrlRead($control[16][0])
	Local $name_note = GUICtrlRead($control[3][0])
	; loại bỏ các ký tự |, [, ] để đảm bảo tính đúng đắn cho phần mềm
	$name_note = StringReplace($name_note, '|', '')
	$name_note = StringReplace($name_note, '[', '')
	$name_note = StringReplace($name_note, ']', '')
	; lấy thông tin windows

	_EDITOR_EditSetting($id_note, '1|5|6|7|8', $name_note & '|' & $hGUI[2] & '|' & $hGUI[3] & '|' & $hGUI[0] & '|' & $hGUI[1])
	Local $text = _GUICtrlRichEdit_StreamToVar($control[6][0], True, True, 0, 1)
	FileDelete($Note_Dir & '\' & $id_note & '.rtf')
	FileWrite($Note_Dir & '\' & $id_note & '.rtf', StringTrimRight($text, 5))
EndFunc   ;==>_EDITOR_AutoSave
; change setting file save note ==========================================================================
Func _EDITOR_EditSetting($id_note, $setting_id, $value)
	; [1 name] [2 on top] [3 đánh dấu] [4 stick] [5 gui_w] [6 gui_h] [7 gui_x] [8 gui_y]  [9 color]  [10 trans] ;
	Local $temp = _IniRead($Database, 'NOTE', $id_note, '')
	If $temp = '' Then
		;_Msgbox(16, 'Thông báo', 'Lỗi đọc dữ liệu. Hãy thử chạy lại OPHi Student bằng quyền admin1')
		Return 0
	EndIf
	Local $temp2 = _StringBetween($temp, '[', ']')
	If Not @error Then
		If UBound($temp2) = $NOTE_SETTING_SLOT Then
			Local $temp3 = StringSplit($setting_id, '|')
			Local $temp4 = StringSplit($value, '|')
			If $temp3[0] <> $temp4[0] Then
				_Msgbox(16, 'Thông báo', 'Lỗi phân tích cấu trúc dữ liệu. Hãy thử chạy lại OPHi Student bằng quyền admin')
			Else
				; làm việc
				For $i = 1 To $temp3[0]
					$temp2[Number($temp3[$i]) - 1] = $temp4[$i]
				Next
				Local $text = ''
				For $i = 0 To UBound($temp2) - 1
					$text = $text & '[' & $temp2[$i] & ']'
				Next
				_IniWrite($Database, 'NOTE', $id_note, $text)
			EndIf
		Else
			_Msgbox(16, 'Thông báo', 'Lỗi phân tích cấu trúc dữ liệu. Hãy thử chạy lại OPHi Student bằng quyền admin')
		EndIf
	Else
		_Msgbox(16, 'Thông báo', 'Lỗi phân tích cấu trúc dữ liệu. Hãy thử chạy lại OPHi Student bằng quyền admin')
	EndIf
EndFunc   ;==>_EDITOR_EditSetting
; Get setting editor
Func _EDITOR_GETEditSetting($id_note, $setting_id)
	Local $temp = _IniRead($Database, 'NOTE', $id_note, '')
	If $temp = '' Then
		_Msgbox(16, 'Thông báo', 'Lỗi đọc dữ liệu. Hãy thử chạy lại OPHi Student bằng quyền admin')
		Return '-1'
	EndIf
	Local $temp2 = _StringBetween($temp, '[', ']')
	If Not @error Then
		If UBound($temp2) <> $NOTE_SETTING_SLOT Then ; đổi chỗ này nếu đổi slot
			_EDITOR_AddLostSetting($temp2, $id_note)
			If $setting_id <= UBound($temp2) Then
				Return String($temp2[$setting_id - 1])
			Else
				Return '-1'
			EndIf

		Else
			Return String($temp2[$setting_id - 1])
		EndIf
	Else
		_Msgbox(16, 'Thông báo', 'Lỗi phân tích cấu trúc dữ liệu. Hãy thử chạy lại OPHi Student bằng quyền admin')
		Return '-1'
	EndIf
EndFunc   ;==>_EDITOR_GETEditSetting
; add lost setting
Func _EDITOR_AddLostSetting(ByRef $setting, $id_note)
	Local $my_setting[$NOTE_SETTING_SLOT]
	If UBound($setting) = $NOTE_SETTING_SLOT Then Return 0
	For $i = 0 To $NOTE_SETTING_SLOT - 1
		If $i <= UBound($setting) - 1 Then
			$my_setting[$i] = $setting[$i]
		Else
			$my_setting[$i] = '-1'
		EndIf
	Next
	Local $text = ''
	For $i = 0 To $NOTE_SETTING_SLOT - 1
		$text = $text & '[' & $my_setting[$i] & ']'
	Next
	_IniWrite($Database, 'NOTE', $id_note, $text)
EndFunc   ;==>_EDITOR_AddLostSetting
; move control to transparent GUI editor===================================================================
Func _Move_Transparent_Control()
	; muốn dùng cái $iLasthGUI thì vui lòng sang myControl, khai báo thêm slot ở OnPrimaryDown_Func :v
	Local $temp = ControlGetPos($iLasthGUI[0][0], '', $iLastCtrlID)
	Local $temp2 = ControlGetPos($iLasthGUI[0][0], '', $iLasthGUI[7][3])
	If @error Then Return 0
	Local $aMousePos = MouseGetPos()
	Local $move = $aMousePos[0] - $iLastiMouse[0]
	If $move + $temp[0] <= $temp2[0] Then
		GUICtrlSetPos($iLastCtrlID, $temp2[0])
	ElseIf $move + $temp[0] >= $temp2[0] + $temp2[2] Then
		
		GUICtrlSetPos($iLastCtrlID, $temp2[0] + $temp2[2])
	Else
		GUICtrlSetPos($iLastCtrlID, $move + $temp[0])
	EndIf
	
	Local $newpos = ControlGetPos($iLasthGUI[0][0], '', $iLastCtrlID)
	Local $iValue = $newpos[0] - $temp2[0] > 10 ? $newpos[0] - $temp2[0] : 0
	Local $transparent = 255 - ($iValue / $temp2[2]) * 200
	_EDITOR_EditSetting(GUICtrlRead($iLasthGUI[16][0]), 10, $transparent) ; $iLasthGUI khai báo ở OnPrimaryDown_Func
	WinSetTrans($iLasthGUI[0][0], '', $transparent)
	$iLastiMouse = MouseGetPos()
EndFunc   ;==>_Move_Transparent_Control
; editor ==============================================================================================
Func _EDITOR_SetFont(ByRef $control, $size = False)
	
	If $size Then
		_GUICtrlRichEdit_SetFont($control[6][0], GUICtrlRead($control[1][2]))
	Else
		_GUICtrlRichEdit_SetFont($control[6][0], Default, GUICtrlRead($control[14][2]))
	EndIf
EndFunc   ;==>_EDITOR_SetFont
; resize func ==============================================================================================
Func EDITOR_GUI_Resize($nothing, ByRef $control, $all = False)
	Local $temp = WinGetPos($control[0][0])
	If @error Then Return 0
	Local $w = $temp[2] - 15
	Local $h = $temp[3] - 17
	Local $temp2
	If String(GUICtrlRead($control[5][0])) == '-1' Or String(GUICtrlRead($control[5][0])) == '-2' Then
		Local $temp_pos = ControlGetPos($control[0][0], '', $control[3][0])
		GUICtrlSetPos($control[4][0], Default, 0, Default, $temp_pos[1] + $temp_pos[3])
		
	ElseIf String(GUICtrlRead($control[5][0])) <> '0' Then
		$temp2 = ControlGetPos($control[0][0], '', $control[14][2])
	EndIf
	If Not IsArray($temp2) Then $temp2 = ControlGetPos($control[0][0], '', $control[4][0])
	
	_WinAPI_MoveWindow($control[6][0], 0, $temp2[1] + $temp2[3] + 1, $w, $h - ($temp2[1] + $temp2[3]))
	_WinAPI_RedrawWindow($control[6][0])
	
	If $all Then
		Local $control_pos = ControlGetPos($control[0][0], '', $control[3][0])
		For $j = 30 To 1 Step -1
			Local $size = _StringSize('Test', $j, 400, 0, "Segoe UI", $control_pos[2])
			If Not @error And $size[3] <= $control_pos[3] Then
				If $j < 15 Then
					GUICtrlSetFont($control[3][0], $j, 700, 0, "Segoe UI")
				Else
					GUICtrlSetFont($control[3][0], $j, 400, 0, "Segoe UI")
				EndIf
				
				ExitLoop
			EndIf
		Next
		
		For $i = 7 To 10
			Local $control_pos = ControlGetPos($control[0][0], '', $control[$i][0])
			Local $text = GUICtrlRead($control[$i][0])
			For $j = 15 To 1 Step -0.5
				Local $size = _StringSize('A', $j, 400, 0, "FontAwesome", $control_pos[2])
				If Not @error And $size[3] <= $control_pos[3] Then
					GUICtrlSetFont($control[$i][0], $j, 400, 0, "FontAwesome")
					ExitLoop
				EndIf
			Next
		Next

		
		If $w < 350 Or $h < 350 Then ; giới hạn mở các công cụ định dạng
			_EDITOR_HideAll($control)
			GUICtrlSetData($control[5][0], '-2')
			Return 0
		EndIf
		If String(GUICtrlRead($control[5][0])) = '-2' Then GUICtrlSetData($control[5][0], '-1') ; tự tắt giới hạn
		
		For $id = 1 To $control[2][0]
			Local $size_id_1
			For $i = 1 To $control[0][$id]
				Local $text = GUICtrlRead($control[$i][$id])
				If $text <> '' Then
					Local $control_pos = ControlGetPos($control[0][0], '', $control[$i][$id])
					If @error Then ExitLoop
					For $j = 17 To 5 Step -0.5
						If $id = 2 And $i = 4 Then ; các trường hợp resize như B, I, U
							Local $size = _StringSize($text, $j, 600, 2, "Segoe UI Semibold", $control_pos[2])
						ElseIf $id = 2 And $i = 6 Then
							Local $size = _StringSize($text, $j, 600, 4, "Segoe UI Semibold", $control_pos[2])
						ElseIf $id = 2 And $i = 5 Then
							Local $size = _StringSize($text, $j, 700, 0, "Segoe UI", $control_pos[2])
						Else ; các trường hợp còn lại
							Local $size = _StringSize($text, $j, 400, 0, "Segoe UI", $control_pos[2])
						EndIf
						
						If Not @error And $size[3] <= $control_pos[3] Then
							If $id = 2 And $i = 3 Then
								GUICtrlSetFont($control[14][2], $j - 1.5, 400, 0, "Segoe UI")
								GUICtrlSetFont($control[1][2], $j - 1.5, 400, 0, "Segoe UI")
							EndIf
							If $id = 2 And $i = 4 Then
								GUICtrlSetFont($control[$i][$id], $j, 600, 2, "Segoe UI Semibold")
							ElseIf $id = 2 And $i = 6 Then
								GUICtrlSetFont($control[$i][$id], $j, 600, 4, "Segoe UI Semibold")
							ElseIf $id = 2 And $i = 5 Then
								GUICtrlSetFont($control[$i][$id], $j, 700, 0, "Segoe UI")
							ElseIf $id = 2 And $i <= 9 Then
								GUICtrlSetFont($control[$i][$id], $j, 400, 0, "FontAwesome")
							ElseIf $id = 1 And $i <> 7 Then
								GUICtrlSetFont($control[$i][$id], $size_id_1, 400, 0, "Segoe UI")
							Else
								GUICtrlSetFont($control[$i][$id], $j, 400, 0, "Segoe UI")
							EndIf
							If $id = 1 And $i = 7 Then $size_id_1 = $j
							ExitLoop
						EndIf
					Next
				EndIf
			Next
		Next
		
	EndIf
EndFunc   ;==>EDITOR_GUI_Resize
; func Hide các control menu tab
Func _EDITOR_HideAll(ByRef $control, $hide = True)
	If $hide Then
		For $id = 1 To $control[2][0]
			For $i = 1 To $control[0][$id]
				GUICtrlSetState($control[$i][$id], $GUI_HIDE)
			Next
		Next

		GUICtrlSetData($control[5][0], '-1')
		EDITOR_GUI_Resize('', $control)
		GUICtrlSetBkColor($control[14][0], '-2')
		GUICtrlSetBkColor($control[10][0], '-2')
	Else
		For $i = 1 To $control[0][1]
			GUICtrlSetState($control[$i][1], $GUI_SHOW)
			GUICtrlSetBkColor($control[$i][1], '-2')
		Next
		Local $temp = ControlGetPos($control[0][0], '', $control[2][1])
		GUICtrlSetPos($control[4][0], Default, 0, Default, $temp[1] + $temp[3])
		GUICtrlSetData($control[5][0], '0')
		EDITOR_GUI_Resize('', $control)
		GUICtrlSetBkColor($control[10][0], _EDITOR_GETEditSetting(GUICtrlRead($control[16][0]), 9))
	EndIf
EndFunc   ;==>_EDITOR_HideAll
; func xử lý event click menu tab
Func _EDITOR_MenuClick(ByRef $control, $id = 1)
	OnPrimaryUp_Func_2('')
	If $id >= 2 And $id <= 3 Then
		GUICtrlSetBkColor($control[$id + 5][1], GUICtrlGetBkColor($control[$id][1]))
		
		Local $flag = $GUI_SHOW
		Local $number = Number(GUICtrlRead($control[5][0]))
		
		If $number == $id Then
			
			GUICtrlSetBkColor($control[$number][1], GUICtrlGetBkColor($control[$id + 5][1]))
			GUICtrlSetBkColor($control[$number + 5][1], -2)
			$flag = $GUI_HIDE
			GUICtrlSetData($control[5][0], 0)
		Else
			GUICtrlSetBkColor($control[$number + 5][1], -2)
			If $number <> 0 Then
				For $i = 1 To $control[0][$number]
					GUICtrlSetState($control[$i][$number], $GUI_HIDE)
				Next
			EndIf
			GUICtrlSetData($control[5][0], $id)
		EndIf
		For $i = 1 To $control[0][$id]
			GUICtrlSetState($control[$i][$id], $flag)
		Next
		;GUICtrlSetBkColor($control[$id][1], "-2")
		EDITOR_GUI_Resize('', $control)
	EndIf
EndFunc   ;==>_EDITOR_MenuClick
; các func tương tác với text
Func _EDITOR_SetAttributes(ByRef $control, $attributes = 'bo')
	Local $temp = _GUICtrlRichEdit_GetCharAttributes($control[6][0])
	Local $flag
	If StringInStr($temp, $attributes & "+") > 0 Then
		$flag = '-'
	Else
		$flag = '+'
	EndIf
	_GUICtrlRichEdit_SetCharAttributes($control[6][0], $flag & $attributes)
EndFunc   ;==>_EDITOR_SetAttributes
Func _EDITOR_SetAlignment(ByRef $control, $ali = 'l')
	Local $temp = _GUICtrlRichEdit_GetParaAlignment($control[6][0])
	Local $flag
	If StringInStr($temp, $ali & ";") > 0 Then
		$flag = 'l'
	Else
		$flag = $ali
	EndIf
	_GUICtrlRichEdit_SetParaAlignment($control[6][0], $flag)
EndFunc   ;==>_EDITOR_SetAlignment
Func _EDITOR_SetColor(ByRef $control, $bk = False)
	$color = _EDITOR_ChooseColor($control[0][0])
	If @error Then Return 0
	If $bk Then
		_GUICtrlRichEdit_SetCharBkColor($control[6][0], $color)
	Else
		_GUICtrlRichEdit_SetCharColor($control[6][0], $color)
	EndIf
	
EndFunc   ;==>_EDITOR_SetColor
Func _EDITOR_SetColor_Skin(ByRef $control)
	$color = _EDITOR_ChooseColor($control[0][0], 1)
	If @error Then Return 0
	_EDITOR_EditSetting(GUICtrlRead($control[16][0]), 9, $color)
	GUISetBkColor($color, $control[0][0])
	GUICtrlSetBkColor($control[4][0], _Change_Color_Editor($color, 40))
	GUICtrlSetColor($control[3][0], _EDITOR_ColorText($color))
	GUICtrlSetbkColor($control[5][3], _EDITOR_ColorText($color))
	GUICtrlSetbkColor($control[7][3], _EDITOR_ColorText($color))
	GUICtrlSetBkColor($control[3][0], _Change_Color_Editor($color, 40))
	_GUICtrlRichEdit_SetBkColor($control[6][0], _Change_Color_Editor($color, 0, 0))
	GUICtrlSetBkColor($control[3][3], $color)
	GUICtrlSetBkColor($control[8][1], $color)
	For $i = 7 To 10
		GUICtrlSetColor($control[$i][0], _EDITOR_ColorText($color))
	Next
	For $id = 1 To $control[2][0]
		For $i = 1 To $control[0][$id]
			If GUICtrlRead($control[$i][$id]) <> '' Then
				GUICtrlSetColor($control[$i][$id], _EDITOR_ColorText($color))
			EndIf
		Next
	Next
	If String(GUICtrlRead($control[5][0])) <> '0' Then GUICtrlSetBkColor($control[10][0], _Change_Color_Editor($color, 0))
	If String(_EDITOR_GETEditSetting(GUICtrlRead($control[16][0]), 2)) = '1' Then GUICtrlSetBkColor($control[9][0], _Change_Color_Editor($color, 0))
	If String(_EDITOR_GETEditSetting(GUICtrlRead($control[16][0]), 4)) = '1' Then GUICtrlSetBkColor($control[7][0], _Change_Color_Editor($color, 0))
EndFunc   ;==>_EDITOR_SetColor_Skin
Func _EDITOR_InsertPic(ByRef $control)
	Local $sBmpFilspc = FileOpenDialog("Chọn tệp", "", "Hình ảnh (*.bmp;*.jpg;*.png)")
	If @error Then Return 0
	_GUICtrlRichEdit_InsertBitmap($control[6][0], $sBmpFilspc)
EndFunc   ;==>_EDITOR_InsertPic
Func _EDITOR_ChooseColor($hGUI, $type_return = 0)
	Local $color = _ChooseColor(2, 0x008AF0, 2, $hGUI)
	If @error Then Return SetError(1)
	If $type_return = 1 Then Return $color
	Local $aColor[3] = [_ColorGetRed($color), _ColorGetGreen($color), _ColorGetBlue($color)]
	Local $nColor = _ColorSetCOLORREF($aColor)
	Return $nColor
EndFunc   ;==>_EDITOR_ChooseColor
Func _EDITOR_MenuTop(ByRef $control, $menu = 0, $flag = 0)
	; $flag = 1: click đánh dấu từ menu tab đánh dấu, vì vậy set bk color bằng cách dựa vào bk color menu tab
	If $menu = 0 Then
		Local $id_note = GUICtrlRead($control[16][0])
		_EDITOR_AutoSave($control[0][0], $control)
		_GUICtrlRichEdit_Destroy($control[6][0])
		GUIDelete($control[0][0])
		If BitAND(WinGetState($NOTEGUI), 2) = 2 Then _NOTE_RESET($id_note)
		_MAIN_NOTE_RESET($id_note)
	ElseIf $menu = 1 Then
		If String(GUICtrlRead($control[5][0])) = '0' Then
			_EDITOR_HideAll($control)
			GUICtrlSetBkColor($control[14][0], '-2')
			GUICtrlSetBkColor($control[10][0], '-2')
		ElseIf String(GUICtrlRead($control[5][0])) <> '-2' Then
			_EDITOR_HideAll($control, False)
		Else
			_Msgbox(16, "Thông báo", "Kích thước ghi chú quá nhỏ, không thể mở công cụ định dạng")
		EndIf
	ElseIf $menu = 2 Then
		If String(_EDITOR_GETEditSetting(GUICtrlRead($control[16][0]), 2)) = '1' Then
			WinSetOnTop($control[0][0], '', 0)
			_EDITOR_EditSetting(GUICtrlRead($control[16][0]), 2, 0)
			GUICtrlSetBkColor($control[9][0], '-2')
			GUICtrlSetBkColor($control[13][0], '-2')
		Else
			WinSetOnTop($control[0][0], '', 1)
			_EDITOR_EditSetting(GUICtrlRead($control[16][0]), 2, 1)
			GUICtrlSetBkColor($control[9][0], _EDITOR_GETEditSetting(GUICtrlRead($control[16][0]), 9))
		EndIf
	ElseIf $menu = 3 Then ; stick
		If String(_EDITOR_GETEditSetting(GUICtrlRead($control[16][0]), 4)) = '1' Then
			_EDITOR_EditSetting(GUICtrlRead($control[16][0]), 4, 0)
			GUICtrlSetBkColor($control[7][0], '-2')
			GUICtrlSetBkColor($control[11][0], '-2')
			GUICtrlSetData($control[10][1], 'ĐÁNH DẤU')
		Else
			_EDITOR_EditSetting(GUICtrlRead($control[16][0]), 4, 1)
			GUICtrlSetData($control[10][1], 'BỎ DẤU')
			GUICtrlSetBkColor($control[7][0], _EDITOR_GETEditSetting(GUICtrlRead($control[16][0]), 9))
		EndIf
	EndIf
EndFunc   ;==>_EDITOR_MenuTop
#EndRegion Hàm chức năng của EDITOR Note
#Region _GUICtrlRichEdit_InsertBitmap tks to UEZ (AutoIT Forum)
Func _GUICtrlRichEdit_InsertBitmap($hWnd, $sFile, $sFormatFunctions = "\", $sBitmapFunctions = "\") ;coded by UEZ build 2016-02-16
	If Not FileExists($sFile) Then Return SetError(0, 0, 1)
	If Not _WinAPI_IsClassName($hWnd, $__g_sRTFClassName) Then Return SetError(0, 0, 2)
	_GDIPlus_Startup()
	Local $hImage = _GDIPlus_ImageLoadFromFile($sFile)
	If @error Then
		_GDIPlus_Shutdown()
		Return SetError(0, 0, 3)
	EndIf
	Local Const $aDim = _GDIPlus_ImageGetDimension($hImage)
	Local Const $hBitmap = _GDIPlus_BitmapCreateFromScan0($aDim[0], $aDim[1]), $hGfx = _GDIPlus_ImageGetGraphicsContext($hBitmap)
	_GDIPlus_GraphicsClear($hGfx, 0xFFFFFFFF)
	_GDIPlus_GraphicsDrawImageRect($hGfx, $hImage, 0, 0, $aDim[0], $aDim[1])
	_GDIPlus_GraphicsDispose($hGfx)
	Local $binStream = _GDIPlus_StreamImage2BinaryString($hBitmap, "BMP")
	If @error Then
		_GDIPlus_ImageDispose($hImage)
		_GDIPlus_ImageDispose($hBitmap)
		_GDIPlus_Shutdown()
		Return SetError(0, 0, 4)
	EndIf
	Local $binBmp = StringMid($binStream, 31)
	Local Const $binRtf = "{\rtf1\viewkind4" & $sFormatFunctions & " {\pict{\*\picprop}" & $sBitmapFunctions & "dibitmap " & $binBmp & "}\par}" ;check out http://www.biblioscape.com/rtf15_spec.htm
	_GUICtrlRichEdit_AppendText($hWnd, $binRtf)
	$binStream = 0
	$binBmp = 0
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_ImageDispose($hBitmap)
	_GDIPlus_Shutdown()
	Return 1
EndFunc   ;==>_GUICtrlRichEdit_InsertBitmap

Func _GDIPlus_StreamImage2BinaryString($hBitmap, $sFormat = "JPG", $iQuality = 100, $bSave = False, $sFileName = @ScriptDir & "\Converted.jpg") ;coded by UEZ 2013 build 2014-01-25 (based on the code by Andreik)
	Local $sImgCLSID, $tGUID, $tParams, $tData
	Switch $sFormat
		Case "JPG"
			$sImgCLSID = _GDIPlus_EncodersGetCLSID($sFormat)
			$tGUID = _WinAPI_GUIDFromString($sImgCLSID)
			$tData = DllStructCreate("int Quality")
			DllStructSetData($tData, "Quality", $iQuality) ;quality 0-100
			Local $pData = DllStructGetPtr($tData)
			$tParams = _GDIPlus_ParamInit(1)
			_GDIPlus_ParamAdd($tParams, $GDIP_EPGQUALITY, 1, $GDIP_EPTLONG, $pData)
		Case "PNG", "BMP", "GIF", "TIF"
			$sImgCLSID = _GDIPlus_EncodersGetCLSID($sFormat)
			$tGUID = _WinAPI_GUIDFromString($sImgCLSID)
		Case Else
			Return SetError(1, 0, 0)
	EndSwitch
	Local $hStream = _WinAPI_CreateStreamOnHGlobal() ;http://msdn.microsoft.com/en-us/library/ms864401.aspx
	If @error Then Return SetError(2, 0, 0)
	_GDIPlus_ImageSaveToStream($hBitmap, $hStream, DllStructGetPtr($tGUID), DllStructGetPtr($tParams))
	If @error Then Return SetError(3, 0, 0)

	Local $hMemory = _WinAPI_GetHGlobalFromStream($hStream) ;http://msdn.microsoft.com/en-us/library/aa911736.aspx
	If @error Then Return SetError(4, 0, 0)
	Local $iMemSize = _MemGlobalSize($hMemory)
	If Not $iMemSize Then Return SetError(5, 0, 0)
	Local $pMem = _MemGlobalLock($hMemory)
	$tData = DllStructCreate("byte[" & $iMemSize & "]", $pMem)
	Local $bData = DllStructGetData($tData, 1)
	_WinAPI_ReleaseStream($hStream) ;http://msdn.microsoft.com/en-us/library/windows/desktop/ms221473(v=vs.85).aspx
	_MemGlobalFree($hMemory)
	If $bSave Then
		Local $hFile = FileOpen($sFileName, 18)
		If @error Then Return SetError(6, 0, $bData)
		FileWrite($hFile, $bData)
		FileClose($hFile)
	EndIf
	Return $bData
EndFunc   ;==>_GDIPlus_StreamImage2BinaryString
#EndRegion _GUICtrlRichEdit_InsertBitmap tks to UEZ (AutoIT Forum)
