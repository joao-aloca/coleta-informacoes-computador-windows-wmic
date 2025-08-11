REM CRIADOR: João Alóca
REM DATA DE CRIAÇÃO: 11/08/2025
REM OBJETIVO: coletar informações das máquinas para atualização de documentação técnica

set HOME = %homepath%
set MAIN_DIR=%username%-computador-specs
set CSV_DIR=csv
set TXT_FILE=%username%_geral.txt

mkdir %MAIN_DIR%
mkdir %MAIN_DIR%\%CSV_DIR%

cd %MAIN_DIR%

hostname > %TXT_FILE%
echo %username% >> %TXT_FILE%

echo ---------------------------------------------------------- >> %TXT_FILE%
echo COMPUTERSYSTEM >> %TXT_FILE%
wmic /APPEND:%TXT_FILE% computersystem GET /ALL /FORMAT:list
wmic /OUTPUT:%CSV_DIR%\%username%_computersystem.csv computersystem GET /ALL /FORMAT:csv

echo ---------------------------------------------------------- >> %TXT_FILE%
echo CPU >> %TXT_FILE%
wmic /APPEND:%TXT_FILE% cpu GET /ALL /FORMAT:list
wmic /OUTPUT:%CSV_DIR%\%username%_cpu.csv cpu GET /ALL /FORMAT:csv

echo ---------------------------------------------------------- >> %TXT_FILE%
echo DISKDRIVE >> %TXT_FILE%
wmic /APPEND:%TXT_FILE% diskdrive GET /ALL /FORMAT:list
wmic /OUTPUT:%CSV_DIR%\%username%_diskdrive.csv diskdrive GET /ALL /FORMAT:csv

echo ---------------------------------------------------------- >> %TXT_FILE%
echo MEMORYCHIP >> %TXT_FILE%
wmic /APPEND:%TXT_FILE% memorychip GET /ALL /FORMAT:list
wmic /OUTPUT:%CSV_DIR%\%username%_memorychip.csv memorychip GET /ALL /FORMAT:csv

echo ---------------------------------------------------------- >> %TXT_FILE%
echo MEMPHYSICAL >> %TXT_FILE%
wmic /APPEND:%TXT_FILE% memphysical GET /ALL /FORMAT:list
wmic /OUTPUT:%CSV_DIR%\%username%_memphysical.csv memphysical GET /ALL /FORMAT:csv

echo ---------------------------------------------------------- >> %TXT_FILE%
echo OS >> %TXT_FILE%
wmic /APPEND:%TXT_FILE% os GET /ALL /FORMAT:list
wmic /OUTPUT:%CSV_DIR%\%username%_os.csv os GET /ALL /FORMAT:csv

echo ---------------------------------------------------------- >> %TXT_FILE%
echo NIC >> %TXT_FILE%
wmic /APPEND:%TXT_FILE% nic GET /ALL /FORMAT:list
wmic /OUTPUT:%CSV_DIR%\%username%_nic.csv nic GET /ALL /FORMAT:csv

echo ---------------------------------------------------------- >> %TXT_FILE%
echo BIOS >> %TXT_FILE%
wmic /APPEND:%TXT_FILE% bios GET /ALL /FORMAT:list
wmic /OUTPUT:%CSV_DIR%\%username%_bios.csv bios GET /ALL /FORMAT:csv


REM  Coleta da Chave de Licença do Windows (BIOS)
echo ---------------------------------------------------------- >> %TXT_FILE%
echo PATH >> %TXT_FILE%
wmic /APPEND:%TXT_FILE% path softwarelicensingservice get OA3xOriginalProductKey /FORMAT:list
wmic /OUTPUT:%CSV_DIR%\%username%_windows_license_key.csv path softwarelicensingservice get OA3xOriginalProductKey /FORMAT:csv

cd ..
tar -czvf %MAIN_DIR%.tar.gz %MAIN_DIR%