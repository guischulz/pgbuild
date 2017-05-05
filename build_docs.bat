@echo on
setlocal

set WXWIN=D:\work\wxWidgets
set PGADMIN3=D:\Work\pgadmin3

set PYTHON=C:\Python27
set PATH=%PYTHON%;%PYTHON%\Scripts;%WXWIN%\lib\vc_dll;%PATH%

REM MS HTML Help Workshop
set HHC=C:\Tools\HTML Help Workshop

REM Sphinx
pip install sphinx

REM Build
pushd "%PGADMIN3%\docs"
createConf.vbs
pushd en_US
call make.bat htmlhelp
popd
"%HHC%\hhc.exe" ./en_US/_build/htmlhelp/pgadmin3.hhp
"%WXWIN%\utils\hhp2cached\vc_mswudll\hhp2cached.exe" ./en_US/_build/htmlhelp/pgadmin3.hhp
popd
