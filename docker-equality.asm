memcmp_issue::naive_search_equality:
 push    rbp
 push    r15
 push    r14
 push    r13
 push    r12
 push    rbx
 push    rax
 mov     eax, 1
 test    rcx, rcx
 je      .LBB0_1
 mov     r15, rcx
 mov     r12, rdx
 mov     rbx, rsi
 mov     rbp, rdi
 mov     r14, qword, ptr, [rip, +, bcmp@GOTPCREL]
 xor     r13d, r13d
.LBB0_3:
 cmp     rbx, r15
 jb      .LBB0_4
 add     rbx, -1
 mov     rdi, rbp
 add     rdi, r13
 mov     rsi, r12
 mov     rdx, r15
 call    r14
 add     r13, 1
 test    eax, eax
 jne     .LBB0_3
 cmp     eax, 1
 mov     al, 1
 adc     al, 0
 movzx   eax, al
 and     eax, 1
 add     r13, rax
 add     r13, -1
 mov     eax, 1
 jmp     .LBB0_7
.LBB0_1:
 xor     r13d, r13d
 jmp     .LBB0_7
.LBB0_4:
 xor     eax, eax
.LBB0_7:
 mov     rdx, r13
 add     rsp, 8
 pop     rbx
 pop     r12
 pop     r13
 pop     r14
 pop     r15
 pop     rbp
 ret
