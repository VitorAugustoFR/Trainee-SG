clear

nCodigoProduto := 0

@ 01,01 say "Insira o codigo do produto: "

@ 01,29 get nCodigoProduto picture(99)
read

if nCodigoProduto =  1
    @ 02,01 say "Alimento nao-perecivel"
elseif 2 <= nCodigoProduto .AND. nCodigoProduto <=  4
    @ 02,01 say "Alimento perecivel"
elseif 5 <= nCodigoProduto .AND. nCodigoProduto <=  6
    @ 02,01 say "Vestuario"
elseif nCodigoProduto =  7
    @ 02,01 say "Higiene Pessoal"
elseif 8 <= nCodigoProduto .AND. nCodigoProduto <=  15
    @ 02,01 say "Limpeza e utensilios domesticos"
else
    @ 02,01 say "Codigo invalido"
endif