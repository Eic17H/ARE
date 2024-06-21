! calcola la somma degli elementi di un vettore vec memorizzato in memoria principale

.SECT .TEXT
    MOV BX, vec
    MOV SI, 0
    MOV CX, vec_end-vec

    ciclo:
        ADDB AL, (BX)(SI)
        ADD SI, 1
    LOOP ciclo

.SECT .DATA
    vec: .BYTE 1, 2, 3, 4, 5
    vec_end: .BYTE 0

.SECT .BSS