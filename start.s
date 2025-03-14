section .data

section .bss

section .text
    global _start

_start:
    call exit

exit:
    mov rax, 60
    mov rdi, 0
    syscall
    ret



