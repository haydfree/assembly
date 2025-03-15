section .data
    prompt db "enter op1, op2, oper",10,0
    prompt_len dq $ - prompt
    
section .bss
    buffer resb 8
    a resb 8
    b resb 8
    op resb 8
    res resb 8

section .text
    global _start

_start:
    ; write prompt
    mov rsi, prompt
    mov rdx, [prompt_len]
    call write

    ; read op1 into buffer
    mov rsi, buffer
    mov rdx, 8
    call read

    ; convert str to int and store 
    mov rcx, [buffer]
    call convert_to_int
    mov [a], rcx

    ; write prompt
    mov rsi, prompt
    mov rdx, [prompt_len]
    call write

    ; read op2 into buffer
    mov rsi, buffer
    mov rdx, 8
    call read

    ; convert str to int and store 
    mov rcx, [buffer]
    call convert_to_int
    mov [b], rcx

    ; get operator
    mov rsi, prompt
    mov rdx, [prompt_len]
    call write
    mov rsi, buffer
    mov rdx, 8
    call read
    mov rcx, [buffer]
    mov [op], rcx

    ; branches
    mov al, [op]

    cmp al, 43
    je add

    call exit

finish:
    mov rcx, [res]
    call convert_to_str
    mov [res], rcx
    mov rsi, res
    mov rdx, 8
    call write

    call exit

add:
    mov rcx, [a]
    add rcx, [b]
    mov [res], rcx
    jmp finish

sub:
    mov rcx, [a]
    sub rcx, [b]
    mov [res], rcx
    jmp finish

convert_to_int:
    sub rcx, 48
    ret

convert_to_str:
    add rcx, 48
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



