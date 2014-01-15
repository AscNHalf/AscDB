:TOP
@CLS
@ECHO OFF
ECHO.
COLOR 0A
echo --------------------------------------------------------------------------------
echo --------------------------------------------------------------------------------
echo        888                                   8888888b.  888888b.
echo       888888        8888888      88888888    888    88  888  "88b
echo      888  888      888    888   888    888   888    888 888  .88P
echo     888    888       888        888          888    888 8888888K.
echo    888      888        888      888          888    888 888  "Y88b
echo   88888888888888        888     888          888    888 888    888
echo  888          888  888   888    888    888   888  .d88P 888   d88P
echo 888            888   88888       88888888    8888888P"  8888888P"
echo --------------------------------------------------------------------------------
echo --------------------------------------------------------------------------------
echo Written By ScymeX
echo.
ECHO Please enter your MySQL Info...
ECHO.
set /p host= MySQL Server Address (Default: localhost): 
ECHO.
set /p user= MySQL Username: 
set /p pass= MySQL Password: 
ECHO.
echo World Database
set /p wdb=
echo Character Database
set /p chdb=
echo Logon Database
set /p ldb=
SET port=3306



:Begin
CLS
ECHO.
COLOR 0A
echo --------------------------------------------------------------------------------
echo --------------------------------------------------------------------------------
echo        888                                   8888888b.  888888b.
echo       888888        8888888      88888888    888    88  888  "88b
echo      888  888      888    888   888    888   888    888 888  .88P
echo     888    888       888        888          888    888 8888888K.
echo    888      888        888      888          888    888 888  "Y88b
echo   88888888888888        888     888          888    888 888    888
echo  888          888  888   888    888    888   888  .d88P 888   d88P
echo 888            888   88888       88888888    8888888P"  8888888P"
echo --------------------------------------------------------------------------------
echo --------------------------------------------------------------------------------
ECHO 	A - Import World Database
ECHO 	B - Import Character Database
ECHO 	C - Import Logon Database
ECHO 	D - Import World Structure
ECHO 	E - Import Character Structure
ECHO 	F - Import Logon Structure
ECHO  !Importing the update is not perfect!
ECHO 	G - Update World Database
ECHO 	H - Update Character Database
ECHO 	i - Update Logon Database
ECHO -------------------------------------------------------------------
ECHO 	X - Exit this tool
ECHO -------------------------------------------------------------------
SET /p v= 		Enter a char: 
IF %v%==* GOTO error
IF %v%==a GOTO worlddb
IF %v%==A GOTO worlddb
IF %v%==b GOTO chardb
IF %v%==B GOTO chardb
IF %v%==c GOTO logondb
IF %v%==C GOTO logondb
IF %v%==d GOTO worldst
IF %v%==D GOTO worldst
IF %v%==e GOTO charst
IF %v%==E GOTO charst
IF %v%==f GOTO logonst
IF %v%==F GOTO logonst
IF %v%==g GOTO worldup
IF %v%==G GOTO worldup
IF %v%==h GOTO charup
IF %v%==H GOTO charup
IF %v%==i GOTO logonup
IF %v%==I GOTO logonup
IF %v%==x GOTO exit
IF %v%==X GOTO exit
set v=
GOTO error

:worlddb
CLS
ECHO Import World Database...
Echo.
ECHO Please extract latest .zip file!
ECHO Press any key to continue!
PAUSE >NUL
ECHO Please wait...................
ECHO Import Database
for %%a in ("Database\AscDB_*.SQL") do mysql -h %host% --user=%user% --password=%pass% --port=%port% %wdb% < %%a
echo Done.
ECHO Press any key to exit.
PAUSE >NUL
GOTO begin

:chardb
CLS
ECHO Import World Database...
Echo.
for %%a in ("Database\Characters.SQL") do mysql -h %host% --user=%user% --password=%pass% --port=%port% %chdb% < %%a
echo Done.
ECHO Press any key to exit.
PAUSE >NUL
GOTO begin

:logondb
CLS
ECHO Import World Database...
Echo.
for %%a in ("Database\Logon.SQL") do mysql -h %host% --user=%user% --password=%pass% --port=%port% %ldb% < %%a
echo Done.
ECHO Press any key to exit.
PAUSE >NUL
GOTO begin

:worldup
CLS
ECHO Import World Updates...
Echo.
for %%a in ("Updates\World_updates\*.SQL") do mysql -h %host% --user=%user% --password=%pass% --port=%port% %wdb% < %%a
echo Done.
ECHO Press any key to exit.
PAUSE >NUL
GOTO begin

:charup
CLS
ECHO Import Character Updates...
Echo.
for %%a in ("Updates\Char_updates\*.SQL") do mysql -h %host% --user=%user% --password=%pass% --port=%port% %chdb% < %%a
echo Done.
ECHO Press any key to exit.
PAUSE >NUL
GOTO begin

:logonup
CLS
ECHO Import Logon Updates...
Echo.
for %%a in ("Updates\Logon_updates\*.SQL") do mysql -h %host% --user=%user% --password=%pass% --port=%port% %ldb% < %%a
echo Done.
ECHO Press any key to exit.
PAUSE >NUL
GOTO begin

:worldst
CLS
ECHO Import World Structure...
Echo.
for %%a in ("Structure\World.SQL") do mysql -h %host% --user=%user% --password=%pass% --port=%port% %wdb% < %%a
echo Done.
ECHO Press any key to exit.
PAUSE >NUL
GOTO begin

:charst
CLS
ECHO Import Character Structure...
Echo.
for %%a in ("Structure\Characters.SQL") do mysql -h %host% --user=%user% --password=%pass% --port=%port% %chdb% < %%a
echo Done.
ECHO Press any key to exit.
PAUSE >NUL
GOTO begin

:logonst
CLS
ECHO Import Logon Structure...
Echo.
for %%a in ("Structure\Logon.SQL") do mysql -h %host% --user=%user% --password=%pass% --port=%port% %ldb% < %%a
echo Done.
ECHO Press any key to exit.
PAUSE >NUL
GOTO begin

:error
ECHO 	Please enter a correct character.
ECHO.
PAUSE
GOTO begin

:error2
ECHO 	Changeset with this number not found.
ECHO.
PAUSE
GOTO begin

:exit