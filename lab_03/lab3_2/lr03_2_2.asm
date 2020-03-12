SD1 SEGMENT para common 'DATA' ; будет участвовать в наложении
	C1 LABEL byte ; метка, указывающая на начало сегмента
	ORG 1h
	C2 LABEL byte ; метка, смещенная на 1 байт от начала сегмента (байты слова хранятся в обратном
    ;порядке, поэтому эта метка указывает на 34)
SD1 ENDS

CSEG SEGMENT para 'CODE'
	ASSUME CS:CSEG, DS:SD1
main:
	mov ax, SD1
	mov ds, ax
	mov ah, 2 ; команда для прерывания dos: вывод на дисплей символа из dl
	mov dl, C1 ; помещение в dl c1
	int 21h ; вывод С1
	mov dl, C2
	int 21h ; вывод С
	mov ax, 4c00h ; код команды завершения программы для прерывания dos
	int 21h
CSEG ENDS
END main
