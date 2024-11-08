//Vitor Augusto Faria Ramalho

set date brit
set epoch to 1940
set message to 10 Center
set wrap on

clear

//Dados de login
cUsuario := space(6)
cSenha := Space(10)

//Dados da venda
nPedido := 0
cNomeCliente := space(20)
nLimiteCredito := 0
dPedido := CToD("")

//desconto maximo
nMaxDescontoAmora := 12
nMaxDescontoUva := 11
nMaxDescontoPepino := 2
nMaxDescontoMorango := 6

//Estoque
nEstoqueAmora := 110
nEstoqueUva := 198.5
nEstoquePepino := 445
nEstoqueMorango := 200

//Valores
nValorTotal := 0

//Variaveis booleanas(Para os laços)
bLoopPrincipal := .f.
bPedir := .f.

//Escolha do usuario
cEscolhaUsuario := space(1)

clear

@ 01,01 say "Digite o E-mail do usuario e a senha"
@ 03,01 say "User.: "
@ 04,01 say "Senha: "

@ 03,08 get cUsuario Valid cUsuario == "Clebin"
@ 04,08 get cSenha Valid cSenha == "1234567890"
read

if cUsuario == "Clebin" .and. cSenha == "1234567890"
    bLoopPrincipal := .t.
endif

do while bLoopPrincipal
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

        @ 00,30 to 11,48
        @ 02,30 to 11,48
        @ 05,30 to 11,48

        @ 01,31 say "Menu principal: "
        @ 03,31 prompt "Pedir" message "Efetuar pedidos"
        @ 04,31 prompt "Sair" message "Sair do programa"
        menu to nOpcao

        if nOpcao == 1
            bPedir := .t.
        elseif nOpcao == 2
            clear
            exit
        endif
        

        do while bPedir == .t.
            clear

            //Variaveis
            nQuantidade := 0
            nValorPorcentagem := 0
            bPedido := .f.

            @ 01,01 say "Digite os dados da venda: "
            @ 03,01 say "Nome.............: "
            @ 04,01 say "Limite de credito: "
            @ 05,01 say "Data do pedido...: "

            @ 03,20 get cNomeCliente
            @ 04,20 get nLimiteCredito picture "9999.99"
            @ 05,20 get dPedido
            read

            if LastKey() == 27
                nOpcao2 := Alert("Oque deseja fazer?", {"Continuar","Finalizar","Cancelar"})
                if nOpcao2 == 1
                    loop
                elseif nOpcao2 == 2
                    clear   
                    bPedir := .f.
                elseif nOpcao2 == 3
                    clear
                    exit
                endif
                loop
            endif

            bPedido := .t.

            do while bPedido == .t.

                if LastKey() == 27
                    nOpcao3 := Alert("Oque deseja fazer?", {"Continuar","Finalizar","Cancelar"})
                    if nOpcao3 == 1
                        loop
                    elseif nOpcao3 == 2
                        clear   
                        bPedir := .f.
                    elseif nOpcao3 == 3
                        clear
                        exit
                    endif
                    loop
                endif

                clear

                //Variaveis
                nValorPedido := 0
                //Dados dos produtos
                nCodigo := 0
                nQuantidade := 0
                nPorcentagemDesconto := 0

                //linhas horizontais
                @ 00,00 to 11,68
                @ 03,00 to 11,68
                @ 05,00 to 11,68
                @ 07,00 to 11,68
                @ 09,00 to 11,68

                //linhas verticais
                @ 00,08 to 11,68
                @ 00,30 to 11,68
                @ 00,43 to 11,68
                @ 00,60 to 11,68

                @ 01,01 say "Codigo  Descricao do Produto  Preco Unit.  % Max. Desconto  Estoque"
                @ 04,01 say "5500    Amora preta           1,50          12%             " + AllTrim(Str(nEstoqueAmora))
                @ 06,01 say "7744    Uva Rubi              8,00          11%             " + AllTrim(Str(nEstoqueUva))
                @ 08,01 say "4445    Pepino                3,99          02%             " + AllTrim(Str(nEstoquePepino))
                @ 10,01 say "6565    Morango               15,49         06%             " + AllTrim(Str(nEstoqueMorango))

                @ 12,00 to 18,46
                @ 12,00 to 14,46

                @ 13,01 say "Digite: "
                @ 15,01 say "Codigo...........................: "
                @ 16,01 say "Quantidade.......................: "
                @ 17,01 say "% de desconto do produto desejado: "

                @ 15,36 get nCodigo picture "9999"
                @ 16,36 get nQuantidade picture "999.99"
                @ 17,36 get nPorcentagemDesconto picture "99"
                read


                //Validacoes e calculos de valores
                //amora
                if nCodigo == 5500
                    
                    //Calulo do valor do pedido
                    nValorPedido += ((nPorcentagemDesconto * (nQuantidade * 1.50)) / 100)
                    
                    if nQuantidade > nEstoqueAmora
                        Alert("Estoque insulficiente")
                        loop
                    elseif nPorcentagemDesconto > nMaxDescontoAmora
                        Alert("Insira uma porcentagem de desconto validada")
                        loop
                    elseif nLimiteCredito < nValorPedido
                        Alert("Credito Insulficiente")
                        loop
                    else
                        nValorTotal += nValorPedido

                        nEstoqueAmora -= nQuantidade
                        nLimiteCredito -= nValorPedido
                    endif
                //uva
                elseif nCodigo == 7744
                    
                    //Calulo do valor do pedido
                    nValorPedido += ((nPorcentagemDesconto * (nQuantidade * 1.50)) / 100)
                    
                    if nQuantidade > nEstoqueUva
                        Alert("Estoque insulficiente")
                        loop
                    elseif nPorcentagemDesconto > nMaxDescontoUva  
                        Alert("Insira uma porcentagem de desconto validada")
                        loop
                    elseif nLimiteCredito < nValorPedido//Checa se a credito sulficiente para realizar o pedido
                        Alert("Credito Insulficiente")
                        loop
                    else
                        nValorTotal += nValorPedido
                        nEstoqueUva -= nQuantidade
                        nLimiteCredito -= nValorPedido
                    endif
                //Pepino
                elseif nCodigo == 4445
                    
                    //Calulo do valor do pedido
                    nValorPedido += ((nPorcentagemDesconto * (nQuantidade * 1.50)) / 100)
                    
                    if nQuantidade > nEstoquePepino
                        Alert("Estoque insulficiente")
                        loop
                    elseif nPorcentagemDesconto > nMaxDescontoPepino  
                        Alert("Insira uma porcentagem de desconto validada")
                        loop
                    elseif nLimiteCredito < nValorPedido
                        Alert("Credito Insulficiente")
                        loop
                    else
                        nValorTotal += nValorPedido

                        nEstoquePepino -= nQuantidade
                        nLimiteCredito -= nValorPedido
                    endif
                //morango
                elseif nCodigo == 6565
                    
                    //Calulo do valor do pedido
                    nValorPedido += ((nPorcentagemDesconto * (nQuantidade * 1.50)) / 100)
                    
                    if nQuantidade > nEstoqueMorango
                        Alert("Estoque insulficiente")
                        loop
                    elseif nPorcentagemDesconto > nMaxDescontoMorango  
                        Alert("Insira uma porcentagem de desconto validada")
                        loop
                    elseif nLimiteCredito < nValorPedido
                        Alert("Credito Insulficiente")
                        loop
                    else
                        nValorTotal += nValorPedido
                        
                        nEstoqueMorango -= nQuantidade
                        nLimiteCredito -= nValorPedido
                    endif
                elseif nCodigo != 5500 .and. nCodigo != 7744 .and. nCodigo != 4445 .and. nCodigo != 6565
                    Alert("Codigo nao existe")
                    loop
                endif

                @ 19,10 say "Valor do pedido: " + AllTrim(Str(nValorPedido))
                @ 20,10 say "Valor Total....: " + AllTrim(Str(nValorTotal))

                @ 22,01 say "Deseja continuar comprando?"
                @ 23,01 get cEscolhaUsuario picture "@!" valid cEscolhaUsuario $ "SN"
                read
                if cEscolhaUsuario == "S"
                    loop
                elseif cEscolhaUsuario == "N"
                    exit
                endif

            enddo
        enddo
enddo