PUBLIC fill_matrix
PUBLIC read_sizes
PUBLIC show_matrix

DataMatrix SEGMENT PARA COMMON 'Matrix'
    MATRIX_SIZE DB 2h   DUP(?)
    MATRIX      DB 81   DUP(?)
    COL_FLAGS   DB 9h   DUP(0)
DataMatrix ENDS

CodeM SEGMENT PARA PUBLIC 'Code'
    ASSUME CS:CodeM, DS:DataMatrix

print_n PROC NEAR
    MOV AH, 02h
    MOV DL, 13
    INT 21h
    MOV DL, 10
    INT 21h
    ret
print_n ENDP

print_space PROC NEAR
    MOV AH, 02h
    MOV DL, ' '
    INT 21h
    ret
print_space ENDP


read_digit PROC NEAR
    MOV AH, 01h
    read_sym:
    INT 21h
    ; ignore everything but digits
    CMP AL, '0'
    JL  read_sym
    SUB AL, '0'
    CMP AL, 9
    JG  read_sym
    ret
read_digit ENDP


read_sizes PROC FAR
    MOV CX, 2
    MOV SI, 0
    MOV BX, 0

    get_sizes:
        call read_digit
        CMP AL, 0
        JNE good_size
            MOV BX, 1
            JMP to_ret
        good_size:
        MOV MATRIX_SIZE[SI], AL
        INC SI
        call print_space

        LOOP get_sizes

    call print_n
    to_ret:
    call print_n
    ret
read_sizes ENDP
    
fill_matrix PROC FAR
    MOV AH, 01h
    MOV BL, MATRIX_SIZE[0]
    MOV SI, 0 ; index for array, which contains matrix
    MOV CX, 0

    fill_rows:
        MOV CL, MATRIX_SIZE[1]
        fill_cols:

            call read_digit

            MOV MATRIX[SI], AL
            INC SI
            call print_space

            LOOP fill_cols

        DEC BX
        CMP BX, 0
        call print_n
        JNE fill_rows

    ret
fill_matrix ENDP

show_matrix PROC FAR
    CMP MATRIX_SIZE[0], 0
    JE  end_show
    CMP MATRIX_SIZE[1], 0
    JE  end_show

    MOV AH, 02h
    MOV BL, MATRIX_SIZE[0]
    MOV SI, 0
    MOV CX, 0

    call print_n
    call print_n

    show_rows:
        MOV CL, MATRIX_SIZE[1]
        show_cols:
            MOV DL, MATRIX[SI]
            ADD DL, '0'
            INT 21h
            call print_space
            INC SI
            LOOP show_cols
        DEC BL
        CMP BL, 0
        call print_n
        JNE show_rows
    end_show:
    ret
show_matrix ENDP

check_cols PROC FAR
    MOV BX, 0 ; current column
    MOV DX, 0
    MOV CX, 0
    MOV DL, MATRIX_SIZE[1]

    run_cols:
        MOV SI, BX ; index of element of matrix

        MOV AX, 0 ; column sum
        MOV CL, MATRIX_SIZE[0] ; cycle for elems in col

        run_rows:
            ADD AL, MATRIX[SI] ; count sum
            ADD SI, DX
            LOOP run_rows
        
        MOV CL, 3 
        DIV CL
        CMP AH, 0
        JNE not_mod_3
            MOV COL_FLAGS[BX], 1h ; true
        not_mod_3:
        INC BL
        CMP BL, MATRIX_SIZE[1]
        JLE run_cols
    ret
check_cols ENDP

remove_cols PROC FAR
    MOV DX, 0
    MOV DL, MATRIX_SIZE[1]
    run_columns:
        SUB DL, 1
        MOV DI, DX
        MOV AL, COL_FLAGS[DI]
        CMP AL, 0
        JE next_col
            call remove_col
        next_col:
        CMP DL, 0
        JNE run_columns
    ret
remove_cols ENDP

remove_col PROC NEAR
    MOV SI, 0
    MOV DI, 0
    MOV BX, 0
    go_rows:
        MOV CX, 0
        go_cols:
            CMP CX, DX
            JNE no_col
                INC CL
                INC DI
                CMP CL, MATRIX_SIZE[1]
                JE  rows_cycle
            no_col:
            MOV AL, MATRIX[DI]
            MOV MATRIX[SI], AL
            INC SI
            INC DI
            INC CL
            CMP CL, MATRIX_SIZE[1]
            JL  go_cols
        rows_cycle:
        INC BL
        CMP BL, MATRIX_SIZE[0]
        JB  go_rows
    SUB MATRIX_SIZE[1], 1
    ret
remove_col ENDP
        

CodeM ENDS
END
