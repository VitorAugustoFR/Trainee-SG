set date brit 
set epoch to 1940
clear 

dAtual := date()
nAno := Year(dAtual)
nDia := Day(dAtual)
nMes := Month(dAtual)
nDiaSemana := DoW(dAtual)

cMes := space(10)
cDiaSemana := space(15)

//Meses
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

//Dias da semana
if nDiaSemana == 1
    cDiaSemana := "Domingo"
elseif nDiaSemana == 2
    cDiaSemana := "Segunda-Feira"
elseif nDiaSemana == 3
    cDiaSemana := "Terca-Feira"
elseif nDiaSemana == 4
    cDiaSemana := "Quarta-Feira"
elseif nDiaSemana == 5
    cDiaSemana := "Quinta-Feira"
elseif nDiaSemana == 6
    cDiaSemana := "Sexta-Feira"
else
    cDiaSemana := "Sabado"
endif


@ 01,01 say "Maringa " + AllTrim(Str(nDia)) + " de " + cMes + " de " + AllTrim(Str(nAno)) + ". " + cDiaSemana