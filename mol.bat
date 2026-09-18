@echo off
setlocal EnableDelayedExpansion

:: Area de inicialização dos elementos e variáveis

set H=1.0080
set He=4.0026
set Li=6.9400
set Be=9.0122
set B=10.8100
set C=12.0110
set N=14.0070
set O=15.9990
set F=18.9980
set Ne=20.1800
set Na=22.9898
set Mg=24.3050
set Al=26.9815
set Si=28.0850
set P=30.9738
set S=32.0600
set Cl=35.4500
set Ar=39.9480
set K=39.0983
set Ca=40.0780
set Sc=44.9559
set Ti=47.8670
set V=50.9415
set Cr=51.9961
set Mn=54.9380
set Fe=55.8450
set Co=58.9332
set Ni=58.6934
set Cu=63.5460
set Zn=65.3800
set Ga=69.7230
set Ge=72.6300
set As=74.9216
set Se=78.9710
set Br=79.9040
set Kr=83.7980
set Rb=85.4678
set Sr=87.6200
set Y=88.9059
set Zr=91.2240
set Nb=92.9064
set Mo=95.9500
set Tc=98.0000
set Ru=101.0700
set Rh=102.9055
set Pd=106.4200
set Ag=107.8682
set Cd=112.4140
set In=114.8180
set Sn=118.7100
set Sb=121.7600
set Te=127.6000
set I=126.9045
set Xe=131.2930
set Cs=132.9055
set Ba=137.3270
set La=138.9055
set Ce=140.1160
set Pr=140.9077
set Nd=144.2420
set Pm=145.0000
set Sm=150.3600
set Eu=151.9640
set Gd=157.2500
set Tb=158.9254
set Dy=162.5000
set Ho=164.9303
set Er=167.2590
set Tm=168.9342
set Yb=173.0450
set Lu=174.9668
set Hf=178.4860
set Ta=180.9479
set W=183.8400
set Re=186.2070
set Os=190.2300
set Ir=192.2170
set Pt=195.0840
set Au=196.9666
set Hg=200.5920
set Tl=204.3800
set Pb=207.2000
set Bi=208.9804
set Po=209.0000
set At=210.0000
set Rn=222.0000
set Fr=223.0000
set Ra=226.0000
set Ac=227.0000
set Th=232.0377
set Pa=231.0359
set U=238.0289
set Np=237.0000
set Pu=244.0000
set Am=243.0000
set Cm=247.0000
set Bk=247.0000
set Cf=251.0000
set Es=252.0000
set Fm=257.0000
set Md=258.0000
set No=259.0000
set Lr=266.0000
set Rf=267.0000
set Db=268.0000
set Sg=269.0000
set Bh=270.0000
set Hs=277.0000
set Mt=278.0000
set Ds=281.0000
set Rg=282.0000
set Cn=285.0000
set Nh=286.0000
set Fl=289.0000
set Mc=290.0000
set Lv=293.0000
set Ts=294.0000
set Og=294.0000

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

