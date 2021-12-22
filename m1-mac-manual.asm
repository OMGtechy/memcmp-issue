memcmp_issue::naive_search_manual:
 cbz     x3, LBB1_8
 mov     x8, x1
 mov     x9, x0
 mov     x1, #0
 mov     w0, #1
LBB1_2:
 cmp     x8, x3
 b.lo    LBB1_9
 mov     x11, #0
 add     x10, x9, #1
 sub     x8, x8, #1
LBB1_4:
 cmp     x3, x11
 b.eq    LBB1_7
 add     x12, x11, #1
 ldrb    w13, [x2, x11]
 ldrb    w14, [x9, x11]
 mov     x11, x12
 cmp     w13, w14
 b.eq    LBB1_4
 sub     x11, x12, #1
 mov     x9, x10
 cmp     x11, x3
 cinc    x1, x1, lo
 b.lo    LBB1_2
LBB1_7:
 ret
LBB1_8:
 mov     x1, #0
 mov     w0, #1
 ret
LBB1_9:
 mov     x0, #0
 ret
