memcmp_issue::naive_search_equality:
 push    r15
 push    r14
 push    r12
 push    rsi
 push    rdi
 push    rbx
 sub     rsp, 40
 mov     r14d, 1
 test    r9, r9
 je      .LBB0_1
 mov     rbx, r9
 mov     r15, r8
 mov     rsi, rdx
 mov     r12, rcx
 xor     edi, edi
.LBB0_3:
 cmp     rsi, rbx
 jb      .LBB0_4
 add     rsi, -1
 lea     rcx, [r12, +, rdi]
 mov     rdx, r15
 mov     r8, rbx
 call    memcmp
 add     rdi, 1
 test    eax, eax
 jne     .LBB0_3
 cmp     eax, 1
 mov     al, 1
 adc     al, 0
 movzx   eax, al
 and     eax, 1
 add     rdi, rax
 add     rdi, -1
 jmp     .LBB0_7
.LBB0_1:
 xor     edi, edi
 jmp     .LBB0_7
.LBB0_4:
 xor     r14d, r14d
.LBB0_7:
 mov     rax, r14
 mov     rdx, rdi
 add     rsp, 40
 pop     rbx
 pop     rdi
 pop     rsi
 pop     r12
 pop     r14
 pop     r15
 ret
