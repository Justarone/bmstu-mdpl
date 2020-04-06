EXTRN read_input : NEAR
EXTRN read16s    : NEAR

EXTRN print2u    : NEAR
EXTRN print8s    : NEAR


StkSeg SEGMENT PARA STACK 'Stack'
    DB 200h DUP(?)
StkSeg ENDS


DataSeg SEGMENT PARA PUBLIC 'Data'
    MENU_TEXT DB 10, 13, 10, 13, "Choose action:", 10, 13
              DB "0. Exit the program;", 10, 13
              DB "1. Enter number (16 signed);", 10, 13
              DB "2. Print 2 unsigned;", 10, 13
              DB "3. Print 8 signed;", 10, 13
              DB "Select action: $"

    FUNC_ARR  DW exit_func, read16s, print2u, print8s
DataSeg ENDS

CodeSeg SEGMENT PARA PUBLIC 'Code'
    ASSUME    SS: StkSeg, DS: DataSeg, CS: CodeSeg

print_menu PROC NEAR
    MOV AH, 09h
    MOV DX, OFFSET MENU_TEXT
    INT 21h
    ret
print_menu ENDP

exit_func PROC NEAR
    MOV AH, 04Ch
    INT 21h
exit_func ENDP

start:
    MOV AX, DataSeg
    MOV DS, AX

main_loop:
    CALL print_menu
    CALL read_input
    CALL FUNC_ARR[SI]
    JMP  main_loop 

CodeSeg ENDS
END start
