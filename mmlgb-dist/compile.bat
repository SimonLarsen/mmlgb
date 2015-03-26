@echo off
PATH=%PATH%;%~dp0\gbdk\bin

java.exe -jar MMLGB.jar %1 driver\song.asm
if %errorlevel% neq 0 (
	pause
	exit /b %errorlevel%
)

lcc.exe -c driver\main.asm -o driver\main.o
lcc.exe -c driver\music.asm -o driver\music.o
lcc.exe -c driver\song.asm -o driver\song.o
lcc.exe driver\main.o driver\music.o driver\song.o -o rom.gb

if %errorlevel% neq 0 (
	echo Error compiling rom!
	pause
	exit /b %errorlevel%
)

echo %~nx0 compiled to rom.gb succesfully!
pause
