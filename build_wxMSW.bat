@echo on
setlocal

rem Visual Studio 2013 C++ build tools
rem call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86_amd64

set PATH=%PATH%;D:\work\git-2.8.1\bin

set WXWIN=D:\work\wxWidgets
set PGADMIN3=D:\work\pgadmin3

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
