set date brit
set epoch to 1940
set message to 07
set wrap on

clear

//Cadastrar
nCodigo := 0
cGuardarSenha := space()
cGuardarData := space()

//Procurar
nCodigoProcurar := 0
bCodigoExiste := .f.
nPegarSenha := 12 * nCodigo
nPegarSenha1 := nPegarSenha - 12
nPegarData := 8 * nCodigo
nPegarData1 := nPegarData - 8

//Menu principal
cMenu := space(1)

//Sair
cSair := space(1)

//Booleans
bLoop := 1
bCadastrar := 0
bConsultar := 0

do while bLoop == 1
    //menu

    @ 00,00 to 08,47
    @ 02,00 to 08,47
    @ 06,00 to 08,47

    @ 01,01 say "Escolha oque fazer dentre as seguintes opcoes:"
    @ 03,01 prompt "1 - Cadastrar" message "Cadastrar codigo"
    @ 04,01 prompt "2 - Consultar" message "Consultar codigo"
    @ 05,01 prompt "3 - Sair     " message "Sair do programa"
    menu to nOpcao

    if nOpcao == 1
        bCadastrar := 1
    elseif nOpcao == 2
        bConsultar := 1
    elseif nOpcao == 3
        clear
        exit
    endif


    //Cadastrar
    do while bCadastrar == 1
        
        //Variaveis iniciais
        cSenha := space(12)
        dCadastro := CToD("")
        
        //verificacao
        cVerificacaoNumero := "1234567890"
        cVerificacaoMaiusculo := "QWERTYUIOPASDFGHJKLZXCVBNM"
        cVerificacaoMinusculo := "qwertyuiopasdfghjklzxcvbnm"
        cVerificacaoEspecial := "'!@#$%¨&*()_-+=`[{~^/?;:.>,<\|}]"

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

        //Pegando e guardando a senha
        @ 01,17 get cSenha Valid Len(AllTrim(cSenha)) >= 8
        read

        cGuardarSenha += cSenha

        //Variaveis da validacao
        bValidacaoNumero := .f.
        bValidacaoMaiusculo := .f.
        bValidacaoMinusculo := .f.
        bValidacaoEspecial := .f.

        nLenSenha := Len(AllTrim(cSenha))
        nCount := 1

        //Menu de sair
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

        //Validadando as condicoes de senha
        do while nCount <= nLenSenha
            cLetrasSenha := SubStr(cSenha, nCount, 1)
            if cLetrasSenha $ cVerificacaoNumero
                bValidacaoNumero := .t.
            endif
            if cLetrasSenha $ cVerificacaoMaiusculo
                bValidacaoMaiusculo := .t.
            endif
            if cLetrasSenha $ cVerificacaoMinusculo
                bValidacaoMinusculo := .t.
            endif
            if cLetrasSenha $ cVerificacaoEspecial
                bValidacaoEspecial := .t.
            endif
            nCount++
        enddo

        if bValidacaoNumero == .f. .or. bValidacaoMaiusculo == .f. .or. bValidacaoMinusculo == .f. .or. bValidacaoEspecial == .f.
            Alert("Senha fraca")
            loop
        endif

        //Pegando e guardando a data
        @ 10,01 say "Digite a data de cadastro: "

        @ 10,28 get dCadastro
        read
        cGuardarData += DToC(dCadastro)

        //numero do codigo
        nCodigo++

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

    nDiasDoMes := 1
    nSemana := 0


    //Consultar
    do while bConsultar == 1
        clear
        @ 01,01 say "Digite o codigo que deseja procurar: "

        @ 01,38 get nCodigoProcurar picture "999"
        read

        if nCodigoProcurar == nCodigo
            bCodigoExiste := .t.
        else
            Alert("Codigo nao existe!")
            loop
        endif
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

        do while bCodigoExiste == .t.

            do while nPegarSenha1 <= nPegarSenha
                cSenhaConsulta := SubStr(cGuardarSenha, nPegarSenha1, 1)
                nPegarSenha1++
            enddo
            do while nPegarData1 <= nPegarData
                cDataConsulta := SubStr(cGuardarData, nPegarData1, 1)
                nPegarData1++
            enddo

            dDataConsulta := CToD(cDataConsulta)

            nAno := Year(dDataConsulta)
            nMes := Month(dDataConsulta) 
            nDiaAtual := Day(dDataConsulta)
            nDiaSemana := DoW(dDataConsulta)

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


            //imprimindo
            clear
            @ 00,00 to 02,20
            @ 01,01 say "Numero do codigo: " + AllTrim(Str(nCodigoProcurar))
            @ 02,01 say "Senha: " + cSenhaConsulta

            @ 06,06 say cMes + " de " + AllTrim(Str(nAno))

            //calendario
            do while nDiasDoMes >= nDia
                @ 05,05 to 15,24
                
                if nDiaDoMes == nDiaAtual
                    @ 7+nSemana,7+nDiaSemana say AllTrim(Str(nDia)) color 'G/W'
                else
                    @ 7+nSemana,7+nDiaSemana say AllTrim(Str(nDia))
                endif

                if nDiaSemana == 1
                    nSemana++
                endif

                nDiaDoMes++

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
enddo