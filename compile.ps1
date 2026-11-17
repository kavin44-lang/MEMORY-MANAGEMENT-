$project = Split-Path -Parent $MyInvocation.MyCommand.Path
$javaFiles = Get-ChildItem -Path "$project\src\main\java" -Recurse -Filter *.java
New-Item -ItemType Directory -Force -Path "$project\out" | Out-Null
javac -cp "$project\lib\mysql-connector-j-9.0.0.jar" -d "$project\out" $javaFiles.FullName
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Host "Compilation successful. Output directory: $project\out"
