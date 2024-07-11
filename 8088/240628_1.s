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

    ! input(m)
    PUSH _GETCHAR
    SYS
    SUBB AL, _NUMOFFSET
    MOVB (m), AL
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
            XOR DX, DX
            MOVB AL, (BX)(SI)
            MOVB DL, 2
            XORB AH, AH
            DIVB DL
            MOVB DH, AH ! dl = v1[i]%2
            MOVB AL, (m)
            MOVB DL, 2
            XORB AH, AH
            DIVB DL ! ah = m%2
            CMPB DH, AH
            JLE caso1 ! v1[i]%2 <= m%2

            XOR AX, AX
            MOVB AL, (BX)(DI)
            MOVB DL, (n)
            MULB DL
            MOVB DH, AL ! dh = v2[i]*n
            MOVB AL, (BX)(SI)
            MOVB DL, (m)
            MULB DL ! al = v1[i]*m
            CMPB DH, AL
            JGE caso2 ! v2[i]*n >= v1[i]*m

            JMP caso3

            caso1:
                XOR AX, AX
                MOVB AL, (BX)(SI)
                MOVB DL, (BX)(DI)
                MULB DL ! al = v1[i]*v2[i]
                MOVB DL, (m)
                ADDB DL, 1
                DIVB DL ! al /= m+1
                MOVB (BX)(SI), AL
            JMP endif

            caso2:
                XOR AX, AX
                MOVB AL, (BX)(DI)
                MOVB DL, (m)
                DIVB DL ! al = v2[i]/m
                MOVB DL, (BX)(SI)
                MULB DL ! al *= v1[i]
                MOVB (BX)(SI), AL
            JMP endif

            caso3:
                XOR AX, AX
                PUSH BX ! temp = i
                ! i = i%dim+1
                MOVB AL, BL ! al = i
                MOVB DL, 4(BP)
                DIVB DL ! ah = i%dim
                ADDB AH, 1
                MOVB BL, AH ! i = i%dim+1
                MOVB AL, (BX)(DI) ! al = v2[i]
                MOVB DL, 2
                ! prima di qualunque divisione, fai questi due: !!!!!!!!!!
                XORB AH, AH
                XORB DH, DH
                DIVB DL ! al /= 2
                ADDB AL, 1 ! al += 1
                POP BX ! i = temp
                MOVB (BX)(SI), AL ! v1[i%dim+1]/2+1
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
            XOR DX, DX
            MOVB AL, 0(SI) ! a = v1[0]
            MOVB DL, (m)
            MULB DL ! a *= m
            ADDB AL, (BX)(SI) ! a += v1[i]
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
    v1: .BYTE 2,9,5,4,3,2
    v2: .BYTE 4,3,7,8,5,8
    stampa: .ASCII "%d \0"
.SECT .BSS
    n: .SPACE 1
    m: .SPACE 1
