@echo off
setlocal

REM Set the current directory as a variable
set "currentDir=%cd%"

REM Create directories
echo Creating directories...
mkdir "%currentDir%\Backup"
mkdir "%currentDir%\Logs"
mkdir "%currentDir%\Temp"

REM Copy files
echo Copying files...
copy "%currentDir%\*.txt" "%currentDir%\Backup"

REM Move files
echo Moving files...
move "%currentDir%\Backup\*.txt" "%currentDir%\Logs"

REM Delete files in the Temp directory older than 7 days
echo Deleting old files...
forfiles /p "%currentDir%\Temp" /s /m *.* /d -7 /c "cmd /c del @path"

REM Display a message
echo All tasks completed successfully.

REM Logging the operations
echo Creating log file...
set logFile="%currentDir%\Logs\operations.log"
echo %date% %time% - Created directories >> %logFile%
echo %date% %time% - Copied files to Backup >> %logFile%
echo %date% %time% - Moved files to Logs >> %logFile%
echo %date% %time% - Deleted old files in Temp >> %logFile%
echo %date% %time% - All tasks completed successfully >> %logFile%

REM Display log file content
type %logFile%

REM End script
echo Script execution finished.
pause
endlocal
