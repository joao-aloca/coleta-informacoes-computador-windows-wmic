REM CRIADOR: João Alóca
REM DATA DE CRIAÇÃO: 11/08/2025
REM OBJETIVO: coletar informações das máquinas para atualização de documentação técnica

mkdir %username%-temp
cd %username%-temp
mkdir csv

hostname > %username%_geral.txt
echo "Home: %homepath%" >> %username%_geral.txt

echo ---------------------------------------------------------- >> %username%_geral.txt
echo PATH >> %username%_geral.txt
wmic /APPEND:%username%_geral.txt path softwarelicensingservice get OA3xOriginalProductKey /FORMAT:list
wmic /OUTPUT:csv\%username%_windows_license_key.csv path softwarelicensingservice get OA3xOriginalProductKey /FORMAT:csv

echo ---------------------------------------------------------- >> %username%_geral.txt
echo CPU >> %username%_geral.txt
wmic /APPEND:%username%_geral.txt cpu GET /ALL /FORMAT:list
wmic /OUTPUT:csv\%username%_cpu.csv cpu GET /ALL /FORMAT:csv

echo ---------------------------------------------------------- >> %username%_geral.txt
echo DISKDRIVE >> %username%_geral.txt
wmic /APPEND:%username%_geral.txt diskdrive GET /ALL /FORMAT:list
wmic /OUTPUT:csv\%username%_diskdrive.csv diskdrive GET /ALL /FORMAT:csv

echo ---------------------------------------------------------- >> %username%_geral.txt
echo MEMORYCHIP >> %username%_geral.txt
wmic /APPEND:%username%_geral.txt memorychip GET /ALL /FORMAT:list
wmic /OUTPUT:csv\%username%_memorychip.csv memorychip GET /ALL /FORMAT:csv

echo ---------------------------------------------------------- >> %username%_geral.txt
echo MEMPHYSICAL >> %username%_geral.txt
wmic /APPEND:%username%_geral.txt memphysical GET /ALL /FORMAT:list
wmic /OUTPUT:csv\%username%_memphysical.csv memphysical GET /ALL /FORMAT:csv

echo ---------------------------------------------------------- >> %username%_geral.txt
echo COMPUTERSYSTEM >> %username%_geral.txt
wmic /APPEND:%username%_geral.txt computersystem GET /ALL /FORMAT:list
wmic /OUTPUT:csv\%username%_computersystem.csv computersystem GET /ALL /FORMAT:csv

echo ---------------------------------------------------------- >> %username%_geral.txt
echo OS >> %username%_geral.txt
wmic /APPEND:%username%_geral.txt os GET /ALL /FORMAT:list
wmic /OUTPUT:csv\%username%_os.csv os GET /ALL /FORMAT:csv

echo ---------------------------------------------------------- >> %username%_geral.txt
echo NIC >> %username%_geral.txt
wmic /APPEND:%username%_geral.txt nic GET /ALL /FORMAT:list
wmic /OUTPUT:csv\%username%_nic.csv nic GET /ALL /FORMAT:csv

echo ---------------------------------------------------------- >> %username%_geral.txt
echo NICCONFIG >> %username%_geral.txt
wmic /APPEND:%username%_geral.txt nicconfig GET /ALL /FORMAT:list
wmic /OUTPUT:csv\%username%_nicconfig.csv nicconfig GET /ALL /FORMAT:csv

echo ---------------------------------------------------------- >> %username%_geral.txt
echo BIOS >> %username%_geral.txt
wmic /APPEND:%username%_geral.txt bios GET /ALL /FORMAT:list
wmic /OUTPUT:csv\%username%_bios.csv bios GET /ALL /FORMAT:csv

cd ..
tar -czvf %username%-inventario-ti.tar.gz %username%-temp
