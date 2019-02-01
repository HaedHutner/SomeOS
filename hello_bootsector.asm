mov ah, 0x0e ; BIOS routine for tty mode

mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10
mov al, 'o'
int 0x10
mov al, ' '
int 0x10
mov al, 'W'
int 0x10
mov al, 'o'
int 0x10
mov al, 'r'
int 0x10
mov al, 'l'
int 0x10
mov al, 'd'
int 0x10
mov al, '!'
int 0x10

jmp $ ; Jump to the current address ( this repeats forever => infintie loop )

;
; Padding + Magic BIOS Number 0xAA55
;

times 510-($-$$) db 0 ; Pad the boot sector with 0s
dw 0xAA55 ; Last two byte are the magic boot sector number, so the BIOS knows what it is
