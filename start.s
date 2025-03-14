section .data
    nl db 0xA
    msga db "enter operand a",10
    msgb db "enter operand b",10
    msgop db "enter operator",10
    msgentry db "you entered:",10
    msganswer db "answer:",10

section .bss
    a resd 1
    b resd 1
    op resb 1
    result resd 1

section .text
    global _start

_start:


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
    ; convert int to str
    mov eax, [result]
    add eax, 48
    mov [result], eax

    ; write() answer message
    mov rax, 1
    mov rdi, 1
    mov rsi, msganswer
    mov rdx, 8
    syscall
    
    ; write() answer
    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, 4
    syscall

    ; exit()
    mov rax, 60
    mov rdi, 0
    syscall
