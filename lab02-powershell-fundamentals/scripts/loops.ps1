for ($i = 1; $i -le 5; $i++) {
    Write-Output "Count: $i"
}

$colors = @("Red","Green","Blue","Yellow")

foreach ($color in $colors) {
    Write-Output "Processing color: $color"
}

$count = 1
while ($count -le 5) {
    Write-Output "While loop iteration: $count"
    $count++
}
