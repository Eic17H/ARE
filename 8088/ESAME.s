! Ogni studente deve eseguire un solo esame.
! Per capire quale, prendete la vostra matricola completa,
! togliete eventuali lettere e simboli, trasformate il numero in binario,
! applicate tre shift a sinistra di 1 bit, sommate 2 decimale e trasformate in decimale
! e calcolate l'operazione modulo 3. Poi sommate 7 decimale e riapplicate l'operazione modulo 3.

! E.g. 60/61/66101 => 606166101 => 100100001000010101110001010101
! => 100001000010101110001010101000=>100001000010101110001010101010=((554361514 % 3)+7)%3=2

! compito 0 20240712

_PRINTF = 127
_GETCHAR = 117
_EXIT = 1
_NUMOFFSET = 0x30

.SECT .TEXT
    main:

    ! input(n)
    PUSH _GETCHAR
    SYS
    SUBB AL, _NUMOFFSET
    MOVB (n), AL
    PUSH _GETCHAR
    SYS

    ! fun(v, dim)
    PUSH v
    PUSH stampa-v
    CALL fun

    !print(v, dim)
    PUSH v
    PUSH stampa-v
    CALL print

    ! exit(0)
    PUSH 0
    PUSH _EXIT
    SYS

    fun:
        ! il solito
        PUSH BP
        MOV BP, SP

        MOV BX, 0 ! indice (i)
        MOV SI, 6(BP) ! primo parametro (v)
        MOV CX, 4(BP) ! secondo parametro (dim)

        for:
            XOR AX, AX
            MOVB AL, (BX)(SI)
            MOVB DL, (n)
            SUBB AL, DL
            MOVB DH, AL ! dh = vi-n
            MOVB AL, 4(BP)
            MOVB DL, 2
            DIVB DL ! al = dim/2
            CMPB DH, AL
            JG caso1 ! vi-n > dim/2

            XOR AX, AX
            MOVB AL, (BX)(SI)
            MOVB DL, (n)
            DIVB DL
            MOVB DH, AH ! dh = vi%n
            XOR AX, AX
            MOVB AL, (BX)(SI)
            MOVB DL, BL
            XORB AH, AH
            DIVB DL ! ah = vi%i
            CMPB DH, AH
            JNE caso2 ! vi%n != vi%i 

            JMP caso3

            caso1:
                XOR AX, AX
                ! n 3 % 1 + vi *
                MOVB AL, (n)
                MOVB DL, 3
                DIVB DL
                MOVB AL, AH ! al = n%3
                ADDB AL, 1 ! al += 1
                MOVB DL, (BX)(SI)
                MULB DL ! al *= vi
                MOVB (BX)(SI), AL
            JMP endif

            caso2:
                XOR AX, AX
                ! al = vi/n, dl = i+3, al *= dl
                MOVB AL, (BX)(SI)
                MOVB DL, (n)
                DIVB DL ! vi/n
                MOVB DL, BL
                ADDB DL, 3 ! i + 3
                MULB DL ! *
                MOVB (BX)(SI), AL
            JMP endif

            caso3:
                XOR AX, AX
                PUSH BX ! temp = i
                ! i = i%(n+1)
                MOVB AL, BL
                MOVB DL, (n)
                ADDB DL, 1
                DIVB DL
                MOVB BL, AH ! bl = bl%(n+1)
                MOVB AL, (BX)(SI) ! al = v[bl]
                MOVB DL, (n)
                MOVB DH, 4(BP) ! dl:dh = n:dim
                ADDB DL, DH
                MULB DL ! al *= n+dim
                POP BX ! i = temp
                MOVB (BX)(SI), AL ! vi = v[bl%(n+1)]*(n+dim)
            endif:

        INC BX
        LOOP for

        MOV SP, BP
        POP BP
        RET

    print:
        PUSH BP
        MOV BP, SP

        MOV BX, 0 ! indice (i)
        MOV SI, 6(BP) ! primo parametro (v)
        MOV CX, 4(BP) ! secondo parametro (dim)

        forp:
            XOR AX, AX
            ! vi/n + v0
            MOVB AL, (BX)(SI) ! a = v[i]
            MOVB DL, (n)
            DIVB DL
            XORB AH, AH ! al = vi/n
            MOVB DL, 0(SI) ! dl = v0
            ADDB AL, DL
            PUSH AX
            PUSH stampa
            PUSH _PRINTF
            SYS

        INC BX
        LOOP forp
        
        MOV SP, BP
        POP BP
        RET


.SECT .DATA
    v: .BYTE 8,2,7,3,5,8
    stampa: .ASCII "%d \0"
.SECT .BSS
    n: .SPACE 1
