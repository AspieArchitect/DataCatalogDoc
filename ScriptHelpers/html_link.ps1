# The purpose of this script is to replace a git markdown link with an html link.

[cmdletbinding()]
param([string]$inputFileName)

$fileContent = Get-Content $inputFileName
$md_markdown_pattern='((?:\[)[\w+\s*]+(?:\]))\(([a-zA-Z0-9:\/_\.\?=-]+)(\s)?(\"[\w\s]*\")?\)'

$results=$fileContent|Select-String -Pattern $md_markdown_pattern -AllMatches

# We only want unique strings because the replace command takes care of multiple instances
foreach ($item in $results.Matches.Value|Sort-Object|Get-Unique) {
    $newItem=$item|Select-String -Pattern $md_markdown_pattern -AllMatches

    # This is the full markdown link to be replaced
    $markdown_link = $newItem.Matches.Groups[0]

    # Build the HTML hyperlink
    $html_link ='<a href="{0}" title="{2}">{1}</a>' -f  $newItem.Matches.Groups[2], $newItem.Matches.Groups[1].ToString().Replace("[","").Replace("]",""), $newItem.Matches.Groups[4].ToString().replace('"','')

    # Replace the MD hyperlink with the HTML hyperlink
    $fileContent=$fileContent.Replace($markdown_link,$html_link)
}
Set-Content -Path $inputFileName -Value $fileContent
