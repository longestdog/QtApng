@echo off
REM 64-bit qapng.dll: 使用 VS2017 x64 环境与 Qt msvc2017_64 的 qmake
REM 文档中的 qtimageformats / qtimageformats.pro 为错误；本仓库入口为 qtapng.pro
setlocal
call "D:\Microsoft Visual Studio\VisualStudio2017\VC\Auxiliary\Build\vcvars64.bat"
if errorlevel 1 exit /b 1
cd /d "%~dp0"
set "QMAKE=D:\Qt\Qt5.14.2\5.14.2\msvc2017_64\bin\qmake.exe"
"%QMAKE%" qtapng.pro CONFIG+=libpng_static
if errorlevel 1 exit /b 1
nmake
if errorlevel 1 exit /b 1
echo.
echo 输出: %CD%\plugins\imageformats\qapng.dll
endlocal
