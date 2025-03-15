section .data
    ascii0 db 48

    msga db "enter a:",10
    msgb db "enter b:",10
    msgabsize db 9
    absize db 8

    msgop db "enter operator:",10
    msgopsize db 16
    opsize db 8

section .bss
    a resb 8
    b resb 8
    op resb 8
    result resb 8

    astr resb 8
    bstr resb 8
    resultstr resb 8

section .text
    global _start

_start:
    mov rsi, msga
    movzx rdx, byte [msgabsize]
    call write

    mov rsi, a
    movzx rdx, byte [absize]
    call read

    mov rsi, a
    movzx rdx, byte [absize]
    add rsi, [ascii0]
    call write

    call exit

add:
    mov rax, [a]
    add rax, [b]

    add rax, [ascii0]
    mov [result], rax

sub:
    mov rax, [a]
    sub rax, [b]

    add rax, [ascii0]
    mov [result], rax

convert:
    add rcx, [ascii0]
    ret

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



