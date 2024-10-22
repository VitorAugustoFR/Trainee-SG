clear

nNumero := 0
nLinha := 10

for i := 0 to (10-1)
    nNumero++
    @i,01 say AllTrim(Str(nNumero))
next
for e := 10 to 0
    @e,04 say AllTrim(Str(nNumero))
    nNumero--
next