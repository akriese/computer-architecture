global formula_int
global formula_flt

; input: rdi, rsi, rdx, rcx, r8, r9, ...stack
; ((a + b) · (c − d)) · (e · 8 + f · 4 − g ÷ 2 + h ÷ 4) / 3
formula_int:
        add edi, esi            ; a + b
        mov eax, edi
        sub edx, ecx            ; c - d
        imul edx                ; (a+b) * (c-d)

        mov rdi, [rsp+8]        ; edi = g
        mov rsi, [rsp+16]       ; esi = h

        mov r10, rax            ; save first big factor term

        sal r8d, 3              ; signed shift left by 3 bits -> * 8
        mov ecx, r8d            ; save result to ecx; a is not needed anymore

        sal r9d, 2
        add ecx, r9d            ; e * 8 + f * 4

        sar edi, 1
        sub ecx, edi            ; e * 8 + f * 4 - g / 2

        sar esi, 2              ; h / 4
        add ecx, esi

        mov rax, r10
        imul ecx                ; big multiplication in numerator

        ; divide by 3, prepare edi and edx for idiv
        mov edi, 3
        mov edx, 0
        idiv edi

        ret


formula_flt:
        ret
