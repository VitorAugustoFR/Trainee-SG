clear

cNome := space(20)
nIdade := 0

@ 01,01 say "Digite o nome do nadador: "
@ 02,01 say "Digite a idade do nadador: "

@ 01,27 get cNome valid !Empty(cNome)
@ 02,28 get nIdade picture("999")
read

if nIdade <= 7
    @ 03,01 say "Infantil A: 5 - 7 anos"
elseif (8 <= nIdade .AND. nIdade <= 10)
    @ 03,01 say "Infantil B: 8 - 10 anos"
elseif 11 <= nIdade .AND. nIdade <= 13
    @ 03,01 say "Juvenil A: 11 - 13 anos"
elseif 13 <= nIdade .AND. nIdade <= 17
    @ 03,01 say "Juvenil B: 14 - 17 anos"
else
    @ 03,01 say "Senior : maiores de 18 anos"
endif