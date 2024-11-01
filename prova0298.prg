//Vitor Augusto Faria Ramalho

set date british
set epoch to 1940

clear

//Variaveis

//Vendedor
cNomeVendedor := Space(30)
dCotacao := CToD("")
//Cliente
cNome := Space(30)
nIdade := 0
cSexo := Space(1)
nPrimeiraCNH := 0
//Veículo
cMarca := Space(20)
nAnoFabricacao := 0
cTipoVeiculo := space(1)
nMotor := 0
nValor := 0
cUso := Space(1)

@ 00,00 to 17,90

@ 01,01 say "SISTEMA DE COTACAO DE SEGURO"
//Recebendo dados do Vendedor
@ 03,01 say "Digite o nome do vendedor............................: "
@ 04,01 say "Digite a data da cotacao.............................: "
//Recebendo dados do Cliente
@ 06,01 say "Digite o nome do cliente.............................: "
@ 07,01 say "Digite a idade.......................................: "
@ 08,01 say "Digite o sexo........................................: "
@ 09,01 say "Digite o ano da primeira CNH.........................: "
//Recebendo dados do Veículo
@ 11,01 say "Digite a marca do veiculo............................: "
@ 12,01 say "Digite o ano da fabricacao...........................: "
@ 13,01 say "Digite o tipo(Passeio P, Esportivo E ou Luxo L)......: "
@ 14,01 say "Digite o motor.......................................: "
@ 15,01 say "Digite o valor.......................................: "
@ 16,01 say "Digite o uso do veiculo(Particular P, Profissional O): "

//Vendedor
@ 03,56 get cNomeVendedor Valid !Empty(cNomeVendedor)
@ 04,56 get dCotacao Valid !Empty(dCotacao)
//Cliente
@ 06,56 get cNome Valid !Empty(cNome)
@ 07,56 get nIdade Valid !Empty(nIdade) picture("999")
@ 08,56 get cSexo Valid !Empty(cSexo)
@ 09,56 get nPrimeiraCNH Valid !Empty(nPrimeiraCNH) picture("9999")
//Veiculo
@ 11,56 get cMarca Valid !Empty(cMarca)
@ 12,56 get nAnoFabricacao Valid !Empty(nAnoFabricacao) picture("9999")
@ 13,56 get cTipoVeiculo Valid !Empty(cTipoVeiculo)
@ 14,56 get nMotor Valid !Empty(nMotor) picture "@E 999.9"
@ 15,56 get nValor Valid !Empty(nValor) picture("9999999999.99")
@ 16,56 get cUso Valid !Empty(cUso)
read

//Valor, seguradora 1 e 2
nValorBase1 := ((nValor * 6) / 100)
nValorBase2 := ((nValor * 7) / 100)

//variaveis adicionais
dCotacaoMes := Month(dCotacao)
dAnoAtual := Date()
nAno := Year(dAnoAtual)
nMes := Month(dAnoAtual)
cMes := space(8)
nValorTotal1 := nValorBase1
nValorTotal2 := nValorBase2

//seguradora 1
clear

@ 00,00 to 8,37
@ 00,00 to 8,80

@ 01,01 say "Seguradora 01"
@ 03,01 say "Valor Base(tabela Fipe)" + AllTrim(Str(nValorBase1))

if nIdade < 25 .or. nIdade> 65
    nValorTotal1 += ((nValorBase1 * 10) / 100)
    //nValorBase1 := nValorBase1 + ((nValorBase1 * 10) / 100)
endif
//2
if cSexo == "M"
    nValorTotal1 += ((nValorBase1 * 10) / 100)
elseif cSexo == "F"
    nValorTotal1 -= ((nValorBase1 * 5) / 100)
endif
//3
if nAno - nPrimeiraCNH  <= 3
    nValorTotal1 += ((nValorBase1 * 15) / 100)
elseif nAno - nPrimeiraCNH  > 8
    nValorTotal1 -= ((nValorBase1 * 10) / 100)
endif
//4
if cTipoVeiculo == "E"
    nValorTotal1 += ((nValorBase1 * 10) / 100)
elseif cTipoVeiculo == "L"
    nValorTotal1 += ((nValorBase1 * 20) / 100)
endif
//5
if nMotor > 2.0
    nValorTotal1 += ((nValorBase1 * 15) / 100)
endif
//6
do while nAnoFabricacao <=20
    nValorTotal1 += ((nValorBase1 * 5) / 1000)
enddo
//7
if cUso == "P"
    nValorTotal1 += ((nValorBase1 * 10) / 100)
endif
//8
if dCotacaoMes == 3
    nValorTotal1 -= ((nValorBase1 * 10) / 100)
endif
//Valor total Seguradora 1
@ 04,01 say "Valor Total: " + AllTrim(Str(nValorTotal1))


//Seguradora 2
@ 01,45 say "Seguradora 02"
@ 03,45 say "Valor Base(tabela Fipe)" + AllTrim(Str(nValorBase2))

//1
if nIdade < 23 .or. nIdade> 60
    nValorTotal2 -= ((nValorBase2 * 15) / 100)
elseif nIdade >= 30 .and. nIdade <= 50
    nValorTotal2 -= ((nValorBase2 * 8) / 100)
endif
//2
if cSexo == "M"
    nValorTotal2 -= ((nValorBase2 * 6) / 100)
elseif cSexo == "F"
    nValorTotal2 -= ((nValorBase2 * 12) / 100)
endif
//3
if nAno - nPrimeiraCNH  <= 2
    nValorTotal2 -= ((nValorBase2 * 20) / 100)
elseif nAno - nPrimeiraCNH  > 5
    nValorTotal2 -= ((nValorBase2 * 8) / 100)
endif
//4
if cTipoVeiculo == "E"
    nValorTotal2 -= ((nValorBase2 * 15) / 100)
elseif cTipoVeiculo == "L"
    nValorTotal2 -= ((nValorBase2 * 18) / 100)
endif
//5
if nMotor >= 1.5
    nValorTotal2 -= ((nValorBase2 * 10) / 100)
endif
//6
do while nAnoFabricacao <=10
    nValorTotal2 -= ((nValorBase2 * 8) / 1000)
enddo
//7
if cUso == "P"
    nValorTotal2 -= ((nValorBase2 * 12) / 100)
endif
//8
if dCotacaoMes == 9
    nValorTotal2 -= ((nValorBase2 * 8) / 100)
endif

//Valor total Seguradora 2
@ 04,45 say "Valor Total: " + AllTrim(Str(nValorTotal2))

//retorna o ultimo dia do mês atual
nDia := Day(CTod('01/' + Str(Month(Date()) + 1, 2) + '/00')-1)

//Cotação
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

@ 06,01 say "Cotacao valida ate " + AllTrim(Str(nDia)) + " de " + cMes + " de " + AllTrim(Str(nAno))