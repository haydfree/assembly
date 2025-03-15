section .data
    prompt db "enter op1, op2, oper", 0
    prompt_len dq $ - prompt

section .bss
    buffer resb 8
    a resb 8
    astr resb 8

section .text
    global _start

_start:
    mov rsi, prompt
    mov rdx, [prompt_len]
    call write

    mov rsi, buffer
    mov rdx, 8
    call read

    mov [a], [buffer]
    mov rcx, [a]
    add rcx, 48
    mov [astr], rcx
    mov rsi, astr
    mov rdx, 8
    call write


    call exit

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



