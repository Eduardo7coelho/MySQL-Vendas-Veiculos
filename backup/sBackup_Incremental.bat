@echo off

REM Definir variáveis
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do (
    set YYYY=%%d
    set MM=%%b
    set DD=%%c
)
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set HH=%%a
    set MN=%%b
)
set DATA=%YYYY%%MM%%DD%%HH%%MN%
set BACKUP_DIR_BASE=C:\backups\mysql
set BACKUP_DIR_INCREMENTAL=%BACKUP_DIR_BASE%\BACKUP_INCREMENTAL_%DATA%
set BACKUP_DATA=C:\ProgramData\MySQL\MySQL Server 8.0\Data
set MYSQL_USER=admin
set MYSQL_PASSWORD=Brasil@2025
set DATABASE=impetus_veiculos

REM Criar o diretório de backup incremental se não existir
if not exist %BACKUP_DIR_INCREMENTAL% (
    mkdir %BACKUP_DIR_INCREMENTAL%
)

REM Backup Incremental: Encontrar o maior arquivo BIN pela extensão numérica e copiá-lo
setlocal enabledelayedexpansion
set LARGEST_BIN=
set MAX_NUM=0

for %%A in ("%BACKUP_DATA%\*-bin.*") do (
    set FILE=%%~nA
    set EXT=%%~xA
    set EXT=!EXT:~1!
    REM Converter a extensão para numérico
    set /A EXT_NUM=!EXT!
    if !EXT_NUM! gtr !MAX_NUM! (
        set MAX_NUM=!EXT_NUM!
        set LARGEST_BIN=%%A
    )
)

REM Verificar se foi encontrado um arquivo BIN para o backup incremental
if "%LARGEST_BIN%"=="" (
    echo "Nenhum arquivo BIN encontrado no diretório %BACKUP_DATA%"
    exit /b 1
)

REM Copiar o maior arquivo BIN para o diretório de backup incremental com o mesmo nome
copy "%LARGEST_BIN%" "%BACKUP_DIR_INCREMENTAL%"

REM Executar o comando FLUSH LOGS no MySQL
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql" -u %MYSQL_USER% -p%MYSQL_PASSWORD% -e "FLUSH LOGS;"

REM Verificar se o comando foi executado com sucesso para o backup incremental
if %errorlevel% neq 0 (
    echo "Erro ao realizar o backup incremental do banco de dados"
) else (
    echo "Backup incremental realizado com sucesso"
)

endlocal
