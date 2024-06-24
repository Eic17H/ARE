! preso un numero in input, ne stampa il quadrato usando due subroutine
_EXIT = 1
_GETCHAR = 117
_PRINTF = 127

.SECT .TEXT
    main:
        ! input e output
        PUSH input
        PUSH _PRINTF
        SYS
        PUSH _GETCHAR
        SYS
        SUBB AL, 0x30
        MOVB (a), AL
        ADD SP, 6
        
        ! chiamata con un parametro
        PUSH (a)
        CALL square
        ADD SP, 2
        MOVB (a), AL

        ! chiamata con un parametro
        PUSH (a)
        CALL print
        ADD SP, 2

        ! uscita
        PUSH 0
        PUSH _EXIT
        SYS

    square:
        PUSH BP
        MOV BP, SP
        ! si mette il parametro in AL e lo si moltiplica
        MOVB AL, 4(BP)
        MULB 4(BP)
        POP BP
        RET
    
    print:
        PUSH BP
        MOV BP, SP
        ! si stampa il parametro con formattazione: 3 parametri
        PUSH 4(BP)
        PUSH output
        PUSH _PRINTF
        SYS
        ADD SP, 6
        POP BP
        RET

.SECT .DATA
    input: .ASCII "Inserire numero: \0"
    output: .ASCII "Quadrato: %d\0"

.SECT .BSS
    a: .SPACE 1
