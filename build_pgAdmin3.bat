@echo on
setlocal

rem Visual Studio 2013 C++ build tools
rem call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86_amd64
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86_amd64
rem set PATH=%PATH%;C:\Program Files (x86)\MSBuild\12.0\Bin\amd64
set PATH=%PATH%;D:\work\git-2.8.1\bin

rem set SED_EXE=C:\Tools\GnuWin\sed.exe

rem set WXWIN=C:\Work\wxMSW-2.8.12
set WXWIN=D:\work\wxWidgets
set PGDIR=C:\Work\postgresql-9.6.2-3
set PGADMIN=D:\Work\pgadmin3
set PGBUILD=%~dp0

rem set INCLUDE=%WX%\include;%WX%\contrib\include;%INCLUDE%
rem set INCLUDE=%PG%\include;%PG%\include\server;%INCLUDE%
rem set LIB=%WX%\lib\vclib;%LIB%

REM Cleanup
pushd "%PGADMIN%
git clean -fdx
popd

REM Create svnversion.h
pushd "%PGADMIN%\pgadmin"
call ver_svn.bat
popd

REM Build
pushd "%PGADMIN%"
rem msbuild xtra/png2c/png2c.vcxproj /p:Configuration="Release (3.0)" /p:Platform=x64
rem msbuild pgadmin/pgAdmin3.vcxproj /p:Configuration="Release (3.0)" /p:Platform=x64
rem msbuild pgAdmin3.sln /p:Configuration="Release (3.0)" /p:Platform=Win32 /p:useenv=true
rem msbuild pgAdmin3.sln /p:Configuration="Release" /p:Platform=Win32
rem %SED_EXE% "s/Win32/x64/g" pgAdmin3.sln > pgAdmin3_x64.sln
copy /y "%PGBUILD%\pgAdmin3_x64.sln" .
msbuild pgAdmin3_x64.sln /p:Configuration="Release" /p:Platform=x64
popd
