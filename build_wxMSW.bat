@echo off
setlocal

call %~dp0environment.bat

REM Cleanup
pushd "%WXWIN%
git clean -fdx
popd

REM Build
pushd "%WXWIN%
cmake -S . -B _build_vs2017x64 -G "Visual Studio 15 2017" -A x64 -DCMAKE_GENERATOR_TOOLSET=host=x64
cmake --build _build_vs2017x64 --config Release --verbose
if not exist "%WXWIN%\lib\vc_dll" md "%WXWIN%\lib\vc_dll"
xcopy /v/y "%WXWIN%\_build_vs2017x64\lib\vc_x64_dll\*.dll" "%WXWIN%\lib\vc_dll"
xcopy /v/y "%WXWIN%\_build_vs2017x64\lib\vc_x64_dll\*.exe" "%WXWIN%\lib\vc_dll"
xcopy /v/y "%WXWIN%\_build_vs2017x64\lib\vc_x64_dll\*.exp" "%WXWIN%\lib\vc_dll"
xcopy /v/y "%WXWIN%\_build_vs2017x64\lib\vc_x64_dll\*.lib" "%WXWIN%\lib\vc_dll"
xcopy /e/s/v/i/y "%WXWIN%\_build_vs2017x64\lib\vc_x64_dll\mswu" "%WXWIN%\lib\vc_dll\mswu"
popd

pushd "%WXWIN%\utils\hhp2cached"
echo %CD%
nmake -f makefile.vc BUILD=RELEASE UNICODE=1 SHARED=1
popd
