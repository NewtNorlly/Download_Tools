$path = "C:\Users\NewtN\Desktop\Download_Tools"
$items = Get-ChildItem -Path $path -Recurse -File
$count = $items.Count
$sizeMB = [math]::Round(($items | Measure-Object -Property Length -Sum).Sum / 1MB, 2)
Write-Output "Files: $count"
Write-Output "Size: $sizeMB MB"

Write-Output ""
Write-Output "Top 10 largest files:"
$items | Sort-Object Length -Descending | Select-Object -First 10 | ForEach-Object {
    $sizeMB_i = [math]::Round($_.Length / 1MB, 2)
    Write-Output "  $sizeMB_i MB - $($_.FullName)"
}
