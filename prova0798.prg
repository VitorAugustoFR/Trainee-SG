//Vitor Augusto Faria Ramalho
set date brit
set epoch to 1940
set message to 10 Center
set wrap on

do while .t.
    clear

    //variaveis para efetuar login
    cLoginDigitado := space(5)
    cSenhaDigitado := space(8)

    //Variaveis de ordem de servico
    nOrdemServico := 0
    cNomeCliente := space(40)
    dOrdemServico := Date()//data atual
    cNomeTecnico := space(30)
    cDescricaoEquipamento := space(40)
    dCompra := CToD("")
    cOpcaoEntrega := space(1)
    nLimiteCredito := 0

    //Variaveis relacionadas a entrega
    cEndereco := space(15)
    cBairro := space(10)
    cReferencia := space(15)
    nTelefone := 0
    nTaxaEntrega := 3

    //Valores
    nValorTotalProdutos := 0
    nValorTotal := 0
    nComissaoTecnico := 0

    //Variaveis supervisor
    cSupervisor := space(15)
    cSenhaSupervisor := "123LIBERA"


    @ 01,01 say "Digite o login:"
    @ 03,01 say "Digite a senha"

    @ 02,01 get cLoginDigitado picture "@!" Valid !Empty(cLoginDigitado)
    @ 04,01 get cSenhaDigitado Valid !Empty(cSenhaDigitado)
    read

    //Validacao login
    if cLoginDigitado == "ADMIN" .and. cSenhaDigitado == "123mudar"
        
        clear

        @ 03,23 to 11,49

        @ 04,24 say "Escolha uma opcao:"
        @ 06,24 prompt "Efetuar Pedidos" message "Efetuar um pedido"
        @ 07,24 prompt "Sair" message "Sair do programa"
        menu to nOpcao

        //saindo do programa
        if nOpcao == 2 

            exit

        endif

    elseif cLoginDigitado != "ADMIN"

        Alert("Login nao existe!")
        loop

    elseif cSenhaDigitado != "123mudar"

        Alert("Senha incorreta!")
        loop

    endif

    do while nOpcao == 1

        clear

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

        
        @ 01,01 say "Digite os dados necessarios para realizar a ordem de servico:"
        @ 03,01 say "Seu nome................: "
        @ 04,01 say "Nome do tecnico.........: "
        @ 05,01 say "Descricao do Equipamento: "
        @ 06,01 say "Data da compra..........: "
        @ 07,01 say "Entrega a domicilio.....? "
        @ 08,01 say "Limite de credito.......: "

        @ 03,26 get cNomeCliente Valid !Empty(cNomeCliente)
        @ 04,26 get cNomeTecnico Valid !Empty(cNomeTecnico)
        @ 05,26 get cDescricaoEquipamento valid !Empty(cDescricaoEquipamento)
        @ 06,26 get dCompra valid !Empty(dCompra)
        @ 07,26 get cOpcaoEntrega picture "@!" Valid cOpcaoEntrega $ "SN"
        @ 08,26 get nLimiteCredito picture "99999.99" Valid !Empty(nLimiteCredito)
        read

        do while .t.

            clear

            @ 04,24 say "Escolha uma opcao:"
            @ 06,24 prompt "Produto" message "Comprar um produto"
            @ 07,24 prompt "Servico" message "Solicitar um servico"
            menu to nOpcao2
            

            //Produtos
            if nOpcao2 == 1

                //Variaveis relacionadas aos produtos
                cDescricaoProduto := space(30)
                nQuantidade := 0
                nPrecoUnidade := 0
                nPorcentagemDescontoProduto := 0

                clear

                @ 01,01 say "Ok, " + AllTrim(cNomeCliente) + " agora digite os dados da compra: "
                @ 03,01 say "Descicao do produto.....: "
                @ 04,01 say "Quantidade..............: "
                @ 05,01 say "Preco/unidade do produto: "
                @ 06,01 say "Porcentagem do desconto.: "

                @ 08,01 say "Preco total dos produtos: " + AllTrim(Str(nValorTotalProdutos))
                @ 09,01 say "Preco total dos pedidos : " + AllTrim(Str(nValorTotal))

                @ 03,27 get cDescricaoProduto Valid !Empty(cDescricaoProduto)
                @ 04,27 get nQuantidade
                @ 05,27 get nPrecoUnidade picture "9999.99"
                @ 06,27 get nPorcentagemDescontoProduto picture "99.99"
                read


                if Year(date()) - Year(dCompra) <= 2
                    if Month(date()) - Month(dCompra) <= 0
                        if Day(date()) - Day(dCompra) <= 0
                            Alert("Coberto pela Garantia")
                        elseif
                            if nPorcentagemDescontoProduto != 0

                                nValorTotalProdutos += ((nQuantidade * nPrecoUnidade) - (nPorcentagemDescontoProduto * (nQuantidade * nPrecoUnidade) / 100))
                            
                            elseif nPorcentagemDescontoProduto == 0 

                                nValorTotalProdutos += nQuantidade * nPrecoUnidade

                            endif
                            
                            if nLimiteCredito < nValorTotalProdutos

                                Alert("Credito insulficiente!")
                                loop

                            else

                                nLimiteCredito -= nValorTotalProdutos
                
                                nValorTotal += nValorTotalProdutos

                            endif
                        endif
                    endif
                endif


            //Servicos
            elseif nOpcao2 == 2
                
                //Variaveis relacionadas aos servicos
                cDescricaoServico := space(25)
                nPorcentagemTecnico := 0
                nValorTotalServicos := 0
                nPrecoServico := 0
                nPorcentagemDescontoServico := 0

                clear

                @ 01,01 say "Digite os dados da solicitacao: "
                @ 03,01 say "Descicao do servico..............: "
                @ 04,01 say "Porcentagem do desconto..........: "
                @ 05,01 say "Porcentagem da comicao do tecnico: "
                @ 06,01 say "Preco do servico.................: "

                @ 08,01 say "Preco total dos servicos: " + AllTrim(Str(nValorTotalServicos))
                @ 09,01 say "Preco total dos pedidos : " + AllTrim(Str(nValorTotal))

                @ 03,36 get cDescricaoServico Valid !Empty(cDescricaoServico)
                @ 06,36 get nPorcentagemDescontoServico picture "99.99"
                @ 05,36 get nPorcentagemTecnico picture "99.99"
                @ 06,36 get nPrecoServico picture "9999.99"
                read

                nComissaoTecnico += nPrecoServico * nPorcentagemTecnico /100

                f Year(date()) - Year(dCompra) <= 1
                    if Month(date()) - Month(dCompra) <= 0
                        if Day(date()) - Day(dCompra) <= 0
                            Alert("Coberto pela Garantia")
                        elseif
                            if nPorcentagemDescontoServico != 0

                                nValorTotalServicos += (nPrecoServico - (nPorcentagemDescontoServico * nPrecoServico / 100)) + nComissaoTecnico
                            
                            elseif nPorcentagemDescontoServico == 0 

                                nValorTotalServicos += nPrecoServico

                            endif

                            if nLimiteCredito < nValorTotalServicos
                                Alert("Credito insulficiente!")
                                loop
                            else
                                nLimiteCredito -= nValorTotalServicos

                                nValorTotal += nValorTotalServicos
                            endif
                        endif
                    endif
                endif

            endif

            cContinuarCompra := space(1)

            @ 15,01 say "Deseja continuar Comprando? "

            @ 15,29 get cContinuarCompra picture "@!" Valid cContinuarCompra $ "SN"
            read

            if cContinuarCompra == "S"
                loop
            else
                exit
            endif


        enddo

        if cOpcaoEntrega == "S"

            @ 10,01 say "Digite os dados relacionados a entrega: "
            @ 11,01 say "Enderco...: "
            @ 12,01 say "Bairro....: "
            @ 13,01 say "Referencia: "
            @ 14,01 say "Telefone..: "

            @ 11,12 get cEndereco Valid !Empty(cEndereco)
            @ 12,12 get cBairro Valid !Empty(cBairro)
            @ 13,12 get cReferencia Valid !Empty(cReferencia)
            @ 14,12 get nTelefone picture "(99) 99999-9999"
            read

            nValorTotal := nValorTotal * 3 / 100 

        endif

        cEncerrarCompra := space(1)

        clear

        @ 01,01 say "Deseja encerrar sua compra? "

        @ 01,29 get cEncerrarcompra picture "@!" Valid cEncerrarCompra $ "SN"
        read

        cMetodoPagamentoGuardar := space(3)
        nQuantiaTotalPagamento := 0
        nValorPago := 0
        do while cEncerrarCompra == "S"

            cMetodoPagamento := space(1)
            nQuantiaPagamento := 0
            
            clear

            @ 04,24 say "Escolha o metodo de pagamento: "
            @ 06,24 say "1 - Dinheiro"
            @ 07,24 say "2 - Cheque"
            @ 07,24 say "3 - Cartao"
            
            @ 04,56 get cMetodoPagamento Valid cMetodoPagamento $ "123"
            read

            cMetodoPagamentoGuardar += cMetodoPagamento
            
            if cMetodoPagamento == "1" !(cMetodoPagamento $ cMetodoPagamentoGuardar)
                clear

                @ 01,01 "digite a quantia a ser paga em dinheiro: "

                @ 02,01 get nQuantiaPagamento picture "99999,99"
                read

                if nQuantiaPagamento > nLimiteCredito

                    Alert("Voce nao tem tudo isso de credito!")
                    loop

                endif

                if nValorTotal - nQuantiaPagamento == 0
                    Alert("Compra efetuada com sucesso!")
                    exit
                elseif nQuantiaPagamento == 0
                    Alert("Quantia Invalida!")
                    loop
                else
                    nQuantiaTotalPagamento += nQuantiaPagamento
                    nValorPago += nValorTotal - nQuantiaPagamento
                    Alert("Valor restante a ser pago: " + (nValorTotal - nValorPago))
                    loop
                endif
            elseif cMetodoPagamento == "2" !(cMetodoPagamento $ cMetodoPagamentoGuardar)
                clear

                @ 01,01 "digite a quantia a ser paga em cheque: "

                @ 02,01 get nQuantiaPagamento picture "99999,99"
                read

                if nQuantiaPagamento > nLimiteCredito

                    Alert("Voce nao tem tudo isso de credito!")
                    loop

                endif

                if nValorTotal - nQuantiaPagamento == 0
                    Alert("Compra efetuada com sucesso!")
                    exit
                elseif nQuantiaPagamento == 0
                    Alert("Quantia Invalida!")
                    loop
                else
                    nQuantiaTotalPagamento += nQuantiaPagamento
                    nValorPago += nValorTotal - nQuantiaPagamento
                    Alert("Valor restante a ser pago: " + (nValorTotal - nValorPago))
                    loop
                endif
            elseif cMetodoPagamento == "3" !(cMetodoPagamento $ cMetodoPagamentoGuardar)
                clear

                @ 01,01 "digite a quantia a ser paga em Cartao: "

                @ 02,01 get nQuantiaPagamento picture "99999,99"
                read

                if nQuantiaPagamento > nLimiteCredito

                    Alert("Voce nao tem tudo isso de credito!")
                    loop

                endif

                if nValorTotal - nQuantiaPagamento == 0
                    Alert("Compra efetuada com sucesso!")
                    exit
                elseif nQuantiaPagamento == 0
                    Alert("Quantia Invalida!")
                    loop
                else
                    nQuantiaTotalPagamento += nQuantiaPagamento
                    nValorPago += nValorTotal - nQuantiaPagamento
                    Alert("Valor restante a ser pago: " + (nValorTotal - nValorPago))
                    loop
                endif
            endif

        enddo

        exit

    enddo

enddo