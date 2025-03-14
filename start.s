section .data
    ascii0 db 48

    msga db "enter a:",10
    msgb db "enter b:",10
    msgabsize db 9

section .bss
    a resb 8
    b resb 8
    op resb 8
    result resb 8

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msga
    mov rdx, [msgabsize]
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, a
    mov rdx, 8
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, msgb
    mov rdx, [msgabsize]
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, b
    mov rdx, 8
    syscall

    call exit

add:
    mov rax, [a]
    add rax, [b]
    mov [result], rax

sub:
    mov rax, [a]
    sub rax, [b]
    mov [result], rax

read:
    mov rax, 0
    mov rdi, 0
    syscall
    ret

write:
    mov rax, 1
    mov rdi, 1
    syscall
    ret

exit:
    mov rax, 60
    mov rdi, 0
    syscall
    ret



