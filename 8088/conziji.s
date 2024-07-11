! prima di DIVB DL, azzera AH e DH
    XORB AH, AH
    XORB DH, DH
    DIVB DL

! ecco i confronti
    ! questi sono quelli che uso
         JE AL, DL ! a==d
        JNE AL, DL ! a!=d
         JA AL, DL ! a>d
        JAE AL, DL ! a>=d
         JB AL, DL ! a<b
        JBE AL, DL ! a<=b

    ! ci sono anche questi confronti ma non ho capito la differenza
         JZ AL, DL ! a==d
        JNZ AL, DL ! a!=d
         JG AL, DL ! a>d
        JGE AL, DL ! a>=d
         JL AL, DL ! a<b
        JLE AL, DL ! a<=b

! operazioni normali
    MOV AX, DX          ! a = d
    MOV AX, 5           ! a = 5
    MOV AX, (SI)        ! a = *s
    MOV AX, (BX)(SI)    ! a = s[b]
    MOV AX, 5(SI)       ! a = s[5]

    LEA AX, 5           ! a = 5
    LEA AX, 5(SI)       ! a = (*s) + 5

    ADD AX, 5           ! a += 5
    ADD AX, DX          ! a += d
    ADD AX, (5)         ! a += *5 (int *i; i=5; a+=*i)
    ADD AX, (SI)        ! a += *s
    ADD (AX), DX        ! sbagliato, non puoi usare AX come indirizzo (puntatore)
    SUB AX, 5           ! a -= 5

    ! ax è l'insieme di ah (high) e al (low)
    ! ax:dx è la stessa cosa ma con ax e dx
    ! ax è come se fosse ah:al, funzionano così anche bx, cx e dx
    MULB DL             ! ax = al*dl
    MUL  DX             ! ax:dx = ax*dx
    DIVB DL             ! al = ax/dl    ! ah = ax%dl
    DIV  DX             ! ax = ax:dx/dx ! dx = ax:dx%dx

! indirizzi:
    SP ! stack top pointer
    SS ! limite massimo di SP
    ! ...