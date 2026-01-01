$number = 15

if ($number -gt 10) {
    Write-Output "$number is greater than 10"
}

$grade = "B"

switch ($grade) {
    "A" { Write-Output "Excellent performance!" }
    "B" { Write-Output "Good performance!" }
    "C" { Write-Output "Average performance." }
    default { Write-Output "Needs improvement." }
}

$day = "Monday"

switch ($day) {
    "Monday" { Write-Output "Start of the work week!" }
}
