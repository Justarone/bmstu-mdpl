section .text

global strcopy

strcopy:
    mov rcx, rdx

    cmp rdi, rsi
    jne not_equal
    ret

not_equal:
    cmp rdi, rsi
    jl simple_copy

    mov rax, rdi
    sub rax, rsi

    cmp rax, rcx
    jge simple_copy

complicated_copy:
    add rdi, rcx
    add rsi, rcx
    copying:
        movsb
        sub rsi, 2
        sub rdi, 2
        loop copying
    
simple_copy:
    rep movsb
    ret
