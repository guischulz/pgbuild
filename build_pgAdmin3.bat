@echo on
setlocal

rem Visual Studio 2013 C++ build tools
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86_amd64

set PATH=%PATH%;D:\work\git-2.8.1\bin

set WXWIN=D:\work\wxWidgets
set PGADMIN3=D:\Work\pgadmin3
set PGDIR=C:\Work\postgresql-9.6.2-3
set PGBUILD=%~dp0

REM Cleanup
pushd "%PGADMIN3%
git clean -fdx
popd

REM Create svnversion.h
pushd "%PGADMIN3%\pgadmin"
call ver_svn.bat
popd

REM Build
pushd "%PGADMIN3%"
copy /y "%PGBUILD%\pgAdmin3_x64.sln" .
msbuild pgAdmin3_x64.sln /p:Configuration="Release" /p:Platform=x64
popd
