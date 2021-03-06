@echo off
setlocal

call %~dp0environment.bat

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

if exist "%PGADMIN3%\pgAdmin3_x64.sln" del "%PGADMIN3%\pgAdmin3_x64.sln"