//%attributes = {}

C_TEXT:C284($0;$1;$TXT)

$TXT:=$1

While (Match regex:C1019("^[\\n\\r\\s\\t]";$TXT;1))
	$TXT:=Substring:C12($TXT;2)
End while 

While (Match regex:C1019("[\\n\\r\\s\\t]$";$TXT;1))
	$TXT:=Substring:C12($TXT;1;Length:C16($TXT)-1)
End while 

$0:=$TXT
