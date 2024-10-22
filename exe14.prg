clear

do while .t.
    nCodCli := 0
                                            //faltando aspas duplas
    @ 12,10 say "Informe o codigo do cliente:"

                        //picture não pict
    @ 12,40 get nCodCli picture ("999999")
    read

    @ 12,10 say nCodCli
    if lastkey() == 27
        loop
    endif
enddo