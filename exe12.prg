clear

nNumeroUm := 0
nNumeroDois := 0
nNumeroTres := 0

@ 01,01 say "Cheque qual o maior numero"
@ 02,01 say "Insira o primeiro numero: "
@ 03,01 say "Insira o segundo numero: "
@ 04,01 say "Insira o terceiro numero: "

@ 02,27 get nNumeroUm
@ 03,26 get nNumeroDois
@ 04,27 get nNumeroTres
read

if nNumeroUm > nNumeroDois .AND. nNumeroUm > nNumeroTres
    @ 05,01 say "O primeiro numero e maior: " + AllTrim(Str(nNumeroUm))
elseif nNumeroDois > nNumeroUm .AND. nNumeroDois > nNumeroTres
    @ 05,01 say "O segundo numero e maior: " + AllTrim(Str(nNumeroDois))
elseif nNumeroTres > nNumeroUm .AND. nNumeroTres > nNumeroDois
    @ 05,01 say "O terceiro numero e maior: " + AllTrim(Str(nNumeroTres))
elseif nNumeroUm == nNumeroDois .AND. nNumeroUm > nNumeroTres
    @ 05,01 say "Ambos o primeiro e o segundo numero sao os maiores: " + AllTrim(Str(nNumeroUm))
elseif nNumeroTres == nNumeroDois .AND. nNumeroDois > nNumeroUm
    @ 05,01 say "Ambos o segundo e o terceiro numero sao os maiores: " + AllTrim(Str(nNumeroDois))
else
    @ 05,01 say "Os numeros sao iguais: " + AllTrim(Str(nNumeroUm))
endif