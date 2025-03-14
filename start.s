section .data
    ascii0 db 48          ; ASCII value of '0'
    msga db "enter a:",10
    msgb db "enter b:",10
    msgabsize db 9        ; Size of the message

section .bss
    a resb 1              ; Reserve space for 'a'
    b resb 1              ; Reserve space for 'b'
    result resb 1         ; Reserve space for result

section .text
    global _start

_start:
    ; Print "enter a:"
    mov rsi, msga
    mov rdx, msgabsize
    call write

    ; Read input for 'a'
    mov rsi, a
    mov rdx, 1            ; Read 1 byte
    call read

    ; Print "enter b:"
    mov rsi, msgb
    mov rdx, msgabsize
    call write

    ; Read input for 'b'
    mov rsi, b
    mov rdx, 1            ; Read 1 byte
    call read

    ; Convert 'a' and 'b' from ASCII to integer
    mov al, [a]           ; Load 'a' into al
    sub al, [ascii0]      ; Convert from ASCII to integer (subtract 48)
    mov bl, al            ; Store the integer value of 'a' in bl

    mov al, [b]           ; Load 'b' into al
    sub al, [ascii0]      ; Convert from ASCII to integer (subtract 48)
    mov cl, al            ; Store the integer value of 'b' in cl

    ; Perform addition (a + b)
    add bl, cl            ; bl = bl + cl

    ; Convert result back to ASCII
    add bl, [ascii0]      ; Convert the result back to ASCII by adding 48

    ; Store result in result variable
    mov [result], bl      ; Store the result in 'result'

    ; Print result
    mov rsi, result
    mov rdx, 1            ; Write 1 byte
    call write

    ; Exit the program
    call exit

read:
    mov rax, 0            ; Syscall number for 'read'
    mov rdi, 0            ; File descriptor 0 (stdin)
    syscall
    ret

write:
    mov rax, 1            ; Syscall number for 'write'
    mov rdi, 1            ; File descriptor 1 (stdout)
    syscall
    ret

exit:
    mov rax, 60           ; Syscall number for 'exit'
    xor rdi, rdi          ; Exit status 0
    syscall
    ret

