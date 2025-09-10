set scoreBoard off
set date brit
set epoch to 1940
//set mode (25,80)

clear
cNome                  := space(50)
cProdutoUm             := space(10)
cProdutoDois           := space(10)
cProdutoTres           := space(10)
cEnderecoEntrega       := space(50)
dAtual                 := Date()
dCompraUm              := CToD("")
dCompraDois            := CToD("")
dCompraTres            := CToD("")
dNascimento            := CToD("")
dEntrega               := CToD("")
nProdutoUmPreco        := 0
nProdutoDoisPreco      := 0
nProdutoTresPreco      := 0
nProdutoUmQuantidade   := 0
nProdutoDoisQuantidade := 0
nProdutoTresQuantidade := 0
nProdutoUmResultado    := 0
nProdutoDoisResultado  := 0
nProdutoTresResultado  := 0
nTaxaEntrega           := 0
nResultadoFinal        := 0

//Dados cliente

@ 01,01 say "Digite seu nome: "
@ 02,01 say "Digite sua data de nascimento: "
@ 01,18 get cNome picture "@!" valid !Empty(cNome)
@ 02,32 get dNascimento valid !Empty(dNascimento)
read

inkey(0)

clear

@ 00,00 to 24,79
@ 04,14 to 09,60 double

@ 03,30 say "Mercadinho Boladao:"
@ 05,15 say " Produto  | Preco  |  Qnt   |  Data  | Total "
@ 06,15 say "          |        |        |        |"
@ 07,15 say "          |        |        |        |"
@ 08,15 say "          |        |        |        |"

//calculo produto um
@ 06,15 get cProdutoUm picture "@!" valid !Empty(cProdutoUm)
@ 06,26 get nProdutoUmPreco picture "@E 9,999.99"
@ 06,35 get nProdutoUmQuantidade picture "@E 9,999.99"
@ 06,44 get dCompraUm valid !Empty(dCompraUm)
read
nProdutoUmResultado := nProdutoUmQuantidade * nProdutoUmPreco
nResultadoFinal     += nProdutoUmResultado
@ 06,52 say transform(nProdutoUmResultado, "@E 9,999.99")

//calculo produto 2
@ 07,15 get cProdutoDois picture "@!" valid !Empty(cProdutoDois)
@ 07,26 get nProdutoDoisPreco picture "@E 9,999.99"
@ 07,35 get nProdutoDoisQuantidade picture "@E 9,999.99"
@ 07,44 get dCompraDois valid !Empty(dCompraDois)
read
nProdutoDoisResultado := nProdutoDoisQuantidade * nProdutoDoisPreco
nResultadoFinal       += nProdutoDoisResultado
@ 07,52 say transform(nProdutoDoisResultado, "@E 9,999.99")

//calculo produto 3
@ 08,15 get cProdutoTres picture "@!" valid !Empty(cProdutoTres)
@ 08,26 get nProdutoTresPreco picture "@E 9,999.99"
@ 08,35 get nProdutoTresQuantidade picture "@E 9,999.99"
@ 08,44 get dCompraTres valid !Empty(dCompraTres)
read
nProdutoTresResultado := nProdutoTresQuantidade * nProdutoTresPreco
nResultadoFinal       += nProdutoTresResultado
@ 08,52 say transform(nProdutoTresResultado, "@E 9,999.99")

@ 10,01 say "Digite o Endereco de entrega: "
@ 13,01 say "Digite o prazo de entrega: "
@ 16,01 say "Digite a taxa de entrega: "

@ 11,01 get cEnderecoEntrega picture "@!" valid !Empty(cEnderecoEntrega)
@ 14,01 get dEntrega valid dEntrega > date() + 5
@ 17,01 get nTaxaEntrega picture "@E 999.99"
read

nResultadoFinal += nTaxaEntrega

inkey(0)

//nota fiscal
clear

@ 00,00 to 24,79
@ 04,14 to 12,56 double

@ 03,25 say "Nota Fiscal:"
@ 05,15 say " Produto  | Preco  |  Qnt   |  Data  |  Total "
@ 06,15 say cProdutoUm + "|" + Str(nProdutoUmPreco) + " |" + Str(nProdutoUmQuantidade) + " |" + DToC(dCompraUm) + " |" + AllTrim(Str(nProdutoUmResultado))
@ 07,15 say cProdutoDois + "|" + Str(nProdutoDoisPreco) + " |" + Str(nProdutoDoisQuantidade) + " |" + DToC(dCompraDois) + " |" + AllTrim(Str(nProdutoDoisResultado))
@ 08,15 say cProdutoTres + "|" + Str(nProdutoTresPreco) + " |" + Str(nProdutoTresQuantidade) + " |" + DToC(dCompraTres) + " |" + AllTrim(Str(nProdutoTresResultado))


@ 10,15 say "Seu produto chegara em: " + DToC(dEntrega)
@ 11,15 say "Resultado Final: R$" + transform(nResultadoFinal, "@E 9,999.99")