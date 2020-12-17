
[cmdletbinding()]
param([string]$inputFileName)
$fileContent = Get-Content $inputFileName
$fileContentLines=$fileContent.Split([Environment]::NewLine)
$tableColumnCount=0
$currentColumnCount=0
$concatenatedHTMLContent=""
$listOpened = $false

ForEach ($line in $fileContentLines){

    # Signifies the start of a markdown table
    If (($line.StartsWith("| Key |")) -or ($line.StartsWith("| Name |"))){
        $tableColumnCount=($line.Split("|")).count
        Write-Output $line
        continue
    }

    # Empty line in an existing table means time to close the table
    if(($line.Length -eq 0) -and ($tableColumnCount -gt 0)){
        $tableColumnCount=0
        $currentColumnCount=0
        $concatenatedHTMLContent=""
    }

    if($tableColumnCount -gt 0){
        $lineArray=$line.Split("|")
        $currentColumnCount=($lineArray).count    
    }
    # If you are not in a table or the table line contains the same number of columns
    # As the title line then just print it out.
    if(($currentColumnCount -eq $tableColumnCount) -or ($tableColumnCount -eq 0)){
        Write-Output $line
        continue
    }

    # Anything beyond this point must be in an open table
    if($tableColumnCount -eq $currentColumnCount +1){
        $lineStart=$lineArray[0..($lineArray.Length -2)] -join "|"
    }

    # As the line is split on the "|" the description line
    # 1.  For a table closing line will be the last but one cell
    # 2.  for a non-table closing line will be the last cell.
    if($line.Trim().EndsWith("|")){
        $lastItem=$lineArray[-2].Trim()
    }else{
        $lastItem=$lineArray[-1].Trim()
    }

    # Allow for detecting list starts
    if (($lastItem.StartsWith("*")) -or ($lastItem.StartsWith("_*"))){
        if ($listOpened -eq $false){
            $listOpened = $True
            $concatenatedHTMLContent+= "{0}</li>" -f $lastItem.Replace("_*","_<ul><li>").Replace("*","<ul><li>")
        }else{
            $concatenatedHTMLContent+= "<li>{0}</li>" -f $lastItem.TrimStart("*")
        }
    }else{
        # Test that isn't in a list
        if($lastItem.Length -gt 0){
            if($listOpened -eq $True){
                $listOpened = $false
                $concatenatedHTMLContent +="</ul>"
            }
            $concatenatedHTMLContent+="<p>{0}</p>" -f $lastItem
        }
    }

    if($line.EndsWith("|")){
        if($listOpened -eq $True){
            $listOpened = $false
            $concatenatedHTMLContent+="</ul>|"
        }else{
            $concatenatedHTMLContent+="|"
        }
        Write-output ("{0}|{1}" -f $lineStart,$concatenatedHTMLContent)
        $concatenatedHTMLContent=""
    }

}
