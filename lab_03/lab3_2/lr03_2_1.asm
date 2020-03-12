STK SEGMENT para STACK 'STACK'
	db 100 dup(0)
STK ENDS

SD1 SEGMENT para common 'DATA' ; common - наложение сегментов с одним именем (начинаются с одного
; и того же адреса)
	W dw 3444h ; выделение 2 байт и помещение значений 34h 44h
SD1 ENDS
END
