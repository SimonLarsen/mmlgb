@echo off
PATH=%PATH%;%~dp0\gbdk\bin

java.exe -jar MMLGB.jar %1 src\song.h
if %errorlevel% neq 0 (
	pause
	exit /b %errorlevel%
)

lcc.exe -Isrc src\main.c src\music.c -o rom.gb
echo %~nx0 compiled to rom.gb succesfully!
pause
