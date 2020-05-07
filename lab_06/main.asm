.model tiny

CODE SEGMENT
    ORG 100h

main:
    JMP init
    old_9h DD ?
    IS_INSTALLED DB 17
    TEXT DB 'Here could be your advertisment...   $'
    REGION_START DW 270
    TEXT_SIZE DB 37
    LINE_SIZE DB 20
    OUTPUT_PROP DB 10h
    CUR_IND DB 0
    SYMB DB '0'
    SYMB_PROP DB 12h
    SPACE DW 6

my_9h PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    PUSH ES
    PUSH DS
    PUSHF

    PUSH CS
    POP DS

    CALL CS:old_9h

    MOV AX, 0040h
    MOV DS, AX
        
    MOV DI, DS:001Ah
    CMP DI, DS:001Ch
    JE end_label

    MOV AX, [DI]
    MOV CS:SYMB, AL

    MOV AX, 0b800h
    MOV ES, AX
    MOV DI, CS:REGION_START

    XOR CX, CX
    MOV CL, CS:LINE_SIZE

    XOR AX, AX
    MOV AL, CS:CUR_IND
    MOV BX, AX
    INC AL
    MOV CS:CUR_IND, AL
    CMP AL, CS:TEXT_SIZE
    JNE print_line
    MOV CS:CUR_IND, 0

    print_line:
        MOV AL, CS:TEXT[BX]
        MOV AH, CS:OUTPUT_PROP
        STOSW
        INC BL
        CMP BL, CS:TEXT_SIZE
        JNE not_upper_bound
        MOV BL, 0
        not_upper_bound:
        LOOP print_line

    ADD DI, CS:SPACE
    MOV AL, CS:SYMB
    MOV AH, CS:SYMB_PROP
    STOSW

    end_label:
    POP DS
    POP ES

    POP DX
    POP CX
    POP BX
    POP AX

    IRET

my_9h ENDP

init:
    MOV AX, 3509H
    INT 21H

    CMP ES:IS_INSTALLED, 17
    JE uninstall

    MOV WORD PTR old_9h, BX
    MOV WORD PTR old_9h + 2, ES

    MOV AX, 2509h
    MOV AH, 25h
    MOV AL, 09h
    MOV DX, OFFSET my_9h
    INT 21h

    MOV DX, OFFSET inst_msg
    MOV AH, 9
    INT 21H

    MOV DX, OFFSET init
    INT 27h

uninstall:
    PUSH ES
    PUSH DS

    MOV DX, WORD PTR ES:old_9h
    MOV DS, WORD PTR ES:old_9h + 2
    MOV AX, 2509H
    INT 21H

    POP DS
    POP ES

    MOV AH, 49H
    INT 21H

    MOV DX, OFFSET uninst_msg
    MOV AH, 9H
    INT 21H

    MOV AX, 4c00h
    INT 21h

    inst_msg   DB 'Advertisment installed!$'
    uninst_msg DB 'advertisment deleted!$'

CODE ENDS
END main
