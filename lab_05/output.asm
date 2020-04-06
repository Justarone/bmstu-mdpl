PUBLIC print2u
PUBLIC print8s
PUBLIC print_n

EXTRN MAIN_NUMBER : WORD

EXTRN rev_number  : NEAR

DataSeg SEGMENT PARA PUBLIC 'Data'
    OUT_BUFFER  DB 18 DUP('$')
    MASK8       DW 07000h
    MASK2       DW 08000h
DataSeg ENDS

CodeSeg SEGMENT PARA PUBLIC 'Code'
ASSUME DS: DataSeg

print_n PROC NEAR
    PUSH AX
    MOV AL, DL
    
    MOV AH, 02h
    MOV DL, 10
    INT 21h
    MOV DL, 13
    INT 21h

    MOV DL, AL
    POP AX
    ret
print_n ENDP

print2u PROC NEAR
    call print_n
    call print_n
    XOR SI, SI
    XOR CX, CX
    MOV DX, 16

    MOV BX, MAIN_NUMBER

    get_digit2u:
        MOV AX, MASK2
        AND AX, BX
        SHL BX, 1

        MOV CL, 7
        SHR AH, CL
        ADD AH, '0'
        MOV OUT_BUFFER[SI], AH
        INC SI

        DEC DX
        JNZ get_digit2u

    MOV OUT_BUFFER[SI], '$'
    MOV AH, 09h
    MOV DX, OFFSET OUT_BUFFER
    INT 21h
    ret
print2u ENDP

print8s PROC NEAR
    call print_n
    call print_n

    XOR SI, SI
    MOV BX, MAIN_NUMBER
    MOV DX, 5

    TEST BX, MASK2
    JZ get_digit8s

    MOV DL, '-'
    MOV AH, 02h
    INT 21h
    DEC BX
    NOT BX
    MOV DX, 5

    get_digit8s:
        MOV AX, MASK8
        AND AX, BX
        MOV CL, 3
        SHL BX, CL
        MOV CL, 4
        SHR AH, CL
        ADD AH, '0'
        MOV OUT_BUFFER[SI], AH
        INC SI

        DEC DX
        JNZ get_digit8s


    MOV OUT_BUFFER[SI], '$'
    MOV AH, 09h
    MOV DX, OFFSET OUT_BUFFER
    INT 21h
    ret
print8s ENDP

CodeSeg ENDS
END
