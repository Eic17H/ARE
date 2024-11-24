_PRINTF = 127
_GETCHAR = 117
_EXIT = 1
_NUMOFFSET = 0x30

.SECT .TEXT
    MOVB (i), 0
    MOVB (j), 0
    MOVB (c), 0

    MOVB DL, 7
    MOVB AL, 22
    XORB AH, AH
    MOVB DH, 10
    MOVB CH, 0
    MOVB CL, (n)

    loops:
        DIVB DL
        MOVB (r), AH
        MOVB AH, 0
        PUSH AX
        PUSH print
        PUSH _PRINTF
        SYS
        MOVB AL, CL
        MOVB AH, (n)
        CMPB AL, AH
        JNE nopunto
        PUSH sep
        PUSH _PRINTF
        SYS
        nopunto:
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
