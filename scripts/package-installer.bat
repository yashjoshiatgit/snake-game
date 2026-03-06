@echo off
setlocal

set TYPE=%1
if "%TYPE%"=="" set TYPE=app-image
set APP_NAME=SnakeGame
set VERSION=1.0.0

call scripts\build-jar.bat
if errorlevel 1 exit /b 1

if not exist build\installer mkdir build\installer

jpackage ^
  --name %APP_NAME% ^
  --input build\libs ^
  --main-jar %APP_NAME%-%VERSION%.jar ^
  --main-class com.snakegame.Main ^
  --type %TYPE% ^
  --dest build\installer ^
  --vendor SnakeGame ^
  --app-version %VERSION%
if errorlevel 1 exit /b 1

echo Installer created in build\installer
