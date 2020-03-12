EXTRN X: byte
PUBLIC exit

SD2 SEGMENT para 'DATA' ; по умолчанию private
	Y db 'Y'
SD2 ENDS

SC2 SEGMENT para public 'CODE'
	assume CS:SC2, DS:SD2
exit:
	mov ax, seg X ; помещаем в es сегмент метки Х
	mov es, ax
	mov bh, es:X ; сегмент:смещение - получаем значение под Х

	mov ax, SD2
	mov ds, ax

; меняем местами значения под метками X, Y
	xchg ah, Y
	xchg ah, ES:X
	xchg ah, Y

	mov ah, 2 ; команда вывода на экран из dl
	mov dl, Y ; помещаем в dl новое значение Y
	int 21h
	
	mov ax, 4c00h ;завершение программы
	int 21h
SC2 ENDS
END
