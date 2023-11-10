        global gauss

; rdi = n
gauss:  ;
        ; add 1 to n
        mov rax, rdi
        inc rax

        ; multiply with n
        mul rdi

        ; divide by 2
        mov rsi, 2
        mov rdx, 0 ; clear part of what div uses as input
        div rsi

        ret
