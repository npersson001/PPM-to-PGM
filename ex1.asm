.data 0x0
	greyScale:	.asciiz	"P2\n"
	newline:	.asciiz	"\n"
	maxPGM:		.word 	255

.text 0x3000

main:
	ori $v0, $0, 12		#take in P3
	syscall
	
	la $a0, greyScale	#print P2
	ori $v0, $0, 4
	syscall
	
	ori $v0, $0, 5		#take in columns
	syscall
	addu $t0, $0, $v0	#$t0 set as columns
	
	ori $v0, $0, 5		#take in rows
	syscall
	addu $t1, $0, $v0	#$t1 set as rows
	
	ori $v0, $0, 5		#take in maxPPM
	syscall
	addu $t2, $0, $v0	#$t2 set as maxPPM
	
	addu $a0, $0, $t0	#print columns
	ori $v0, $0, 1
	syscall
	
	la $a0, newline		#print newLine
	ori $v0, $0, 4
	syscall
	
	addu $a0, $0, $t1	#print rows
	ori $v0, $0, 1
	syscall
	
	la $a0, newline		#print newLine
	ori $v0, $0, 4
	syscall
	
	addiu $a0, $0, 255	#print maxPGM
	ori $v0, $0, 1
	syscall
	
	multu $t0, $t1		#multiply rows and columns
	mflo $t0		#$t0 set as max for for loop
	ori $t1, $0, 0		#$t1 set as i for loop
	
loop:
	la $a0, newline		#print newLine
	ori $v0, $0, 4
	syscall
	
	ori $v0, $0, 5		#take in r
	syscall
	addu $t3, $0, $v0	#$t3 set as r
	
	ori $v0, $0, 5		#take in g
	syscall
	addu $t4, $0, $v0	#$t4 set as g
	
	ori $v0, $0, 5		#take in b
	syscall
	addu $t5, $0, $v0	#$t5 set as b
	
	ori $t6, $0, 30
	ori $t7, $0, 59
	ori $t8, $0, 11
	
	multu $t3, $t6
	mflo $t6
	multu $t4, $t7
	mflo $t7
	multu $t5, $t8
	mflo $t8
	
	addu $t6, $t6, $t7
	addu $t6, $t6, $t8
	
	addiu $t7, $0, 255
	
	multu $t6, $t7
	mflo $t6
	
	addiu $t7, $0, 100
	addu $t8, $0, $t2
	
	multu $t7, $t8
	mflo $t7
	
	divu $t6, $t7
	mflo $t6
	
	addu $a0, $0, $t6	#print grey
	ori $v0, $0, 1
	syscall
	
	
	addu $t1, $t1, 1 	#i++
	slt $t8, $t1, $t0	#i < rows*colums
	bne $t8, $0, loop
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	