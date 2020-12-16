[cmdletbinding()]
param([string]$Foldername)

# Git repos automatically render readme.md files so change the index.md files to readme.md files
Get-ChildItem -Path $Foldername -Recurse -File -Filter "index.md"|Rename-Item  -Force -NewName "readme.md"

# As all references point to index.md change ALL references across all md files to them to point to readme.md
Get-ChildItem -Path $Foldername -Recurse -File -Filter "*.md"|ForEach-Object{
    (Get-Content -Path $_.FullName).Replace("index.md","readme.md")|Set-Content -Path $_.FullName
}
