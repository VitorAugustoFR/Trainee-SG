//Vitor Augusto Faria Ramalho
set message to 10 Center
set wrap on

clear

//Boleans dos do whiles
bInicio := .t.
bJogo := .f.

do while bInicio == .t.

    clear

    cNomeParticipante := space(20)

    cPalavraChave := space(20)
    cLetra := space(1)

    cLetrasEscolhidas := space(26)

    //Numericos
    nErros := 0
    nChances := 6
    nDiminuiChance := 1

    nContador := 1

    //Mebros do boneco
    cCabeca := "()"
    cTorso := "|"
    cBracoDireito := "\"
    cBracoEscquerdo := "/"
    cPernaDireito := "\"
    cPernaEscquerdo := "/"
    cPe := "_"
    
    @ 00,23 to 02,61
    @ 00,23 to 05,61
    @ 00,23 to 11,61
    
    @ 01,24 say "Desafio da forca!"
    @ 03,24 say "Insira seu nome: "
    
    @ 03,41 get cNomeParticipante Valid !Empty(cNomeParticipante)
    read
    
    @ 04,24 say "Escolha a dificuldade:"
    @ 06,24 prompt "Facil" message "Modo Facil"
    @ 07,24 prompt "Medio" message "Modo Normal"
    @ 08,24 prompt "Dificil" message "Modo Dificil"
    menu to nOpcao

    if LastKey() == 27
        nOpcao1 := Alert("Oque deseja fazer?", {"Continuar","Sair"})
        if nOpcao1 == 1
            loop
        elseif nOpcao1 == 2
            clear
            exit
        endif
        loop
    endif

    clear

    @ 10,20 say "digite a Palavra chave: "
    @ 10,43 get cPalavraChave picture "@!"
    read
    bJogo := .t.

    do while bJogo == .t.

        clear

        if LastKey() == 27
            nOpcao2 := Alert("Oque deseja fazer?", {"Continuar","Sair"})
            if nOpcao2 == 1
                loop
            elseif nOpcao2 == 2
                clear
                exit
            endif
            loop
            endif

        cEscolhaFinal := space(1)
        cPalavraNaForca := space(20)

        //Consequencias das respectivas dificuldades
        //Facil
        if nOpcao == 1
            nDiminuiChance := 1
            if nErros == 2
                @ 00,00 say "dica 1"
            endif
            if nErros == 3
                @ 00,00 say "dica 2"
            endif
            if nErros == 4
                @ 00,00 say "dica 3"
            endif
        //Medio
        elseif nOpcao == 2
            nDiminuiChance := 1
        //Dificil
        elseif nOpcao == 3
            nDiminuiChance := 2
        endif


        //pegando a letra e fazendo a validacao
        @ 01,01 say "Digite uma letra: "
        @ 01,19 get cLetra picture "@!"
        read

        //boneco
        @ 06,14 say cCabeca
        @ 07,15 say cTorso
        @ 07,14 say cBracoEscquerdo
        @ 07,16 say cBracoDireito
        @ 08,14 say cPernaEscquerdo
        @ 08,16 say cPernaDireito
        @ 08,13 say cPe
        @ 08,17 say cPe


        if cLetra $ cLetrasEscolhidas
            @ 03,01 say "A letra " + cLetra + "já foi escolhida" //color(R/W)
            loop
        else
            cLetrasEscolhidas += cLetra
        endif

        //Achando a letra
        do while nContador <= Len(cPalavraChave)
            cLetrasPalavra := SubStr(cPalavraChave, nContador, 1)
            if cLetra $ cLetrasPalavra
                cPalavraNaForca := SubStr(cLetra, nContador, 1)
                @ 06, 10+nContador say cPalavraNaForca
                @ 06, 10+nContador say "_"
            else
                nChances -= nDiminuiChance
            endif
            nContador++
        enddo

        //Validacao final
        if nChances == 0 .or. cPalavraNaForca == cPalavraChave
            @ 10,01 say "Que pena, voce perdeu :("
            @ 11,01 say "Deseja jogar novamente?"

            @ 11,24 get cEscolhaFinal picture "@!" Valid cEscolhaFinal $ "SN"
            read

            if cEscolhaFinal == "S"
                loop
            else
                exit
                bInicio := .f.
            endif
        endif
    enddo
enddo