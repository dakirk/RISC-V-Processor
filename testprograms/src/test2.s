addi a0,zero,0 #a0 = 0 pc = 0
addi a1,zero,1 #a1 = 1 pc = 4
addi a2,zero,2 #a2 = 2 pc = 8
addi a3,zero,3 #a3 = 3 pc = c
addi a4,zero,4 #a4 = 4 pc = 10
addi a5,zero,5 #a5 = 5 pc = 14
addi a6,zero,6 #a6 = 6 pc = 18
addi a7,zero,7 #a7 = 7 pc = 1c

lui s2,-1
auipc s3,4
jalr s4,68(a4)
addi a0,zero,1000000
addi a1,zero,1000000
addi a2,zero,1000000 
addi a3,zero,1000000
addi a4,zero,1000000
addi a5,zero,1000000
addi a6,zero,1000000
addi a7,zero,1000000 #pc = 48
addi a7,zero,-1
