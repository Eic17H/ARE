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
            MOVB AL, (BX)(SI) ! a = v[i]
            MOVB DL, (n) ! d = n
            DIVB DL ! a = v[i]/n
            MOVB DL, BL
            ADDB DL, 2 ! d = i+2
            CMPB AL, DL
            JE caso1 ! if(v[i]/n == i+2) GOTO caso1

            XOR AX, AX
            MOVB AL, (BX)(SI) ! a = v[i]
            MOVB DL, (BX)(SI) ! d = v[i]
            MULB DL ! a = a*d
            MOVB DL, AL ! d = v[i]*v[i]
            XOR AX, AX
            MOVB AL, 4(BP) ! al = dim
            MOVB AH, (n) ! ah = n
            MULB AH ! ax = al*ah = n*dim
            CMPB DL, AL
            JGE caso2 ! if(v[i]*v[i] >= n*dim) GOTO caso2

            JMP caso3

            caso1:
                XOR AX, AX
                MOVB AL, (BX)(SI)
                MOVB DL, (n)
                MULB DL ! a = v[i]*n
                MOVB DL, BL
                ADDB DL, 1 ! d = i+1
                DIVB DL ! a = a/n
                MOVB (BX)(SI), AL ! v[i] = v[i]*n/(i+1)
            JMP endif

            caso2:
                XOR AX, AX
                XOR DX, DX
                MOVB AL, (BX)(SI)
                ADDB AL, 4 ! a = v[i] + 4
                MOVB DL, (n)
                DIVB DL ! a /= n
                MOVB DL, 4(BP)
                MULB DL ! a *= dim
                MOVB (BX)(SI), AL
            JMP endif

            caso3:
                XOR AX, AX
                PUSH BX ! temp = i
                MOVB AL, 4(BP) ! a = dim
                MOVB DL, BL
                DIVB DL ! a /= i
                MOVB BH, 0
                MOVB BL, AL ! b = dim/i
                MOVB AL, (BX)(SI) ! a = v[b]
                MOVB DL, (n)
                ADDB DL, 2 ! d = n+2
                MULB DL ! a *= d
                POP BX ! i = temp
                MOVB (BX)(SI), AL ! v[i] = v[dim/i]*(n+2)
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
            MULB DL ! a *= 2
            MOVB DL, (n)
            DIVB DL ! a /= n
            ! printf("%d \0", al)
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
    v: .BYTE 5,9,6,4,8,2
    stampa: .ASCII "%d \0"
.SECT .BSS
    n: .SPACE 1
