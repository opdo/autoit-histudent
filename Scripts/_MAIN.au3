
#Region Tạo các control trong GUIMAIN
; TẠO CONTROL TRONG GUI MAIN
Func _GUIMAIN_Create_MenuTab3()

	GUICtrlCreateLabel("", 36, 260, 156 * 5, 122, -1, -1)
	GUICtrlSetState(-1, BitOR($GUI_SHOW, $GUI_DISABLE))
	GUICtrlSetBkColor(-1, 0x0072C6)

	GUICtrlCreateLabel("Thời khóa biểu bạn đang có", 73, 273, 213, 22, -1, -1)
	GUICtrlSetFont(-1, 11, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab2_menu1_Text1 = GUICtrlCreateLabel("", 73, 297, 62, 78, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 45, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab2_menu1_Text2 = GUICtrlCreateLabel("", 149, 314, 108, 60, -1, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab2_menu1_Text3 = GUICtrlCreateLabel("", 272, 295, 66, 78, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 45, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	$main_Tab2_menu1_Text4 = GUICtrlCreateLabel("", 343, 314, 171, 59, -1, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	
	For $i = 0 To 4
		$main_Tab2_menu1_tkb[$i][0] = GUICtrlCreateLabel("", 36 + $i * 156, 383, 156, 115, -1, -1)
		GUICtrlSetBkColor(-1, "0x008AF0")
		If $i = 3 Then GUICtrlSetOnEvent(-1, '_MoGUITKB')
		If $i = 4 Then GUICtrlSetOnEvent(-1, '_MAIN_Tab3_TKB_Open')
		If $i < 3 Then
			$main_Tab2_menu1_tkb[$i][1] = GUICtrlCreateLabel("", 36 + $i * 156, 393, 156, 38, $SS_CENTER, -1)
			GUICtrlSetFont(-1, 11, 600, 0, "Segoe UI Semibold")
			GUICtrlSetColor(-1, "0x0072C6")
			GUICtrlSetBkColor(-1, "-2")
			$main_Tab2_menu1_tkb[$i][2] = GUICtrlCreateLabel("", 53 + $i * 156, 437, 121, 41, $SS_CENTER, -1)
			GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
			GUICtrlSetColor(-1, "0x0072C6")
			GUICtrlSetBkColor(-1, "-2")
		Else
			$main_Tab2_menu1_tkb[$i][1] = GUICtrlCreateLabel($i = 3 ? $ICON_STUDY : $ICON_ADD, 75 + $i * 156, 390, 72, 58, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
			GUICtrlSetFont(-1, 30, 400, 0, "FontAwesome")
			GUICtrlSetColor(-1, "0xFFFFFF")
			GUICtrlSetBkColor(-1, "-2")
			$main_Tab2_menu1_tkb[$i][2] = GUICtrlCreateLabel($i = 3 ? 'Mở thời khóa biểu' : "Tạo thời khóa biểu", 36 + $i * 156, 463, 156, 22, $SS_CENTER, -1)
			GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
			GUICtrlSetColor(-1, "0xFFFFFF")
			GUICtrlSetBkColor(-1, "-2")


		EndIf
		
	Next

EndFunc   ;==>_GUIMAIN_Create_MenuTab3
Func _GUIMAIN_Create_MenuTab2($left = 0)
	; menu 1
	$main_Tab2_menu1[0] = GUICtrlCreateLabel("", 61 - $left, 261, 238, 238, 0, -1)
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetOnEvent(-1, '_NOTE_ShowGUI')

	$main_Tab2_menu1[1] = GUICtrlCreateLabel("", 61 - $left, 261, 238, 238, 0, -1)
	GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlSetBkColor(-1, "-2")

	GUICtrlCreatePic("", 110 - $left, 306, 140, 140, -1, -1)
	_SetImage(-1, @ScriptDir & '\Images\Process\nen.png')

	$main_Tab2_menu1_Text[0] = GUICtrlCreateLabel("36", 109 - $left, 332, 140, 60, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 40, 700, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab2_menu1_Text[1] = GUICtrlCreateLabel("ghi chú", 109 - $left, 395, 140, 19, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	$main_Tab2_menu1_Text[2] = GUICtrlCreateLabel("Nhiều hơn 36 ghi chú" & @CRLF & "so với 7 ngày trước", 62 - $left, 457, 236, 35, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab2_menu1_Title = GUICtrlCreateLabel("Bạn hiện có", 70 - $left, 261, 220, 29, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	;menu2

	GUICtrlCreateLabel("Ghi chú đánh dấu", 325 - $left, 261, 238, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")

	GUICtrlCreateLabel("", 325 - $left, 296, 238, 167, $SS_CENTER, -1)
	GUICtrlSetBkColor(-1, "0x008AF0")
	GUICtrlSetState(-1, $GUI_DISABLE)

	Local $h = 27
	For $i = 0 To 11 Step 2
		$main_Tab2_menu2_NOTEHover[Int($i / 2)] = GUICtrlCreateLabel("", 325, 296 + Int($i / 2) * ($h + 1), 238, $h, $SS_CENTER, -1)
		$main_Tab2_menu2_NOTE[$i] = GUICtrlCreateLabel($ICON_NOTE, 325, 296 + Int($i / 2) * ($h + 1), 47, $h, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
		GUICtrlSetFont(-1, 15, 400, 0, "FontAwesome")
		GUICtrlSetColor(-1, "0xFFFFFF")
		GUICtrlSetBkColor(-1, "0x0072C6")
		$main_Tab2_menu2_NOTE[$i + 1] = GUICtrlCreateLabel("Các từ tiếng anh thông...", 372 - $left, 296 + Int($i / 2) * ($h + 1), 191, $h, $SS_CENTERIMAGE, -1)
		GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
		GUICtrlSetColor(-1, "0xFFFFFF")
		GUICtrlSetBkColor(-1, "0x0072C6")
	Next

	GUICtrlCreateLabel("", 325 - $left, 464, 238, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetState(-1, BitOR($GUI_SHOW, $GUI_DISABLE))
	GUICtrlSetFont(-1, 15, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")

	$main_Tab2_menu2_arrow[0] = GUICtrlCreateLabel($ICON_ARROW_LEFT, 325 - $left, 464, 31, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetState(-1, $GUI_SHOW)
	GUICtrlSetFont(-1, 12, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	SetOnEventA(-1, '_MenuMain_Note_ChangePage', $ParamByVal, False)
	$main_Tab2_menu2_arrow[1] = GUICtrlCreateLabel($ICON_ARROW_RIGHT, 532 - $left, 464, 31, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetState(-1, $GUI_SHOW)
	GUICtrlSetFont(-1, 12, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	SetOnEventA(-1, '_MenuMain_Note_ChangePage', $ParamByVal, True)
	$main_Tab2_menu2_NoteText = GUICtrlCreateLabel("và 12 ghi chú khác", 361 - $left, 464, 171, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetState(-1, $GUI_SHOW)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	; menu 3

	GUICtrlCreateLabel("Có thể bạn cần", 587, 261, 223, 38, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreateLabel("Thói quen viết ghi chú sẽ giúp bạn làm việc hiệu quả hơn", 587, 310, 223, 47, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")

	$main_Tab2_menu3_button[1][1] = GUICtrlCreateLabel("", 587, 376, 223, 57, $SS_WHITEFRAME, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetOnEvent(-1, '_NOTE_NewNote')
	$main_Tab2_menu3_button[0][1] = GUICtrlCreateLabel("GHI CHÚ MỚI", 658, 377, 151, 55, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab2_menu3_button[2][1] = GUICtrlCreateLabel("", 588, 377, 70, 55, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 20, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	$main_Tab2_menu3_button[1][2] = GUICtrlCreateLabel("", 587, 442, 223, 57, $SS_WHITEFRAME, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetOnEvent(-1,'_MainMenu_NoteSetting')
	$main_Tab2_menu3_button[0][2] = GUICtrlCreateLabel("THIẾT LẬP", 658, 443, 151, 55, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab2_menu3_button[2][2] = GUICtrlCreateLabel($ICON_SETTING, 588, 443, 70, 55, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 20, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	_MAIN_NOTE_SetList()
EndFunc   ;==>_GUIMAIN_Create_MenuTab2
Func _GUIMAIN_Create_MenuTab1($left = 0)

	; menu 1
	$main_Tab1_menu1_left[0] = GUICtrlCreateLabel("", 61 - $left, 366, 28, 28, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	$main_Tab1_menu1_right[0] = GUICtrlCreateLabel("", 271 - $left, 366, 28, 28, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	$main_Tab1_menu1[0] = GUICtrlCreateLabel("", 61 - $left, 261, 238, 238, 0, -1)
	GUICtrlSetBkColor(-1, "-2")

	$main_Tab1_menu1_left[1] = GUICtrlCreateLabel($ICON_ARROW_LEFT, 61 - $left, 366, 28, 28, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 13, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab1_menu1_right[1] = GUICtrlCreateLabel($ICON_ARROW_RIGHT, 271 - $left, 366, 28, 28, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 13, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab1_menu1[1] = GUICtrlCreateLabel("", 61 - $left, 261, 238, 238, 0, -1)
	GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlSetBkColor(-1, "-2")

	$main_Percent_nen = GUICtrlCreatePic("", 110 - $left, 306, 140, 140, -1, -1)
	$main_Percent = GUICtrlCreatePic("", 110 - $left, 306, 140, 140, -1, -1)
	
	$main_Tab1_menu1_Text[1] = GUICtrlCreateLabel("", 109 - $left, 377, 140, 19, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab1_menu1_Text[0] = GUICtrlCreateLabel("", 109 - $left, 342, 140, 32, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 20, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	$main_Tab1_menu1_Text[2] = GUICtrlCreateLabel("", 62 - $left, 463, 236, 35, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor($main_Tab1_menu1_Text[2], "0xFFFFFF")
	GUICtrlSetBkColor($main_Tab1_menu1_Text[2], "0x008AF0")
	$main_Tab1_menu1_Title = GUICtrlCreateLabel("Các sự kiện sắp tới", 70 - $left, 261, 220, 29, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	;menu2

	$main_Tab1_menu2_tkb_text = GUICtrlCreateLabel("Môn học hôm nay", 325 - $left, 261, 238, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")

	$main_Tab1_menu2_nen = GUICtrlCreateLabel("", 325 - $left, 296, 238, 167, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetBkColor(-1, "0x008AF0")
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")

	$main_Tab1_menu2_TKBHover[0] = GUICtrlCreateLabel("", 325 - $left, 296, 238, 42, $SS_CENTER, -1)
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab1_menu2_TKBHover[1] = GUICtrlCreateLabel("", 325 - $left, 338, 238, 42, $SS_CENTER, -1)
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab1_menu2_TKBHover[2] = GUICtrlCreateLabel("", 325 - $left, 380, 238, 42, $SS_CENTER, -1)
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab1_menu2_TKBHover[3] = GUICtrlCreateLabel("", 325 - $left, 422, 238, 42, $SS_CENTER, -1)
	GUICtrlSetBkColor(-1, "-2")



	$main_Tab1_menu2_TKB[0] = GUICtrlCreateLabel("", 325 - $left, 296, 46, 41, $SS_CENTER, -1)
	$main_Tab1_menu2_TKB[1] = GUICtrlCreateLabel("", 372 - $left, 296, 191, 41, $SS_CENTER, -1)
	$main_Tab1_menu2_TKB[2] = GUICtrlCreateLabel("", 325 - $left, 338, 46, 41, $SS_CENTER, -1)
	$main_Tab1_menu2_TKB[3] = GUICtrlCreateLabel("", 372 - $left, 338, 191, 41, $SS_CENTER, -1)
	$main_Tab1_menu2_TKB[4] = GUICtrlCreateLabel("", 325 - $left, 380, 46, 41, $SS_CENTER, -1)
	$main_Tab1_menu2_TKB[5] = GUICtrlCreateLabel("", 372 - $left, 380, 191, 41, $SS_CENTER, -1)
	$main_Tab1_menu2_TKB[6] = GUICtrlCreateLabel("", 325 - $left, 422, 46, 41, $SS_CENTER, -1)
	$main_Tab1_menu2_TKB[7] = GUICtrlCreateLabel("", 372 - $left, 422, 191, 41, $SS_CENTER, -1)
	For $i = 0 To 7
		GUICtrlSetFont($main_Tab1_menu2_TKB[$i], 11, 400, 0, "Segoe UI")
		GUICtrlSetColor($main_Tab1_menu2_TKB[$i], "0xFFFFFF")
		GUICtrlSetBkColor($main_Tab1_menu2_TKB[$i], "0x0072C6")
	Next

	GUICtrlCreateLabel("", 325 - $left, 464, 238, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetState(-1, BitOR($GUI_SHOW, $GUI_DISABLE))
	GUICtrlSetBkColor(-1, "0x008AF0")

	$main_Tab1_menu2_arrow[0] = GUICtrlCreateLabel($ICON_ARROW_LEFT, 325 - $left, 464, 31, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetState(-1, $GUI_SHOW)
	GUICtrlSetFont(-1, 12, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	GUICtrlSetOnEvent(-1, '_MAIN_Tab1_TKB_Pre')
	$main_Tab1_menu2_arrow[1] = GUICtrlCreateLabel($ICON_ARROW_RIGHT, 532 - $left, 464, 31, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetState(-1, $GUI_SHOW)
	GUICtrlSetFont(-1, 12, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "0x008AF0")
	GUICtrlSetOnEvent(-1, '_MAIN_Tab1_TKB_Next')
	$main_Tab1_menu2_tkbcount = GUICtrlCreateLabel("", 361 - $left, 464, 171, 34, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetState(-1, $GUI_SHOW)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	; menu 3
	Global $main_Tab1_menu3_button[4][4]
	GUICtrlCreateLabel("Có thể bạn cần", 587, 261, 223, 38, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	$main_Tab1_menu3_button[1][0] = GUICtrlCreateLabel("", 587, 309, 223, 57, $SS_WHITEFRAME, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetOnEvent(-1, '_NOTE_NewNote')
	$main_Tab1_menu3_button[0][0] = GUICtrlCreateLabel("VIẾT GHI CHÚ", 658, 310, 151, 55, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab1_menu3_button[2][0] = GUICtrlCreateLabel($ICON_NOTE, 588, 310, 70, 55, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 20, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")


	$main_Tab1_menu3_button[1][1] = GUICtrlCreateLabel("", 587, 376, 223, 57, $SS_WHITEFRAME, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetOnEvent(-1, '_TKB_MainCreate')
	$main_Tab1_menu3_button[0][1] = GUICtrlCreateLabel("TẠO NHẮC NHỞ", 658, 377, 151, 55, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab1_menu3_button[2][1] = GUICtrlCreateLabel('', 588, 377, 70, 55, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 20, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	$main_Tab1_menu3_button[1][2] = GUICtrlCreateLabel("", 587, 442, 223, 57, $SS_WHITEFRAME, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetOnEvent(-1, '_MAIN_Tab4_AddEvent')
	$main_Tab1_menu3_button[0][2] = GUICtrlCreateLabel("THÊM SỰ KIỆN", 658, 443, 151, 55, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab1_menu3_button[2][2] = GUICtrlCreateLabel($ICON_EVENT, 588, 443, 70, 55, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 20, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	
EndFunc   ;==>_GUIMAIN_Create_MenuTab1
Func _GUIMAIN_Create_MenuTab4()
	$MAIN_Tab4_Date[1] = @MDAY
	$MAIN_Tab4_Date[2] = @MON
	$MAIN_Tab4_Date[3] = @YEAR
	; menu 2
	
	$main_Tab4_menu2_arrow[0] = GUICtrlCreateLabel("", 303, 374, 27, 32, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab4_menu2_arrow[1] = GUICtrlCreateLabel("", 513, 374, 27, 32, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetBkColor(-1, "-2")

	$main_Tab4_menu2_control[0] = GUICtrlCreateLabel("", 303, 260, 238, 238)
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetOnEvent(-1, '_MAIN_Tab4_AddEventDate')
	
	$main_Tab4_menu2_control[5] = GUICtrlCreateLabel("", 303, 260, 238, 71, -1, -1) ; nền trên
	GUICtrlSetState(-1, BitOR($GUI_SHOW, $GUI_DISABLE))
	GUICtrlSetBkColor(-1, "0x008AF0")
	$main_Tab4_menu2_control[4] = GUICtrlCreateLabel("", 303, 260, 238, 238, $SS_WHITEFRAME, -1)
	GUICtrlCreateLabel("", 335, 247, 23, 29, -1, -1)
	GUICtrlSetBkColor(-1, "0xFFFFFF")
	GUICtrlCreateLabel("", 477, 247, 23, 29, -1, -1)
	GUICtrlSetBkColor(-1, "0xFFFFFF")

	$main_Tab4_menu2_control[1] = GUICtrlCreateLabel("01", 361, 340, 116, 94, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 55, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	$main_Tab4_menu2_control[2] = GUICtrlCreateLabel("Bạn có 3 sự kiện", 303, 456, 238, 42, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlCreatePic("", 31855, 31875, 140, 140, -1, -1)

	$main_Tab4_menu2_control[3] = GUICtrlCreateLabel("THÁNG BA", 303, 280, 238, 38, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 17, 600, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	$main_Tab4_menu2_arrow[2] = GUICtrlCreateLabel($ICON_ARROW_LEFT, 303, 374, 27, 32, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 13, 300, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab4_menu2_arrow[3] = GUICtrlCreateLabel($ICON_ARROW_RIGHT, 513, 374, 27, 32, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 13, 300, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	
	$main_Tab4_menu1_arrow[0] = GUICtrlCreateLabel("", 61, 374, 27, 32, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab4_menu1_arrow[1] = GUICtrlCreateLabel("", 251, 374, 27, 32, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetBkColor(-1, "-2")


	$main_Tab4_menu1_control[0][1] = GUICtrlCreateLabel("", 61, 260, 217, 152, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetBkColor($main_Tab4_menu1_control[0][1], "0x808080")
	$main_Tab4_menu1_control[1][1] = GUICtrlCreateLabel("", 74, 277, 27, 22, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 13, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab4_menu1_control[2][1] = GUICtrlCreateLabel("", 100, 277, 164, 27, -1, -1)
	GUICtrlSetFont(-1, 11, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab4_menu1_control[3][1] = GUICtrlCreateLabel("", 101, 304, 147, 22, -1, -1)
	GUICtrlSetFont(-1, 11, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab4_menu1_control[5][1] = GUICtrlCreateLabel("", 74, 304, 27, 22, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab4_menu1_control[4][1] = GUICtrlCreateLabel("(Không có sự kiện sắp diễn ra)" & @CRLF & 'Thêm sự kiện bằng các nút lệnh bên phải', 80, 333, 184, 44, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	$main_Tab4_menu1_control[0][2] = GUICtrlCreateLabel("", 61, 412, 110, 87, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetBkColor(-1, "0x000040")
	$main_Tab4_menu1_control[2][2] = GUICtrlCreateLabel("Một sự kiện được test", 87, 419, 64, 72, -1, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab4_menu1_control[1][2] = GUICtrlCreateLabel("", 62, 419, 27, 22, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 13, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	$main_Tab4_menu1_control[0][3] = GUICtrlCreateLabel("", 168, 412, 110, 87, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetBkColor(-1, "0x008000")
	$main_Tab4_menu1_control[1][3] = GUICtrlCreateLabel("", 166, 419, 27, 22, $SS_CENTER, -1) ; clock
	GUICtrlSetFont(-1, 13, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab4_menu1_control[2][3] = GUICtrlCreateLabel("Một sự kiện được test", 193, 419, 68, 72, -1, -1)
	GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	$main_Tab4_menu1_arrow[2] = GUICtrlCreateLabel($ICON_ARROW_LEFT, 61, 374, 27, 32, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 13, 300, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab4_menu1_arrow[3] = GUICtrlCreateLabel($ICON_ARROW_RIGHT, 251, 374, 27, 32, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 13, 300, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")


	; menu 3

	GUICtrlCreateLabel("Có thể bạn cần", 587, 261, 223, 38, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	$main_Tab4_menu3_button[1][0] = GUICtrlCreateLabel("", 587, 309, 223, 57, $SS_WHITEFRAME, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetOnEvent(-1, '_MAIN_Tab4_AddEvent')
	$main_Tab4_menu3_button[0][0] = GUICtrlCreateLabel("THÊM SỰ KIỆN", 658, 310, 151, 55, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab4_menu3_button[2][0] = GUICtrlCreateLabel("", 588, 310, 70, 55, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 20, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	$main_Tab4_menu3_button[1][1] = GUICtrlCreateLabel("", 587, 376, 223, 57, $SS_WHITEFRAME, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetOnEvent(-1, '_ShowGUI_LICH')
	$main_Tab4_menu3_button[0][1] = GUICtrlCreateLabel("MỞ LỊCH BIỂU", 658, 377, 151, 55, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab4_menu3_button[2][1] = GUICtrlCreateLabel($ICON_LICH, 588, 377, 70, 55, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 20, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")

	$main_Tab4_menu3_button[1][2] = GUICtrlCreateLabel("", 587, 442, 223, 57, $SS_WHITEFRAME, -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetOnEvent(-1,'_MainMenu_LichSetting')
	$main_Tab4_menu3_button[0][2] = GUICtrlCreateLabel("THIẾT LẬP", 658, 443, 151, 55, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$main_Tab4_menu3_button[2][2] = GUICtrlCreateLabel($ICON_SETTING, 588, 443, 70, 55, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 20, 400, 0, "FontAwesome")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	
	
EndFunc   ;==>_GUIMAIN_Create_MenuTab4
Func _GUIMAIN_Create_MenuTab5()
	

	$MAIN_Tab5_Button[1] = GUICtrlCreateLabel("THÔNG TIN", 61, 260, 150, 44, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0x0072C6")
	GUICtrlSetBkColor(-1, "0xFFFFFF")
	SetOnEventA(-1, '_Tab5_ShowTab', $ParamByVal, 0)
	_GUICtrl_OnHoverRegister(-1, "_MainTab5Hover", "_MainTab5Normal")

	$MAIN_Tab5_Button[3] = GUICtrlCreateLabel("THIẾT LẬP", 61, 314, 150, 44, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	SetOnEventA(-1, '_Tab5_ShowTab', $ParamByVal, 2)
	_GUICtrl_OnHoverRegister(-1, "_MainTab5Hover", "_MainTab5Normal")

	$MAIN_Tab5_Button[2] = GUICtrlCreateLabel("DONATE", 61, 367, 150, 44, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	_GUICtrl_OnHoverRegister(-1, "_MainTab5Hover", "_MainTab5Normal")
	SetOnEventA(-1, '_Tab5_ShowTab', $ParamByVal, 1)
	Local $control[12]
	$control[0] = GUICtrlCreateLabel("OPHi Student", 280, 250, 546, 31, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 20, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$control[1] = GUICtrlCreateLabel("Phiên bản " & $VERSION, 278, 291, 546, 23, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 11, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$control[2] = GUICtrlCreateLabel("WEBSITE", 356, 320, 90, 26, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0x0072C6")
	GUICtrlSetBkColor(-1, "0xFFFFFF")
	_GUICtrl_OnHoverRegister(-1, "_MainTab5Hover", "_MainTab5Normal", "_Nothing", "_MainTab5Click")
	$control[3] = GUICtrlCreateLabel("FACEBOOK", 455, 320, 90, 26, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0x0072C6")
	GUICtrlSetBkColor(-1, "0xFFFFFF")
	_GUICtrl_OnHoverRegister(-1, "_MainTab5Hover", "_MainTab5Normal", "_Nothing", "_MainTab5Click")
	$control[4] = GUICtrlCreateLabel("HƯỚNG DẪN", 554, 320, 92, 26, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0x0072C6")
	GUICtrlSetBkColor(-1, "0xFFFFFF")
	_GUICtrl_OnHoverRegister(-1, "_MainTab5Hover", "_MainTab5Normal", "_Nothing", "_MainTab5Click")
	$control[5] = GUICtrlCreateLabel("CẬP NHẬT", 654, 320, 94, 26, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0x0072C6")
	GUICtrlSetBkColor(-1, "0xFFFFFF")
	_GUICtrl_OnHoverRegister(-1, "_MainTab5Hover", "_MainTab5Normal", "_Nothing", "_MainTab5Click")
	$control[6] = GUICtrlCreateLabel("Phần mềm được thiết kế và phát triển bởi Vinh Phạm với <3 dành cho bạn" & @CRLF & "Liên hệ hỗ trợ: imopdo@opdo.vn" & @CRLF & "Phần mềm có sử dụng các thư viện sau:", 294, 367, 532, 76, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$control[7] = GUICtrlCreateLabel("OnEventFunc", 326, 444, 86, 23, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 11, 300, 4, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetCursor(-1, 4)
	_GUICtrl_OnHoverRegister(-1, "_Nothing", "_Nothing", "_Nothing", "_MainTab5Click")
	$control[8] = GUICtrlCreateLabel("StringSize", 423, 444, 68, 23, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 11, 300, 4, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetCursor(-1, 4)
	_GUICtrl_OnHoverRegister(-1, "_Nothing", "_Nothing", "_Nothing", "_MainTab5Click")
	$control[9] = GUICtrlCreateLabel("GUIScrollbars_Ex", 505, 444, 101, 23, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 11, 300, 4, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetCursor(-1, 4)
	_GUICtrl_OnHoverRegister(-1, "_Nothing", "_Nothing", "_Nothing", "_MainTab5Click")
	$control[10] = GUICtrlCreateLabel("GUICtrlOnHover", 623, 444, 101, 23, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 11, 300, 4, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetCursor(-1, 4)
	_GUICtrl_OnHoverRegister(-1, "_Nothing", "_Nothing", "_Nothing", "_MainTab5Click")
	$control[11] = GUICtrlCreateLabel("Thêm...", 710, 444, 101, 23, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 11, 300, 4, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetCursor(-1, 4)
	_GUICtrl_OnHoverRegister(-1, "_Nothing", "_Nothing", "_Nothing", "_MainTab5Click")
	
	$MAIN_Tab5_Control[0] = $control

	Local $control[3]
	$control[0] = GUICtrlCreateLabel("Cảm ơn bạn vì đã ủng hộ phần mềm!", 278, 428, 532, 48, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$control[1] = GUICtrlCreateLabel("DONATE NOW", 470, 380, 161, 26, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0x0072C6")
	GUICtrlSetBkColor(-1, "0xFFFFFF")
	_GUICtrl_OnHoverRegister(-1, "_MainTab5Hover", "_MainTab5Normal", "_Nothing", "_MainTab5Click")
	$control[2] = GUICtrlCreateLabel("Nếu cảm thấy phần mềm hữu ích với bạn, hãy donate để chúng tôi có thể phát triển nó trở nên hữu ích hơn ^^", 278, 319, 532, 48, $SS_CENTER, -1)
	GUICtrlSetFont(-1, 12, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	$MAIN_Tab5_Control[1] = $control
	
	Local $control[5]
	$control[0] = GUICtrlCreateLabel("Tổng quan", 280, 259, 87, 23, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0x008AF0")
	GUICtrlSetBkColor(-1, "0xFFFFFF")
	GUICtrlSetCursor(-1, 0)
	_GUICtrl_OnHoverRegister(-1, "_Nothing", "_Nothing", "_Nothing", "_MainSettingClick")
	$control[1] = GUICtrlCreateLabel("Ghi chú", 280 + 87, 259, 73, 23, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetCursor(-1, 0)
	_GUICtrl_OnHoverRegister(-1, "_Nothing", "_Nothing", "_Nothing", "_MainSettingClick")
	$control[2] = GUICtrlCreateLabel("Học biểu", 280 + 87 + 73, 259, 73, 23, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetCursor(-1, 0)
	_GUICtrl_OnHoverRegister(-1, "_Nothing", "_Nothing", "_Nothing", "_MainSettingClick")
	$control[3] = GUICtrlCreateLabel("Lịch biểu", 280 + 87 + 73 * 2, 259, 73, 23, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetFont(-1, 11, 400, 0, "Segoe UI")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetCursor(-1, 0)
	_GUICtrl_OnHoverRegister(-1, "_Nothing", "_Nothing", "_Nothing", "_MainSettingClick")
	$control[4] = GUICtrlCreateLabel("", 280, 260 + 22, 73 * 3 + 87, 1, BitOR($SS_CENTER, $SS_CENTERIMAGE), -1)
	GUICtrlSetBkColor(-1, "0xFFFFFF")
	$MAIN_Tab5_Control[2] = $control
	_Tab5_ShowTab(0)
	GUICtrlCreateLabel("", 240, 260, 2, 245, $SS_CENTER, -1) ; line
	GUICtrlSetBkColor(-1, "0xFFFFFF")
EndFunc   ;==>_GUIMAIN_Create_MenuTab5
Func _Tab5_ShowTab($id)
	If Number($id) <> Number($MAIN_Tab5_Button[0]) - 1 Then
		
		
		GUICtrlSetColor($MAIN_Tab5_Button[$MAIN_Tab5_Button[0]], "0xFFFFFF")
		GUICtrlSetBkColor($MAIN_Tab5_Button[$MAIN_Tab5_Button[0]], "-2")
		$MAIN_Tab5_Button[0] = Number($id) + 1
		GUICtrlSetColor($MAIN_Tab5_Button[$MAIN_Tab5_Button[0]], "0x0072C6")
		GUICtrlSetBkColor($MAIN_Tab5_Button[$MAIN_Tab5_Button[0]], "0xFFFFFF")
	EndIf

	For $i = 0 To 2
		If $i <> $id Then
			If IsArray($MAIN_Tab5_Control[$i]) Then
				For $var In $MAIN_Tab5_Control[$i]
					GUICtrlSetState($var, $GUI_HIDE)
				Next
			EndIf
		Else
			If IsArray($MAIN_Tab5_Control[$i]) Then
				For $var In $MAIN_Tab5_Control[$i]
					GUICtrlSetState($var, $GUI_SHOW)
				Next
			EndIf
		EndIf
	Next
	If $id < 2 Then
		If IsHWnd($MAIN_SETTING) Then GUIDelete($MAIN_SETTING)
	Else
		For $i = 0 To 3
			GUICtrlSetBkColor(($MAIN_Tab5_Control[2])[$i], '-2')
			GUICtrlSetColor(($MAIN_Tab5_Control[2])[$i], '0xFFFFFF')
		Next
		GUICtrlSetBkColor(($MAIN_Tab5_Control[2])[0], '0xFFFFFF')
		GUICtrlSetColor(($MAIN_Tab5_Control[2])[0], '0x008AF0')
		_SettingGUI()
	EndIf
EndFunc   ;==>_Tab5_ShowTab
Func _MAIN_SetWelcome()
	Local $text_welcome
	If @HOUR > 6 And @HOUR <= 11 Then
		$text_welcome = 'Chúc bạn buổi sáng vui vẻ (y)'
	ElseIf @HOUR > 11 And @HOUR <= 17 Then
		$text_welcome = 'Chúc bạn trưa mát mẻ ^^'
	ElseIf @HOUR > 17 And @HOUR <= 23 Then
		$text_welcome = 'Chúc bạn tối ấm cúng :D'
	Else
		$text_welcome = 'Khuya rồi, ngủ sớm bạn nhé :P'
	EndIf
	GUICtrlSetData($main_TextWelcome, 'Chào ' & _iniread($Database, 'Pro5', "Name", "") & '! ' & $text_welcome)
EndFunc   ;==>_MAIN_SetWelcome
Func _GUIMain_Prepare()
	_MAIN_SetWelcome()
	$main_TabCtrl = GUICtrlCreateTab(0, 0)
	GUICtrlCreateTabItem("tab0")
	_GUIMAIN_Create_MenuTab1()
	GUICtrlCreateTabItem("tab1")
	_GUIMAIN_Create_MenuTab2()
	GUICtrlCreateTabItem("tab2")
	_GUIMAIN_Create_MenuTab3()
	GUICtrlCreateTabItem("tab3")
	_GUIMAIN_Create_MenuTab4()
	GUICtrlCreateTabItem("tab4")
	_GUIMAIN_Create_MenuTab5()
	GUICtrlCreateTabItem("")
	_GUICtrlTab_SetCurFocus($main_TabCtrl, 0)
	Global $main_Title[4], $MAIN_ESC
	$MAIN_ESC = GUICtrlCreateButton('', -1000, -1000)
	GUICtrlSetOnEvent(-1, '_Hide')
	Dim $MAIN_AccelTable[1][2] = [["{ESC}", $MAIN_ESC]]
	GUISetAccelerators($MAIN_AccelTable)

	$main_Title[0] = GUICtrlCreateLabel("OPHi Student", 177, 10, 291, 50, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 25, 600, 0, "Segoe UI Semibold")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetState(-1, $GUI_HIDE)
	$main_Title[1] = GUICtrlCreateLabel("Phần mềm hỗ trợ ghi chú, học tập", 177, 50, 291, 50, $SS_CENTERIMAGE, -1)
	GUICtrlSetFont(-1, 15, 300, 0, "Segoe UI Light")
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlSetBkColor(-1, "-2")
	GUICtrlSetState(-1, $GUI_HIDE)
	$main_Title[2] = GUICtrlCreateLabel("", 0, 0, 300, 110)
	GUICtrlSetBkColor(-1, "0x0072C6")
	GUICtrlSetState(-1, $GUI_HIDE)
	$main_Tab[0] = 1 ; set tab = 1
	Global $main_Logo = GUICtrlCreatePic(@ScriptDir & '\Images\Logo.bmp', 390, 10, 90, 90)
	GUICtrlSetCursor(-1, 0)
	GUICtrlSetOnEvent(-1, '_LogoClick')
	GUICtrlCreateLabel("", 0, 0, 980, 90, BitOR($SS_CENTER, $SS_CENTERIMAGE), $GUI_WS_EX_PARENTDRAG)
	GUICtrlSetBkColor(-1, "-2")
	_TKB_Load_DeffaultTKB() ; set tkb deffault
	If @HOUR > 21 Then
		Local $ngaymai = _DateAdd('d', 1, _NowCalcDate())

		_TKB_LoadDataMain(StringSplit($ngaymai, '/')[1], StringSplit($ngaymai, '/')[2], StringSplit($ngaymai, '/')[3])
		GUICtrlSetData($main_Tab1_menu2_tkb_text, 'Môn học ngày mai')
	Else
		GUICtrlSetData($main_Tab1_menu2_tkb_text, 'Môn học hôm nay')
		_TKB_LoadDataMain()
	EndIf
	_MAIN_Tab4_ShowCalendar()
EndFunc   ;==>_GUIMain_Prepare
#EndRegion Tạo các control trong GUIMAIN

Func _MainMenu_NoteSetting()
	
	_Tab_Swich(5)
	$flag_TabSlider = True
	_MoveTabSlider($main_Tab[5])
	$flag_TabSlider = False
	_Tab5_ShowTab(2)
			_GUIScrollBars_SetScrollInfoPos($MAIN_SETTING, $SB_VERT, 0)
			For $i = 0 To 3
				GUICtrlSetBkColor(($MAIN_Tab5_Control[2])[$i], '-2')
				GUICtrlSetColor(($MAIN_Tab5_Control[2])[$i], '0xFFFFFF')
			Next
			GUICtrlSetBkColor(($MAIN_Tab5_Control[2])[1], '0xFFFFFF')
			GUICtrlSetColor(($MAIN_Tab5_Control[2])[1], '0x008AF0')
			_GUICtrlTab_SetCurFocus($MAINSETTING_Tab, 1)
			
EndFunc
Func _MainMenu_LichSetting()
	
	_Tab_Swich(5)
	$flag_TabSlider = True
	_MoveTabSlider($main_Tab[5])
	$flag_TabSlider = False
	_Tab5_ShowTab(2)
			_GUIScrollBars_SetScrollInfoPos($MAIN_SETTING, $SB_VERT, 0)
			For $i = 0 To 3
				GUICtrlSetBkColor(($MAIN_Tab5_Control[2])[$i], '-2')
				GUICtrlSetColor(($MAIN_Tab5_Control[2])[$i], '0xFFFFFF')
			Next
			GUICtrlSetBkColor(($MAIN_Tab5_Control[2])[3], '0xFFFFFF')
			GUICtrlSetColor(($MAIN_Tab5_Control[2])[3], '0x008AF0')
			_GUICtrlTab_SetCurFocus($MAINSETTING_Tab, 3)
			
EndFunc

Func _TKB_MainCreate()
	If GUICtrlRead($main_Tab1_menu3_button[0][1]) = 'TẠO NHẮC NHỞ' Then
		Local $read = IniReadSection($Database, "TKB" & $GUI_TKB[1])
		Local $id_mon
		If $MAIN_tkb[0] > 0 Then
			$id_mon = StringSplit($MAIN_tkb[1], '@')[1]
		Else
			$id_mon = $read[1][0]
		EndIf
		If _TKB_MON_ADD_NHACNHO($GUI_TKB[1], $id_mon) Then _TKB_LoadDataMain()
	ElseIf GUICtrlRead($main_Tab1_menu3_button[0][1]) = 'TẠO MÔN HỌC' Then
		If _TKB_ADD_MON($GUI_TKB[1]) Then _TKB_LoadDataMain()
	Else
		If _TKB_ADD_TKB() Then 
			_TKB_LoadDataMain()
			_TKB_SetMain()
		EndIf
	EndIf
EndFunc   ;==>_TKB_MainCreate

#Region Các hàm chức năng liên quan của GUI MAIN
Func _MAIN_Tab3_TKB_Open()
	Local $GUI_Temp = _DisableGUI($GUIMAIN)
	If $GUI_TKB[0] > 0 Then
		Local $read = IniReadSection($Database, "TKB" & $GUI_TKB[1])
		If Not @error Then
			
			If $read[0][0] > 0 Then
				
				Local $id_mon
				If $MAIN_tkb[0] > 0 Then
					$id_mon = StringSplit($MAIN_tkb[1], '@')[1]
				Else
					$id_mon = $read[1][0]
				EndIf
				If _TKB_MON_ADD_NHACNHO($GUI_TKB[1], $id_mon) Then _TKB_LoadDataMain()
			Else
				If _TKB_ADD_MON($GUI_TKB[1]) Then _TKB_LoadDataMain()
			EndIf
		Else
			If _TKB_ADD_MON($GUI_TKB[1]) Then _TKB_LoadDataMain()
		EndIf
	Else
		If _TKB_ADD_TKB() Then 
			_TKB_LoadDataMain()
		EndIf
	EndIf
	_EnableGUI($GUIMAIN, $GUI_Temp)
EndFunc   ;==>_MAIN_Tab3_TKB_Open
Func _MAIN_Tab1_TKB_Next()
	
	If $MAIN_tkb[0] > 4 Then
		Local $temp = $MAIN_tkb[$MAIN_tkb[0]]
		For $i = $MAIN_tkb[0] To 2 Step -1
			$MAIN_tkb[$i] = $MAIN_tkb[$i - 1]
		Next
		$MAIN_tkb[1] = $temp
		_TKB_SetMain()
	EndIf
EndFunc   ;==>_MAIN_Tab1_TKB_Next

Func _MAIN_Tab1_TKB_Pre()
	
	If $MAIN_tkb[0] > 4 Then
		Local $temp = $MAIN_tkb[1]
		For $i = 1 To $MAIN_tkb[0] - 1
			$MAIN_tkb[$i] = $MAIN_tkb[$i + 1]
		Next
		$MAIN_tkb[$MAIN_tkb[0]] = $temp
		_TKB_SetMain()
	EndIf
EndFunc   ;==>_MAIN_Tab1_TKB_Pre
Func _MAIN_Tab4_AddEvent()
	_ADDEvent_ShowGUI(@MDAY, @MON, @YEAR, @HOUR, @MIN, '', $GUIMAIN)
EndFunc   ;==>_MAIN_Tab4_AddEvent
Func _MAIN_Tab4_AddEventDate()
	_LICH_ShowEventTab($MAIN_Tab4_Date[1], $MAIN_Tab4_Date[2], $MAIN_Tab4_Date[3])
EndFunc   ;==>_MAIN_Tab4_AddEventDate

Func _MAIN_Tab4_ClickEvent($id)
	If Number($MAIN_Tab4_NextEvent[0]) >= $id Then _ADDEvent_ShowGUI(@MDAY, @MON, @YEAR, @HOUR, @MIN, $MAIN_Tab4_NextEvent[$id], $GUIMAIN)
EndFunc   ;==>_MAIN_Tab4_ClickEvent

Func _MAIN_Tab4_SetEventCalendar($count = 0)
	
	If $MAIN_Tab4_NextEvent[0] > 1 And $count <> 0 Then
		Local $temp1 = $count > 0 ? $MAIN_Tab4_NextEvent[1] : $MAIN_Tab4_NextEvent[$MAIN_Tab4_NextEvent[0]]
		Local $start = $count > 0 ? 1 : $MAIN_Tab4_NextEvent[0]
		Local $end = $count > 0 ? $MAIN_Tab4_NextEvent[0] - 1 : 2
		Local $step = $count > 0 ? 1 : -1
		For $i = $start To $end Step $step
			If $count > 0 Then
				$MAIN_Tab4_NextEvent[$i] = $MAIN_Tab4_NextEvent[$i + 1]
			Else
				$MAIN_Tab4_NextEvent[$i] = $MAIN_Tab4_NextEvent[$i - 1]
			EndIf
		Next
		If $count > 0 Then
			$MAIN_Tab4_NextEvent[$MAIN_Tab4_NextEvent[0]] = $temp1
		Else
			
			$MAIN_Tab4_NextEvent[1] = $temp1
		EndIf
		
	EndIf

	For $j = 1 To Number($MAIN_Tab4_NextEvent[0]) > 3 ? 3 : Number($MAIN_Tab4_NextEvent[0]) ; set data
		GUICtrlSetState($main_Tab4_menu1_control[0][$j], $GUI_SHOW)
		GUICtrlSetState($main_Tab4_menu1_control[1][$j], $GUI_SHOW)
		GUICtrlSetState($main_Tab4_menu1_control[2][$j], $GUI_SHOW)
		Local $time1 = StringSplit(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$j], 5), '/')
		Local $day_left = _DateDiff('d', _NowCalcDate(), $time1[3] & '/' & $time1[2] & '/' & $time1[1])
		GUICtrlSetData($main_Tab4_menu1_control[2][$j], _ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$j], 1))
		GUICtrlSetData($main_Tab4_menu1_control[1][$j], _ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$j], 11))
		Local $color = StringSplit($ADDEVENT_SETTING_COLOR, ',')[_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$j], 10)]
		GUICtrlSetBkColor($main_Tab4_menu1_control[0][$j], $color)
		GUICtrlSetColor($main_Tab4_menu1_control[1][$j], _EDITOR_ColorText($color))
		GUICtrlSetColor($main_Tab4_menu1_control[2][$j], _EDITOR_ColorText($color))
		If $j = 1 Then
			GUICtrlSetState($main_Tab4_menu1_control[3][$j], $GUI_SHOW)
			GUICtrlSetState($main_Tab4_menu1_control[5][$j], $GUI_SHOW)
			GUICtrlSetData($main_Tab4_menu1_control[4][$j], 'Mô tả: ' & _ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$j], 2))
			GUICtrlSetData($main_Tab4_menu1_control[3][$j], Number($day_left) = 0 ? 'Sự kiện hôm nay' : 'Còn ' & $day_left & ' ngày nữa')
			GUICtrlSetColor($main_Tab4_menu1_control[3][$j], _EDITOR_ColorText($color))
			GUICtrlSetColor($main_Tab4_menu1_control[4][$j], _EDITOR_ColorText($color))
			GUICtrlSetColor($main_Tab4_menu1_control[5][$j], _EDITOR_ColorText($color))
		Else
			GUICtrlSetData($main_Tab4_menu1_control[2][$j], GUICtrlRead($main_Tab4_menu1_control[2][$j]))
		EndIf
	Next
EndFunc   ;==>_MAIN_Tab4_SetEventCalendar

Func _MAIN_Tab4_SetCalendar($count = 0, $return = -1)
	Local $new_date = _DateAdd('d', $count, $MAIN_Tab4_Date[3] & '/' & $MAIN_Tab4_Date[2] & '/' & $MAIN_Tab4_Date[1])
	Local $get_date = StringSplit($new_date, '/')
	$MAIN_Tab4_Date[1] = Number($get_date[3])
	$MAIN_Tab4_Date[2] = Number($get_date[2])
	$MAIN_Tab4_Date[3] = Number($get_date[1])
	_LICH_GETEVENT_MON($MAIN_Tab4_Date[2], $MAIN_Tab4_Date[3], $MAIN_Tab4_Date[1], $return)
	GUICtrlSetData($main_Tab4_menu2_control[1], $MAIN_Tab4_Date[1] < 10 ? '0' & $MAIN_Tab4_Date[1] : $MAIN_Tab4_Date[1])
	GUICtrlSetData($main_Tab4_menu2_control[3], StringUpper(_LICH_NumberToMon($MAIN_Tab4_Date[2])))
	GUICtrlSetData($main_Tab4_menu2_control[2], $LICH2_Control[0][0] = 0 ? 'Không có sự kiện nào!' : 'Bạn có ' & $LICH2_Control[0][0] & ' sự kiện')
EndFunc   ;==>_MAIN_Tab4_SetCalendar
Func _MAIN_Tab1_SetEventCalendar($count = 0)

	If $MAIN_Tab4_NextEvent[0] = 0 Then
		GUICtrlSetData($main_Tab1_menu1_Text[1], "Khỏe re")
		GUICtrlSetData($main_Tab1_menu1_Text[0], "")
		GUICtrlSetData($main_Tab1_menu1_Text[2], "Bạn không có sự kiện nào" & @CRLF & 'sắp diễn ra')
		Return 0
	EndIf
	$main_Tab1_Event[0] += $count
	
	$main_Tab1_Event[0] = Number($main_Tab1_Event[0]) <= 0 ? $MAIN_Tab4_NextEvent[0] : $main_Tab1_Event[0]
	$main_Tab1_Event[0] = Number($main_Tab1_Event[0]) > Number($MAIN_Tab4_NextEvent[0]) ? 1 : $main_Tab1_Event[0]
	$main_Tab1_Event[1] = $MAIN_Tab4_NextEvent[$main_Tab1_Event[0]]
	Local $time1 = StringSplit(_ADDEVENT_GetSetting($main_Tab1_Event[1], 5), '/')
	Local $time_left = _DateDiff('d', _NowCalcDate(), $time1[3] & '/' & $time1[2] & '/' & $time1[1])
	
	GUICtrlSetData($main_Tab1_menu1_Text[1], Number($time_left) = 0 ? "Sự kiện hôm nay" : 'Còn ' & $time_left & ' ngày nữa')
	GUICtrlSetData($main_Tab1_menu1_Text[0], _ADDEVENT_GetSetting($main_Tab1_Event[1], 11))
	GUICtrlSetData($main_Tab1_menu1_Text[2], _ADDEVENT_GetSetting($main_Tab1_Event[1], 1) & @CRLF & '[' & _ADDEVENT_GetSetting($main_Tab1_Event[1], 5) & ']')
	
EndFunc   ;==>_MAIN_Tab1_SetEventCalendar
Func _MAIN_Tab4_ShowCalendar($DATE = @MDAY, $MON = @MON, $YEAR = @YEAR)
	
	_MAIN_Tab4_SetCalendar(0, 1)

	For $i = $MAIN_Tab4_NextEvent[0] - 1 To 1 Step -1 ; tráo đổi theo thứ tự thời gian
		For $j = 1 To $i
			Local $time1 = StringSplit(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$j], 5), '/')
			Local $time2 = StringSplit(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$j + 1], 5), '/')
			Local $temp3 = _ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$j], 9)
			If $temp3 > 2 Then
				If $temp3 = 3 Then
					$time1[2] = @MON
				ElseIf $temp3 = 4 Then
					Local $add_day = _DateToDayOfWeekISO($time1[3], $time1[2], $time1[1]) - _DateToDayOfWeekISO(@YEAR, @MON, @MDAY)
					Local $new_day = StringSplit(_DateAdd('d', $add_day, @YEAR & '/' & @MON & '/' & @MDAY), '/')
					$time1[2] = $new_day[2]
					$time1[1] = $new_day[3]
					$time1[3] = $new_day[1]
				ElseIf $temp3 = 5 Then
					$time1[2] = @MON
					$time1[1] = @MDAY
				EndIf
				$time1[3] = @YEAR
			ElseIf $temp3 = 2 Then
				$time1[3] = @YEAR
			EndIf
			$temp3 = _ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$j + 1], 9)
			If $temp3 > 2 Then
				If $temp3 = 3 Then
					$time2[2] = @MON
				ElseIf $temp3 = 4 Then
					Local $add_day = _DateToDayOfWeekISO($time2[3], $time2[2], $time2[1]) - _DateToDayOfWeekISO(@YEAR, @MON, @MDAY)
					Local $new_day = StringSplit(_DateAdd('d', $add_day, @YEAR & '/' & @MON & '/' & @MDAY), '/')
					$time2[2] = $new_day[2]
					$time2[1] = $new_day[3]
					$time2[3] = $new_day[1]
				ElseIf $temp3 = 5 Then
					$time2[2] = @MON
					$time2[1] = @MDAY
				EndIf
				$time2[3] = @YEAR
			ElseIf $temp3 = 2 Then
				$time2[3] = @YEAR
			EndIf
			If Number(_DateDiff('d', _NowCalcDate(), $time1[3] & '/' & $time1[2] & '/' & $time1[1])) > Number(_DateDiff('d', _NowCalcDate(), $time2[3] & '/' & $time2[2] & '/' & $time2[1])) Then
				Local $temp = $MAIN_Tab4_NextEvent[$j]
				$MAIN_Tab4_NextEvent[$j] = $MAIN_Tab4_NextEvent[$j + 1]
				$MAIN_Tab4_NextEvent[$j + 1] = $temp
			EndIf
			;	If _ADDEVENT_StringInSlot(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$j], 3), $ADDEVENT_PRIORITY) < _ADDEVENT_StringInSlot(_ADDEVENT_GetSetting($MAIN_Tab4_NextEvent[$j + 1], 3), $ADDEVENT_PRIORITY) Then
			;		Local $temp = $MAIN_Tab4_NextEvent[$j]
			;		$MAIN_Tab4_NextEvent[$j] = $MAIN_Tab4_NextEvent[$j + 1]
			;		$MAIN_Tab4_NextEvent[$j + 1] = $temp
			;	EndIf
		Next
	Next
	
	For $j = 2 To 3
		GUICtrlSetState($main_Tab4_menu1_control[0][$j], $GUI_HIDE)
		GUICtrlSetState($main_Tab4_menu1_control[1][$j], $GUI_HIDE)
		GUICtrlSetState($main_Tab4_menu1_control[2][$j], $GUI_HIDE)
	Next
	GUICtrlSetBkColor($main_Tab4_menu1_control[0][1], "0x808080")
	GUICtrlSetPos($main_Tab4_menu1_control[0][2], Default, Default, 110)
	GUICtrlSetPos($main_Tab4_menu1_control[2][2], Default, Default, 64)
	GUICtrlSetPos($main_Tab4_menu1_control[0][1], Default, Default, Default, 152)
	GUICtrlSetPos($main_Tab4_menu1_control[4][1], Default, Default, Default, 44)
	GUICtrlSetStyle($main_Tab4_menu1_control[4][1], 0)
	If Number($MAIN_Tab4_NextEvent[0]) <= 1 Then
		If Number($MAIN_Tab4_NextEvent[0]) = 0 Then
			GUICtrlSetState($main_Tab4_menu1_control[1][1], $GUI_HIDE)
			GUICtrlSetState($main_Tab4_menu1_control[2][1], $GUI_HIDE)
			GUICtrlSetState($main_Tab4_menu1_control[3][1], $GUI_HIDE)
			GUICtrlSetState($main_Tab4_menu1_control[5][1], $GUI_HIDE)
			GUICtrlSetData($main_Tab4_menu1_control[4][1], "(Không có sự kiện sắp diễn ra)" & @CRLF & 'Thêm sự kiện bằng các nút lệnh bên phải')
			GUICtrlSetStyle($main_Tab4_menu1_control[4][1], $SS_CENTER)

		EndIf
		
		GUICtrlSetPos($main_Tab4_menu1_control[0][1], Default, Default, Default, 152 + 87)
		GUICtrlSetPos($main_Tab4_menu1_control[4][1], Default, Default, Default, 44 + 87)
		For $k = 0 To 3
			If $k <= 1 Then
				GUICtrlSetState($main_Tab1_menu1_left[$k], $GUI_HIDE)
				GUICtrlSetState($main_Tab1_menu1_right[$k], $GUI_HIDE)
			EndIf
			GUICtrlSetState($main_Tab4_menu1_arrow[$k], $GUI_HIDE)
		Next
	ElseIf Number($MAIN_Tab4_NextEvent[0]) <= 2 Then
		GUICtrlSetPos($main_Tab4_menu1_control[0][2], Default, Default, 217)
		GUICtrlSetPos($main_Tab4_menu1_control[2][2], Default, Default, 64 + 107)
		For $k = 0 To 3
			If $k <= 1 Then
				GUICtrlSetState($main_Tab1_menu1_left[$k], $GUI_SHOW)
				GUICtrlSetState($main_Tab1_menu1_right[$k], $GUI_SHOW)
			EndIf
			GUICtrlSetState($main_Tab4_menu1_arrow[$k], $GUI_SHOW)
		Next
	EndIf
	$main_Tab1_Event[0] = 1
	_MAIN_Tab1_SetEventCalendar()
	_MAIN_Tab4_SetEventCalendar()
EndFunc   ;==>_MAIN_Tab4_ShowCalendar


Func _MAIN_NOTE_RESET($id_note)
	For $i = 1 To 6
		If $id_note = $main_note_list[$i + ($main_note_page[1] - 1) * 6] Then
			GUICtrlSetData($main_Tab2_menu2_NOTE[$i * 2 - 2], $ICON_NOTESTICK)
			GUICtrlSetColor($main_Tab2_menu2_NOTE[$i * 2 - 2], _EDITOR_GETEditSetting($id_note, 9))
			GUICtrlSetData($main_Tab2_menu2_NOTE[$i * 2 - 1], _EDITOR_GETEditSetting($id_note, 1))
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_MAIN_NOTE_RESET
Func _MenuMain_NoteClick($iCtrlID)
	For $i = 0 To 5
		If $iCtrlID = $main_Tab2_menu2_NOTEHover[$i] Then
			If $i + 1 + ($main_note_page[1] - 1) * 6 <= $main_note_list[0] Then
				_NOTEEDIT_GUICreateControl($main_note_list[$i + 1 + ($main_note_page[1] - 1) * 6])
			EndIf
		EndIf
	Next
EndFunc   ;==>_MenuMain_NoteClick
Func _MAIN_NOTE_SetPage($page = '')
	
	If $page = '' Then $page = $main_note_page[1]
	If $main_note_page[1] <= $main_note_page[0] Then
		For $i = 1 To 6
			If $i + ($page - 1) * 6 > $main_note_list[0] Then
				
				GUICtrlSetData($main_Tab2_menu2_NOTE[$i * 2 - 1], '')
				GUICtrlSetData($main_Tab2_menu2_NOTE[$i * 2 - 2], '')
			Else
				Local $id_note = $main_note_list[$i + ($page - 1) * 6]
				GUICtrlSetData($main_Tab2_menu2_NOTE[$i * 2 - 2], $ICON_NOTESTICK)
				GUICtrlSetColor($main_Tab2_menu2_NOTE[$i * 2 - 2], _EDITOR_GETEditSetting($id_note, 9))
				GUICtrlSetData($main_Tab2_menu2_NOTE[$i * 2 - 1], _EDITOR_GETEditSetting($id_note, 1))
			EndIf
		Next
		If $page = 1 Then
			If $main_note_list[0] > 6 Then
				GUICtrlSetData($main_Tab2_menu2_NoteText, 'và ' & $main_note_list[0] - 6 & ' ghi chú khác')
			Else
				GUICtrlSetData($main_Tab2_menu2_NoteText, $main_note_list[0] > 0 ? 'bạn đánh dấu ' & $main_note_list[0] & ' ghi chú' : "Không có ghi chú đánh dấu")
			EndIf
		Else
			GUICtrlSetData($main_Tab2_menu2_NoteText, $page & '/' & $main_note_page[0])
		EndIf
	Else
		$main_note_page[1] = 1
		;_MAIN_NOTE_SetPage()
	EndIf
EndFunc   ;==>_MAIN_NOTE_SetPage
Func _MenuMain_Note_ChangePage($flag = True)
	; true: up , false : down
	If $main_note_page[0] < 2 Then Return 0
	If $flag == True Then
		If $main_note_page[1] >= $main_note_page[0] Then Return 0
		$main_note_page[1] += 1
	Else
		If $main_note_page[1] < 2 Then Return 0
		$main_note_page[1] -= 1
	EndIf
	_MAIN_NOTE_SetPage()
EndFunc   ;==>_MenuMain_Note_ChangePage
Func _MAIN_NOTE_SetList()
	$main_note_page[0] = 1
	$main_note_page[1] = 1
	$main_note_list[0] = 0
	Local $number_new_note = 0
	Local $temp = IniReadSection($Database, "NOTE")
	If @error Then
		GUICtrlSetData($main_Tab2_menu1_Text[0], 0)
		GUICtrlSetData($main_Tab2_menu1_Text[2], 'Nhấp vào đây để' & @CRLF & 'xem các ghi chú của bạn')
	Else
		For $i = $temp[0][0] To 1 Step -1
			$id_note = $temp[$i][0]
			If @YDAY - Number(_EDITOR_GETEditSetting($id_note, 11)) <= 7 Or _EDITOR_GETEditSetting($id_note, 11) = '-1' Then $number_new_note += 1
			If _EDITOR_GETEditSetting($id_note, 3) == '1' Then ; nếu nó được đánh dấu
				$main_note_list[0] += 1
				$main_note_list[$main_note_list[0]] = $id_note
			EndIf
		Next
		
		GUICtrlSetData($main_Tab2_menu1_Text[0], $temp[0][0])
		If $temp[0][0] = 0 Then
			GUICtrlSetData($main_Tab2_menu1_Text[2], 'Nhấp vào đây để' & @CRLF & 'xem các ghi chú của bạn')
		Else
			If $number_new_note = 0 Then
				GUICtrlSetData($main_Tab2_menu1_Text[2], 'Không có ghi chú nào mới' & @CRLF & 'trong 7 ngày qua :(')
			Else
				GUICtrlSetData($main_Tab2_menu1_Text[2], 'Nhiều hơn ' & $number_new_note & ' ghi chú' & @CRLF & 'so với 7 ngày trước :D')
			EndIf
		EndIf
	EndIf
	
	$main_note_page[0] = Int($main_note_list[0] / 6)
	If $main_note_page[0] * 6 < $main_note_list[0] Or $main_note_page[0] = 0 Then $main_note_page[0] += 1
	_MAIN_NOTE_SetPage()
EndFunc   ;==>_MAIN_NOTE_SetList
#EndRegion Các hàm chức năng liên quan của GUI MAIN

#Region Các hàm chức năng khác của GUI MAIN
Func _Tab_Swich($tab)
	If $main_Tab[0] = $tab Then Return 0
	
	GUICtrlSetFont($main_Tab[$main_Tab[0]], 15, 300, 0, "Segoe UI")
	$main_Tab[0] = $tab
	$flag_TabSlider = True
	;_MoveTabSlider($main_Tab[$tab])
	_GUICtrlTab_SetCurFocus($main_TabCtrl, $tab - 1)
	If $tab = 5 Then
		_Tab5_ShowTab(0)
	Else
		If IsHWnd($MAIN_SETTING) Then GUIDelete($MAIN_SETTING)
	EndIf
EndFunc   ;==>_Tab_Swich
Func _MoveLichSlider($id)
	$flag_LichSlider = False
	Local $temp1 = ControlGetPos($GUILICH, '', $LICH_Menu_Mon[3])
	Local $temp2, $temp3
	Local $iX, $iW_change, $iW, $iStep
	If $id = 0 Then
		$temp2 = ControlGetPos($GUILICH, '', $LICH_Menu_Mon[0])
		$iX = $temp2[0]
		$iW = $temp2[2]
	ElseIf $id = 1 Then
		$temp2 = ControlGetPos($GUILICH, '', $LICH_Menu_Mon[1])
		$temp3 = ControlGetPos($GUILICH, '', $LICH_Menu_Mon[4])
		$iX = $temp2[0] > $temp3[0] ? $temp3[0] : $temp2[0]
		$iW = $temp2[2] + $temp3[2]
	ElseIf $id = 2 Then
		$temp2 = ControlGetPos($GUILICH, '', $LICH_Menu_Mon[2])
		$temp3 = ControlGetPos($GUILICH, '', $LICH_Menu_Mon[5])
		$iX = $temp2[0] > $temp3[0] ? $temp3[0] : $temp2[0]
		$iW = $temp2[2] + $temp3[2]
	Else
		$iX = 0
		$iW = 865
		
	EndIf
	$iW_change = $temp1[2]
	$iStep = $temp1[0] > $iX ? -4 : 4
	For $i = $temp1[0] To $iX Step $iStep
		If $flag_LichSlider And $id = -1 Then Return 0
		If $iW_change <> $iW Then
			$iW_change = $iW_change > $iW ? $iW_change - 6 < $iW ? $iW : $iW_change - 6 : $iW_change + 6 > $iW ? $iW : $iW_change + 6
		EndIf
		GUICtrlSetPos($LICH_Menu_Mon[3], $i, Default, $iW_change)
		
	Next
	
	GUICtrlSetPos($LICH_Menu_Mon[3], $iX, Default, $iW)
EndFunc   ;==>_MoveLichSlider

Func _MoveSearchIcon($flag = False)
	GUICtrlSetState($NOTE_Group[1][0], $GUI_SHOW)
	Local $iA, $iB, $iStep
	; true là đút dzô, false là đút ra. range từ 336 - 373
	$iA = $flag ? 373 : 336
	$iB = $flag ? 336 : 373
	$iStep = $flag ? -2 : 2
	For $i = $iA To $iB Step $iStep
		GUICtrlSetPos($NOTE_Group[1][0], $i)
		Sleep(10)
	Next
	If $flag Then GUICtrlSetState($NOTE_Group[1][0], $GUI_HIDE)
EndFunc   ;==>_MoveSearchIcon
Func _Effect_LoadGUI($hGUI, $flag = True, $max = 0, $speed = 0)
	; flag: True là fade in, false out
	Local $iA, $iB, $iStep
	$iA = $flag ? 0 : 255
	$iB = $flag ? 255 : 0
	$iStep = $flag ? 10 + $speed : -10 + $speed
	If $max <> 0 Then
		$iA = $flag ? $iA : $max
		$iB = $flag ? $max : $iB
	EndIf
	WinSetTrans($hGUI, '', $iA)
	For $i = $iA To $iB Step $iStep
		WinSetTrans($hGUI, '', $i)
		Sleep(10)
	Next
	WinSetTrans($hGUI, '', $iB)
EndFunc   ;==>_Effect_LoadGUI
Func _DisableGUI($hGUI)
	GUISetState(@SW_DISABLE, $hGUI)
	WinSetOnTop($hGUI, '', 1)
	Local $pos = WinGetPos($hGUI)
	Local $GUI_Temp = GUICreate('', $pos[2], $pos[3], $pos[0], $pos[1], $WS_POPUP, BitOR($WS_EX_TOOLWINDOW, $WS_EX_TOPMOST))
	GUISetBkColor(0x808080)
	WinSetTrans($GUI_Temp, '', 100)
	GUISetState(@SW_SHOW, $GUI_Temp)
	GUISetState(@SW_DISABLE, $GUI_Temp)
	Return $GUI_Temp
EndFunc   ;==>_DisableGUI
Func _EnableGUI($hGUI1, $hGUI2)
	WinSetOnTop($hGUI1, '', 0)
	GUISetState(@SW_ENABLE, $hGUI1)
	GUIDelete($hGUI2)
EndFunc   ;==>_EnableGUI
Func _Exit()
	Exit
EndFunc   ;==>_Exit
Func _Hide()
	GUISetState(@SW_HIDE, $GUIMAIN)
	If $MAIN_NOTI = 0 Then _Notification_GUI(2, 2, 1, "Mở lại chương trình từ icon bên dưới", "OPHi Student vẫn hoạt động", '')
	$MAIN_NOTI = 1
EndFunc   ;==>_Hide

Func _MAIN_Show()
	Local $pos_GUI = WinGetPos($GUIMAIN)
	Local $pos_x = Int(@DesktopWidth / 2 - $pos_GUI[2] / 2)
	Local $pos_y = Int(@DesktopHeight / 2 - $pos_GUI[3] / 2)
	WinMove($GUIMAIN, '', $pos_x, $pos_y)
	$item_move_TabSlider = $main_Tab[1]
	_MoveTabSlider($main_Tab[1])
	GUISetState(@SW_SHOW, $GUIMAIN)
	_Tab_Swich(1)
	
EndFunc   ;==>_MAIN_Show
#EndRegion Các hàm chức năng khác của GUI MAIN
