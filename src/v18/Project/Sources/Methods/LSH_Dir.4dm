//%attributes = {}

cast 

C_TEXT:C284($1;$dir)

If (Count parameters:C259>=1)
	
	$dir:=$1
	
	If (Test path name:C476($dir)=Is a folder:K24:2)
		If ($dir#("@"+Folder separator:K24:12))
			$dir:=$dir+Folder separator:K24:12
		End if 
	Else 
		$dir:=""
	End if 
	
End if 

<>system.dirHost:=$dir
