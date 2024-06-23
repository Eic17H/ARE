_EXIT = 1 
_GETCHAR = 117 
_PRINTF = 127 
 
.SECT.TEXT 
main:!read n 
 PUSH _GETCHAR 
 SYS 
 SUBB AL, 0x30 
 MOVB (n), AL 
 PUSH _GETCHAR 
 SYS 
 
 !read m 
 PUSH _GETCHAR 
 SYS 
 SUBB AL, 0x30 
 MOVB (m), AL 
 PUSH _GETCHAR 
 SYS 
 
 !the function 
 PUSH v1 
 PUSH v2 
 PUSH s-v2 
 CALL function 
 
 !print msg1 
 PUSH msg1 
 PUSH _PRINTF 
 SYS 
 
 !dump v2 array 
 PUSH v2 
 PUSH s-v2 
 CALL dump 
 
 !print msg 2 
 PUSH msg2 
 PUSH _PRINTF 
 SYS 
 
 !process v2 and print 
 PUSH v2 
 PUSH s-v2 
 CALL print 
 
 PUSH 0 
 PUSH _EXIT 
 SYS 
 
function: 
 PUSH BP 
 MOV BP, SP 
 MOV BX, 0 
 MOV SI, 8(BP) !v1 
 MOV DI, 6(BP) !v2 
 MOV CX, 4(BP) !cnt 
 
for: 
 XOR AX, AX 
 !XOR DX, DX 
 !cond 1 
 
 CMPB AH, AL 
 J if1 !branch if1 
 
 XOR AX, AX 
 !cond 2 
 
 CMPB AH, AL 
 J if2 !branch if2 
 
else: 
 !both false 
 MOVB (BX)(), 
 JMP endif 
 
if1: 
 XOR AX, AX 
 !XOR DX, DX 
 
 MOVB (BX)(), 
 JMP endif 
if2: 
 XOR AX, AX 
 XOR DX, DX 
 
 MOVB (BX)(), 
endif: 
 INC BX 
 LOOP for 
 MOV SP, BP 
 POP BP 
 RET 
 
!the custom function of the exercise 
print: 
 PUSH BP 
 MOV BP, SP 
 MOV BX, 0 
 MOV SI, 6(BP) !v2 
 MOV CX, 4(BP) !cnt 
 
printloop: 
 XOR AX, AX 
 !code here 
 
 PUSH AX 
 PUSH s 
 PUSH _PRINTF 
 SYS 
 
 INC BX 
 LOOP printloop 
 
 MOV SP, BP 
 POP BP 
 RET 
 
!dump an array 
dump: 
 PUSH BP 
 MOV BP, SP 
 MOV BX, 0 
 MOV SI, 6(BP) !array 
 MOV CX, 4(BP) !cnt 
 
dumploop: 
 XOR AX, AX 
 MOVB AL, (BX)(SI) 
 !push is 16 bit wide 
 PUSH AX 
 PUSH s 
 PUSH _PRINTF 
 SYS 
 
 INC BX 
 LOOP dumploop 
 
 MOV SP, BP 
 POP BP 
 RET 
 
.SECT.DATA 
v1: .BYTE !your vector here 
v2: .BYTE !your vector here 
s: .ASCII "%d \0" 
msg1: .ASCII "V2: \0" 
msg2: .ASCII "\nV2[i] + >..\0" 
 
.SECT.BSS 
n: .SPACE 1 
m: .SPACE 1