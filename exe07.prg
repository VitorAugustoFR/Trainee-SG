clear
//declarando váriaveis
nNumeroUm := space(50)
nNumeroDois := space(50)
cOperador := space(1)

//demonstrando
@ 00,00 to 07,70
@ 01,01 say "Digite dois numeros e um operador(+, -, *, /) para realiza-lo"
@ 02,01 say "Primeiro numero"
@ 04,01 say "Operador"
@ 05,01 say "Segundo numero"

@ 03,16 get nNumeroUm
@ 04,09 get cOperador
@ 05,15 get nNumeroDois
read

if (cOperador == "+")
    nAdicao := val(nNumeroUm) + val(nNumeroDois)
    @ 07,01 say "A adicao dos dois numeros resultou em = " + alltrim(str(nAdicao))
    elseif (cOperador == "-")
        nSubtracao := val(nNumeroUm) - val(nNumeroDois)
        @ 07,01 say "A subtracao dos dois numeros resultou em = " + alltrim(str(nSubtracao))
        elseif (cOperador == "*")
            nMultiplicacao := val(nNumeroUm) * val(nNumeroDois)
            @ 07,01 say "A multiplicacao dos dois numeros resultou em = " + alltrim(str(nMultiplicacao))
            elseif (cOperador == "/")
                nDivisao := val(nNumeroUm) / val(nNumeroDois)
                @ 07,01 say "A divisao dos dois numeros resultou em = " + alltrim(str(nDivisao))
            else
                @ 07,01 say "Insira operadores e/ou numeros validos"
endif