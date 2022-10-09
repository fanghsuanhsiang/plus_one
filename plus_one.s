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

.text
main:
    la s0, nums1 #load nums1 address
    jal ra, plusone
    jal ra, arrprint
    la s0, nums2
    jal ra, plusone
    jal ra, arrprint
    la s0, nums3
    jal ra, plusone
    jal ra, arrprint
plusone:
    lw s2, size1 #load num1 size
    addi s3, s2, -1 #int i
    mv a0, s0 #store num address for i
    
loop:
    lw a1, 0(a0) #load digit[0]
    add a1, a1, s3 #load digit[i]
    addi a2, zero, 9
    blt a1, a2, same
    mv a1, zero #digit[i] = 0
    addi s3, s3, -1 #i--
    addi a0, a0, 4 #point to next digits[i]
    blt s3, zero, arrlength
same:
    addi a1, a1, 1
    addi s3, s3, -1 #i--
    j arrlength
addone:
    addi a1, a1, 1
arrlength:
    lw a3, 0(a0) #load digit[0]
    add a4, a3, s3 #load digit[1]
    mv a5, a1 #load digit[2]
    beq a1, zero, addlength
addlength:
arrprint:
    mv a0, a1
    li a7, 1
    ecall
    mv a0, a1
    li a7, 1
    ecall
    mv a0, a1
    li a7, 1
    ecall
