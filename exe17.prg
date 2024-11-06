clear

cNome := Space(50)
nCount := 0
nFinalPalavra := 1
cFinalPalavra := space(50)

@ 01,01 say "Digite uma Palavra para inverte-la"

@ 01,25 get cNome valid !Empty(cNome)
read

// Pega o tamanho
nLenStr := Len (AllTrim(cNome))

clear

@ 01,01 say "'" + AllTrim(cNome) + "' invertido:"

//Fazer sem o say dentro do While
do while nCount < nLenStr
    //invertendo
    cPalavra := SubStr(cNome, nCount + 1, 1)
    @ 03,(nLenStr-nCount) say AllTrim(cPalavra) 
    nCount++
enddo
@ 04,(nLenStr-nCount) say AllTrim(cPalavra) 