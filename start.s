section .data
    ascii0 db 48
    a dd 1
    b dd 1

section .bss

section .text
    global _start

_start:
    mov rsi, ascii0
    mov rdx, 4
    call write
    call exit

read:
    mov rax, 0
    mov rdi, 0
    syscall

write:
    mov rax, 1
    mov rdi, 1
    syscall

exit:
    mov rax, 60
    mov rdi, 0
    syscall
    ret



