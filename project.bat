@echo OFF
: start
SET JAVA_OPTS = " -Xmx1024m -Xms256m "
set hour=%time:~0,2%
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
set min=%time:~3,2%
if "%min:~0,1%" == " " set min=0%min:~1,1%
set secs=%time:~6,2%
if "%secs:~0,1%" == " " set secs=0%secs:~1,1%
set year=%date:~-4%
set month=%date:~3,2%
if "%month:~0,1%" == " " set month=0%month:~1,1%
set day=%date:~0,2%
if "%day:~0,1%" == " " set day=0%day:~1,1%
Set MaDate=%day%/%month%/%year%
Set MyTime=%hour%:%min%:%secs%
set DateTimeFile=%year%_%month%_%day%_%hour%_%min%_%secs%
echo "Execution de fichier Jar dans un script Batch" > output_%DateTimeFile%.log




set /p nom="Enter votre nom : " 

set nom=%1
set set=%2

echo   ## INPUT##  >> output_%DateTimeFile%.log


  ECHO   le resultat est dans fichier log  
if [%2] == [] (
    ECHO votre nom  invalide     
) else (
   java -jar med-1.0-SNAPSHOT.jar %nom%   >> output_%DateTimeFile%.log
)
echo   ## OUTPUT##  >> output_%DateTimeFile%.log
for /f "delims=" %%A in ( ' java -jar med-1.0-SNAPSHOT.jar %nom%' ) do set retvalue=%%A
echo   Bonjour Mr %retvalue%  >> output_%DateTimeFile%.log

set /p test="Tester votre nom : "  
echo   Le nom de Test est : %test%  >> output_%DateTimeFile%.log
IF  "%test%"=="%retvalue%" (
    ECHO votre nom  est valide     >> output_%DateTimeFile%.log
) else (
ECHO votre nom  est invalide     >> output_%DateTimeFile%.log
)
 IF /I "%ERRORLEVEL%" NEQ "0" (
    ECHO execution d'application est echoué      >> output_%DateTimeFile%.log
)
 

@pause