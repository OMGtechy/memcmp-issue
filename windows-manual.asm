memcmp_issue::naive_search_manual:
 push    rsi
 push    rdi
 push    rbp
 push    rbx
 mov     eax, 1
 test    r9, r9
 je      .LBB1_1
 mov     r10, rdx
 mov     r11, r9
 neg     r11
 xor     edx, edx
.LBB1_3:
 cmp     r10, r9
 jb      .LBB1_4
 lea     rsi, [rcx, +, 1]
 add     r10, -1
 mov     rdi, -1
.LBB1_6:
 lea     rbx, [r11, +, rdi]
 cmp     rbx, -1
 je      .LBB1_9
 movzx   ebp, byte, ptr, [r8, +, rdi, +, 1]
 lea     rbx, [rdi, +, 1]
 cmp     bpl, byte, ptr, [rcx, +, rdi, +, 1]
 mov     rdi, rbx
 je      .LBB1_6
 cmp     rbx, r9
 adc     rdx, 0
 mov     rcx, rsi
 cmp     rbx, r9
 jb      .LBB1_3
 jmp     .LBB1_9
.LBB1_1:
 xor     edx, edx
.LBB1_9:
 pop     rbx
 pop     rbp
 pop     rdi
 pop     rsi
 ret
.LBB1_4:
 xor     eax, eax
 jmp     .LBB1_9
