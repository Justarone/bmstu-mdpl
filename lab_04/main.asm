EXTRN read_sizes: FAR
EXTRN fill_matrix: FAR

DataMatrix SEGMENT PARA COMMON 'Matrix'
    C1      LABEL   BYTE
    ORG     2h
    C2      LABEL   BYTE
DataMatrix ENDS

StkSeg SEGMENT PARA STACK 'Stack'
    DB      100h    DUP(?)
StkSeg ENDS

CodeMain SEGMENT PARA PUBLIC 'Code'
    ASSUME DS:DataMatrix, CS:CodeMain
start:
    call read_sizes
    call fill_matrix
    mov AH, 4Ch
    INT 21h
CodeMain ENDS
END start

