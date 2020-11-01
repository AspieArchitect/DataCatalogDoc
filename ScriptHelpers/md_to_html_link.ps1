[cmdletbinding()]
param([string]$Foldername)

# As all references point to index.md change ALL references across all md files to them to point to readme.md
Get-ChildItem -Path $Foldername -Recurse -File -Filter "*.html"|ForEach-Object{
    ./ScriptHelpers/html_link.ps1 $_.FullName
}
