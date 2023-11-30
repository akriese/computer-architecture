global collatz

; n = rax, rdi
; k = rsi
collatz:
        mov rsi, 0

        .while:
        cmp rdi, 1
        jna .after_while

                mov rax, rdi    ; prepare n for mul
                mov rcx, 2      ; prepare 2 for mul
                mov rdx, 0      ; clear rdx input
                div rcx
                cmp rdx, 0      ; rest of division stored in rdx
                jne .else_modulo

                        .if_modulo:
                        mov rdi, rax ; move result of division to rdi register (where we keep n)
                        jmp .after_if

                        .else_modulo:
                        mov rax, rdi    ; move n to rax
                        mov rcx, 3
                        mul rcx         ; multiply n by 3
                        inc rax         ; increment n
                        mov rdi, rax    ; save n to its register

                .after_if:
                inc rsi         ; increment k
                jmp .while      ; continue while loop

        .after_while:
        mov rax, rsi
        ret

