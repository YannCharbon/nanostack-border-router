mbed deploy
@echo off
(
:: Creation of the JLink script for the custom board (debug config)
echo halt
echo loadbin BUILD/%1/GCC_ARM-DEBUG/%2.bin,0x0
echo setpc 0x0
echo reset
echo go
echo exit
) > flashefr32custom_debug.jlink
(
:: Creation of the JLink script for the custom board
echo halt
echo loadbin BUILD/%1/GCC_ARM/%2.bin,0x0
echo setpc 0x0
echo reset
echo go
echo exit
) > flashefr32custom.jlink
@echo on
:: Update Tasks file for VSCode
del .\.vscode\tasks.json
copy .\.vscode\tasks-windows.json .\.vscode\tasks.json
echo "The VScode tasks have been updated for Windows commands (restart VScode too see changes in task runner)"