@echo off
rem Build file for VS 2017 (expected in %ProgramFiles%\Microsoft Visual Studio\2017)

rem Save the values of INCLUDE, LIB and PATH
set SAVE_INCLUDE=%INCLUDE%
set SAVE_LIB=%LIB%
set SAVE_PATH=%PATH%

rem Determine where the program files are, both for 64-bit and 32-bit Windows
if exist "%ProgramFiles%" set PROGRAM_FILES_DIR=%ProgramFiles%
if exist "%ProgramFiles(x86)%" set PROGRAM_FILES_DIR=%ProgramFiles(x86)%

rem Determine the installed version of Visual Studio (Professional/Enterprise)
if exist "%PROGRAM_FILES_DIR%\Microsoft Visual Studio\2017\Professional\VC\Auxiliary\Build\vcvarsall.bat" set VCVARS_BAT=%PROGRAM_FILES_DIR%\Microsoft Visual Studio\2017\Professional\VC\Auxiliary\Build\vcvarsall.bat
if exist "%PROGRAM_FILES_DIR%\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvarsall.bat" set VCVARS_BAT=%PROGRAM_FILES_DIR%\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvarsall.bat

:BUILD_32BIT
call "%VCVARS_BAT%" x86
devenv.com StormLib_vs17.sln /project "StormLib" /build "DebugAD|Win32"
devenv.com StormLib_vs17.sln /project "StormLib" /build "DebugAS|Win32"
devenv.com StormLib_vs17.sln /project "StormLib" /build "DebugUD|Win32"
devenv.com StormLib_vs17.sln /project "StormLib" /build "DebugUS|Win32"
devenv.com StormLib_vs17.sln /project "StormLib" /build "ReleaseAD|Win32"
devenv.com StormLib_vs17.sln /project "StormLib" /build "ReleaseAS|Win32"
devenv.com StormLib_vs17.sln /project "StormLib" /build "ReleaseUD|Win32"
devenv.com StormLib_vs17.sln /project "StormLib" /build "ReleaseUS|Win32"
call :RestoreEnvVars

:BUILD_64BIT
call "%VCVARS_BAT%" x64
devenv.com StormLib_vs17.sln /project "StormLib" /build "DebugAD|x64"
devenv.com StormLib_vs17.sln /project "StormLib" /build "DebugAS|x64"
devenv.com StormLib_vs17.sln /project "StormLib" /build "DebugUD|x64"
devenv.com StormLib_vs17.sln /project "StormLib" /build "DebugUS|x64"
devenv.com StormLib_vs17.sln /project "StormLib" /build "ReleaseAD|x64"
devenv.com StormLib_vs17.sln /project "StormLib" /build "ReleaseAS|x64"
devenv.com StormLib_vs17.sln /project "StormLib" /build "ReleaseUD|x64"
devenv.com StormLib_vs17.sln /project "StormLib" /build "ReleaseUS|x64"
call :RestoreEnvVars

:RestoreEnvVars
set INCLUDE=%SAVE_INCLUDE%
set LIB=%SAVE_LIB%
set PATH=%SAVE_PATH%
