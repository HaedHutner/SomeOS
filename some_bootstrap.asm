mov ah, 0x0e ; tty mode
mov al, 'H'
int 0x10
mov al, 'E'
int 0x10
mov al, 'L'
int 0x10
int 0x10 ; Because 'L' is still on al, we can interrupt again to print it twice
mov al, 'O'
int 0x10

jmp $ ; jump to current address = infinite loop

; padding and magic number 0xAA55
times 510 - ($-$$) db 0
dw 0xAA55


