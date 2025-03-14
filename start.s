section .data
    nl db 0xA

    msga db "enter operand a",10
    msgb db "enter operand b",10
    msgabsize dd 16

    msgop db "enter operator",10
    msgopsize dd 14

    msgentry db "you entered:",10
    msgentrysize dd 13

    msganswer db "answer:",10
    msganswersize dd 8

section .bss
    a resd 1
    b resd 1
    op resb 1
    result resd 1

section .text
    global _start

_start:
    mov rax, 0

;add:
;    mov rax, [a]
;    add rax, [b]
;    mov [result], rax
;    jmp output
;
;sub:
;    mov rax, [a]
;    sub rax, [b]
;    mov [result], rax
;    jmp output
;
;mul:
;    mov eax, [a]
;    mov edx, 0
;    mul dword [b]
;    mov [result], eax
;    jmp output
;
;div:
;    mov eax, [a]
;    mov edx, 0
;    div dword [b]
;    mov [result], eax
;    jmp output
;
write:
    mov rax, 1
    mov rdi, 1
    syscall
    ret

read:
    mov rax, 0
    mov rdi, 0
    syscall
    ret

exit:
    mov rax, 60
    mov rdi, 0
    syscall
    ret

output:
    mov rsi, msganswer
    mov rdx, 8
    call write
    call exit

