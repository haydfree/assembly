section .bss
    a resd 1
    b resd 1
    op resb 1
    res resd 1

section .text
    global _start

_start:
    ; read() a
    mov rax, 0
    mov rdi, 0
    mov rsi, a
    mov rdx, 4
    syscall

    ; read() b
    mov rax, 0
    mov rdi, 0
    mov rsi, b
    mov rdx, 4
    syscall

    ; read() op
    mov rax, 0
    mov rdi, 0
    mov rsi, op
    mov rdx, 1
    syscall

    ; branches
    mov rax, op
    cmp op, 0x2b ; ascii for +
    je add
    cmp op, 0x2d ; ascii for - 
    je sub
    cmp op, 0x2a ; ascii for *
    je mul
    cmp op, 0x2f ; ascii for /
    je div

    ; write()
    mov rax, 1
    mov rdi, 1
    mov rsi, res
    mov rdx, 4
    syscall

    ; exit()
    mov rax, 60
    mov rdi, 0
    syscall
