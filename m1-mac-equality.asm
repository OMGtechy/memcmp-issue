memcmp_issue::naive_search_equality:
 stp     x24, x23, [sp, #-64]!
 stp     x22, x21, [sp, #16]
 stp     x20, x19, [sp, #32]
 stp     x29, x30, [sp, #48]
 add     x29, sp, #48
 cbz     x3, LBB0_5
 mov     x20, x3
 mov     x21, x2
 mov     x22, x1
 mov     x23, x0
 mov     x19, #0
LBB0_2:
 cmp     x22, x20
 b.lo    LBB0_7
 sub     x22, x22, #1
 add     x0, x23, x19
 mov     x1, x21
 mov     x2, x20
 bl      _memcmp
 add     x19, x19, #1
 cbnz    w0, LBB0_2
 cmp     w0, #0
 mov     w8, #2
 csinc   w8, w8, wzr, eq
 and     x8, x8, #0x1
 add     x8, x8, x19
 sub     x19, x8, #1
 b       LBB0_6
LBB0_5:
 mov     x19, #0
LBB0_6:
 mov     w0, #1
 mov     x1, x19
 ldp     x29, x30, [sp, #48]
 ldp     x20, x19, [sp, #32]
 ldp     x22, x21, [sp, #16]
 ldp     x24, x23, [sp], #64
 ret
LBB0_7:
 mov     x0, #0
 mov     x1, x19
 ldp     x29, x30, [sp, #48]
 ldp     x20, x19, [sp, #32]
 ldp     x22, x21, [sp, #16]
 ldp     x24, x23, [sp], #64
 ret
