@echo off
setlocal

call %~dp0environment.bat

REM Sphinx
rem pip install sphinx
python -m pip install --index-url=http://pypi.python.org/simple/ --trusted-host pypi.python.org sphinx

REM Build
pushd "%PGADMIN3%\docs"
createConf.vbs
pushd en_US
call make.bat htmlhelp
popd
"%HHC%\hhc.exe" ./en_US/_build/htmlhelp/pgadmin3.hhp
"%WXWIN%\utils\hhp2cached\vc_mswudll\hhp2cached.exe" ./en_US/_build/htmlhelp/pgadmin3.hhp
popd
