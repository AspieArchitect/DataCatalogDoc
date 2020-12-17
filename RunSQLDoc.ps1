Set-Alias sqldoc 'C:\Program Files (x86)\Red Gate\SQL Doc 5\SQLDoc.exe' -Scope Script

# base_path is the folder containing this script
$base_path = Split-Path -Parent $PSCommandPath
$documentation_path = "$base_path\SQLDoc\DADSPCJUNE2014_documentation"

# Make sure we start with a clean folder
Get-ChildItem -Path $documentation_path -Recurse|Remove-Item -Force -Recurse

# Generate both md and html documentation
sqldoc /server:DADSPCJUNE2014 /database:Redgate_SqlDataCatalog  /project:RedgateDataCatalog.sqldoc /fileType:md
sqldoc /server:DADSPCJUNE2014 /database:Redgate_SqlDataCatalog  /project:RedgateDataCatalog.sqldoc /fileType:html

& ".\ScriptHelpers\index_to_readme.ps1" "$documentation_path"
& ".\ScriptHelpers\md_to_html_link.ps1" "$documentation_path"
& ".\ScriptHelpers\md_to_bullet_list.ps1" "documentation_path"
