clear

nMultiplicando := 0
nMultiplicador := 0
nResultado := 0
nI := 0

@ 01,01 say "Digite um numero para mostrar sua tabuada do 0 ao 10"

@ 01,42 get nMultiplicando
read

clear

@ 00,00 to 14,18

@ 01,01 say "Tabuada do " + AllTrim(Str(nMultiplicando))

do while nMultiplicador <= 10
    nResultado = nMultiplicando * nMultiplicador
    @ (nMultiplicador+3),01 say AllTrim(Str(nMultiplicando)) + " * " + AllTrim(Str(nMultiplicador)) + " = " + AllTrim(Str(nResultado))
    @ 14,01 say ""
    nMultiplicador++
enddo