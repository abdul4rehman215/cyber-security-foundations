Write-Output "=== File Management Automation ==="

$project = "MyProject"
New-Item -ItemType Directory -Name $project
Set-Location $project

"src","docs","tests","config" | ForEach-Object {
    New-Item -ItemType Directory -Name $_
    Write-Output "Created directory: $_"
}

Write-Output "Project structure created successfully!"
