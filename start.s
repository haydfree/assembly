section .data:
    str "hello world\n"

section .text:
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, str 
    mov rdx, 12
    syscall
