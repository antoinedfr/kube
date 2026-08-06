Get-ChildItem ".\k8s\*.yaml" | ForEach-Object {
    Write-Host "Testing $($_.Name)"
    kyverno apply policies --resource $_.FullName
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}