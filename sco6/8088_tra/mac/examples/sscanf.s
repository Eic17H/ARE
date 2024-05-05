! This program is meant to show the SSCANF
! system subroutine.
! The format string claims that a byte, an octal,
! a four byte string, a decimal and a string
! can be expected. In the read string all those
! elements can be found.
! The arguments are pushed in reverse order as usual.
! before the call is made.
! Note that the end of line is not processed in the
! string request %s.
! Note also that the request for the charer string is
! %4c, which can take the four characters and does not 
! need a place for the closing ascii-0

#include "../syscalnr.h"		!  1
.SECT .TEXT				!  2
	PUSH octer			!  3
	PUSH fmt			!  4
	PUSH str			!  5
	PUSH _SSCANF			!  6
	SYS				!  7
	ADD SP,8			!  8
.SECT .DATA				!  9
fmt: .ASCIZ "%o"			! 10
str: .ASCIZ "0123"			! 11
formatter: .ASCIZ "%c %o %4c %d %s"	! 12
readstr: .ASCIZ "A 01001 ball 997 cq\n"	! 13
.ALIGN 2				! 14
.SECT .BSS				! 15
lstr: .SPACE 4				! 18
deccer: .SPACE 2			! 17
charer: .SPACE 4			! 16
octer: .SPACE 2				! 19
byter: .SPACE 1				! 20
.SECT .TEXT				! 21
	PUSH lstr			! 24
	PUSH deccer			! 23
	PUSH charer			! 22
	PUSH octer			! 25
	PUSH byter			! 26
	PUSH formatter			! 27
	PUSH readstr			! 28
	PUSH _SSCANF			! 29
	SYS				! 30
	ADD SP,16			! 31
	PUSH 0				! 32
	PUSH _EXIT			! 33
	SYS				! 34
