clear
nNumero := 3
@ 01,01 say nNumero
nNumero += 5
@ 02,01 say nNumero
nNumero := nNumero + 5

@ 03,01 say nNumero

do while .t.
    nNumero++
    @ 05,01 say nNumero
    if LastKey() == 27
        nOpcao2 := Alert("Oque deseja fazer?", {"Cancelar","Processar"})
        if nOpcao2 == 1
            exit
        elseif nOpcao2 == 2
            loop
        endif
        loop
    endif
enddo