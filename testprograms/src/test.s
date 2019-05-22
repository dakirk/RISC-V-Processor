addi a0,zero,0 #a0 = 0
addi a1,zero,1 #a1 = 1
addi a2,zero,2 #a2 = 2
addi a3,zero,3 #a3 = 3
addi a4,zero,4 #a4 = 4
addi a5,zero,5 #a5 = 5
addi a6,zero,6 #a6 = 6
addi a7,zero,7 #a7 = 7

sub s2,a7,a5 #s2 = 2
and s3,a0,a1 #s3 = 0
or s4,a0,a1 #s4 = 1
xor s5,a0,a1 #s5 = 1
xori s6,a3,-1 #s6 = -4
ori s7,a2,1 #s7 = 3
andi s8,a6,2 #s8 = 2
add s9,a4,a5 #s9 = 9

slti s10,a6,-8 #s10 = 0
sltiu s11,a6,-8 #s11 = 1
slli t3,a3,1 #t3 = 6
addi a0,zero,-1000 #a0 = -100
srli t4,a0,3 #t4 = some very big number
srai t5,a0,3 #t5 = -125
