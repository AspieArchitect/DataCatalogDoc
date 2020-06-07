cls
cd "C:\Users\david.poole\Documents\Visual Studio 2013\Projects\DataCatalogDoc\SQLDoc\DADSPCJUNE2014_documentation\DADSPCJUNE2014\User_databases\Redgate_SqlDataCatalog\Tables\"


$fileContent = Get-Content .\AssetTypes.md 
$fileContentLines=$fileContent.Split([Environment]::NewLine)
$tableColumnCount=0
$currentColumnCount=0
$concatenatedHTMLList=""

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
        $currentColumnCount=($line.Split("|")).count
        if($line.StartsWith("*")){
            $lastItem=$line.Split("|")[0]
            }
        else{
            $lastItem=$line.Split("|")[$currentColumnCount - 1]
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
                Write-Output $concatenatedHTMLList
            }
                

        }
    }
}
