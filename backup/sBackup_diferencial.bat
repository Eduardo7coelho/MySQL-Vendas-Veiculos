@echo off
REM Script para fazer backup diferencial do esquema sucos_vendas

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
set BACKUP_DIR_DIFERENCIAL=%BACKUP_DIR_BASE%\BACKUP_DIFERENCIAL_%DATA%
set BACKUP_DATA=C:\ProgramData\MySQL\MySQL Server 8.0\Data
set MYSQL_USER=admin
set MYSQL_PASSWORD=Brasil@2025
set DATABASE=impetus_veiculos

REM Criar o diretório de backup diferencial se não existir
if not exist %BACKUP_DIR_DIFERENCIAL% (
    mkdir %BACKUP_DIR_DIFERENCIAL%
)

REM Backup Diferencial: Copiar todos os arquivos BIN, exceto os com extensão .index
for %%A in ("%BACKUP_DATA%\*-bin.*") do (
    if not "%%~xA"==".index" (
        copy "%%A" "%BACKUP_DIR_DIFERENCIAL%\"
    )
)

REM Verificar se o comando foi executado com sucesso para o backup diferencial
if %errorlevel% neq 0 (
    echo "Erro ao realizar o backup diferencial do banco de dados"
) else (
    echo "Backup diferencial realizado com sucesso"
)

REM Fim do script
