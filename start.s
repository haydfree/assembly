section .data
    ascii0 db 48
    a db 1
    b db 1

section .bss

section .text
    global _start

_start:
    mov al, [a]
    add al, [b]
    add al, [ascii0]
    mov result, al
    mov rdx, 1
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



