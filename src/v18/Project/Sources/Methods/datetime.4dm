//%attributes = {}

C_TEXT:C284($0;$DT)
C_DATE:C307($1;$date)
C_TIME:C306($2;$time)
C_LONGINT:C283($3;$days)
C_LONGINT:C283($4;$hours)
C_LONGINT:C283($5;$minutes)
C_LONGINT:C283($6;$seconds)

C_LONGINT:C283($hh;$mm;$ss)

If (Count parameters:C259>=1)
	$date:=$1
Else 
	$date:=Current date:C33
End if 

If (Count parameters:C259>=2)
	$time:=$2
Else 
	$time:=Current time:C178
End if 

If (Count parameters:C259>=3)
	$days:=$3
End if 

If (Count parameters:C259>=4)
	$hours:=$4
End if 

If (Count parameters:C259>=5)
	$minutes:=$5
End if 

If (Count parameters:C259>=6)
	$seconds:=$6
End if 

$date:=Add to date:C393($date;0;0;$days)

$hh:=Num:C11(Substring:C12(String:C10($time;HH MM SS:K7:1);1;2))+$hours
$mm:=Num:C11(Substring:C12(String:C10($time;HH MM SS:K7:1);4;2))+$minutes
$ss:=Num:C11(Substring:C12(String:C10($time;HH MM SS:K7:1);7;2))+$seconds

While ($ss<0)
	$ss:=$ss+60
	$mm:=$mm-1
End while 
While ($ss>=60)
	$ss:=$ss-60
	$mm:=$mm+1
End while 

While ($mm<0)
	$mm:=$mm+60
	$hh:=$hh-1
End while 
While ($mm>=60)
	$mm:=$mm-60
	$hh:=$hh+1
End while 

While ($hh<0)
	$hh:=$hh+24
	$date:=Add to date:C393($date;0;0;-1)
End while 
While ($hh>=24)
	$hh:=$hh-24
	$date:=Add to date:C393($date;0;0;1)
End while 

$DT:=String:C10($date;Internal date short:K1:7)+" "+\
String:C10($hh;"00")+":"+\
String:C10($mm;"00")+":"+\
String:C10($ss;"00")

$0:=$DT

