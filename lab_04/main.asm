EXTRN read_sizes: FAR
EXTRN fill_matrix: FAR
EXTRN show_matrix: FAR
EXTRN check_cols: FAR
EXTRN remove_cols: FAR

DataMatrix SEGMENT PARA COMMON 'Matrix'
DataMatrix ENDS

CodeMain SEGMENT PARA PUBLIC 'Code'
    ASSUME DS:DataMatrix, CS:CodeMain
start:
    MOV AX, DataMatrix
    MOV DS, AX
    call read_sizes
    CMP BX, 0
    JE process_matrix
        JMP end_program
    process_matrix:
    call fill_matrix
    call check_cols
    call remove_cols
    call show_matrix
    end_program:
    mov AH, 4Ch
    INT 21h
CodeMain ENDS
END start
