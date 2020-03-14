PUBLIC fill_matrix
PUBLIC read_sizes

DataMatrix SEGMENT PARA COMMON 'Matrix'
    SIZE        DB 2h   DUP(?)
    MATRIX      DB 81h  DUP(?)
DataMatrix ENDS

DataInvites SEGMENT PARA PUBLIC 'Invites'
    INV_SIZE 'Enter 2 sizes using space: $'
    INV_FILL 'Enter matrix using spaces: $'
DataInvites ENDS

CodeM SEGMENT PARA PUBLIC 'Code'
    ASSUME CS:CodeM, DS:DataMatrix

read_sizes PROC FAR
    MOV CX, 2
    MOV SI, 0
    MOV AH, 01h
get_sizes:
    INT 21h
    CMP AL, ' '
    JE  get_sizes
    MOV SIZE[SI], AL
    INC S
    LOOP get_sizes
    ret
read_sizes ENDP
    
fill_matrix PROC FAR
    MOV AH, 01h
    MOV BX, SIZE[0]
    MOV SI, 0
    fill_rows:
        MOV CX, SIZE[1]
        fill_cols:
            INT 21h
            CMP AL, ' '
            JE fill_cols
            MOV MATRIX[SI], AL
            INC SI
            LOOP fill_cols
        DEC BX
        CMP BX, 0
        JZ fill_rows
    ret
fill_matrix ENDP
CodeM ENDS
