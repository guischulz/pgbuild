rem Visual Studio 2013 C++ build tools
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86_amd64

set PGBUILD=%~dp0

set GIT=D:\work\git-2.8.1
set HHC=D:\Tools\HTML Help Workshop
set PGADMIN3=D:\work\pgadmin3
set PGDIR=D:\Work\postgresql-10.1-2
set PYTHON=C:\Python27
set WXWIN=D:\work\wxWidgets

set PATH=%GIT%\bin;%PYTHON%;%PYTHON%\Scripts;%WXWIN%\lib\vc_dll;%PATH%