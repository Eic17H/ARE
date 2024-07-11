! prima di DIVB DL, azzera AH e DH
    XORB AH, AH
    XORB DH, DH
    DIVB DL

! MULB e DIVB
    DIVB DL             ! al = ax/dl    ! ah = ax%dl
    DIV  DX             ! ax = ax:dx/dx ! dx = ax:dx%dx

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

! registri:
    ! con questi lavoriamo direttamente:
        AX ! accumulatore, risultato
        BX ! memorizzare e accedere a un indirizzo
        CX ! contatore nei loop
        DX ! dati
        SP ! stack top pointer
        SS ! limite massimo di SP
        BP ! puntatore base, punta anywhere nello stack
        SI ! indice sorgente, per accedere ai dati sullo stack (con BP) o in memoria (con BX)
        DI ! come SI, ma è l'indice destinazione (ma si possono usare allo stesso modo)
    
    ! questi esistono per conto proprio:
        IP ! instruction pointer, è il program counter e si usa nel fetch
        ! queste sono flag da 1 bit scritte da CMP e lette dai Jump:
        ZF ! zero
        SF ! negativo
        OF ! overflow
        CF ! riporto
        AF ! riporto ausiliario
        PF ! pari
        IF ! interrupt
        TF ! tracing
        DF ! operazioni su stringhe