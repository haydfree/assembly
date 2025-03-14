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
