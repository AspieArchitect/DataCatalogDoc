
[cmdletbinding()]
param([string]$inputFileName)
$fileContent = Get-Content $inputFileName
$fileContentLines=$fileContent.Split([Environment]::NewLine)

$md_markdown_pattern='((?:\[)[\w+\s*]+(?:\]))\(([a-zA-Z0-9:\/_\.-]+)(\s)?(\"[\w\s]*\")?\)'

cls
$results=$fileContent|Select-String -Pattern $md_markdown_pattern -AllMatches

foreach ($item in $results.Matches.Value) {
    $newItem=$item|Select-String -Pattern $md_markdown_pattern -AllMatches
    Write-Host('--> {0}  <a href="{1}" title="{3}">{2}</a>' -f $newItem.Matches.Groups[0], $newItem.Matches.Groups[2], $newItem.Matches.Groups[1], $newItem.Matches.Groups[4].ToString().replace('"',''))
}