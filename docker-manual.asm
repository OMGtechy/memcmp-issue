memcmp_issue::naive_search_manual:
 push    rbp
 push    rbx
 mov     eax, 1
 test    rcx, rcx
 je      .LBB1_1
 mov     r8, rdx
 mov     r9, rcx
 neg     r9
 xor     edx, edx
.LBB1_3:
 cmp     rsi, rcx
 jb      .LBB1_4
 lea     r10, [rdi, +, 1]
 add     rsi, -1
 mov     r11, -1
.LBB1_6:
 lea     rbx, [r9, +, r11]
 cmp     rbx, -1
 je      .LBB1_9
 movzx   ebp, byte, ptr, [r8, +, r11, +, 1]
 lea     rbx, [r11, +, 1]
 cmp     bpl, byte, ptr, [rdi, +, r11, +, 1]
 mov     r11, rbx
 je      .LBB1_6
 cmp     rbx, rcx
 adc     rdx, 0
 mov     rdi, r10
 cmp     rbx, rcx
 jb      .LBB1_3
 jmp     .LBB1_9
.LBB1_1:
 xor     edx, edx
.LBB1_9:
 pop     rbx
 pop     rbp
 ret
.LBB1_4:
 xor     eax, eax
 pop     rbx
 pop     rbp
 ret
