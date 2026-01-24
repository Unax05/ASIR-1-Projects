@echo off
setlocal enabledelayedexpansion

:: Configuración por defecto
set DEFAULT_ORIGEN=C:\Laboratorio_LACC
set DEFAULT_DESTINO=D:\Backups_LACC
set DIAS_RETENCION_LOGS=30

:: Carpeta específica para logs
set CARPETA_LOGS=!DEFAULT_DESTINO!\Logs

:MENU_PRINCIPAL
cls
echo.
echo ===========
echo MENU BACKUP
echo ===========
echo.
echo 1. Realizar Backup
echo 2. Limpiar Logs Antiguos
echo 3. Configurar Rutas por Defecto
echo 4. Salir
echo.
choice /c 1234 /n /m "Selecciona una opcion: "

if %errorlevel% equ 1 goto REALIZAR_BACKUP
if %errorlevel% equ 2 goto LIMPIAR_LOGS
if %errorlevel% equ 3 goto CONFIGURAR_RUTAS
if %errorlevel% equ 4 goto SALIR

:REALIZAR_BACKUP
cls
echo.
echo REALIZAR BACKUP
echo ===============
echo.
echo Ruta origen actual: !DEFAULT_ORIGEN!
echo Ruta destino actual: !DEFAULT_DESTINO!
echo Carpeta logs: !CARPETA_LOGS!
echo.

set /p USAR_DEFAULT="Usar rutas por defecto? (S/n): "
if /i "!USAR_DEFAULT!"=="n" goto PERSONALIZAR_RUTAS

set ORIGEN=!DEFAULT_ORIGEN!
set DESTINO=!DEFAULT_DESTINO!
set CARPETA_LOGS=!DESTINO!\Logs
goto EJECUTAR_BACKUP

:PERSONALIZAR_RUTAS
echo.
set /p ORIGEN="Introduce ruta ORIGEN: "
set /p DESTINO="Introduce ruta DESTINO: "
set CARPETA_LOGS=!DESTINO!\Logs

:EJECUTAR_BACKUP
:: Verificar origen
if not exist "!ORIGEN!\" (
    echo.
    echo ERROR: La carpeta origen no existe: !ORIGEN!
    pause
    goto REALIZAR_BACKUP
)

:: Crear destino si no existe
if not exist "!DESTINO!\" (
    mkdir "!DESTINO!" >nul 2>&1
    if errorlevel 1 (
        echo.
        echo ERROR: No se pudo crear la carpeta destino
        pause
        goto REALIZAR_BACKUP
    )
)

:: Crear carpeta de logs si no existe
if not exist "!CARPETA_LOGS!\" (
    mkdir "!CARPETA_LOGS!" >nul 2>&1
)

:: Generar nombres de log únicos
set FECHA_HORA=%date:~-4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%
set FECHA_HORA=!FECHA_HORA: =0!
set LOG_INDIVIDUAL=!CARPETA_LOGS!\backup_!FECHA_HORA!.log
set LOG_RESUMEN=!CARPETA_LOGS!\resumen_backups.log

echo.
echo Origen:  !ORIGEN!
echo Destino: !DESTINO!
echo Log:     !LOG_INDIVIDUAL!
echo.
echo Realizando backup...

:: Ejecutar backup
robocopy "!ORIGEN!" "!DESTINO!" /E /XO /R:3 /W:10 /LOG:"!LOG_INDIVIDUAL!" /NP

:: Registrar en log resumen
echo !date! !time! - Backup completado >> "!LOG_RESUMEN!"
echo   Origen: !ORIGEN! >> "!LOG_RESUMEN!"
echo   Destino: !DESTINO! >> "!LOG_RESUMEN!"
echo   Log: !LOG_INDIVIDUAL! >> "!LOG_RESUMEN!"
if %errorlevel% leq 7 (
    echo   Estado: EXITOSO >> "!LOG_RESUMEN!"
) else (
    echo   Estado: FALLIDO >> "!LOG_RESUMEN!"
)
echo. >> "!LOG_RESUMEN!"

echo.
echo Backup completado: !LOG_INDIVIDUAL!
pause
goto MENU_PRINCIPAL

:LIMPIAR_LOGS
cls
echo.
echo LIMPIAR LOGS ANTIGUOS
echo =====================
echo.
echo ATENCION: Se eliminaran TODOS los logs de la carpeta:
echo !CARPETA_LOGS!
echo.
set /p CONFIRMAR="Continuar? (s/N): "
if /i not "!CONFIRMAR!"=="s" goto MENU_PRINCIPAL

if exist "!CARPETA_LOGS!\" (
    :: Eliminar todos los archivos .log de la carpeta de logs
    del "!CARPETA_LOGS!\*.log" /Q >nul 2>&1
    echo.
    echo Todos los logs han sido eliminados de: !CARPETA_LOGS!
) else (
    echo No existe la carpeta de logs: !CARPETA_LOGS!
)
pause
goto MENU_PRINCIPAL

:CONFIGURAR_RUTAS
cls
echo.
echo CONFIGURAR RUTAS POR DEFECTO
echo ============================
echo.
echo Ruta origen actual: !DEFAULT_ORIGEN!
echo Ruta destino actual: !DEFAULT_DESTINO!
echo Carpeta logs actual: !CARPETA_LOGS!
echo.
set /p NUEVO_ORIGEN="Nueva ruta origen (Enter para mantener actual): "
set /p NUEVO_DESTINO="Nueva ruta destino (Enter para mantener actual): "

if not "!NUEVO_ORIGEN!"=="" set DEFAULT_ORIGEN=!NUEVO_ORIGEN!
if not "!NUEVO_DESTINO!"=="" (
    set DEFAULT_DESTINO=!NUEVO_DESTINO!
    set CARPETA_LOGS=!DEFAULT_DESTINO!\Logs
)

echo.
echo Configuracion actualizada:
echo Origen:  !DEFAULT_ORIGEN!
echo Destino: !DEFAULT_DESTINO!
echo Logs:    !CARPETA_LOGS!
pause
goto MENU_PRINCIPAL

:SALIR
cls
echo.
echo Saliendo...
echo.
endlocal