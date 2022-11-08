//%attributes = {}

$OBJ:=New object:C1471
$OBJ.sec:=150
$OBJ.min:=20
$OBJ.hour:=0

C_OBJECT:C1216(<>system)
<>system:=New object:C1471
<>system.interval:=$OBJ

C_TEXT:C284($DT_NOW;$DT_NEXT)

$DT_NEXT:=datetime (\
Current date:C33;Current time:C178;0;\
<>system.interval.hour;\
<>system.interval.min;\
<>system.interval.sec)

While (<>system.loop)
	
	$DT_NOW:=datetime 
	
	If ($DT_NOW>=$DT_NEXT)
		
		$PATH:=New log file:C926
		
		$DT_NEXT:=datetime (\
			Current date:C33;Current time:C178;0;\
			<>system.interval.hour;\
			<>system.interval.min;\
			<>system.interval.sec)
		
	End if 
	
	DELAY PROCESS:C323(Current process:C322;60)
	
End while 
