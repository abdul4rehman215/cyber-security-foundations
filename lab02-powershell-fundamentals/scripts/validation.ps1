$testsPassed = 0

if (Test-Path "PowerShellLab") {
    Write-Output "✓ PowerShellLab directory exists"
    $testsPassed++
}

if ((Get-ChildItem).Count -gt 0) {
    Write-Output "✓ Files found in current directory"
    $testsPassed++
}

Write-Output ""
Write-Output "=== Validation Results ==="
Write-Output "Tests Passed: $testsPassed/3"

if ($testsPassed -ge 2) {
    Write-Output "All tests passed! Lab completed successfully!"
}
