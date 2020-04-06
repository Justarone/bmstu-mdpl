PUBLIC rev_number

EXTRN MAIN_NUMBER : WORD

CodeSeg SEGMENT PARA PUBLIC 'Code'

rev_number PROC NEAR
    NOT MAIN_NUMBER
    INC MAIN_NUMBER
    ret
rev_number ENDP

CodeSeg ENDS
END
