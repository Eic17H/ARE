! controlla se due vettori sono uguali

_EXIT = 1
_GETCHAR = 117
_PRINTF = 127

.SECT .TEXT
    MOV CX, vec2-vec1
    MOV SI, vec2-vec1
    MOV BX, vec1

    MOVB (uguali), 1

    while:
        MOVB AL, (BX)
        MOVB AH, (BX)(SI)
        CMPB AL, AH
        JNE falso
        ADD BX, 1
    LOOP while
    JMP fine

    falso:
        MOVB (uguali), 0

    fine:

        PUSH (uguali)
        PUSH s
        PUSH _PRINTF
    SYS

    PUSH 1
    PUSH _EXIT
    SYS

.SECT .DATA
    vec1: .BYTE 1, 2, 3, 4, 2
    vec2: .BYTE 1, 2, 3, 4, 5
    s: .ASCII "Uguali: %d "

.SECT .BSS
    uguali: .SPACE 1
