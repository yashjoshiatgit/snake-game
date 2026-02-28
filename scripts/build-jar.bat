@echo off
setlocal

set APP_NAME=VegetarianSnake
set VERSION=1.0.0
set BUILD_DIR=build
set CLASSES_DIR=%BUILD_DIR%\classes
set JAR_DIR=%BUILD_DIR%\libs

if exist %BUILD_DIR% rmdir /s /q %BUILD_DIR%
mkdir %CLASSES_DIR%
mkdir %JAR_DIR%

for /r src\main\java %%f in (*.java) do (
  set FILES=!FILES! "%%f"
)

javac -d %CLASSES_DIR% src\main\java\com\vegsnake\*.java
if errorlevel 1 exit /b 1

jar --create --file %JAR_DIR%\%APP_NAME%-%VERSION%.jar --main-class com.vegsnake.Main -C %CLASSES_DIR% .
if errorlevel 1 exit /b 1

echo Built: %JAR_DIR%\%APP_NAME%-%VERSION%.jar
