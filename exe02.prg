clear

do while .t.
    cNome := space(50)
    nIdade := 0
    nPeso := 0

    @ 00,00 to 08,73

    @ 01,01 say"Digite seu nome: "
    @ 02,01 say"Digite sua idade: "
    @ 03,01 say"Digite seu peso: "

    @ 01,18 get cNome Valid !Empty(cNome)
    @ 02,19 get nIdade Valid !Empty(nIdade) .AND. nIdade >= 0
    @ 03,18 get nPeso Valid !Empty(nPeso) .AND. nPeso > 0
    read

    if LastKey() == 27
        nOpcao := Alert("Deseja sair?", {"Sim","Nao"})
        if nOpcao == 1
            exit
        endif
        loop
    endif

    @ 05,01 say"Seu nome: " + cNome
    @ 06,01 say"Sua idade: " + AllTrim(Str(nIdade))
    @ 07,01 say"Seu peso: " + AllTrim(Str(nPeso))

    Inkey( 0 )
enddo

@ 05,01 say"Seu nome: " + cNome
@ 06,01 say"Sua idade: " + AllTrim(Str(nIdade))
@ 07,01 say"Seu peso: " + AllTrim(Str(nPeso))