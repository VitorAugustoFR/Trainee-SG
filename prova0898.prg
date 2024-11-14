//Vitor Augusto Faria Ramalho

clear

//Variaveis
cNomes := ""
cScores := ""

cLetrasAleatorias := ""
cPosicao := ""

do while .t.

    //Variaveis jogador
    cNome := Space(20)
    nScore := 0
    //Booleanas
    bGame := .t.
    bGameTabela := .t.

    clear

    @ 00,00 to 03,70

    @ 04,21 to 24,51
    @ 06,21 to 24,51

    //pedindo nome
    @ 01,01 say "Digite seu nome: "
    @ 05,33 say "Tabela"

    @01,18 get cNome picture "@!" Valid !Empty(cNome)
    read

    cNomes += cNome
    cScores += AllTrim(Str(nScore))

    clear

    //Comecando o jogo
    @ 01,01 say "PRESSIONE QUALQUER TECLA PARA JOGAR!"
    Inkey(0)

    do while bGame == .t.

        clear

        nCount := 0

        //Printando o score
        @ 00,01 say "Score: " + AllTrim(Str(nScore))

        @ 02,00 to 24,10
        @ 22,02 say "W" color("")

        //Jogo cabuloso
        do while bGameTabela == .t.

            //Checa se tem o numero necessario de letras na tela
            if nCount <= 19
                
                
                cAleatorio := ""
                
                nAleatorio := hb_RandomInt(1,4)
                nCount++

                if nAleatorio == 1
                    @ 22 - nCount,02 say "Q"
                    cAleatorio += "Q"
                    cPosicao += AllTrim(Str(nCount + 2))
                elseif nAleatorio == 2
                    @ 22 - nCount,04 say "W"
                    cAleatorio += "W"
                    cPosicao += AllTrim(Str(nCount + 2))
                elseif nAleatorio == 3
                    @ 22 - nCount,06 say "E"
                    cAleatorio += "E"
                    cPosicao += AllTrim(Str(nCount + 2))
                elseif nAleatorio == 4
                    @ 22 - nCount,08 say "R"
                    cAleatorio += "R"
                    cPosicao += AllTrim(Str(nCount + 2))
                endif

                cLetrasAleatorias += cAleatorio

                @ 22,02 Say "Q"
                @ 22,04 Say "W"
                @ 22,06 Say "E"
                @ 22,08 Say "R"

            endif

            //Validacao da tecla pressionada + descendo as letras
            if nCount == 19

                cPosicaoLetra := 0
                cLetraFinal := ""

                nKey := Inkey(1)

                cLetrasAleatorias := SubStr(cLetrasAleatorias, nCount-1, nCount-1)

                if nKey == 113 .and. nAleatorio == 1
                    nCount--
                    nScore++
                elseif nKey == 119 .and. nAleatorio == 2
                    nCount--
                    nScore++
                elseif nKey == 101 .and. nAleatorio == 3
                    nCount--
                    nScore++
                elseif nKey == 114 .and. nAleatorio == 4
                    nCount--
                    nScore++
                elseif (!(nKey == 113) .and. nAleatorio == 1) .or. (!(nKey == 119) .and. nAleatorio == 2) .or. (!(nKey == 101) .and. nAleatorio == 3) .or. (!(nKey == 114) .and. nAleatorio == 4)
                    Alert ("Score: " + AllTrim(Str(nScore)))
                    bGame := .f.
                    bGameTabela := .f.
                endif


                //desce as letras
                do while cPosicaoLetra <= nCount
                    cLetraFinal += SubStr(cLetrasAleatorias, cPosicaoLetra, 1)

                    if cLetraFinal == "Q"
                    @ 3 + cPosicaoLetra,02 say "Q"
                    elseif cLetraFinal == "W"
                    @ 3 + cPosicaoLetra,04 say "W"
                    elseif cLetraFinal == "E"
                    @ 3 + cPosicaoLetra,06 say "E"
                    elseif cLetraFinal == "R"
                    @ 3 + cPosicaoLetra,08 say "R"
                    endif

                    cPosicaoLetra++
                    @ 22,02 Say "Q"
                    @ 22,04 Say "W"
                    @ 22,06 Say "E"
                    @ 22,08 Say "R"
                enddo

            endif 

        enddo

    enddo

enddo