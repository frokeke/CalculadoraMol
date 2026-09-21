@echo off
setlocal EnableDelayedExpansion

call teste.bat

::Criacao de uma pseudo-lista para os elementos da tabela(para facilitar a população do pseudo-array)

set "elemTab=H He Li Be B C N O F Ne Na Mg Al Si P S Cl Ar K Ca Sc Ti V Cr Mn Fe Co Ni Cu Zn Ga Ge As Se Br Kr Rb Sr Y Zr Nb Mo Tc Ru Rh Pd Ag Cd In Sn Sb Te I Xe Cs Ba La Ce Pr Nd Pm Sm Eu Gd Tb Dy Ho Er Tm Yb Lu Hf Ta W Re Os Ir Pt Au Hg Tl Pb Bi Po At Rn Fr Ra Ac Th Pa U Np Pu Am Cm Bk Cf Es Fm Md No Lr Rf Db Sg Bh Hs Mt Ds Rg Cn Nh Fl Mc Lv Ts Og"

::Area de inicialização de pseudo-array e população

set /a i=0

for %%E in (%elemTab%) do (
    set "tabPeri[!i!]=!%%E!"
    set /a i+=1
)

::Visualização do usuario

echo Teste
echo Li = !tabPeri[3]!

powershell -Command "[math]::Round(!tabPeri[0]! + !tabPeri[1]!, 4)"

pause
cls

