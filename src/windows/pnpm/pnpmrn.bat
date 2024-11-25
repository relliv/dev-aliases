@REM Remove node modules directly

if exist "./node_modules" rd /s /q "./node_modules"
if exist "./pnpm-lock.json" rd /s /q "./pnpm-lock.json"