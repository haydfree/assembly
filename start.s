section .data
    text db 48

section .bss

section .text
    global _start

_start:
    mov rsi, 48
    mov rdx, 1
    syscall
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



