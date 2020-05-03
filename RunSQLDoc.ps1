Set-Alias sqldoc 'C:\Program Files (x86)\Red Gate\SQL Doc 5\SQLDoc.exe' -Scope Script
sqldoc /server:DADSPCJUNE2014 /database:Redgate_SqlDataCatalog RedgateDataCatalog.sqldoc /project:RedgateDataCatalog.sqldoc /fileType:md
sqldoc /server:DADSPCJUNE2014 /database:Redgate_SqlDataCatalog RedgateDataCatalog.sqldoc /project:RedgateDataCatalog.sqldoc /fileType:html

function Get-ScriptDirectory {
    Split-Path -Parent $PSCommandPath
}

$base_path = Split-Path -Parent $PSCommandPath
$documentation_path = "$base_path\SQLDoc\DADSPCJUNE2014_documentation"

& ".\ScriptHelpers\index_to_readme.ps1" "$documentation_path"
