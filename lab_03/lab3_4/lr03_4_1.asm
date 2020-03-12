PUBLIC X
EXTRN exit: far

SSTK SEGMENT para STACK 'STACK'
	db 100 dup(0)
SSTK ENDS

SD1 SEGMENT para public 'DATA' ; сегмент с данными в 1 байт и меткой Х
	X db 'X'
SD1 ENDS

SC1 SEGMENT para public 'CODE'
	assume CS:SC1, DS:SD1
main:
	jmp exit
SC1 ENDS
END main
