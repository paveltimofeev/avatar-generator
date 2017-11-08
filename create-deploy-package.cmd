@echo off

rmdir /S /Q _deploy >nul 2>&1
mkdir _deploy

xcopy /I /S /Q img _deploy\img\
xcopy /I /S /Q lib _deploy\lib\
rem xcopy /I /S /Q node_modules _deploy\node_modules\
xcopy /I /Q package.json _deploy\package.json*
xcopy /I /Q settings.js _deploy\settings.js*
xcopy /I /Q handler.js _deploy\handler.js*

cd _deploy
call npm install --production
cd ..

del /Q "%CD%\_deploy.zip" >nul 2>&1
"%PROGRAMFILES(x86)%\WinRAR\winrar.exe"  a -afzip "%CD%\_deploy.zip" _deploy
echo Packed to "%CD%\_deploy.zip"
