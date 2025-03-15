section .data
    prompt db "enter op1, op2, oper", 0
    prompt_len dq $ - prompt

section .bss
    buffer resb 32

section .text
    global _start

_start:
    mov rsi, prompt
    mov rdx, [prompt_len]
    call write

    mov rsi, buffer
    mov rdx, 32
    call read

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



