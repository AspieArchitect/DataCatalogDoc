[cmdletbinding()]
param([string]$Foldername)
Clear-Host

Get-ChildItem -Path $Foldername -Recurse -File -Filter "*.md"|ForEach-Object{

    # We are only interested in the immediate parent folder and the file without any extension
    $ParentFolder = (Get-Item $_.Directory).BaseName
    $MarkDownFileWithoutExtension = $_.BaseName
    
    if($ParentFolder -eq $MarkDownFileWithoutExtension){
        $readme_file = Join-Path -Path $_.DirectoryName -ChildPath "README.md"
        Copy-Item -Path $_.FullName -Destination $readme_file -Force
    }
}
