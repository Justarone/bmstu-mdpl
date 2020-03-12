SD1 SEGMENT para public 'DATA'
	S1 db 'Y' ; выделение байта памяти
	db 65535 - 2 dup (0) ; выделение 65533 байт памяти с инициализацией нулями
SD1 ENDS

; аналогично sd1
SD2 SEGMENT para public 'DATA'
	S2 db 'E'
	db 65535 - 2 dup (0)
SD2 ENDS

; аналогично sd1
SD3 SEGMENT para public 'DATA'
	S3 db 'S'
	db 65535 - 2 dup (0)
SD3 ENDS

CSEG SEGMENT para public 'CODE'
	assume CS:CSEG, DS:SD1
; метка в коде (можно прыгнуть на нее с помощью call и jmp)
output:
	mov ah, 2 ; код команды для прерывания dos (вывод символа из dl на консоль)
	int 21h ; прерывание 
	mov dl, 13 ; код символа возврата каретки
	int 21h
	mov dl, 10 ; код символа перехода на новую строку (все вместе - enter)
	int 21h
	ret
main:
	mov ax, SD1
	mov ds, ax
	mov dl, S1 ; перенос s1 в dl и печать
	call output
assume DS:SD2
	mov ax, SD2 
	mov ds, ax
	mov dl, S2  ; перенос s2 в dl и печать  
	call output
assume DS:SD3
	mov ax, SD3 
	mov ds, ax
	mov dl, S3 ; перенос s3 в dl и печать
	call output
; НАБЛЮДАЯ ЗА АДРЕСАМИ ЗАМЕЧАЕМ, ЧТО ОНИ РАСПОЛОЖЕНЫ В ПАМЯТИ ПОСЛЕДОВАТЕЛЬНО
; сегмент кода начинается в дебагере с main (поэтому не 0000, потому что
; 0000 у метки output)
	mov ax, 4c00h
	int 21h
CSEG ENDS
END main
