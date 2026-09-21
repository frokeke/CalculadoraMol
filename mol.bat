@echo off
setlocal EnableDelayedExpansion

call periTab.bat

::Criacao de uma pseudo-lista para os elementos da tabela(para facilitar a população do pseudo-array)

set "elemTab=H He Li Be B C N O F Ne Na Mg Al Si P S Cl Ar K Ca Sc Ti V Cr Mn Fe Co Ni Cu Zn Ga Ge As Se Br Kr Rb Sr Y Zr Nb Mo Tc Ru Rh Pd Ag Cd In Sn Sb Te I Xe Cs Ba La Ce Pr Nd Pm Sm Eu Gd Tb Dy Ho Er Tm Yb Lu Hf Ta W Re Os Ir Pt Au Hg Tl Pb Bi Po At Rn Fr Ra Ac Th Pa U Np Pu Am Cm Bk Cf Es Fm Md No Lr Rf Db Sg Bh Hs Mt Ds Rg Cn Nh Fl Mc Lv Ts Og"

::Area de inicialização de pseudo-array e população

set /a i=0

for %%E in (%elemTab%) do (
    set "tabPeri[!i!]=!%%E!"
    set /a i+=1
)

::Visualização do usuario

set /p "formula=Digite uma formula quimica: "

set /a pos=0

:formula_parse

set "c1=!formula:~%pos%,1!"

if "!c1!"=="" goto fim_formula

set /a prox=pos+1
set "c2=!formula:~%prox%,1!"

set "simbolo="

if not "!c2!"=="" (
    for %%E in (%elemTab%) do (
        if "%%E"=="!c1!!c2!" (
            set "simbolo=%%E"
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

if defined simbolo (

    set /a indice=!numAtomico[!simbolo!]!
    set /a numeroAtomico=indice+1

    echo Elemento: !simbolo! ^| Numero atomico: !numeroAtomico!

    if "!c2!"=="" (
        set /a pos+=1
    ) else (
        for %%E in (%elemTab%) do (
            if "%%E"=="!c1!!c2!" (
                set /a pos+=2
                goto formula_parse
            )
        )
        set /a pos+=1
    )
) else (
    echo Quantidade: !c1!
    set /a pos+=1
)

goto formula_parse


:fim_formula

powershell -Command "[math]::Round(!tabPeri[0]! + !tabPeri[1]!, 4)"



pause
cls

