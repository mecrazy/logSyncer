//%attributes = {}

C_POINTER:C301($1;$2;$3;$4;$5)
ARRAY LONGINT:C221($alPNum;0)
ARRAY TEXT:C222($atPName;0)
ARRAY LONGINT:C221($alPState;0)
ARRAY LONGINT:C221($alPTime;0)
ARRAY BOOLEAN:C223($abPVisible;0)

C_LONGINT:C283($i;$sizeI;$pos)
C_BOOLEAN:C305($saveFlg)
C_TEXT:C284($pName)
C_LONGINT:C283($pState;$pTime)
C_BOOLEAN:C305($pVisible)

  //プロセス情報取得
$sizeI:=1000
For ($i;1;$sizeI)
	$saveFlg:=True:C214
	PROCESS PROPERTIES:C336($i;$pName;$pState;$pTime;$pVisible)
	Case of 
		: (($pState=0) | ($pState=1) | ($pState=5))
			
		: (($pState=-1) | ($pState=2) | ($pState=3) | ($pState=4))
			  //$saveFlg:=False
		Else 
			$saveFlg:=False:C215
	End case 
	If ($saveFlg)
		APPEND TO ARRAY:C911($alPNum;$i)
		APPEND TO ARRAY:C911($atPName;$pName)
		APPEND TO ARRAY:C911($alPState;$pState)
		APPEND TO ARRAY:C911($alPTime;$pTime)
		APPEND TO ARRAY:C911($abPVisible;$pVisible)
	End if 
End for 

COPY ARRAY:C226($alPNum;$1->)
COPY ARRAY:C226($atPName;$2->)
COPY ARRAY:C226($alPState;$3->)
COPY ARRAY:C226($alPTime;$4->)
COPY ARRAY:C226($abPVisible;$5->)
