section .data
    prompt db "Enter something: ", 0  ; Prompt message
    prompt_len equ $ - prompt         ; Length of prompt

section .bss
    buffer resb 32   ; Reserve 32 bytes for user input

section .text
    global _start

_start:
    ; Write the prompt message
    mov rax, 1        ; syscall: write
    mov rdi, 1        ; file descriptor: stdout
    mov rsi, prompt   ; pointer to message
    mov rdx, prompt_len ; message length
    syscall

    ; Read user input
    mov rax, 0        ; syscall: read
    mov rdi, 0        ; file descriptor: stdin
    mov rsi, buffer   ; pointer to buffer
    mov rdx, 32       ; max number of bytes to read
    syscall           ; syscall executes, stores input in buffer

    ; Print user input back to the screen
    mov rax, 1        ; syscall: write
    mov rdi, 1        ; file descriptor: stdout
    mov rsi, buffer   ; pointer to buffer (contains user input)
    mov rdx, 32       ; max bytes to print (same as read size)
    syscall

    ; Exit
    mov rax, 60       ; syscall: exit
    xor rdi, rdi      ; exit status 0
    syscall

