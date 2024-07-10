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
            MOVB AL, (SI)(BX) ! a = v[i]
            MOVB DL, (n) ! d = n
            DIVB DL ! a = v[i]/n
            MOVB DL, BL
            ADDB DL, 2 ! d = i+2
            CMPB AL, DL
            JE caso1 ! if(v[i]/n == i+2) GOTO caso1

            XOR AX, AX
            MOVB AL, (SI)(BX) ! a = v[i]
            MULB AL ! a = a*a
            MOVB DL, AL ! d = v[i]*v[i]
            XOR AX, AX
            MOVB AL, 4(BP) ! al = dim
            MOVB AH, (n) ! ah = n
            MULB AH ! ax = al*ah = n*dim
            CMPB DL, AL
            JGE caso2 ! if(v[i]*v[i] >= n*dim) GOTO caso2

            JMP caso3

            caso1:
            JMP endif

            caso2:
            JMP endif

            caso3:
            JMP endif
        
        endif:
            INC BX
            LOOP for

        POP BP
        RET

.SECT .DATA
    v: .BYTE 5,9,6,4,8,2
    stampa: .ASCII "%d \0"

.SECT .BSS
    n: .SPACE 1
