@echo off
title GESTION DE BASE DE DATOS - DROI
color 02
echo ==================================
echo =   GESTION DE BASE DE DATOS     =
echo ==================================
echo Version 0.1
echo Autor DROI
echo Todos los derechos reservados
pause
:menu
cls
echo ==================================
echo =   GESTION DE BASE DE DATOS     =
echo ==================================
echo OPCIONES
echo -1 Crear Base de datos 'gesadmin'
echo -2 Cargar DB desde archivo
echo -3 Ir a PhpMyAdmin
echo -4 Salir
set /p N=selecciona una opcion:
:: Call and mask out invalid call targets
  goto :switch-case-N-%N% 2>nul || (
    :: Default case
    echo No es una opcion
    pause
    goto :menu
  )
  goto :switch-case-end
  :switch-case-N-1
    cls
    echo ==================================
    cd "C:\"
    cd xampp/mysql/bin
    color 0b
    set D=VACIO
    set /p D=Ingrese nombre base de datos (vacio si es 'gesadmin'):
    if %D%==VACIO set D=gesadmin
    echo Base de datos: %D%
    echo CREATE DATABASE %D%; > data.txt
    pause
    mysql -u root < data.txt
    echo LISTO!!
    del data.txt
    pause
    goto :switch-case-end
    pause
  :switch-case-N-2
    cls
    echo ==================================
    color 0d
    set D=VACIO
    set /p D=Ingrese nombre base de datos (vacio si es 'gesadmin'):
    if %D%==VACIO set D=gesadmin
    echo Base de datos: %D%
    echo Ruta del archivo '.sql' (se recomienda que en el nombre del archivo no haya espacios :D )
    set /p U=Ingrese direccion:
    echo Ruta archivo: %U%
    cd "C:\"
    cd xampp/mysql/bin
    mysql -u root %D% < %U%
    echo LISTO!!
    pause
    goto :switch-case-end
  :switch-case-N-3
    start http://localhost/phpmyadmin
    goto :switch-case-end
  :switch-case-N-4
    exit
:switch-case-end
 goto :menu
