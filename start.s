section .data
    ascii0 db 48

    msga db "enter a:",10
    msgb db "enter b:",10
    msgabsize db 9

section .bss
    a resb 1
    b resb 1
    op resb 1
    result resb 1

section .text
    global _start

_start:
    mov rsi, msga
    mov rdx, msgabsize
    call write

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

write:
    mov rax, 1
    mov rdi, 1
    syscall

exit:
    mov rax, 60
    mov rdi, 0
    syscall
    ret



