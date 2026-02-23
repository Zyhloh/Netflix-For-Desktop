@echo off
echo ============================================
echo  Netflix For Desktop - uBlock Origin Setup
echo ============================================
echo.

:: Check if UBlock folder already exists
if exist "UBlock\manifest.json" (
    echo uBlock Origin is already installed in UBlock\
    echo Delete the UBlock folder first if you want to re-download.
    pause
    exit /b 0
)

echo Downloading uBlock Origin for Chromium...

:: Download the latest Chromium release zip from GitHub
set "UBLOCK_URL=https://github.com/gorhill/uBlock/releases/download/1.69.0/uBlock0_1.69.0.chromium.zip"
set "ZIP_FILE=%TEMP%\ublock_chromium.zip"
set "EXTRACT_DIR=%TEMP%\ublock_extract"

powershell -Command "try { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%UBLOCK_URL%' -OutFile '%ZIP_FILE%' -UseBasicParsing; Write-Host 'Download complete.' } catch { Write-Host 'ERROR: Download failed.' -ForegroundColor Red; Write-Host $_.Exception.Message; exit 1 }"
if %ERRORLEVEL% neq 0 (
    echo.
    echo Download failed. Please check your internet connection.
    echo You can also manually download uBlock Origin for Chromium from:
    echo   https://github.com/gorhill/uBlock/releases
    echo Extract the contents into a folder called "UBlock" next to this script.
    pause
    exit /b 1
)

echo Extracting...

:: Clean up any previous extract
if exist "%EXTRACT_DIR%" rmdir /s /q "%EXTRACT_DIR%"

:: Extract using native PowerShell (Expand-Archive)
powershell -Command "try { Expand-Archive -Path '%ZIP_FILE%' -DestinationPath '%EXTRACT_DIR%' -Force; Write-Host 'Extraction complete.' } catch { Write-Host 'ERROR: Extraction failed.' -ForegroundColor Red; Write-Host $_.Exception.Message; exit 1 }"
if %ERRORLEVEL% neq 0 (
    echo.
    echo Extraction failed.
    pause
    exit /b 1
)

:: Find manifest.json inside extracted folder and copy to UBlock
if exist "UBlock" rmdir /s /q "UBlock"
powershell -Command "$manifest = Get-ChildItem -Path '%EXTRACT_DIR%' -Filter 'manifest.json' -Recurse | Select-Object -First 1; if ($manifest) { $src = $manifest.DirectoryName; Copy-Item -Path $src -Destination 'UBlock' -Recurse -Force; Write-Host 'Copied to UBlock folder.' } else { Write-Host 'ERROR: manifest.json not found.' -ForegroundColor Red; exit 1 }"
if %ERRORLEVEL% neq 0 (
    echo.
    echo ERROR: Could not find manifest.json in the downloaded archive.
    echo The download may be corrupted. Please try again.
    rmdir /s /q "%EXTRACT_DIR%" 2>nul
    del "%ZIP_FILE%" 2>nul
    pause
    exit /b 1
)

:: Clean up temp files
rmdir /s /q "%EXTRACT_DIR%" 2>nul
del "%ZIP_FILE%" 2>nul

:: Verify
if exist "UBlock\manifest.json" (
    echo.
    echo ============================================
    echo  uBlock Origin installed successfully!
    echo ============================================
    echo  Location: UBlock\
    echo  You can now build the project with:
    echo    dotnet publish -c Release -r win-x64 --self-contained false -o publish
    echo ============================================
) else (
    echo.
    echo ERROR: Installation verification failed.
    echo Please try again or manually download uBlock Origin.
)

pause
