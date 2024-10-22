clear

//Declarando váriaveis
nProdutoA := 10
nProdutoB := 5.25
nProdutoC := 20
nQuantidadeA := space(50)
nQuantidadeB := space(50)
nQuantidadeC := space(50)

@ 00,00 to 05,110

@ 01,01 say "Coloque a quantia do produto 1(Valor RS10,00): "
@ 02,01 say "Coloque a quantia do produto 2(Valor RS5,25): "
@ 03,01 say "Coloque a quantia do produto 3(Valor RS20,00): "

//Lendo input de usuário
@ 01,48 get nQuantidadeA
@ 02,47 get nQuantidadeB
@ 03,48 get nQuantidadeC
read

nValorProdutoA := (nProdutoA * Val(nQuantidadeA))
nValorProdutoB := (nProdutoB * Val(nQuantidadeB))
nValorProdutoC := (nProdutoC * Val(nQuantidadeC))

nValorTotal := nValorProdutoA + nValorProdutoB + nValorProdutoC

//printando o valor total
@04,01 say"Valor Total = " + AllTrim(Str(nValorTotal))