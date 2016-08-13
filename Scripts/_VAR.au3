;_VAR.au3
; Khai báo biến MAIN
Global Const $VERSION = '1.3'
Global Const $Note_Dir = @ScriptDir & '\Data\Note'
DirCreate($Note_Dir)
Global Const $Database = @ScriptDir & '\Data\Database.opdo'
Global $iPressed = 0, $iLastCtrlID = -1, $iLastiMouse ; chạy thanh trong suốt EDITOR
Global $iLasthGUI[20][20] ; dùng cho control hover event EDITOR GUI
Global $time_TabSlider, $flag_TabSlider = False, $item_move_TabSlider = 0 ; dùng để chạy hiệu ứng slider MAIN GUI
Global $time_Logo, $flag_Logo = True ; dùng để chạy hiệu ứng Logo MAIN GUI
Global $flag_LichSlider = False, $time_LichSlider, $time_LichSlider_Wait = 100, $item_move_LichSlider = -1, $MAIN_NOTI = 0
Global $MAIN_MDAY = @MDAY
;_MAIN.au3
Global $main_Tab1_menu1_left[2], $main_Tab1_menu1_Text[4], $main_Tab1_menu1_right[2], $main_Tab1_menu1[2], $main_Tab2_menu1[2], $main_Tab2_menu1_Text[3], $main_TabCtrl, $main_Tab1_Event[2]
Global Const $MAIN_NOTE_NUMBER = 50
Global $main_note_list[$MAIN_NOTE_NUMBER], $main_note_page[2] ; slot column 0: chứa số lượng, x: id note
Global $MAIN_Tab4_NextEvent[50], $main_Tab1_menu2_tkbcount, $main_Tab1_menu2_nen
Global Const $NOTE_SETTING_SLOT = 11 ; cái này để lầy trong _EDITOR_EditSetting, _EDITOR_GETEditSetting, _EDITOR_AddLostSetting
Global $MAIN_Tab4_Date[4]
Global $MAIN_tkb[50] ; lưu thời khóa biểu
Global $main_Tab2_menu1_Text1, $main_Tab2_menu1_Text2, $main_Tab2_menu1_Text3, $main_Tab2_menu1_Text4
Global $main_Tab2_menu1_tkb[5][4]
Global $MAIN_Tab5_Control[3], $MAIN_Tab5_Button[4]
Global $main_Tab4_menu2_control[6]
Global $main_Tab4_menu2_arrow[4]
Global $main_Tab4_menu1_control[6][4], $main_Tab4_menu1_arrow[4]
Global $main_Tab4_menu3_button[4][4]
Global $main_Tab1_menu2_TKB[8], $main_Tab1_menu2_TKBHover[4]
Global $main_Tab1_menu2_arrow[2], $main_Tab1_menu2_tkb_text
Global $main_Tab1_menu1_Text[3], $main_Percent_nen, $main_Percent,$main_Tab1_menu1_Title
Global $main_Tab2_menu1_Title
Global $main_Tab2_menu2_NOTE[12], $main_Tab2_menu2_NOTEHover[12]
Global $main_Tab2_menu2_arrow[2], $main_Tab2_menu2_NoteText
Global $main_Tab2_menu3_button[4][4]

; FILE _CHOSSEDATE.au3
Global $CHOOSEDATE, $CHOOSEDATE_choose[3], $CHOOSEDATE_Date[7 * 6 + 1], $CHOOSEDATE_Label[4], $CHOOSEDATE_Mon[13], $CHOOSEDATE_Year[13]
Global $CHOOSEDATE_TabCtrl, $CHOOSEDATE_Tab = 0, $CHOOSEDATE_type

; FILE _ADD_EVENT.au3
Global $GUIEventAdd, $ADDEVENT_type = 0, $ADDEVENT_ID
Global $ADDEVENT_Choose_Type[3], $ADDEVENT_Button[3], $ADDEVENT_Setting[20][3]
Global $ADDEVENT_Control_Color[24][2], $ADDEVENT_Color[2], $ADDEVENT_GUITemp, $ADDEVENT_GUITemp2
Global Const $ADDEVENT_SETTING_SLOT = 11 ; [1 title] [2 des] [3 ưu tiên] [4 nhắc nhở] [5 date start] [6 date end] [7 time start] [8 time end] [9 repeat] [10 color] [11 icon]
Global Const $ADDEVENT_SETTING_COLOR = '0x0057e7,0xca2723,0xff4500,0xeeee00,0x0aa05c,0x6488a8,0x631639,0xfefefe,0x202020,0x808080'
Global Const $ADDEVENT_SETTING_COLORNAME = 'Mặc định|Đỏ|Cam|Vàng|Lục|Lam|Tím|Trắng|Đen|Xám'
Global Const $ADDEVENT_SETTING_ICON = '|||||||||||||'
Global Const $ADDEVENT_SETTING_REPEAT = 'Không lặp lại|Lặp lại hằng năm|Lặp lại hằng tháng|Lặp lại hằng tuần|Lặp lại hằng ngày'
Global Const $ADDEVENT_PRIORITY = 'Không|Bình thường|Quan trọng|Rất quan trọng'
Global Const $ADDEVENT_NHACNHO = 'Không|Trước một tháng|Trước một tuần|Trước 3 ngày|Trước 2 ngày|Trước 1 ngày'
Global Const $THU_TU_NGAY = 'Thứ hai|Thứ ba|Thứ tư|Thứ năm|Thứ sáu|Thứ bảy|Chủ nhật'

; FILE _GUITKB.au3
Global $GUITKB, $GUITKB2, $GUI_TKB[50], $GUITKB2_MonHoc[50][2], $TBK_Button1, $TBK_Button2, $TBK_Button3, $TBK_Button_dstkb[5], $TKB_TabCtrl, $TBK_Tab1, $TBK_Tab2
Global $GUITKB2_text_Dateline[7], $GUITKB2_text_Date[7], $GUITKB2_text_Hour[25], $GUITKB2_text_Hourline[25], $GUITKB2_text_Date_today, $GUITKB2_text_no, $GUITKB2_text_Date_nen
Global $GUITKB_State = 0
Global $TKB2_Mon_Control[50][2]

; FILE _TKB_ADD.au3
Global $ADDTKB_State = 0;
Global Const $GUITKB_ADD_START = 4 ; vị trí bắt đầu giờ học trong cấu trúc ini

; ICON
Global Const $ICON_NOTE = ''
Global Const $ICON_OPEN = ''
Global Const $ICON_STUDY = ''
Global Const $ICON_ADD = ''
;~ Global Const $ICON_ARROW_LEFT = '◀'
;~ Global Const $ICON_ARROW_RIGHT = '▶'
Global Const $ICON_ARROW_LEFT = ''
Global Const $ICON_ARROW_RIGHT = ''
Global Const $ICON_SETTING = ''
Global Const $ICON_STICK = ''
Global Const $ICON_EVENT = ''
Global Const $ICON_LICH = ''
Global Const $ICON_ONTOP = ''
Global Const $ICON_RURLE = ''
Global Const $ICON_NOTESTICK = ''