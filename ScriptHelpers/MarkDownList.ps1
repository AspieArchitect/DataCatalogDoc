
[cmdletbinding()]
param([string]$inputFileName)
$fileContent = Get-Content $inputFileName
$fileContentLines=$fileContent.Split([Environment]::NewLine)
$tableColumnCount=0
$currentColumnCount=0
$concatenatedHTMLList=""
$listOpened = $True
#Clear-Host

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
        $concatenatedHTMLList=""
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

        
    if($line.Trim().StartsWith("*")){
        $lastItem=$lineArray[0]
        $newItem="{0}</li>" -f $lastItem.Replace("* ","<li>")
        if ($line.EndsWith("|")){
            $concatenatedHTMLList += "{0}</ul>|" -f $newItem.Replace("_ </li>","</li>")
            Write-output $concatenatedHTMLList
        } else{
            $concatenatedHTMLList +=  $newItem
        }

    }
    else{
        $lastItem=$lineArray[$currentColumnCount - 1]
        $lineStart=$lineArray[0..($lineArray.Length -2)] -join "|"
        $concatenatedHTMLList="{0}{1}</li>" -f $linestart,$lastItem.Replace("_* ","|<ul><li>")

    }
}
