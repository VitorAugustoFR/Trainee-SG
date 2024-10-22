clear

nNumeroA := 3
nNumeroB := 1

@ 00,00 to 06,22

@ 01,01 say "Antigo valor de A = " + alltrim(str(nNumeroA))
@ 02,01 say "Antigo valor de B = " + alltrim(str(nNumeroB))

nGuardarA := nNumeroA
nNumeroA := nNumeroB
nNumeroB := nGuardarA

@ 04,01 say "Novo valor de A = " + alltrim(str(nNumeroA))
@ 05,01 say "Novo valor de B = " + alltrim(str(nNumeroB))