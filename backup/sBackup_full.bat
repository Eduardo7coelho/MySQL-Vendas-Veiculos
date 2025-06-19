@echo off
REM Script para fazer backup completo do esquema sucos_vendas

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
set BACKUP_DIR_COMPLETO=%BACKUP_DIR_BASE%\BACKUP_COMPLETO_%DATA%
set MYSQL_USER=admin
set MYSQL_PASSWORD=Brasil@2025
set DATABASE=impetus_veiculos

REM Criar o diretório de backup completo se não existir
if not exist %BACKUP_DIR_COMPLETO% (
    mkdir %BACKUP_DIR_COMPLETO%
)

REM Executar o mysqldump para o backup completo
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqldump" -u %MYSQL_USER% -p%MYSQL_PASSWORD% %DATABASE% > %BACKUP_DIR_COMPLETO%\%DATABASE%_backup.sql

REM Verificar se o comando foi executado com sucesso para o backup completo
if %errorlevel% neq 0 (
    echo "Erro ao realizar o backup completo do banco de dados"
) else (
    echo "Backup completo realizado com sucesso"
)

REM Fim do script
