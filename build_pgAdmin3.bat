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
pushd "%PGADMIN3%\pgadmin\ui"
call "%PGADMIN3%\pgadmin\ui\embed-xrc.bat"
popd
pushd "%PGADMIN3%"
msbuild pgAdmin3.sln /p:Configuration="Release" /p:Platform=x64
popd
