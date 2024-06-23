! calcola il fattoriale del numero immesso
_EXIT = 1
_GETCHAR = 117
_PRINTF = 127

.SECT .TEXT
    start: 
    ! input(n)
            PUSH _GETCHAR
        SYS
        SUBB AL, 0x30
    MOVB (n), AL
    
    MOVB DL, 1
    MOVB AL, 1
    MOV CX, (n)

    while:
    MULB DL
    ADDB DL, 1
    LOOP while
    MOV (n), AX

            PUSH (n)
            PUSH s
        PUSH _PRINTF
    SYS

            PUSH 0
        PUSH _EXIT
    SYS

.SECT .DATA
    s: .ASCII "%d "

.SECT .BSS
    n: .SPACE 2
