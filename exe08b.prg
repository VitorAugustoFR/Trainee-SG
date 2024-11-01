set date brit
set century on
clear

//Declarando váriaveis
cNome :=  space(40)
cEndereco := space(90)
nIdade := 0

dCompra := CToD("")
dEntrega := CToD("")

cProdutoA := space(20)
cProdutoB := space(20)
cProdutoC := space(20)

nQuantidadeA := 0
nQuantidadeB := 0
nQuantidadeC := 0

nPrecoA := 0
nPrecoB := 0
nPrecoC := 0

@ 00,00 to 12,110

//pegando o nome e a idade
@ 10,01 say "Nome:"
@ 11,01 say "Idade:"

@ 10,06 get cNome
@ 11,06 get nIdade
read

@ 01,01 say "SEQ       Produto          QTD        Preco       Valor"
@ 02,01 say " 1"
@ 03,01 say " 2"
@ 04,01 say " 3"
@ 06,01 say "Endereco: "
@ 07,01 say "Data da compra: "
@ 08,01 say "Data de Entrega: "

//Lendo input de usuário
//produto A
@ 02,05 get cProdutoA
@ 02,26 get nQuantidadeA
@ 02,37 get nPrecoA picture("999.99")
read
nValorProdutoA := (nQuantidadeA * nPrecoA)
@ 02,50 say AllTrim(Str(nValorProdutoA))

//produto B
@ 03,05 get cProdutoB
@ 03,26 get nQuantidadeB
@ 03,37 get nPrecoB picture("999.99")
read
nValorProdutoB := (nQuantidadeB * nPrecoB)
@ 03,50 say AllTrim(Str(nValorProdutoB))

//produto C
@ 04,05 get cProdutoC
@ 04,26 get nQuantidadeC
@ 04,37 get nPrecoC picture("999.99")
read
nValorProdutoC := (nQuantidadeC * nPrecoC)
@ 04,50 say AllTrim(Str(nValorProdutoC))

//calculando o valor total
nValorTotal := nValorProdutoA + nValorProdutoB + nValorProdutoC

//printando o valor total
@05,42 say"Valor Total = " + AllTrim(Str(nValorTotal))

//pegando endereço + data da compra e entrega
@ 06,11 get cEndereco
@ 07,17 get dCompra
@ 08,19 get dEntrega Valid dEntrega >= (dCompra += 3)


//Nota fiscal
clear

@ 00,00 to 14,90

@ 01,01 say "Nome: " + cNome
@ 02,01 say "Idade: " + AllTrim(Str(nIdade))
@ 04,01 say "Data da Compra: " + DToC(dCompra)
@ 06,01 say "Itens comprados:"
@ 08,01 say "Primeiro item: " + AllTrim(cProdutoA) + ",   " + "Preco: " + AllTrim(Str(nPrecoA)) + ",   " + "Quantidade: " + AllTrim(Str(nQuantidadeA)) + ",   " + "Valor: " + AllTrim(Str(nValorProdutoA)) + ";"
@ 09,01 say "Segundo item:  " + AllTrim(cProdutoB) + ",   " + "Preco: " + AllTrim(Str(nPrecoB)) + ",   " + "Quantidade: " + AllTrim(Str(nQuantidadeB)) + ",   " + "Valor: " + AllTrim(Str(nValorProdutoB)) + ";"
@ 10,01 say "Terceiro item: " + AllTrim(cProdutoC) + ",   " + "Preco: " + AllTrim(Str(nPrecoC)) + ",   " + "Quantidade: " + AllTrim(Str(nQuantidadeC)) + ",   " + "Valor: " + AllTrim(Str(nValorProdutoC)) + ";"
@ 11,01 say "Valor total: " + AllTrim(nValorTotal)
@ 13,01 say "Endereco: " + AllTrim(cEndereco) + ".   Data da entrega: " + DToC(dEntrega)