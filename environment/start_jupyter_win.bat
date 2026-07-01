@echo off
setlocal EnableExtensions

REM ------------------------------------------------------------
REM AI for NTH Summer School - Windows launcher
REM Assumes this script lives in: AI_NTH_Bundle\environment
REM ------------------------------------------------------------

REM Resolve bundle root
set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%..") do set "BUNDLE_DIR=%%~fI"

set "ENV_ARCHIVE=%SCRIPT_DIR%ai-nth-summerschool_windows.zip"
set "ENV_DIR=%SCRIPT_DIR%portable_env"
set "PYTHON_EXE=%ENV_DIR%\python.exe"
set "CONDA_UNPACK=%ENV_DIR%\Scripts\conda-unpack.exe"
set "VERIFY_NOTEBOOK=%SCRIPT_DIR%00_verify_environment.ipynb"
set "COURSE_MATERIALS_DIR=%BUNDLE_DIR%\course_materials"
set "DATASETS_DIR=%BUNDLE_DIR%\datasets"
set "UNPACK_MARKER=%ENV_DIR%\.conda_unpacked_done"

echo.
echo ============================================
echo AI for NTH Summer School - Jupyter Launcher
echo ============================================
echo Bundle directory: %BUNDLE_DIR%
echo.

REM Basic checks
if not exist "%ENV_ARCHIVE%" (
    echo ERROR: Environment archive not found:
    echo   %ENV_ARCHIVE%
    echo.
    echo Please check that the bundle was copied correctly.
    pause
    exit /b 1
)

if not exist "%COURSE_MATERIALS_DIR%" (
    echo WARNING: course_materials folder not found:
    echo   %COURSE_MATERIALS_DIR%
    echo.
)

if not exist "%DATASETS_DIR%" (
    echo WARNING: datasets folder not found:
    echo   %DATASETS_DIR%
    echo.
)

if not exist "%VERIFY_NOTEBOOK%" (
    echo WARNING: Verification notebook not found:
    echo   %VERIFY_NOTEBOOK%
    echo JupyterLab will still open, but please check the bundle contents.
    echo.
)

REM First-run unpack
if not exist "%PYTHON_EXE%" (
    echo First launch detected. Extracting the portable environment...
    echo This may take a few minutes.
    echo.

    if exist "%ENV_DIR%" (
        echo Removing incomplete existing environment folder...
        rmdir /s /q "%ENV_DIR%"
    )

    mkdir "%ENV_DIR%" >nul 2>&1

    powershell -NoProfile -ExecutionPolicy Bypass -Command ^
        "Expand-Archive -LiteralPath '%ENV_ARCHIVE%' -DestinationPath '%ENV_DIR%' -Force"

    if errorlevel 1 (
        echo ERROR: Failed to extract the environment archive.
        echo.
        echo Please check that you copied the bundle to a writable local folder.
        pause
        exit /b 1
    )

    if exist "%CONDA_UNPACK%" (
        echo Running conda-unpack to fix environment paths...
        call "%CONDA_UNPACK%"
        if errorlevel 1 (
            echo ERROR: conda-unpack failed.
            pause
            exit /b 1
        )
        echo done > "%UNPACK_MARKER%"
    ) else (
        echo ERROR: conda-unpack.exe not found:
        echo   %CONDA_UNPACK%
        echo The packed environment may be incomplete.
        pause
        exit /b 1
    )
)

REM Launch JupyterLab
cd /d "%BUNDLE_DIR%"

echo Launching JupyterLab...
echo.

if exist "%VERIFY_NOTEBOOK%" (
    call "%PYTHON_EXE%" -m jupyter lab --ServerApp.root_dir="%BUNDLE_DIR%" "%VERIFY_NOTEBOOK%"
) else (
    call "%PYTHON_EXE%" -m jupyter lab --ServerApp.root_dir="%BUNDLE_DIR%" "%COURSE_MATERIALS_DIR%"
)

if errorlevel 1 (
    echo.
    echo ERROR: JupyterLab failed to start.
    echo Please contact the organisers / TAs for support.
    pause
    exit /b 1
)

endlocal
exit /b 0
