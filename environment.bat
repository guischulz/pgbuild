rem Visual Studio 2017 C++ build tools
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\WDExpress\VC\Auxiliary\Build\vcvarsall.bat" x86_x64

set PGBUILD=%~dp0

set GIT=D:\work\git-2.8.1
set HHC=C:\Tools\HTML Help Workshop
set PGADMIN3=D:\work\pgadmin3-pg13
set PGDIR=C:\Work\postgresql-13.4-1
set PYTHON=C:\Python36
set WXWIN=D:\work\wxWidgets

set PATH=%GIT%\bin;%PYTHON%;%PYTHON%\Scripts;%WXWIN%\lib\vc_dll;%PATH%
