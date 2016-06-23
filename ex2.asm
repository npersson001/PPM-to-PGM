.data 0x0
	greyScale:	.asciiz	"P2\n"
	newline:	.asciiz	"\n"
	maxPGM:		.word 	255

.text 0x3000

main:
	ori $v0, $0, 5		#take in x1
	syscall
	addu $s0, $0, $v0	#$s0 set as x1
	
	ori $v0, $0, 5		#take in x2
	syscall
	addu $s1, $0, $v0	#$s1 set as x2
	
	ori $v0, $0, 5		#take in y1
	syscall
	addu $s2, $0, $v0	#$s0 set as y1
	
	ori $v0, $0, 5		#take in y2
	syscall
	addu $s3, $0, $v0	#$s0 set as y2
	
	la $a0, greyScale	#print P2
	ori $v0, $0, 4
	syscall
	
	ori $v0, $0, 5		#take in columns
	syscall
	addu $t0, $0, $v0	#$t0 set as columns
	
	ori $v0, $0, 5		#take in rows
	syscall
	addu $t1, $0, $v0	#$t1 set as rows
	
	ori $v0, $0, 5		#take in maxPGM
	syscall
	addu $t2, $0, $v0	#$t2 set as maxPGM
	
	subu $s4, $s1, $s0	#find new columns and rows
	subu $s5, $s3, $s2
	
	addiu $s4, $s4, 1
	addiu $s5, $s5, 1
	
	addu $a0, $0, $s4	#print columns
	ori $v0, $0, 1
	syscall
	
	la $a0, newline		#print newLine
	ori $v0, $0, 4
	syscall
	
	addu $a0, $0, $s5	#print rows
	ori $v0, $0, 1
	syscall
	
	la $a0, newline		#print newLine
	ori $v0, $0, 4
	syscall
	
	addiu $a0, $0, 255	#print maxPGM
	ori $v0, $0, 1
	syscall
	
	ori $t2, $0, 0		#$t2 set as i for outerLoop
	ori $t3, $0, 0		#$t3 set as j for innerLoop
	
outerLoop:
	ori $t3, $0, 0		#$t3 reset j to 0
	
innerLoop:	
	ori $v0, $0, 5		#take in grey
	syscall
	addu $t4, $0, $v0
	
	blt $t2, $s2, else
	bgt $t2, $s3, else
	blt $t3, $s0, else
	bgt $t3, $s1, else
	
	la $a0, newline		#print newLine
	ori $v0, $0, 4
	syscall
	
	addu $a0, $0, $t4	#print grey
	ori $v0, $0, 1
	syscall
	
else:
	addiu $t3, $t3, 1	#j++
	slt $s5, $t3, $t0
	bne $s5, $0, innerLoop
	
outerLoopIncrement:
	addiu $t2, $t2, 1	#i++
	slt $s4, $t2, $t1	#i < rows
	bne $s4, $0, outerLoop
	
exit:
	li $v0, 10
	syscall
	
	
	
	