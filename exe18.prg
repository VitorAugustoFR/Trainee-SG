clear

nNumero := 0
nVariavelUm := 1
nVariavelDois := 1

do while nVariavelUm <= 10
    nNumero++
    @ nVariavelUm,01 say AllTrim(Str(nNumero))
    nVariavelUm++
enddo
do while nVariavelDois <= 10
    @ nVariavelDois,04 say AllTrim(Str(nNumero))
    nNumero--
    nVariavelDois++
enddo