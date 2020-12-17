[cmdletbinding()]
param([string]$Foldername)

# Iterate over every HTML file in the folder
Get-ChildItem -Path $Foldername -Recurse -File -Filter "*.html"|ForEach-Object{
    ./ScriptHelpers/html_link.ps1 $_.FullName
}
