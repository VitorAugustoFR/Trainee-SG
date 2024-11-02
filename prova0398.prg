//Vitor Augusto Faria Ramalho

set date british
set epoch to 1940
clear

//Numero de empregados
nEmpregados := 1
//Variaveis colaborador
cNomeColaborador := space(50)
cSexo := space(1)
dNacimento := CToD("")
dAdmissao := CToD("")
dDemissao := CToD("")
nSalarioBase := 0
nAdicionalNoturno := 0
nAdicionalInsalubridade := 0

//Variaveis adicionais
nAnoAdmissao := Year(dAdmissao)
nAnoDemissao := Year(dDemissao)
nHomens := 0
nHomensBonus := 0
nHomensAdmissao := 0
nMulheres := 0
nMulheres85 := 0
nTotalAposentados := 0

nValorAposentadoria := 0

nEmpregados2 := 1

nValorTotal := 0 

do while nEmpregados >= nEmpregados2
    @ 00,00 to 13,80
    @ 00,00 to 02,80
    @ 00,00 to 04,80
    
    @ 01,01 say "Digite o numero de empregados a serem analizados.: "
    @ 03,01 say "Digite os dados do empregado"
    @ 05,01 say "Nome do colaborador..............................: "
    @ 06,01 say "Sexo do colaborador..............................: "
    @ 07,01 say "Data de nascimento...............................: "
    @ 08,01 say "Data de admissao.................................: "
    @ 09,01 say "Data de demissao.................................: "
    @ 10,01 say "Valor do salario base............................: "
    @ 11,01 say "Percentual noturno(Caso nao tenha digite 0)......: "
    @ 12,01 say "Percentual insalubridade(Caso nao tenha digite 0): "

    @ 01,52 get nEmpregados picture "999" Valid !Empty(nEmpregados)
    @ 05,52 get cNomeColaborador Valid !Empty(cNomeColaborador)
    @ 06,52 get cSexo Valid !Empty(cSexo)
    @ 07,52 get dNacimento Valid !Empty(dNacimento)
    @ 08,52 get dAdmissao Valid !Empty(dAdmissao)
    @ 09,52 get dDemissao Valid !Empty(dNacimento)
    @ 10,52 get nSalarioBase picture "@E 99999.99" Valid !Empty(nSalarioBase)
    @ 11,52 get nAdicionalNoturno
    @ 12,52 get nAdicionalInsalubridade
    read
        //aptidão para receber aposentadoria
    if cSexo == "M"
        if (dNacimento - Date()) >= 59 .and. (dDemissao - dAdmissao) >= 27
        endif
    elseif cSexo == "F"
        if (dNacimento - Date()) >= 55 .and. (dDemissao - dAdmissao) >= 22
        endif
    endif

    //Calculo da remuneracao da aposentadoria
    if nAdicionalNoturno > 0 
        nValorAposentadoria += (nSalarioBase * nAdicionalNoturno)/100
    elseif nAdicionalInsalubridade > 0
        nValorAposentadoria += (nSalarioBase * nAdicionalInsalubridade)/100
    endif

    if nAnoDemissao >= 2010 .or. nAnoDemissao <= 2015
        nValorAposentadoria += (nSalarioBase * 6) / 100
    elseif nAnoDemissao >= 2012 .or. nAnoDemissao <= 2020
        nValorAposentadoria -= (nSalarioBase * 2) / 100
    endif

    nValorTotal += nValorAposentadoria
    //calculos quadro
    //Numero de homens e mulheres aposentados(as)
    if cSexo == "M"
        nHomens++
    elseif cSexo == "F"
        nMulheres++ 
    endif

    //Mulheres acima de 85 anos
    if cSexo == "F" .and. (dNacimento - Date()) > 85
        nMulheres85++
    endif

        //Homens admitidos antes de 2006
    if cSexo == "M" .and. nAnoAdmissao < 2006
        nHomensAdmissao++
    endif

    //Homens que receberam algum tipo de bonus
    if cSexo == "M" .and. (nAdicionalInsalubridade > 0 .or. nAdicionalNoturno > 0)
        nHomensBonus++ 
    endif

    if LastKey() == 27
        nOpcao2 := Alert("Oque deseja fazer?", {"Cancelar","Retornar","Processar"})
        if nOpcao2 == 1
            exit
        elseif nOpcao2 == 2
            loop
        elseif nOpcao2 == 3
        endif
        loop
    endif

    nEmpregados2++
enddo

clear
//quadro
//Percentual de Homens e mulheres aposendados(as)
nTotalAposentados := nHomens + nMulheres
nPorcentagemHomens := (nHomens * 100) / nTotalAposentados
nPorcentagemMulheres := (nMulheres * 100) / nTotalAposentados

@ 00,00 to 10,80
@ 01,01 say "Total de aposentados: " + AllTrim(Str(nTotalAposentados))
@ 02,01 say "Porcentagem de aposentados homens: " + AllTrim(Str(nPorcentagemHomens))
@ 03,01 say "Porcentagem de aposentadas mulheres: " + AllTrim(Str(nPorcentagemMulheres))
@ 05,01 say "Valor total da remuneracao: " + AllTrim(Str(nValorTotal))
@ 07,01 say "Numero de mulheres com idade superior a 85 anos: " + AllTrim(Str(nMulheres85))
@ 08,01 say "Numero de Homens admitidos antes do ano de 2006: " + AllTrim(Str(nHomensAdmissao))
@ 09,01 say "Quantidade de homens que receberam algum tipo de bonus " + AllTrim(Str(nHomensBonus))