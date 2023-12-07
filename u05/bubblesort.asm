global sort

; input: rdi = n, rsi = *arr
; use rdi as counter for i
; use rcx as counter for j
sort:
        mov rdi, rdi

.outer_loop:
        ; check outer loop condition
        cmp rdi, 1
        jna .exit_outer

        ; set j = 0
        mov rcx, 0
.inner_loop:
        ; check inner loop condition
        mov rax, rdi
        sub rax, 1
        cmp rcx, rax
        jnb .exit_inner


        ; multiply j * 8 and add as offset rsi (array start)
        mov rax, [rsi+8*rcx]
        mov rdx, [rsi+8*(rcx+1)]

        cmp rax, rdx
        jna .iterate_inner_loop

        ; switch the two values
        mov [rsi+8*rcx], rdx
        mov [rsi+8*(rcx+1)], rax

.iterate_inner_loop:
        inc rcx
        jmp .inner_loop

.exit_inner:
        // just passin' thru

.iterate_outer_loop:
        dec rdi
        jmp .outer_loop


.exit_outer:
        ret
