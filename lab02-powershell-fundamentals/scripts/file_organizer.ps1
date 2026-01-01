New-Item -ItemType Directory -Name "txt_files" -Force

Get-ChildItem *.txt | ForEach-Object {
    Move-Item $_ "txt_files/"
    Write-Output "Moved $($_.Name) to txt_files/"
}

Write-Output "File organization completed!"
