//set mode(25,80)
/*Para fazer:
    colocar sistema de combate
    colocar sistema de knock back
    colocar sistema de colisão de blocos estaticos por array e list
*/
clear
//Player
cPersonagem := "O"
cArma := {"|", "-"}
nHspd := 40
nVspd := 12
nVidaPersonagem := 10
nUltimaTecla := inkey()
//Inimigo
//cInimigoPos := Array{nHspdInimigo, nVspdInimigo}
//nColisao := {Numeros onde existem objetos colidiveis}
cInimigo := "M"
nVidaInimigo := 2
nHspdInimigo := 15
nVspdInimigo := 15
lViuPlayer := .f.
nDistanciaH := nHspd - nHspdInimigo
nDistanciaV := nVspd - nVspdInimigo
    

do while .t.

    // se a vida do player for maior que 0
    //Transformar em if e criar um do while que engloba tudo
    if nVidaPersonagem > 0

        @ nVspdInimigo,nHspdInimigo say cInimigo
        @ nVspd,nHspd say cPersonagem 

        nMovAleatorio := hb_RandomInt(1,2)
        nDirecaoAleatoria := hb_RandomInt(1,2)
        @ 01,01 say "Vida" + Str(nVidaPersonagem)

        //Mov + colisão com a lateral
        if LastKey() == 65 .or. LastKey() == 97 .and. nHspd > 1//A
            @ nVspd,nHspd clear to nVspd,nHspd
            nHspd--
            @ nVspd,nHspd say cPersonagem
        elseif LastKey() == 68 .or. LastKey() == 100 .and. nHspd < 78//D
            @ nVspd,nHspd clear to nVspd,nHspd
            nHspd++
            @ nVspd,nHspd say cPersonagem
        elseif LastKey() == 87 .or. LastKey() == 119 .and. nVspd > 1//W
            @ nVspd,nHspd clear to nVspd,nHspd
            nVspd--
            @ nVspd,nHspd say cPersonagem
        elseif LastKey() == 83 .or. LastKey() == 115 .and. nVspd < 23//S
            @ nVspd,nHspd clear to nVspd,nHspd
            nVspd++
            @ nVspd,nHspd say cPersonagem
        end if

        //Reduzir vida do player quando encostar no inimigo
        if nHspd == nHspdInimigo .and. nVspd == nVspdInimigo
            nVidaPersonagem--
        end if

        //ataque player
        if LastKey() == 102 .or. LastKey() == 70
            if nUltimaTecla == LastKey() == 65 .or. LastKey() == 97
                @ (nHspd - 1),nVspdcArma(1) say cArma == 2
            elseif LastKey() == 68 .or. LastKey() == 100
                @ (nHspd + 1),nVspdcArma(1) say cArma == 2
            elseif LastKey() == 87 .or. LastKey() == 119
                @ nHspd,(nVspd - 1) say cArma == 1
            elseif LastKey() == 83 .or. LastKey() == 115
                @ nHspd,(nVspd + 1) say cArma == 1
            end if
        end if

        //Inimigo
        //Enquanto a vida do inimigo for maior que zero
        if nVidaInimigo > 0

            // if nHspd <= (nHspdInimigo + 5) .or. (nHspdInimigo - 5) .or. (nHspdInimigo + 5) .or. (nHspdInimigo + 5) .or.

            //Checa se o player esta no campo de target do inimigo
            if (nDistanciaH < 2 .and. nDistanciaH > -2) .or. (nDistanciaV < 2 .and. nDistanciaV > -2)
                lViuPlayer := .t.
            elseif nDistanciaH > 2 .or. nDistanciaH < -2 .or. nDistanciaV > 2 .or. nDistanciaV < -2
                lViuPlayer := .f.
            end if

           //Comportamento do inimigo sem ver o player
            if lViuPlayer == .f.
                if nDirecaoAleatoria == 1 .and. nMovAleatorio == 1
                    @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                    nHspdInimigo++
                    @ nVspdInimigo,nHspdInimigo say cInimigo
                elseif nDirecaoAleatoria == 1 .and. nMovAleatorio == 2
                    @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                    nHspdInimigo--
                    @ nVspdInimigo,nHspdInimigo say cInimigo
                elseif nDirecaoAleatoria == 2 .and. nMovAleatorio == 1
                    @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                    nVspdInimigo++
                    @ nVspdInimigo,nHspdInimigo say cInimigo
                elseif nDirecaoAleatoria == 2 .and. nMovAleatorio == 2
                    @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                    nVspdInimigo--
                    @ nVspdInimigo,nHspdInimigo say cInimigo
                end if
            //comportamento do inimigo após ver o player
            elseif lViuPlayer == .t.
                if nDistanciaH > 0 .and. nDistanciaH < 2
                    @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                    nHspdInimigo++
                    @ nVspdInimigo,nHspdInimigo say cInimigo
                elseif nDistanciaV > 0 .and. nDistanciaV < 2
                    @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                    nVspdInimigo++
                    @ nVspdInimigo,nHspdInimigo say cInimigo
                elseif nDistanciaH < 0 .and. nDistanciaH > -2
                    @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                    nHspdInimigo--
                    @ nVspdInimigo,nHspdInimigo say cInimigo
                elseif nDistanciaV < 0 .and. nDistanciaH > -2
                    @ nVspdInimigo,nHspdInimigo clear to nVspdInimigo,nHspdInimigo
                    nVspdInimigo--
                    @ nVspdInimigo,nHspdInimigo say cInimigo
                end if
            end if
        end if
        //Tone(500,1)

        @ 00,00 to 24,79
        inkey(0)
    end if

    if nVidaPersonagem == 0
        nOpca1 := Alert("Game Over", {"Jogar Novamente", "Sair"})
        if nOpca1 == 1
            loop
        elseif nOpca1 == 2
            clear
            exit
        end if
        loop
    end if

end do