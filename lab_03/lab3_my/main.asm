EXTRN print: far

Data SEGMENT PARA COMMON 'Data'
    str_size dw 10h
    db 10h dup(0)
    ;db 'Hello world'
Data ENDS

Stk SEGMENT PARA STACK 'Stack'
    db 100h DUP(0)
Stk ENDS

Code1 SEGMENT PARA PUBLIC 'Code' 
    assume CS:Code1, DS:Data
main:
    mov ax, Data
    mov ds, ax
    call print
    ;mov dl, DS:3
    mov dl, DS:5
    mov ah, 2h
    int 21h
    mov ah, 4Ch
    int 21h
Code1 ENDS
END main
