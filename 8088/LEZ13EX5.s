_PRINTF = 127
_EXIT = 1

.SECT .TEXT
    MOV AX, vec2-vec1
    MOV BX, 2
    DIV BX
    MOVB CL, AL ! j = len(vec1)
    MOV SI, vec1
    MOV DI, vec2
    MOV BX, 0 ! i=0

    ciclo:
        MOV AX, (BX)(SI) ! AX = vec1[i]
        ADD AX, (BX)(DI) ! AX += vec2[i]
        PUSH SI ! push(&vec1[i])
        MOV SI, vec3
        MOV (BX)(SI), AX ! vec3[i] = vec1[i] + vec2[i]
        POP SI ! SI = &vec1[i]
        ADD BX, 2 ! i++
    LOOP ciclo ! for(j=len(vec1); j>0; j--)

    MOV AX, vec2-vec1
    MOV BX, 2
    DIV BX
    MOVB CL, AL ! j = len(vec1)
    MOV SI, vec3
    MOV BX, 0 ! i=0

    ciclo2:
        PUSH (BX)(SI)
        PUSH s
        PUSH _PRINTF
        SYS ! printf("%d ", vec3[i]);
        ADD BX, 2 ! i++
    LOOP ciclo2 ! for(j=len(vec3); j>0; j--)

    PUSH 0
    PUSH _EXIT
    SYS ! return 0

.SECT .DATA
    vec1: .WORD 1,2,3,4,5,6
    vec2: .WORD 6,5,4,3,2,1
    vec3: .WORD 0,0,0,0,0,0
    s: .ASCII "%d "

.SECT .BSS