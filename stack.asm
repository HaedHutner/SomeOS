; Demonstrate the stack

mov ah, 0x0e

mov bp, 0x8000             ; Set base of stack. This is slightly above where the BIOS loads
mov sp, bp                 ; the boot sector - so it won't override anything important

push 'A'                   ; Push characters on the stack for later use.
push 'B'                   ; These are pushed as 16-bit values, meaning the most significant byte
push 'C'                   ; will be added by the assembler as 0x00

pop bx                     ; Can only pop 16-bit valies, so pop to bx
mov al, bl                 ; and copy bl ( the 8-bit character is stored in the least significant part )
int 0x10                   ; into al and print al

pop bx                     ; Pop the next value
mov al, bl
int 0x10                   ; print it

mov al, [0x7ffe]           ; To prove the stack grows downwards from bp,
                           ; fetch the chat at 0x8000 - 0x02 ( i.e. 16-bits )
int 0x10                   ; and print it

jmp $

times 510-($-$$) db 0
dw 0xAA55
