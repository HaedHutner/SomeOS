[org 0x7c00]
    
    mov bx, HELLO_MSG
    call print

    mov bx, GOODBYE_MSG
    call print
    
    primary_loop:
        ; mov bx, TICK_MSG
        ; call print
    jmp primary_loop

%include "print.asm"

HELLO_MSG:
    db "Hello, OS!",0xa,0xd,0

GOODBYE_MSG:
    db "Goodbye!",0xa,0xd,0

TICK_MSG:
    db "Tick ",0

times 510-($-$$) db 0
dw 0xAA55
