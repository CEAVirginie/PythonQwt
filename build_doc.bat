@echo off
if defined WINPYDIRBASE (
    call %WINPYDIRBASE%\scripts\env.bat
    @echo ==============================================================================
    @echo:
    @echo Using WinPython from %WINPYDIRBASE%
    @echo:
    @echo ==============================================================================
    @echo:
    )
set PATH=C:\Program Files\7-Zip;C:\Program Files (x86)\7-Zip;C:\Program Files\HTML Help Workshop;C:\Program Files (x86)\HTML Help Workshop;%PATH%
set PYTHONPATH=%cd%
sphinx-build -b htmlhelp doc build\doc
hhc build\doc\PythonQwt.hhp
copy /y build\doc\PythonQwt.chm doc\_downloads
7z a doc\_downloads\PythonQwt.chm.zip doc\_downloads\PythonQwt.chm
move /y doc\PythonQwt.chm .
sphinx-build -b html doc build\doc
@echo:
@echo ==============================================================================
@echo:
if not defined UNATTENDED (
    @echo End of script
    pause
    )