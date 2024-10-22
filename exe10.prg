clear

nIdade := 0

@ 01,01 say"Insira sua idade: "

@ 01,19 get nIdade picture("999")
read

if nIdade < 21
    @ 02,01 say"Voce tem menos de 21 anos"
elseif nIdade == 21
    @ 02,01 say"Voce tem 21 anos"
else
    @ 02,01 say"Voce tem mais de 21 anos"
endif