PUBLIC print

Data SEGMENT PARA COMMON 'Data'
    LB LABEL word
Data ENDS

Code2 SEGMENT PARA PUBLIC 'Code2'
    assume CS:Code2, DS:Data
print proc far
    mov ax, Data
    mov ds, ax
    mov ah, 01h
    ;int 21h
    ;mov LB, al
    mov cx, [LB]
    mov bx, 2

read_char:
    int 21h
    mov [bx], al
    inc bx
    cmp al, 13
    loopne read_char

    ret
print endp
Code2 ENDS
END
