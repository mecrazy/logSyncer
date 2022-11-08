//%attributes = {}

C_BOOLEAN:C305($0;$visible)
C_TEXT:C284($1;$NAME)
C_POINTER:C301($2)
C_OBJECT:C1216($OBJ)

ARRAY LONGINT:C221($alPNum;0)
ARRAY TEXT:C222($atPName;0)
ARRAY LONGINT:C221($alPState;0)
ARRAY LONGINT:C221($alPTime;0)
ARRAY BOOLEAN:C223($abPVisible;0)

C_LONGINT:C283($pos)
C_LONGINT:C283($P_Num)
C_TEXT:C284($P_Name)
C_LONGINT:C283($P_State)
C_LONGINT:C283($P_Time)
C_BOOLEAN:C305($P_Visible)

$OBJ:=New object:C1471

If (Count parameters:C259>=1)
	$NAME:=trim ($1)
End if 

If ($NAME="")
	$visible:=False:C215
Else 
	processList (->$alPNum;->$atPName;->$alPState;->$alPTime;->$abPVisible)
	$pos:=Find in array:C230($atPName;$NAME)
	$visible:=($pos>0)
	
	If ($visible)
		$P_Num:=$alPNum{$pos}
		$P_Name:=$atPName{$pos}
		$P_State:=$alPState{$pos}
		$P_Time:=$alPTime{$pos}
		$P_Visible:=$abPVisible{$pos}
	End if 
	
End if 

$OBJ.num:=$P_Num
$OBJ.name:=$P_Name
$OBJ.state:=$P_State
$OBJ.time:=$P_Time
$OBJ.visible:=$P_Visible

$0:=$visible

If (Count parameters:C259>=2)
	$2->:=OB Copy:C1225($OBJ)
End if 

