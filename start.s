section .data
    str db "hello world\n", 10

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, str 
    mov rdx, 12
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
