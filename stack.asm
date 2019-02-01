; Demonstrate the stack

mov ah, 0x0e               ; Set tele-type mode

mov bp, 0x8000             ; Set base of stack. This is slightly above where the BIOS loads
mov sp, bp                 ; the boot sector - so it won't override anything important

push 'H'                   ; Push characters on the stack for later use.
push 'E'
push 'L'
push 'L'
push 'O'
push ' '
push 'W'
push 'O'
push 'R'
push 'L'
push 'D'
push '!'
push termination_char

call print

jmp $

print:
    pop bx
    cmp bx, termination_char
    jne print_char
    ret   

print_char:
    mov al, bl
    int 0x10
    jmp print

termination_char: db 0x00

hello_world:
    db 'Hello World!',0

times 510-($-$$) db 0
dw 0xAA55

