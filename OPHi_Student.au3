#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=C:\Users\vinhp\Desktop\Software\favicon.ico
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Res_Comment=OPHi Student
#AutoIt3Wrapper_Res_Description=OPHi Student
#AutoIt3Wrapper_Res_Fileversion=1.3.0.0
#AutoIt3Wrapper_Res_LegalCopyright=OPDO.VN
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#Au3Stripper_Parameters=/so /tl
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs======================================================================
	Project: OPHi Student
	Author: VinhPham (opdo.vn)
	Version: 1.3
	Source: AutoIT
#ce======================================================================
Opt("GUIOnEventMode", 1) ; sử dụng Event Mode
Opt("TrayMenuMode", 1)
Opt("TrayOnEventMode", 1)
FileInstall('Logo.bmp',@ScriptDir& '\Images\Logo.bmp',1)
; include
#include <Icons.au3>
#include <ComboConstants.au3>
#include <GuiRichEdit.au3>
#include <WinAPI.au3>
#include <Color.au3>
#include <Misc.au3>
#include <String.au3>
#include <APIGdiConstants.au3>
#include <WinAPIGdi.au3>

#include "Scripts\_VAR.au3" ; var
; form
#include "Forms\GUIMAIN.isf"

; orther scipt
#include "Scripts\UDF\GUICtrlOnHover.au3"
#include "Scripts\UDF\onEventFunc.au3"
#include "Scripts\UDF\StringSize.au3"
#include "Scripts\UDF\GUIScrollbars_Ex.au3"
#include "Scripts\UDF\_ControlHover.au3"
#include "Scripts\myControl.au3"
#include "Scripts\_Msgbox.au3"
#include "Scripts\_MAIN.au3"
#include "Scripts\_EDITOR.au3"
#include "Scripts\_NOTE.au3"
#include "Scripts\_SETTING.au3"
#include "Scripts\_ADD_EVENT.au3"
#include "Scripts\_CHOOSEDATE.au3"
#include "Scripts\_LICH_NEW.au3"
#include "Scripts\_TKB_ADD.au3"
#include "Scripts\_GUITKB.au3"
#include "Scripts\_Notification.au3"
#include "Scripts\_TrayMenuGUI.au3"
#include "Scripts\_WIDGET.au3"
#include "Scripts\_CheckUPDATE.au3"
_WinAPI_AddFontResourceEx(@ScriptDir & '\Data\fontawesome.ttf', $FR_PRIVATE) ; load font
; your code below here
If _Singleton("OPHi_Student", 1) = 0 Then Exit

If _Iniread($Database, 'Pro5', "Name", "") = "" Then _iniwrite($Database, 'Pro5', "Name", "bạn")


GUISwitch($GUIMAIN)
_GUIMain_Prepare()
_SetImage($main_Percent, @ScriptDir & '\Images\Process\0.png')
_SetImage($main_Percent_nen, @ScriptDir & '\Images\Process\nen.png')
_Set_SSCtrlHover() ; set on hover control
_LogoClick() ; set color effect
GUISetState(@SW_SHOW, $GUIMAIN) ; show GUI
_Load()
TraySetOnEvent($TRAY_EVENT_PRIMARYDOWN, '_TrayMenuGUI')
TraySetOnEvent($TRAY_EVENT_SECONDARYDOWN, '_TrayMenuGUI')
Global $MAIN_CHECK_UPDATE = _CheckUpdate(1) , $MAIN_CHECK_UPDATE_FLAG = True
if Number(RegRead('HKEY_CURRENT_USER\SOFTWARE\opdo\HiStudent', 'Frist_Time')) = 0 Then
	_Msgbox(64,'Cập nhật 1.2','Phiên bản cập nhật 1.2 bao gồm các nội dung:'&@CRLF&'- Thay đổi giao diện các bảng thông báo'&@CRLF&'- Điều chỉnh một số mã màu trong sự kiện'&@CRLF&'- Điều chỉnh hiển thị mã màu của ghi chú'&@CRLF&'- Hoàn thiện chức năng startup khi windows khởi động'&@CRLF&'- Và một số điều chỉnh khác cho bạn!')
	if _Msgbox(48+4,'Cám ơn!','Cám ơn bạn đã sử dụng OPHi Student. Nếu có điều kiện, hãy donate ủng hộ để chúng tôi có thể cống hiến nhiều hơn cho bạn và cộng đồng ^^'&@CRLF&'Bạn có muốn mở link donate bây giờ?') = 6 Then ShellExecute('http://www.opdo.vn/p/ong-gop-cho-tac-gia.html')
	RegWrite('HKEY_CURRENT_USER\SOFTWARE\opdo\HiStudent', 'Frist_Time', 'REG_SZ', 1)
EndIf
While 1
	Sleep(10)
	if $MAIN_CHECK_UPDATE_FLAG then
		
		if InetGetInfo ($MAIN_CHECK_UPDATE)[2] Then
			$MAIN_CHECK_UPDATE_FLAG = False
			if _CheckUpdate(2) Then
				$ver = IniRead(@TempDir&'\update.ini','Update','Version',$VERSION)
				_Notification_GUI(3, IniRead(@TempDir&'\update.ini','Update','Link','www.opdo.vn'), 1, "Click vào để tải phiên bản "&$ver, "Có phiên bản mới", '')
				
				
			EndIf
		Elseif InetGetInfo ($MAIN_CHECK_UPDATE)[4] Then
			
			$MAIN_CHECK_UPDATE_FLAG = False
		EndIf
	EndIf
	If $iPressed Then _Move_Transparent_Control()
	If $flag_TabSlider And TimerDiff($time_TabSlider) > 100 Then _MoveTabSlider($item_move_TabSlider) ; di chuyển tab slider về vị trí cũ
	If $flag_LichSlider And TimerDiff($time_LichSlider) > $time_LichSlider_Wait Then _MoveLichSlider($item_move_LichSlider)
	If Not $flag_Logo And TimerDiff($time_Logo) > 5000 Then ; phục vụ cho mục đích cao cả, hiệu ứng logo nhún nhún
		_MoveLogo(False)
		$flag_Logo = True
	EndIf
	If Number($NOTIFI_GUI[0]) > 0 Then
		For $i = 1 To Number($NOTIFI_GUI[0])
			Local $control = $NOTIFI_GUI[$i]
			If IsArray($control) Then
				If TimerDiff($control[4]) > $SETTING_POPUP_TIME * 1000 Then
					_Notification_DelGUI($i)

				EndIf
			EndIf
		Next
	EndIf
	If Number($NOTIFI_DS[0]) > 0 Then
		If Number($NOTIFI_GUI[0]) < $SETTING_NUMBER_POPUP - 1 Then
			For $i = Number($NOTIFI_GUI[0]) To $SETTING_NUMBER_POPUP - 1
				If Number($NOTIFI_DS[0]) <= 0 Then ExitLoop
				_Notification_GUI(StringSplit($NOTIFI_DS[1], '|')[2], StringSplit($NOTIFI_DS[1], '|')[1], 1)
				$NOTIFI_DS[1] = ''
				For $j = 1 To $NOTIFI_DS[0] - 1
					$NOTIFI_DS[$j] = $NOTIFI_DS[$j + 1]
				Next
				$NOTIFI_DS[0] -= 1
			Next
		EndIf
	EndIf
	If $MAIN_MDAY <> @MDAY Then
		$MAIN_MDAY = @MDAY
		_MAIN_SetWelcome()
		_Load_Notification()
	EndIf
	If IsHWnd($TrayMenuGUI) Then
		If TimerDiff($TrayMenuTimer) > 2500 and WinExists($TrayMenuGUI) or not WinActive($TrayMenuGUI) Then
			_TrayMenuGUI_Del()
		EndIf
	EndIf
	
WEnd

Func _TrayMenuGUI_Del()
	Local $trans = 250
	For $i = @DesktopHeight - 164 - 50 To @DesktopHeight - 164 Step 5
		$trans -= 10
		WinMove($TrayMenuGUI, '', Default, $i)
		WinSetTrans($TrayMenuGUI, '', $trans)
		Sleep(20)
	Next
	GUIDelete($TrayMenuGUI)
EndFunc   ;==>_TrayMenuGUI_Del
Func _Load()
	_SETTING_LOAD_PROGRAMSETTING()
	if _IniRead($Database, "Pro5", "Note1",1) =1 then _SETTING_NOTE_LoadStick()
	_Load_Notification()
	_LoadWidget()
EndFunc