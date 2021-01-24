Set-Alias sqldoc 'C:\Program Files (x86)\Red Gate\SQL Doc 5\SQLDoc.exe' -Scope Script

# Location where SQLDoc projects are held
$SQLDoc_Project= "C:\code\SQLDoc\Projects\RedgateDataCatalog.sqldoc"

# Location where RedGate SQLDoc will be output
$SQLDoc_Path = "C:\Documentation\SQLDoc\DADSPCJUNE2014_documentation"

# Create the output location if it doesn't already exist
if(!(Test-Path -Path $SQLDoc_Path)){
    New-Item -ItemType directory -Path $SQLDoc_Path
}

# Make sure we start with a clean folder
Get-ChildItem -Path $SQLDoc_Path -Recurse|Remove-Item -Force -Recurse

# Generate both md and html documentation
sqldoc /server:DADSPCJUNE2014 /database:Redgate_SqlDataCatalog  /project:$SQLDoc_Project /outputfolder:$SQLDoc_Path /fileType:md
sqldoc /server:DADSPCJUNE2014 /database:Redgate_SqlDataCatalog  /project:$SQLDoc_Project /outputfolder:$SQLDoc_Path /fileType:html

& ".\ScriptHelpers\index_to_readme.ps1" "$SQLDoc_Path"
& ".\ScriptHelpers\md_to_html_link.ps1" "$SQLDoc_Path"
& ".\ScriptHelpers\md_to_bullet_list.ps1" "$SQLDoc_Path"
& ".\ScriptHelpers\object_to_readme.ps1" "$SQLDoc_Path"