_EXIT = 1
_GETCHAR = 117
_PRINTF = 127

.SECT .TEXT
    main:
        ! chiamata a funzione con due parametri
            PUSH 1
            PUSH 2
        CALL func
        ADD SP, 4
        ! segnamo come liberi i due slot in cima

        ! chiamata a funzione con un parametro
            PUSH AX
        CALL print
        ADD SP, 2
        ! segnamo come libero lo slot in cima

        PUSH 1
        PUSH _EXIT
        SYS


    func:
        ! segnamo sullo stack il vecchio BP
        PUSH BP
        ! mettiamo il nuovo BP
        MOV BP, SP
        ! sullo stack c'e' anche l'indirizzo di ritorno, quindi i parametri sono dal terzo slot in poi
        MOV AX, 4(BP)
        ADD AX, 6(BP)
        ! rimettiamo il vecchio BP
        POP BP
        RET

    print:
        PUSH BP
        MOV BP, SP
        PUSH 4(BP)
        PUSH s
        PUSH _PRINTF
        SYS
        ADD SP, 6
        ! segnamo come liberi i tre parametri di printf
        POP BP
        RET

.SECT .DATA
    s: .ASCII "%d "

.SECT .BSS
