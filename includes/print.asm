print:                  ; declare print function
    pusha               ; push all registers on stack
    mov ah, 0x0e        ; int = 10 and ah = 0x0e -> BIOS tele-type output
    
    print_loop:
        mov al, [bx]    ; move the contents of bx into al
        cmp al, 0       ; compare al to 0 ( null-termination char )
        je print_return ; if al contains the null-termination character, jump to print_return
                        
        int 0x10        ; otherwise, print the character
        inc bx          ; increment bx, so it contains the next character
        jne print_loop  ; if they're not equal ( it's not the termination character ), continue the loop   

    print_return:
        popa            ; pop registers back
        ret             ; return

println:
    pusha
    mov ah, 0x0e

    println_loop:
        mov al, [bx]
        cmp al, 0
        je println_return
        
        int 0x10
        inc bx
        jne print_loop

    println_return:
        mov al, 0xa
        int 0x10
        mov al, 0xd
        int 0x10
        popa
        ret
