global asm_fib_it
global asm_fib_rek

; argument n: rdi
; output to rax

; fib(n):
;  a, b, k = 1, 1, 2
;  while k < n:
;   tmp, a = a+b, b
;   b = tmp
;   k++
;  return b
asm_fib_it:
        mov r8, 1       ; a = fib(1)
        mov r9, 1       ; b = fib(2)
        mov rcx, 2      ; k = 2; counter variable

        ; handle special cases, n=1, n=2
        cmp rdi, 2
        ja .while

        ; return 1 if n <= 2
        mov rax, 1
        ret

        .while:
        cmp rdi, rcx
        je .return

        mov rax, r8
        add rax, r9     ; a + b
        mov r8, r9      ; a = b
        mov r9, rax     ; b = tmp

        inc rcx         ; k += 1

        jmp .while

        .return:
        mov rax, r9
        ret

; argument n: rdi
; output to rax
asm_fib_rek:
        cmp rdi, 2
        ja .recurse

        mov rax, 1
        ret

        .recurse:
        mov rax, rdi
        sub rax, 2      ; n-2
        push rdi        ; push n to stack
        mov rdi, rax    ; prepare rdi for call with n-2
        call asm_fib_rek; fib(n-2)

        mov r8, rax     ; mov result of call to r8
        pop rax         ; get n from stack

        push r8         ; save result of fib(n-2)
        sub rax, 1      ; n-1
        mov rdi, rax    ; prepare rdi for call with n-1
        call asm_fib_rek; call fib(n-1)
        pop rdi         ; retrieve fib(n-2) from stack
        add rax, rdi    ; fib(n-1) + fib(n-2)

        ret



