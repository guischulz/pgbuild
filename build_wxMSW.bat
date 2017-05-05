@echo on
setlocal

rem Visual Studio 2013 C++ build tools
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86_amd64

set PATH=%PATH%;D:\work\git-2.8.1\bin

rem set WX=C:\Work\wxMSW-2.8.12
set WX=D:\work\wxWidgets
set PGADMIN3=D:\work\pgadmin3
rem set MINGW64=C:\msys64\mingw64

REM Cleanup
pushd "%WX%
git clean -fdx
popd

REM Copy include files
copy /Y "%PGADMIN3%\xtra\wx-build\setup0-msw-2.8.h" "%WX%\include\wx\setup0.h"
copy /Y "%PGADMIN3%\xtra\wx-build\setup0-msw-2.8.h" "%WX%\include\wx\setup.h"
copy /Y "%PGADMIN3%\xtra\wx-build\setup0-msw-2.8.h" "%WX%\include\wx\msw\setup.h"
copy /Y "%~dp0pbt.h" "%WX%\include"

REM Build
pushd "%WX%\build\msw"
echo %CD%
nmake -f makefile.vc BUILD=RELEASE UNICODE=1 SHARED=1
popd

pushd "%WX%\contrib\build\deprecated"
echo %CD%
nmake -f makefile.vc BUILD=RELEASE UNICODE=1 SHARED=1
popd
pushd "%WX%\contrib\build\fl"
echo %CD%
nmake -f makefile.vc BUILD=RELEASE UNICODE=1 SHARED=1
popd
pushd "%WX%\contrib\build\foldbar"
echo %CD%
nmake -f makefile.vc BUILD=RELEASE UNICODE=1 SHARED=1
popd
pushd "%WX%\contrib\build\gizmos"
echo %CD%
nmake -f makefile.vc BUILD=RELEASE UNICODE=1 SHARED=1
popd
pushd "%WX%\contrib\build\mmedia"
echo %CD%
nmake -f makefile.vc BUILD=RELEASE UNICODE=1 SHARED=1
popd
pushd "%WX%\contrib\build\net"
echo %CD%
nmake -f makefile.vc BUILD=RELEASE UNICODE=1 SHARED=1
popd
pushd "%WX%\contrib\build\ogl"
echo %CD%
nmake -f makefile.vc BUILD=RELEASE UNICODE=1 SHARED=1
popd
pushd "%WX%\contrib\build\plot"
echo %CD%
nmake -f makefile.vc BUILD=RELEASE UNICODE=1 SHARED=1
popd
pushd "%WX%\contrib\build\stc"
echo %CD%
nmake -f makefile.vc BUILD=RELEASE UNICODE=1 SHARED=1
popd
pushd "%WX%\contrib\build\svg"
echo %CD%
nmake -f makefile.vc BUILD=RELEASE UNICODE=1 SHARED=1
popd

pushd "%WX%\utils\hhp2cached"
echo %CD%
nmake -f makefile.vc BUILD=RELEASE UNICODE=1 SHARED=1
popd
pushd "%WX%\utils\wxrc"
echo %CD%
nmake -f makefile.vc BUILD=RELEASE UNICODE=1 SHARED=1
popd
