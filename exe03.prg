clear

nNumeroA := 0
nNumeroB := 0

@ 00,00 to 05,40

@ 01,01 say "Digite o valor do numero A = "
@ 02,01 say "Digite o valor do numero B = "

@ 01,30 get nNumeroA
@ 02,30 get nNumeroB
read

nProduto := nNumeroA * nNumeroB

@ 03,01 say "valor numero A= " + alltrim(str(nNumeroA)) + ". Valor numero B= " + alltrim(str(nNumeroB))
@ 04,01 say "Produto de A e B= " + alltrim(str(nProduto))