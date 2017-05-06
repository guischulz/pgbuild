@echo off
setlocal
title Building pgAdmin III

call "%~dp0build_wxMSW.bat"
call "%~dp0build_pgAdmin3.bat"
call "%~dp0build_docs.bat"
call "%~dp0install.bat""

pause