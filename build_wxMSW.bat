@echo off
setlocal

call %~dp0environment.bat

REM Cleanup
pushd "%WXWIN%
git clean -fdx
popd

REM Copy include files
copy /Y "%PGADMIN3%\xtra\wx-build\setup0-msw-2.8.h" "%WXWIN%\include\wx\setup0.h"
copy /Y "%PGADMIN3%\xtra\wx-build\setup0-msw-2.8.h" "%WXWIN%\include\wx\setup.h"
copy /Y "%PGADMIN3%\xtra\wx-build\setup0-msw-2.8.h" "%WXWIN%\include\wx\msw\setup.h"
copy /Y "%~dp0pbt.h" "%WXWIN%\include"

REM Build
pushd "%WXWIN%\build\msw"
echo %CD%
nmake -f makefile.vc BUILD=RELEASE UNICODE=1 SHARED=1
popd

pushd "%WXWIN%\contrib\build\stc"
echo %CD%
nmake -f makefile.vc BUILD=RELEASE UNICODE=1 SHARED=1
popd

pushd "%WXWIN%\utils\hhp2cached"
echo %CD%
nmake -f makefile.vc BUILD=RELEASE UNICODE=1 SHARED=1
popd
