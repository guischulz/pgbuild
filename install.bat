@echo off
setlocal

call %~dp0environment.bat

REM Cleanup
if exist "%~dp0target" rd /s/q "%~dp0target"

if not exist "%~dp0target" md "%~dp0target"
if not exist "%~dp0target\bin" md "%~dp0target\bin"
if not exist "%~dp0target\pgAdmin III" md "%~dp0target\pgAdmin III"
if not exist "%~dp0target\pgAdmin III\docs" md "%~dp0target\pgAdmin III\docs"
if not exist "%~dp0target\pgAdmin III\i18n" md "%~dp0target\pgAdmin III\i18n"
if not exist "%~dp0target\pgAdmin III\plugins.d" md "%~dp0target\pgAdmin III\plugins.d"

copy /Y "%PGDIR%\bin\*.dll" "%~dp0target\bin"
del /Q "%~dp0target\bin\wxbase313ud*.dll"
del /Q "%~dp0target\bin\wxmsw313ud*.dll"
copy /Y "%WXWIN%\lib\vc_dll\wxbase313u_net_vc_x64_custom.dll" "%~dp0target\bin"
copy /Y "%WXWIN%\lib\vc_dll\wxbase313u_xml_vc_x64_custom.dll" "%~dp0target\bin"
copy /Y "%WXWIN%\lib\vc_dll\wxmsw313u_aui_vc_x64_custom.dll" "%~dp0target\bin"
copy /Y "%WXWIN%\lib\vc_dll\wxmsw313u_html_vc_x64_custom.dll" "%~dp0target\bin"
copy /Y "%WXWIN%\lib\vc_dll\wxmsw313u_stc_vc_x64_custom.dll" "%~dp0target\bin"
copy /Y "%WXWIN%\lib\vc_dll\wxmsw313u_xrc_vc_x64_custom.dll" "%~dp0target\bin"
copy /Y "%PGADMIN3%\pgadmin\Release\pgAdmin3.exe" "%~dp0target\bin"

xcopy /E/S/V/I/Y "%PGADMIN3%\docs\en_US\_build\htmlhelp" "%~dp0target\pgAdmin III\docs\en_US"
del "%~dp0target\pgAdmin III\docs\en_US\.buildinfo
xcopy /E/S/V/I/Y "%PGADMIN3%\docs\en_US\hints" "%~dp0target\pgAdmin III\docs\en_US\hints"
for %%f in (ca_ES cs_CZ de_DE fr_FR ja_JP lv_LV pl_PL ru_RU sr_RS zh_CN) do (
  xcopy /E/S/V/I/Y "%PGADMIN3%\i18n\%%f" "%~dp0target\pgAdmin III\i18n\%%f"
  del "%~dp0target\pgAdmin III\i18n\%%f\*.po"
)

copy /Y "%PGADMIN3%\i18n\pg*.*" "%~dp0target\pgAdmin III\i18n"
copy /Y "%PGADMIN3%\plugins.d\plugins.ini" "%~dp0target\pgAdmin III\plugins.d"
copy /Y "%PGADMIN3%\pgadmin\settings.ini" "%~dp0target\pgAdmin III"
