addi	zero,zero,0
addi	zero,zero,0
addi	zero,zero,0
jal	zero,10 <hart0>

addi	zero,zero,0
addi	ra,zero,0
lui	sp,0x4
addi	sp,sp,-4 # 3ffc <__global_pointer$+0x3620>
addi	gp,zero,0
addi	tp,zero,0
addi	t0,zero,0
addi	t1,zero,0
addi	t2,zero,0
addi	s0,zero,0
addi	a0,zero,0
addi	a1,zero,0
addi	a2,zero,0
addi	a3,zero,0
addi	a4,zero,0
addi	a5,zero,0
addi	a6,zero,0
addi	a7,zero,0
addi	s2,zero,0
addi	s3,zero,0
addi	s4,zero,0
addi	s5,zero,0
addi	s6,zero,0
addi	s7,zero,0
addi	s8,zero,0
addi	s9,zero,0
addi	s10,zero,0
addi	s11,zero,0
addi	t3,zero,0
addi	t4,zero,0
addi	t5,zero,0
addi	t6,zero,0
auipc	ra,0x0
jalr	ra,212(ra) # 164 <main>
addi	zero,zero,0
addi	s1,a0,0
addi	zero,zero,0
addi	zero,zero,0
addi	zero,zero,0
addi	zero,zero,0
auipc	ra,0x0
jalr	ra,0(ra) # b0 <hart0+0xa0>
addi	zero,zero,0
addi	zero,zero,0
addi	zero,zero,0
addi	zero,zero,0

addi	sp,sp,-32
sw	ra,28(sp)
sw	s0,24(sp)
sw	s1,20(sp)
addi	s0,sp,32
sw	a0,-20(s0)
lw	a4,-20(s0)
addi	a5,zero,1
blt	a5,a4,f4 <fib+0x2c>
lw	a5,-20(s0)
jal	zero,128 <fib+0x60>
lw	a5,-20(s0)
addi	a5,a5,-1
addi	a0,a5,0
auipc	ra,0x0
jalr	ra,-56(ra) # c8 <fib>
addi	s1,a0,0
lw	a5,-20(s0)
addi	a5,a5,-2
addi	a0,a5,0
auipc	ra,0x0
jalr	ra,-80(ra) # c8 <fib>
addi	a5,a0,0
add	a5,s1,a5
addi	a0,a5,0
lw	ra,28(sp)
lw	s0,24(sp)
lw	s1,20(sp)
addi	sp,sp,32
jalr	zero,0(ra)

addi	sp,sp,-32
sw	s0,28(sp)
addi	s0,sp,32
sw	a0,-20(s0)
lw	a5,-20(s0)
addi	a0,a5,0
lw	s0,28(sp)
addi	sp,sp,32
jalr	zero,0(ra)

addi	sp,sp,-32
sw	ra,28(sp)
sw	s0,24(sp)
addi	s0,sp,32
addi	a5,zero,8
sw	a5,-20(s0)
lw	a0,-20(s0)
auipc	ra,0x0
jalr	ra,-184(ra) # c8 <fib>
addi	a5,a0,0
addi	a0,a5,0
auipc	ra,0x0
jalr	ra,-80(ra) # 140 <return_function>
sw	a0,-24(s0)
lw	a5,-24(s0)
addi	a0,a5,0
lw	ra,28(sp)
lw	s0,24(sp)
addi	sp,sp,32
jalr	zero,0(ra)
addi	zero,zero,0
addi	zero,zero,0
addi	zero,zero,0
addi	zero,zero,0
auipc	ra,0x0
jalr	ra,0(ra) # 1c4 <main+0x60>
addi	zero,zero,0
addi	zero,zero,0
addi	zero,zero,0
addi	zero,zero,0
