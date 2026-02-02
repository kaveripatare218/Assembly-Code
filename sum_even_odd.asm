section .data
        Array dd 10,11,12,13,14,15,16,17,18,-1
        msg db "Even sum = %d and Odd sum = %d",10,0
section .bss
        two resd 1
section .text
        global main
        extern printf
main:
        mov dword [two],2
        mov ebx,Array
        xor ecx,ecx
        xor esi,esi   ;;add sum esi
        xor edi,edi   ;;;even sum edi
lp:     xor edx,edx
        mov eax,dword[ebx]
        cmp eax,-1
        jz endp
        div dword[two]
        cmp edx,0
        jnz odd
        add edi,dword[ebx]
        jmp even
odd:    add esi,dword[ebx]
even:   add ebx,4
        jmp lp
endp:   push esi
        push edi
        push msg
        call printf
        add esp,12
        ret
