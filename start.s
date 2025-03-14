section .data
    msga db "enter operand a",0
    msgb db "enter operand b",0

section .bss
    a resd 1
    b resd 1
    op resb 1
    result resd 1

section .text
    global _start

_start:
    ; write() message about entering a
    mov rax, 1
    mov rdi, 1
    mov rsi, msga
    mov rdx, 16 
    syscall

    ; read() a
    mov rax, 0
    mov rdi, 0
    mov rsi, a
    mov rdx, 4
    syscall

    ; write() message about entering b
    mov rax, 1
    mov rdi, 1
    mov rsi, msgb
    mov rdx, 16 
    syscall

    ; read() b
    mov rax, 0
    mov rdi, 0
    mov rsi, b
    mov rdx, 4
    syscall

    ; read() op
    mov rax, 0
    mov rdi, 0
    mov rsi, op
    mov rdx, 1
    syscall

    ; branches
    mov al, [op]
    cmp al, 0x2b ; ascii for +
    je add
    cmp al, 0x2d ; ascii for - 
    je sub
    cmp al, 0x2a ; ascii for *
    je mul
    cmp al, 0x2f ; ascii for /
    je div

add:
    mov rax, [a]
    add rax, [b]
    mov [result], rax
    jmp output

sub:
    mov rax, [a]
    sub rax, [b]
    mov [result], rax
    jmp output

mul:
    mov eax, [a]
    mov edx, 0
    mul dword [b]
    mov [result], eax
    jmp output

div:
    mov eax, [a]
    mov edx, 0
    div dword [b]
    mov [result], eax
    jmp output

output:
    ; write()
    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, 4
    syscall

    ; exit()
    mov rax, 60
    mov rdi, 0
    syscall
