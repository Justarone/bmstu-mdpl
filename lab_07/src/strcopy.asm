section .text

global strcopy

strcopy:
    mov rcx, rdx

    cmp rdi, rsi
    jne not_equal
    jmp quit

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
    dec rsi
    dec rdi
    std

simple_copy:
    rep movsb
    cld
quit:
    ret
