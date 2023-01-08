.data
nums1:
.word 1,2,3
size1:
.word 3
nums2:
.word 4,3,2,1
size2:
.word 4
nums3:
.word 9
size3:
.word 1
endl: 
.string "\n"

.data
carry: .word 0
size: .word 4
nums: .word 4,3,2,1
newnums: .word 0 0 0 0
nums2:
.word 1,2,3
size2:
.word 3
nums3:
.word 9
size3:
.word 1

.text
main:
lw s1, carry # s1 = 0
lw s2, size # s2 = 3
la s3, nums # s3 = &nums[0]
la s4, newnums # s4 = & newnums[0]
li t0, 4 # t0 = 4
mul t0, s2, t0 # t0 = 4 * size
addi t0, t0, -4 # t0 = t0 - 4
add t0, t0, s3 # t0 = t0 + s3 , t0 = &nums[size-1]
lw t1, 0(t0) # t1 = nums[size-1]
addi t1, t1, 1 # t1 = nums[size-1] + 1
sw t1, 0(t0) #nums[size-1] = nums[size-1] + 1

addi t1, s2, -1 # t1(i) = s2(size) - 1
plusone:
li t2, 10 # t2 = 10
lw t3, 0(t0) # t3 = nums[i]
bne t3, t2, elseBreak # t3(nums[i]) != 10 brach to elseBreak 
li t3, 0 # t3(nums[i]) = 0
sw t3,0(t0) # nums[i] = t0
bne t1,x0, else # t1(i) != 0 branch to else
li s1, 1 # s1(carry) = 1
j forend
else:
addi t0, t0, -4 # t0 = &nums[i] - 4 = &nums[i-1]
lw t3, 0(t0) # t3 = nums[i-1]
addi t3, t3, 1 # t3 = t3 - 1
sw t3, 0(t0) # nums[i-1] = t3
forend:
addi t1, t1, -1 # t1(i) = t1(i) - 1
bge t1, x0, plusone # if t1(i) >= 0 branch to plusone
elseBreak:
beq s1, x0, arrprint # s1(carry) == 0 branch to arrprint
li t0, 1 # t0 = 1
sw t0, 0(s4) # newnums[0] = 1
li t1, 0 # t1(i) = 0
add t0, s3, x0 # t0 = &nums[0]
addi t3, s4, 4 # t3 = &newnums[1]
addlength:
lw t2, 0(t0) # t2 = nums[i]
sw t2, 0(t3) #newnums[i+1] = nums[i]
addi t0, t0, 4 # t0 = &nums[i] + 4
addi t3, t3, 4 # t3 = &nums[i+1] + 4
addi t1, t1, 1 # t1(i) = t1(i) + 1
blt t1, s2, addlength # if t1(i) < s2(size) goto addlength
j arrprintnew # jump to arrprintnew
arrprint: 
li t1, 0 # t1(i) = 0
add t0, s3, x0 # t0 = &nums[0] 
printloop:
lw a0, 0(t0) # print integer nums[i]
li a7, 1 
ecall
addi t1, t1, 1 # t1(i) = t1(i) + 1
addi t0, t0, 4 # t0 = &nums[i] + 4
blt t1, s2, printloop # if t1(i) < s2(size) goto printloop
j end # jump to end
arrprintnew:
li t1, 0 # t1(i) = 0
add t0, s4, x0 # t0 = &newnums[0] 
addi t2, s2, 1 # t2 = s2(size) + 1
printloopnew:
lw a0, 0(t0) # print integer newnums[i]
li a7, 1
ecall
addi t1, t1, 1 # t1(i) = t1(i) + 1
addi t0, t0, 4 # t0 = &newnums[i] + 4
blt t1, t2, printloopnew # if t1(i) < t2(size+1) goto printloopnew
end:
li a7, 10 # end program
ecall
