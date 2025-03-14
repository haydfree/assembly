section .data
    a dd 0
    b dd 0
    op db ""
    res dd 0

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

    ; write()
    mov rax, 1
    mov rdi, 1
    mov rsi, a
    mov rdx, 11
    syscall

    ; exit()
    mov rax, 60
    mov rdi, 0
    syscall
