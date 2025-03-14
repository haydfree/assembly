section .data

section .bss

section .text
    global _start

exit:
    mov rax, 60
    mov rdi, 69
    syscall
    ret

_start:
    mov rax, 60
    mov rdi, 0
    syscall
