@echo off
setlocal

call %~dp0environment.bat

set NASM=D:\work\nasm-2.15.05
set PERLDIR=C:\Strawberry\perl
set OPENSSL=D:\work\openssl

REM Cleanup
pushd "%OPENSSL%
git clean -fdx
popd

REM Path
set PATH=%NASM%;%PERLDIR%\bin;%PATH%

REM Build
pushd "%OPENSSL%"
perl Configure no-comp VC-WIN64A
nmake -f makefile
popd
