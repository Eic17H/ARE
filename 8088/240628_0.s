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
            ADDB DL, 2
            XORB AH, AH
            DIVB DL ! al = v[i]/(n+2)
            MOVB DL, 4(BP)
            SUBB DL, 4 ! dl = dim-4
            CMPB AL, DL
            JL caso1 ! v[i]/(n+2) < dim-4

            XOR AX, AX
            MOVB AL, (BX)(SI)
            MOVB DL, BL
            DIVB DL
            MOVB DH, AL ! dh = v[i]/i
            MOVB AL, BL
            MOVB DL, (n)
            MULB DL ! al = i*n
            CMPB AL, DH
            JGE caso2 ! i*n >= v[i]/i

            JMP caso3

            caso1:
                XOR AX, AX
                PUSH BX ! temp = i
                MOVB AL, (n)
                MOVB DL, 2
                XORB AH, AH
                DIVB DL ! ah = n%2
                ADDB BL, AH ! i+=n%2
                MOVB AL, (BX)(SI) ! al = v[i+n%2]
                MOVB DL, (n)
                ADDB DL, 2 ! dl = n+2
                MULB DL ! al = v[i+n%2]*(n+2)
                POP BX ! i = temp
                MOVB (BX)(SI), AL
            JMP endif

            caso2:
                XOR AX, AX
                MOVB AL, (BX)(SI)
                ADDB AL, 3
                MOVB DH, AL ! dh = v[i]+3
                MOVB AL, BL
                MOVB DL, 2
                DIVB DL ! al = i/2
                MULB DH ! al *= v[i]+3
                MOVB (BX)(SI), AL
            JMP endif

            caso3:
                XOR AX, AX
                ! dim 2 * n + v[i] *
                MOVB AL, 4(BP)
                MOVB DL, 2
                MULB DL
                MOVB DL, (n)
                ADDB AL, DL
                MOVB DL, (BX)(SI)
                MULB DL
                MOVB (BX)(SI), AL
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
            MOVB AL, (BX)(SI) ! a = v[i]
            MOVB DL, 2
            XORB AH, AH
            DIVB DL
            MOVB DL, 0(SI)
            ADDB AL, DL
            XORB AH, AH
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
    v: .BYTE 4,9,7,3,9,8
    stampa: .ASCII "%d \0"
.SECT .BSS
    n: .SPACE 1
