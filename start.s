section .data
    a dd 0
    b dd 0

section .text
    global _start

_start:
    ; read()
    mov rax, 0
    mov rdi, 0
    mov rsi, a
    mov rdx, 1

    ; write()
    mov rax, 1
    mov rdi, 1
    mov rsi, text 
    mov rdx, 11
    syscall

    ; exit()
    mov rax, 60
    mov rdi, 0
    syscall
