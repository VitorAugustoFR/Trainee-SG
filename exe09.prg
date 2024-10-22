set date brit
set century on
clear

//Declarando váriaveis
cLetra := space(1)
dData := CToD("")
nInteiro := space(5)
nDecimal := space(8)
cString := space(50)

@ 01,01 say "Digite UMA letra: "
@ 02,01 say "Digite uma data: "
@ 03,01 say "Digite um numero inteiro: "
@ 04,01 say "Digite um numero decimal: "
@ 05,01 say "Digite uma frase: "

//Lendo input de usuário
@ 01,19 get cLetra Valid !Empty(cLetra)
@ 02,18 get dData 
@ 03,27 get nInteiro picture"99999"
@ 04,27 get nDecimal picture"99999.99"
@ 05,19 get cString Valid !Empty(cLetra)
read

//Apresentando dados
@ 06,01 say "Dados apresentados: "
@ 07,01 say"Letra: " + cLetra 
@ 08,01 say"Data: " + DToC(dData)
@ 09,01 say"Numero Inteiro: " + nInteiro
@ 10,01 say"Numero Decimal: " + transform(nDecimal, "@E 99999.99")
@ 11,01 say"Frase: " + cString

//resolver problemas de data