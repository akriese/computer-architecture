        global tri_area

tri_area:       mov rax, rdi
                mul rsi

                mov rcx, 2
                div rcx

                ret
