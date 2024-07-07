$path = ""
$file = Get-Content $path 
#need a check for null path 
$fileAge = Get-ItemProperty $path
$fullDate = Get-Date
$olderThan = $fullDate.AddHours(-1)
$seconds = 10
$wait = $false
$i = 0
$e = 9001

$fileChange = $false

do {
    
    if ($fileAge.LastWriteTime -lt $olderThan)
    {
        
    }
    else {
        
    }

} until ( $i -eq $e)