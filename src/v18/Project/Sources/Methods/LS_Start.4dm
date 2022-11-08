//%attributes = {"shared":true}
  //< ミラーリングプロセスの始動 >

  //第1引数 ( 必須 ) : 動作モード 【 テキスト型 】　( "host" または "mirror" )
  //第2引数 ( 必須 ) : 本番サーバホスト名またはIPアドレス 【 テキスト型 】
  //第3引数 ( 任意 ) : ミラーリング間隔(秒) 【 倍長整数型 】　( デフォルト 0 )
  //第4引数 ( 任意 ) : ミラーリング間隔(分) 【 倍長整数型 】　( デフォルト 5 )
  //第5引数 ( 任意 ) : ミラーリング間隔(時間) 【 倍長整数型 】　( デフォルト 0 )
  //戻り値 : 始動した場合は True 【 ブール型 】 ( 4D Serverでない場合は常時 False )

  //※1 4D Server以外では実行されないので注意
  //※2 第3～5引数が全て 0 の場合はミラーリングしない
  //※3 ミラーマシンを立ち上げる時は4D(非Server)で
  //　　　第1引数を "mirror" に修正してから4D Serverで起動してください

cast 

C_BOOLEAN:C305($0;$FLG_Launch)
C_TEXT:C284($1;$MODE)
C_TEXT:C284($2;$IP)
C_LONGINT:C283($3;$sec)
C_LONGINT:C283($4;$min)
C_LONGINT:C283($5;$hour)

C_LONGINT:C283($process)
C_OBJECT:C1216($OBJ)

$FLG_Launch:=(Count parameters:C259>=2)

If ($FLG_Launch)
	
	$MODE:=Lowercase:C14(trim ($1))
	$IP:=trim ($2)
	
	If (Count parameters:C259>=3)
		$sec:=$3
		If ($sec<0)
			$sec:=0
		End if 
	End if 
	
	If (Count parameters:C259>=4)
		$min:=$4
		If ($min<0)
			$min:=0
		End if 
	End if 
	
	If (Count parameters:C259>=5)
		$hour:=$5
		If ($hour<0)
			$hour:=0
		End if 
	End if 
	
	$OBJ:=New object:C1471
	$OBJ.sec:=$sec
	$OBJ.min:=$min
	$OBJ.hour:=$hour
	
	$FLG_Launch:=(Application type:C494=4D Server:K5:6)
	
End if 

If ($FLG_Launch)
	
	<>system.mode:=$MODE
	<>system.interval:=$OBJ
	<>system.loop:=True:C214
	
	Case of 
		: ($MODE="host")
			
			If (Not:C34(processVisible ("LS_Host")))
				$process:=New process:C317("LS_Host";0;"LS_Host";$OBJ)
			End if 
			
		: ($MODE="mirror")
			
			If (Not:C34(processVisible ("LS_Mirror")))
				$process:=New process:C317("LS_Mirror";0;"LS_Mirror";$OBJ)
			End if 
			
	End case 
	
End if 

$0:=$FLG_Launch
