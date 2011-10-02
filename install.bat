@rem quick and dirty script to install the blender nif scripts
@rem to detect BLENDERADDONS, you can use https://gist.github.com/1254859
@echo off

if "%BLENDERADDONS%" == "" goto pleasesetblenderaddons

echo.Installing in
echo.%BLENDERADDONS%\io_scene_nif
rem remove old files
rmdir /s /q "%BLENDERADDONS%\io_scene_nif"
rem copy files from repository to blender addons folder
for %%A in (io_scene_nif, ) do mkdir "%BLENDERADDONS%\%%A"
for %%A in (__init__.py, import_export_nif.py, export_nif.py, import_nif.py) do (
  copy "scripts\addons\io_scene_nif\%%A" "%BLENDERADDONS%\io_scene_nif"
)
goto end

:pleasesetblenderaddons
echo.Please set BLENDERADDONS to the folder where the blender addons reside, such as:
echo.
echo.  set BLENDERADDONS=C:\Program Files\Blender Foundation\Blender\2.59\scripts\addons
echo.
pause
goto end

:end
