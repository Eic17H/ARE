! mette in una variabile cresc 1 se gli elementi sono ordinati in modo strettamente crescente, 0 altrimenti

.SECT .TEXT
start:
    MOV BX, vec
    MOV SI, 0
    MOV CX, vec_end-vec-1

    ciclo:
        MOVB AL, (BX)(SI) ! AL = BX[SI]
        CMPB AL, 1(BX)(SI) ! cmp(AL, BX[SI+1])
        JGE falso
        INC SI
    LOOP ciclo
    JMP vero
    JMP fine

    vero:
        MOV (cresc), 1
    JMP fine

    falso:
        MOV (cresc), 0
    JMP fine

    fine:
    end:

.SECT .DATA
    vec: .BYTE 1, 2, 3, 4, 1
    vec_end: .BYTE 0

.SECT .BSS
    cresc: .SPACE 1