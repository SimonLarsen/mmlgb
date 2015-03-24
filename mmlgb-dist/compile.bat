@echo off
PATH=%PATH%;%~dp0\gbdk\bin

java.exe -jar MMLGB.jar %1 driver\song.h
if %errorlevel% neq 0 (
	pause
	exit /b %errorlevel%
)

lcc.exe -Idriver -c driver\main.c -o driver\main.o
lcc.exe -Idriver -c driver\music.c -o driver\music.o
lcc.exe driver\main.o driver\music.o -o rom.gb
echo %~nx0 compiled to rom.gb succesfully!
pause
