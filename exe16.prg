clear

cNome := space(50)
nQuantidadeNome := 0
nVariavel := 1

@ 01,01 say "Qual seu nome?"
@ 02,01 say "Quantas vezes devemos imprimir seu nome?"

@ 01,15 get cNome Valid !Empty(cNome)
@ 02,41 get nQuantidadeNome
read

do while nVariavel < nQuantidadeNome
    @ nVariavel,01 say cNome
    nVariavel++
enddo