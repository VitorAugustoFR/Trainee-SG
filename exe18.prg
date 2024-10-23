clear

nNumero := 0

for i := 1 to 10
    nNumero++
    @ i,01 say AllTrim(Str(nNumero))
next
for i := 1 to 10
    @ i,04 say AllTrim(Str(nNumero))
    nNumero--
next