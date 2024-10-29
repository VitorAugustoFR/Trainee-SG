//
set date brit
set century on
clear

//Variaveis

//Dados do aluno
cNomeAluno := space(50)
dNascimento := CToD("")
cCurso := space(15)
cSerie := space(5)
nValorMensalidade := 0

//Disciplinas
cDisciplinaUm := Space(20)
cDisciplinaDois := Space(20)
cDisciplinaTres := Space(20)

//Faltas
nFaltaBimestreUmDiscipliaUm := 0
nFaltaBimestreUmDiscipliaDois := 0
nFaltaBimestreUmDiscipliaTres := 0
nFaltaBimestreDoisDisciplinaUm := 0
nFaltaBimestreDoisDisciplinaDois := 0
nFaltaBimestreDoisDisciplinaTres := 0
nFaltaBimestreTresDisciplinaUm := 0
nFaltaBimestreTresDisciplinaDois := 0
nFaltaBimestreTresDisciplinaTres := 0
nFaltaBimestreQuatroDisciplinaUm := 0
nFaltaBimestreQuatroDisciplinaDois := 0
nFaltaBimestreQuatroDisciplinaTres := 0

//Notas
nNotaBimestreUmDisciplinaUm := 0
nNotaBimestreUmDisciplinaDois := 0
nNotaBimestreUmDisciplinaTres := 0
nNotaBimestreDoisDisciplinaUm := 0
nNotaBimestreDoisDisciplinaDois := 0
nNotaBimestreDoisDisciplinaTres := 0
nNotaBimestreTresDisciplinaUm := 0
nNotaBimestreTresDisciplinaDois := 0
nNotaBimestreTresDisciplinaTres := 0
nNotaBimestreQuatroDisciplinaUm := 0
nNotaBimestreQuatroDisciplinaDois := 0
nNotaBimestreQuatroDisciplinaTres := 0

@ 00,00 to 14,18

@ 01,01 say "Escola: Legal"
@ 01,20 say "Endereco: Rua Sei La, 420"

@ 03,01 say "Digite o Nome do aluno:                 "
@ 04,01 say "Digite a Data de nascimento do aluno:   "
@ 05,01 say "Digite o Curso que o aluno frequenta:   "
@ 06,01 say "Digite a Serie do aluno:                "
@ 07,01 say "Digite o Valor da Mensalidade do aluno: "

@ 03,41 get cNomeAluno valid !Empty(cNomeAluno)
@ 04,41 get dNascimento valid !Empty(dNascimento < date())
@ 05,41 get cCurso valid !Empty(cCurso)
@ 06,41 get cSerie valid !Empty(cSerie)
@ 07,41 get nValorMensalidade valid !Empty(Transform(nValorMensalidade, "@E 9999,99"))
read