! mette in BX la somma dei numeri da 1 a CX
_PRINTF = 127
_GETCHAR = 117
_EXIT = 1
_NOOFFSET = 0x30
.SECT .TEXT
	start:
		PUSH _GETCHAR
		SYS
		SUB AX, _NOOFFSET
		MOV CX, AX
		MOV BX, 0
	sium:
		ADD BX, CX
	LOOP sium
	PUSH BX
	PUSH s
	PUSH _PRINTF
	SYS
	PUSH 0
	PUSH _EXIT
	SYS
.SECT .DATA
	s: .ASCII "Ris: %d"
.SECT .BSS