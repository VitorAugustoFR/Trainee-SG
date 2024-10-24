clear

cNome := space(50)
nMesada := 0
nPrecoProduto := 0

@ 01,01 say "Digite seu nome: "
@ 02,01 say "Digite sua mesada: "

@ 01,18 get cNome
@ 02,20 get nMesada picture("999.99")
read

@ 05,01 say "Digite o preco do produto: "

@ 05,27 get nPrecoProduto picture("999.99")
read

clear

do while nMesada >= nPrecoProduto
    nMesadaRestante := nMesada - nPrecoProduto
    nMesadaStr := AllTrim(Str(nMesadaRestante))
    @ 01,01 say "Mesada restante: " + nMesadaStr
    nMesada := nMesadaRestante
    @ 03,01 get nPrecoProduto picture("999.99")
    read
enddo

@ 05,01 say AllTrim(cNome) + ", voce nao tem mesada o suficiente para comprar"
@ 06,01 say "Mesada restante: " + AllTrim(Str(nMesadaRestante))