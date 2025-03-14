section .data

section .bss

section .text
    global _start

_start:

exit1:
    mov rax, 60
    mov rdi, 1
    syscall
    ret

exit0:
    mov rax, 60
    mov rdi, 0
    syscall
    ret


