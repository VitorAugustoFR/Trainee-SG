clear

nNumeroUm := 5
nNumeroDois := 10
nNumeroTres := 10

nMedia := (nNumeroUm + nNumeroDois + nNumeroTres)/3

@ 00,00 to 06,12

@ 01,01 say "Valor 1= " + alltrim(str(nNumeroUm) )
@ 02,01 say "Valor 2= " + alltrim(str(nNumeroDois))
@ 03,01 say "Valor 3= " + alltrim(str(nNumeroTres))
@ 05,01 say "Media= " + alltrim(str(nMedia))