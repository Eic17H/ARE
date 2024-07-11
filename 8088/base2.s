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

    ! fun(v1, v2, dim)
    PUSH v1
    PUSH v2
    PUSH v2-v1
    CALL fun

    !print(v1, dim)
    PUSH v1
    PUSH v2-v1
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
        MOV SI, 8(BP) ! primo parametro (v1)
        MOV DI, 6(BP) ! secondo parametro (v2)
        MOV CX, 4(BP) ! terzo parametro (dim)

        for:
            XOR AX, AX
            ! ...
            CMPB AL, DL
            JE caso1

            XOR AX, AX
            ! ...
            CMPB DL, AL
            JE caso2

            JMP caso3

            caso1:
                XOR AX, AX
                ! ...
                MOVB (BX)(SI), AL
            JMP endif

            caso2:
                XOR AX, AX
                PUSH BX ! temp = i
                ! ...
                POP BX ! i = temp
                MOVB (BX)(SI), AL
            JMP endif

            caso3:
                XOR AX, AX
                ! ...
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
            ! ...
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
    v1: .BYTE
    v2: .BYTE
    stampa: .ASCII "%d \0"
.SECT .BSS
    n: .SPACE 1
