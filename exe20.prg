clear

nNumero := 10
nNumeroResultado := 0

@ 01,01 say "A soma dos numeros entre 10 e 50 e igual a:"

do while nNumero <= 50
    @ nNumero,01 say AllTrim(Str(nNumeroResultado)) + " + " + AllTrim(Str(nNumero))
    nNumeroResultado += nNumero
    nNumero++
enddo

@ 52,01 say AllTrim(Str(nNumeroResultado))