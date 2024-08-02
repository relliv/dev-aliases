@REM Remove node modules directly

if exist "./node_modules" rd /s /q "./node_modules"
if exist "./package-lock.json" rd /s /q "./package-lock.json"