;_CheckUPDATE.au3

Global Const $HOST = 'http://bbd789fef5ccb909481f722a98e0e2d041bc4791-www.googledrive.com/host/0B7ji-w0T3os-ZExaSkc0NVVMbzA/update.ini'
Func _CheckUpdate($flag = 0) ; flag = 1 download in background , = 2 có sẵn file
	if $HOST = '' then Return False
	if $flag < 2 then FileDelete(@TempDir&'\update.ini')
	if $flag = 1 Then 
		return InetGet($HOST,@TempDir&'\update.ini',1,1)
	EndIf
	if $flag = 0 Then InetGet($HOST,@TempDir&'\update.ini',1)
	
	If Not @error or $flag = 2 Then
		
		Local $lastest = IniRead(@TempDir&'\update.ini','Update','Version',$VERSION)
		if _VersionCompare($VERSION,$lastest) = -1 Then Return True
	EndIf
	Return False
EndFunc