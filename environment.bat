rem Visual Studio 2017 C++ build tools
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\WDExpress\VC\Auxiliary\Build\vcvarsall.bat" x86_x64

set GIT=D:\work\git-2.8.1
set CMAKE=D:\work\cmake-3.21.3-windows-x86_64
set HHC=C:\Tools\HTML Help Workshop
set PYTHON=C:\Python36

set PGBUILD=%~dp0
set PGDIR=D:\Work\postgresql-14.0-1
set WXWIN=D:\work\wxWidgets-3.1.3

rem https://github.com/guischulz/pgadmin3
set PGADMIN3=D:\work\pgadmin3

set PATH=%GIT%\bin;%CMAKE%\bin;%PYTHON%;%PYTHON%\Scripts;%WXWIN%\lib\vc_dll;%PATH%
