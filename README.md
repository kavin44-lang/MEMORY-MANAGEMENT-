# Product Management System

This project is a Java Swing desktop application for managing product records using JDBC and MySQL. It follows the concept described in the report: a product management system with validation, CRUD operations, persistent storage, and a simple graphical interface.

## Features
- Add new products
- View all products in a table
- Search products by ID, name, or category
- Update existing product records
- Delete products
- Validate price and quantity before saving
- Uses MySQL as the database backend

## Project structure
- `src/main/java/com/productmanagement` — Java source files
- `db/schema.sql` — MySQL schema and sample data
- `lib` — MySQL connector JAR (downloaded locally)

## Prerequisites
- Java 17 or later
- MySQL Server running locally
- MySQL Connector/J JAR

## Database setup
1. Start MySQL.
2. Create a database named `product_management` or set the `DB_URL` environment variable to point to your database.
3. Import `db/schema.sql` if needed.

Example:
```sql
CREATE DATABASE product_management;
```

## Run the application
From the project root:

```bash
javac -cp "lib/mysql-connector-j-9.0.0.jar" -d out $(find src/main/java -name "*.java")
java -cp "out:lib/mysql-connector-j-9.0.0.jar" com.productmanagement.ProductManagementApp
```

On Windows PowerShell:

```powershell
$files = Get-ChildItem -Path .\src\main\java -Recurse -Filter *.java
javac -cp ".\lib\mysql-connector-j-9.0.0.jar" -d .\out $files.FullName
java -cp ".\out; .\lib\mysql-connector-j-9.0.0.jar" com.productmanagement.ProductManagementApp
```

## Environment variables
The app will use these settings if present:
- `DB_URL`
- `DB_USER`
- `DB_PASSWORD`

Default URL:
```text
jdbc:mysql://localhost:3306/product_management?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC
```

## Notes
This project is designed as a practical implementation of the concept described in the Product Management System report. It is intended to be a working Java desktop application that can be extended with stock alerts, supplier data, or reporting features.
