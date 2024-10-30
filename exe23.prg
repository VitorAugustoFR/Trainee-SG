clear

nDigitado := 0

@ 01,01 say "Tente advinhar um numero em um range de 1 a 10"

do while nDigitado != 5
    @ 01,47 get nDigitado
    read

    if nDigitado > 0 .and. nDigitado < 5 .or. nDigitado > 5 .and. nDigitado < 10
        @ 03,01 say "Errou..!"
        loop
    elseif nDigitado == 5
        @ 03,01 say "Acertou!"
        exit
    else
        @ 03,01 say "Invalido"
        loop
    endif
enddo