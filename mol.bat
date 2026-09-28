@echo off
setlocal EnableExtensions EnableDelayedExpansion

color a

:: Tabela de elementos
set "elemTab=H He Li Be B C N O F Ne Na Mg Al Si P S Cl Ar K Ca Sc Ti V Cr Mn Fe Co Ni Cu Zn Ga Ge As Se Br Kr Rb Sr Y Zr Nb Mo Tc Ru Rh Pd Ag Cd In Sn Sb Te I Xe Cs Ba La Ce Pr Nd Pm Sm Eu Gd Tb Dy Ho Er Tm Yb Lu Hf Ta W Re Os Ir Pt Au Hg Tl Pb Bi Po At Rn Fr Ra Ac Th Pa U Np Pu Am Cm Bk Cf Es Fm Md No Lr Rf Db Sg Bh Hs Mt Ds Rg Cn Nh Fl Mc Lv Ts Og"

set /a Z=0

for %%E in (%elemTab%) do (
    set /a Z+=1
    set "numAtomico[%%E]=!Z!"
)

for %%E in (%elemTab%) do (
    set "qtd[%%E]=0"
)

::Intro
echo.
echo ==============================================
echo       CALCULADORA DE MASSA MOLAR E MOL
echo ==============================================
echo.

set /p "formula=Digite uma formula quimica: "

:: Remove espacos
set "formula=!formula: =!"

if not defined formula (
    echo.
    echo ERRO: nenhuma formula foi informada.
    echo.
    pause
    exit /b
)

set "resto=!formula!"

call :grupo 1

:: Caso erro
if defined erro (
    echo.
    echo ==============================================
    echo ERRO
    echo ==============================================
    echo !erro!
    echo ==============================================
    echo.
    pause
    exit /b
)

if defined resto (
    echo.
    echo ==============================================
    echo ERRO
    echo ==============================================
    echo Formula nao foi completamente processada.
    echo Restante: !resto!
    echo ==============================================
    echo.
    pause
    exit /b
)

echo.
echo ==============================================
echo       	      RESULTADO
echo ==============================================
echo.

for %%E in (%elemTab%) do (

    if !qtd[%%E]! GTR 0 (

        if !qtd[%%E]! EQU 1 (
            echo Elemento %%E ^| Numero atomico: !numAtomico[%%E]!
        ) else (
            echo Elemento %%E ^| Numero atomico: !numAtomico[%%E]! ^| Quantidade: !qtd[%%E]!
        )
    )
)

echo.
pause
cls
exit /b

::Tratamento de um grupo quimico
:grupo

set /a multiplicador=%1

:grupo_loop

:: Se acabou o texto, termina
if not defined resto exit /b

:: Primeiro caractere
set "c1=!resto:~0,1!"

:: Se encontrou fechamento, retorna para quem abriu
if "!c1!"==")" exit /b

::Abre grupo
if "!c1!"=="(" goto abrir_grupo

goto ler_elemento

::Func para abrir grupo
:abrir_grupo

::Remove "("
set "resto=!resto:~1!"

:: Guarda quantidades antes do grupo
for %%E in (%elemTab%) do (
    set "qtdAntes[%%E]=!qtd[%%E]!"
)

::Processa conteúdo
call :grupo 1

if defined erro exit /b

:: Tem que existir ")"
if not defined resto (
    set "erro=Parenteses aberto sem fechamento."
    exit /b
)

set "c1=!resto:~0,1!"

if not "!c1!"==")" (
    set "erro=Era esperado um parenteses de fechamento."
    exit /b
)

:: Remove ")"
set "resto=!resto:~1!"

:: Lê número após o grupo
call :ler_numero

if not defined numero set "numero=1"

:: Multiplica elementos adicionados pelo grupo
for %%E in (%elemTab%) do (

    set /a "adicionados=qtd[%%E]-qtdAntes[%%E]"

    if !adicionados! GTR 0 (
        set /a "qtd[%%E]+=adicionados*(numero-1)"
    )
)

goto grupo_loop

:ler_elemento

set "simbolo="
set "dois=0"

set "c2=!resto:~1,1!"

if defined c2 (

    for %%E in (%elemTab%) do (

        if "%%E"=="!c1!!c2!" (
            set "simbolo=%%E"
            set "dois=1"
        )
    )
)

if not defined simbolo (

    for %%E in (%elemTab%) do (

        if "%%E"=="!c1!" (
            set "simbolo=%%E"
        )
    )
)

if not defined simbolo (
    set "erro=Elemento invalido: !c1!"
    exit /b
)

if "!dois!"=="1" (
    set "resto=!resto:~2!"
) else (
    set "resto=!resto:~1!"
)

call :ler_numero

if not defined numero set "numero=1"

::Adiciona um elemento
set /a "qtd[%simbolo%]=qtd[%simbolo%]+numero*multiplicador"

goto grupo_loop

:ler_numero

set "numero="

:numero_loop

if not defined resto exit /b

set "c2=!resto:~0,1!"

call :eh_digito "!c2!"

if errorlevel 1 exit /b

set "numero=!numero!!c2!"
set "resto=!resto:~1!"

goto numero_loop


:: Funcao :eh_digito verifica se o caractere é um número.
::
:: ERRORLEVEL 0 = SIM
:: ERRORLEVEL 1 = NÃO

:eh_digito

if "%~1"=="0" exit /b 0
if "%~1"=="1" exit /b 0
if "%~1"=="2" exit /b 0
if "%~1"=="3" exit /b 0
if "%~1"=="4" exit /b 0
if "%~1"=="5" exit /b 0
if "%~1"=="6" exit /b 0
if "%~1"=="7" exit /b 0
if "%~1"=="8" exit /b 0
if "%~1"=="9" exit /b 0

exit /b 1
