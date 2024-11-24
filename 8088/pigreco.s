_PRINTF = 127
_GETCHAR = 117
_EXIT = 1
_NUMOFFSET = 0x30

.SECT .TEXT
    MOVB (i), 0
    MOVB (j), 0
    MOVB (c), 0

    loopi:
        loopj:
            MOVB AL, (i)
            MULB AL
            MOVB DL, AL
            MOVB AL, (j)
            MULB AL
            ADDB DL, AL ! dl = i*i+j*j
            MOVB AL, (n)
            MULB AL ! al = x*x
            CMPB DL, AL
                JAE falso
                ADDB (c), 1 ! if(i*i+j*j<x*x) c++
                falso:
        ADDB (j), 1
        MOVB AL, (j)
        MOVB DL, (n)
        CMPB AL, DL
        JL loopj
    MOVB (j), 0
    ADDB (i), 1
    MOVB AL, (i)
    MOVB DL, (n)
    CMPB AL, DL
    JL loopi

    MOVB AL, (n)
    MULB AL
    MOVB DL, 4
    DIVB DL
    MOVB DL, AL ! dl = n*n/4
    MOVB AL, (c)
    XORB AH, AH
    MOVB DH, 10
    MOVB CH, 0
    MOVB CL, (n)

    ! prima cifra e poi punto
    DIVB DL
    MOVB (r), AH
    MOVB AH, 0
    PUSH AX
    PUSH print
    PUSH _PRINTF
    SYS
    MOVB AL, (r)
    XORB AH, AH
    MULB DH
    PUSH sep
    PUSH _PRINTF
    SYS

    loops:
        DIVB DL
        MOVB (r), AH
        MOVB AH, 0
        PUSH AX
        PUSH print
        PUSH _PRINTF
        SYS
        MOVB AL, (r)
        XORB AH, AH
        MULB DH
    LOOP loops

    PUSH 0
    PUSH _EXIT
    SYS

.SECT .DATA
    n: .BYTE 15
    b: .BYTE 10
    print: .ASCII "%d\0"
    sep: .ASCII ".\0"

.SECT .BSS
    i: .SPACE 1
    j: .SPACE 1
    c: .SPACE 1
    r: .SPACE 1
