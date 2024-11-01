set date brit
set century on
clear

//Declarando váriaveis
cNome :=  space(40)
cEndereco := space(50)
nIdade := 0

dCompra := CToD("")
dEntrega := CToD("")

nValorTotal := 0 

nLinha := 5

bLoop := .t.

do while bLoop == .t.
    @ 00,00 to 12,65

    //pegando o nome e a idade
    @ 01,01 say "Nome:"
    @ 02,01 say "Idade:"

    @ 01,06 get cNome
    @ 02,06 get nIdade
    read

    if LastKey() == 27
        nOpcao := Alert("Deseja sair?", {"Sim","Nao"})
        if nOpcao == 1
            exit
        endif
        loop
    endif

    do while .t.
        cProduto := space(20)
        nQuantidade := 0
        nPreco := 0
        @ 04,01 say "SEQ       Produto          QTD        Preco       Valor"
        @ nLinha,01 say AllTrim(Str(nLinha - 4)) Valid nLinha > 10
        @ 08,01 say "Endereco: "
        @ 09,01 say "Data da compra: "
        @ 10,01 say "Data de Entrega: "

        //Lendo input de usuário
        //produto A
        @ nLinha,05 get cProduto
        @ nLinha,26 get nQuantidade
        @ nLinha,37 get nPreco picture("999.99")
        read
        nValorProduto := (nQuantidade * nPreco)
        @ 05,50 say AllTrim(Str(nValorProduto))

        //printando o valor total
        nValorTotal += nValorProduto
        @06,42 say"Valor Total = " + AllTrim(Str(nValorTotal))

        nLinha++

        if LastKey() == 27
            nOpcao := Alert("Oque deseja fazer?", {"Cancelar","Finalizar","Continuar"})
            if nOpcao == 1
                bLoop := .f.
                exit
            elseif nOpcao == 2
                exit
                exit
            endif
            loop
        endif
    enddo


    //pegando endereço + data da compra e entrega
    @ 08,11 get cEndereco
    @ 09,17 get dCompra
    @ 10,19 get dEntrega Valid dEntrega >= (dCompra += 3)
    read

enddo

//Nota fiscal
clear

@ 00,00 to 09,55

@ 01,01 say "Nome: " + cNome
@ 02,01 say "Idade: " + AllTrim(Str(nIdade))
@ 04,01 say "Data da Compra: " + DToC(dCompra)
@ 06,01 say "Valor total: " + AllTrim(Str(nValorTotal))
@ 08,01 say "Endereco: " + AllTrim(cEndereco) + ".   Data da entrega: " + DToC(dEntrega)