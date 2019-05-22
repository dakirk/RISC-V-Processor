addi	zero,zero,0
addi	zero,zero,0
addi	zero,zero,0
jal	zero,10 <hart0>

addi	zero,zero,0
addi	ra,zero,0
lui	sp,0x4
addi	sp,sp,-4 # 3ffc <__global_pointer$+0x3634>
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
jalr	ra,196(ra) # 154 <main>
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

addi	sp,sp,-48
sw	ra,44(sp)
sw	s0,40(sp)
addi	s0,sp,48
sw	a0,-36(s0)
sw	a1,-40(s0)
lw	a4,-36(s0)
lw	a5,-40(s0)
bne	a4,a5,f8 <gcd+0x30>
lw	a5,-36(s0)
sw	a5,-20(s0)
jal	zero,13c <gcd+0x74>
lw	a4,-36(s0)
lw	a5,-40(s0)
bge	a5,a4,118 <gcd+0x50>
lw	a4,-36(s0)
lw	a5,-40(s0)
sub	a5,a4,a5
sw	a5,-36(s0)
jal	zero,128 <gcd+0x60>
lw	a4,-40(s0)
lw	a5,-36(s0)
sub	a5,a4,a5
sw	a5,-40(s0)
lw	a1,-40(s0)
lw	a0,-36(s0)
auipc	ra,0x0
jalr	ra,-104(ra) # c8 <gcd>
sw	a0,-20(s0)
lw	a5,-20(s0)
addi	a0,a5,0
lw	ra,44(sp)
lw	s0,40(sp)
addi	sp,sp,48
jalr	zero,0(ra)

addi	sp,sp,-32
sw	ra,28(sp)
sw	s0,24(sp)
addi	s0,sp,32
addi	a5,zero,64
sw	a5,-20(s0)
addi	a5,zero,48
sw	a5,-24(s0)
lw	a1,-24(s0)
lw	a0,-20(s0)
auipc	ra,0x0
jalr	ra,-180(ra) # c8 <gcd>
sw	a0,-28(s0)
lw	a5,-28(s0)
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
jalr	ra,0(ra) # 1b0 <main+0x5c>
addi	zero,zero,0
addi	zero,zero,0
addi	zero,zero,0
addi	zero,zero,0
