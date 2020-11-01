# The purpose of this script is to replace a git markdown link with an html link.

[cmdletbinding()]
param([string]$inputFileName)

$fileContent = Get-Content $inputFileName
Write-Output $_.FullName
$md_markdown_pattern='((?:\[)[\w+\s*]+(?:\]))\(([a-zA-Z0-9:\/_\.-]+)(\s)?(\"[\w\s]*\")?\)'


$results=$fileContent|Select-String -Pattern $md_markdown_pattern -AllMatches

foreach ($item in $results.Matches.Value|Sort-Object|Get-Unique) {
    $newItem=$item|Select-String -Pattern $md_markdown_pattern -AllMatches
    $markdown_link = $newItem.Matches.Groups[0]
    $html_link ='<a href="{0}" title="{2}">{1}</a>' -f  $newItem.Matches.Groups[2], $newItem.Matches.Groups[1].ToString().Replace("[","").Replace("]",""), $newItem.Matches.Groups[4].ToString().replace('"','')
    $fileContent=$fileContent.Replace($markdown_link,$html_link)
}
Set-Content -Path $inputFileName -Value $fileContent
