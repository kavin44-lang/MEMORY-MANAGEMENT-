$project = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not (Test-Path "$project\out")) {
    & "$project\compile.ps1"
}
$env:DB_URL = $env:DB_URL ?? "jdbc:mysql://localhost:3306/product_management?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC"
$env:DB_USER = $env:DB_USER ?? "root"
$env:DB_PASSWORD = $env:DB_PASSWORD ?? ""
java -cp "$project\out;$project\lib\mysql-connector-j-9.0.0.jar" com.productmanagement.ProductManagementApp
