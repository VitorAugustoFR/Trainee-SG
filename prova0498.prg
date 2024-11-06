set date brit
set epoch to 1940

clear

nCodigo := 0
cSenha := space(12)
dCadastro := CToD("")

nCodigoProcurar := 0

cMenu := space(1)

cSair := space(1)

bLoop := 1
bCadastrar := 0
bConsultar := 0

do while bLoop == 1
    //menu
    @ 00,00 to 08,47
    @ 02,00 to 08,47
    @ 06,00 to 08,47

    @ 01,01 say "Escolha oque fazer dentre as seguintes opcoes:"
    @ 03,01 say "1 - Cadastrar"
    @ 04,01 say "2 - Consultar"
    @ 05,01 say "3 - Sair"
    @ 07,01 say "Digite o numero da opcao desejada: "

    //                                     erro quantia de caracteres
    @ 07,36 get cMenu Valid cMenu $ "123" //.and. cSenha $ "1234567890" .and. cSenha $ 'qwertyuiopasdfghjklzxcvbnm' .and. cSenha $ 'QWERTYUIOPASDFGHJKLZXCVBNM' .and. cSenha $ "'!@#$%¨&*()_-+=`[{~^/?;:.>,<\|}]"
    read

    if cMenu == "1"
        bCadastrar := 1
    elseif cMenu == "2"
        bConsultar := 1
    elseif cMenu == "3"
        bLoop := 0
    endif

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

    //Cadastrar
    do while bCadastrar == 1

        clear
        
        @ 00,00 to 09,29
        @ 02,00 to 09,29
        @ 01,01 say "Crie uma senha:"

        @ 03,01 say "A senha deve ter no minimo:"
        @ 04,01 say "8 caracteres"
        @ 05,01 say "1 caractere numerico"
        @ 06,01 say "1 letra maiuscula"
        @ 07,01 say "1 letra minuscula"
        @ 08,01 say "1 caractere especial"

        @ 01,17 get cSenha Valid Len(AllTrim(cSenha)) >= 8
        read

        @ 10,01 say "Digite a data de cadastro: "

        @ 10,28 get dCadastro
        read
        nCodigo++
        if LastKey() == 27
            nOpcao2 := Alert("Oque deseja fazer?", {"Continuar","Prosseguir","Cancelar"})
            if nOpcao2 == 1
                loop
            elseif nOpcao2 == 2
                clear   
                bCadastrar := 0
            elseif nOpcao2 == 3
                clear
                exit
            endif
            loop
        endif
        clear
        @ 01,01 say "Codigo: " + AllTrim(Str(nCodigo)) + " Senha: " + cSenha
        @ 03,01 say "Deseja sair?"

        @ 03,14 get cSair picture "@!" Valid cSair $ "SN"
        read

        if cSair == "S"
            clear
            bCadastrar :=0
        else
            clear
            loop
        endif
    enddo

    nAno := Year(dCadastro)
    nMes := Month(dCadastro) 
    nDiaAtual := Day(dCadastro)
    nDiasDoMes := 1
    nSemana := 2
    nDiaSemana := 1
    nGrades := 0

    //Consultar
    do while bConsultar == 1
        clear
        @ 01,01 say "Digite o codigo que deseja procurar: "

        @ 01,38 get nCodigoProcurar picture "999"
        read

        if LastKey() == 27
            nOpcao3 := Alert("Oque deseja fazer?", {"Continuar","Prosseguir","Cancelar"})
            if nOpcao3 == 1
                loop
            elseif nOpcao3 == 2
                clear   
                bConsultar := 0
            elseif nOpcao3 == 3
                clear
                exit
            endif
            loop
        endif

        do while nCodigoProcurar == nCodigo
            //pegando o ultimo dia do mes
            nDia := Day(CTod('01/' + Str(nMes + 1, 2) + '/00')-1)

            //Selecionando o mes
            if nMes == 1
                cMes := "Janeiro"
            elseif nMes == 2
                cMes := "Fevereiro"
            elseif nMes == 3
                cMes := "Marco"
            elseif nMes == 4
                cMes := "Abril"
            elseif nMes == 5
                cMes := "Maio"
            elseif nMes == 6
                cMes := "Julho"
            elseif nMes == 7
                cMes := "Junho"
            elseif nMes == 8
                cMes := "Agosto"
            elseif nMes == 9
                cMes := "Setembro"
            elseif nMes == 10
                cMes := "Outubro"
            elseif nMes == 11
                cMes := "Novembro"
            else
                cMes := "Dezembro"
            endif

            clear
            @ 00,00 to 09,18
            @ 01,01 say cMes + " de " + AllTrim(Str(nAno))

            do while nDiasDoMes >= nDia
                @ 00,00 to 09,18
                
                if nDiaDoMes == nDiaAtual
                    @ nSemana,nDiaSemana say AllTrim(Str(nDia)) color 'B/W'
                else
                    @ nSemana,nDiaSemana say AllTrim(Str(nDia))
                endif

                nDiaSemana++

                if nDiaSemana == 7
                    nSemana++
                    nDiaSemana := 1
                endif

                if LastKey() == 27
                    nOpcao4 := Alert("Oque deseja fazer?", {"Continuar","Sair"})
                    if nOpcao4 == 1
                        loop
                    elseif nOpcao4 == 2
                        clear
                        exit
                    endif
                    loop
                endif
            enddo

            @ 15,01 say "Deseja sair?"

            @ 03,14 get cSair picture "@!" Valid cSair $ "SN"
            read
    
            if cSair == "S"
                clear
                nCodigoProcurar := 0
            else
                clear
                loop
            endif

        enddo

        @ 01,01 say "Deseja sair?"

        @ 03,14 get cSair picture "@!" Valid cSair $ "SN"
        read

        if cSair == "S"
            clear
            bConsultar := 0
        else
            clear
            loop
        endif
    enddo
enddo