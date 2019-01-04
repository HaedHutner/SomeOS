; Demonstrate addressing
[org 0x7c00]

mov ah, 0x0e ; enter tty mode

mov al, [boot_os_msg]
int 0x10

; First attempt
mov al, the_secret
int 0x10
mov al, "|"
int 0x10

; Second
mov al, [the_secret]
int 0x10
mov al, "|"
int 0x10

; Third
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10
mov al, "|"
int 0x10

; Fourth
mov al, [0x7c1e]
int 0x10
mov al, "|"
int 0x10

jmp $

the_secret:
    db "X"

boot_os_msg:
    db "Booting OS...", 0

; Padding + BIOS Number
times 510-($-$$) db 0
dw 0xAA55
