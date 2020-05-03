function Get-ScriptDirectory {
    Split-Path -Parent $PSCommandPath.-Parent
}
function Get-DocumentationObjectDirectory {

}

$folderForTables=$PSScriptRoot\
$fileContent= Get-Content .\AssetTypes.md
$fileContent -replace '[\|] [_][*]','|<ul>*' -replace '\* (\w{1,}.*)' ,'<li>$1</li>'