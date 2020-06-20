
[cmdletbinding()]
param([string]$inputFileName)
$fileContent = Get-Content $inputFileName
$fileContentLines=$fileContent.Split([Environment]::NewLine)
$tableColumnCount=0
$currentColumnCount=0
$concatenatedHTMLList=""
Clear-Host

ForEach ($line in $fileContentLines){

    # Signifies the start of a markdown table
    If (($line.StartsWith("| Key |")) -or ($line.StartsWith("| Name |"))){
        $tableColumnCount=($line.Split("|")).count
    }

    if(($line.Length -eq 0) -and ($tableColumnCount -gt 0)){
        $tableColumnCount=0
        $currentColumnCount=0
        $concatenatedHTMLList=""
    }
    if($tableColumnCount -eq 0){
        Write-Output $line
    }
    else{
        $lineArray=$line.Split("|")
        $currentColumnCount=($lineArray).count
        if($line.StartsWith("*")){
            $lastItem=$lineArray[0]
            }
        else{
            $lastItem=$lineArray[$currentColumnCount - 1]
            $lineStart=$lineArray[0..($lineArray.Length -2)] -join ""
            
        }
        if($currentColumnCount -eq $tableColumnCount){
            Write-Output $line
        }
        else{
            if(($tableColumnCount -1) -eq $currentColumnCount){
                $newItem="{0}</li>" -f $lastItem.Replace("* ","<ul><li>")
                $concatenatedHTMLList = $newItem
            }
            else{
                $newItem="{0}</li>" -f $lastItem.Replace("* ","<li>")
            }
            if($lastItem.Length -gt 0){
                $line=$line.Replace($lastItem,$newItem).Replace("</li>|","</li></ul>|")
                $concatenatedHTMLList+=$line
            }
            if($concatenatedHTMLList.EndsWith("</li></ul>|")){
                $concatenatedHTMLList = $lineStart + $concatenatedHTMLList
                Write-Output $concatenatedHTMLList
            }
                

        }
    }
}
