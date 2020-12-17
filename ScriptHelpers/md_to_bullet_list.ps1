[cmdletbinding()]
param([string]$Foldername)

# Iterate over every HTML file in the folder
Get-ChildItem -Path $Foldername -Recurse -File -Filter "*.md" -Exclude "tmp_output.md"|ForEach-Object{
    $temporary_file = Join-Path -Path $_.DirectoryName -ChildPath "tmp_output.md"
    
    ./ScriptHelpers/MarkDownList.ps1 $_.FullName > $temporary_file
    
    # Copy the tmp_output.md file back over the original file.
    Copy-Item -Path $temporary_file -Destination $_.FullName -Force
    
    # Clean up the temporary file
    Remove-Item -Path $temporary_file
}
