.globl	ordenamiento_iterativo
	.set	nomips16
	.set	nomicromips
	.ent	ordenamiento_iterativo
	.type	ordenamiento_iterativo, @function
ordenamiento_iterativo:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	slt	$2,$5,2
	bne	$2,$0,$L8
	addiu	$8,$5,-1

	sll	$7,$8,2
	b	$L3
	addu	$7,$4,$7

$L5:
	lw	$3,0($2)
	lw	$5,4($2)
	slt	$6,$5,$3
	beq	$6,$0,$L4
	nop

	sw	$5,0($2)
	sw	$3,4($2)
$L4:
	addiu	$2,$2,4
	bne	$2,$7,$L5
	nop

$L6:
	addiu	$8,$8,-1
	beq	$8,$0,$L8
	addiu	$7,$7,-4

$L3:
	blez	$8,$L6
	nop

	b	$L5
	move	$2,$4

$L8:
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	ordenamiento_iterativo
	.size	ordenamiento_iterativo, .-ordenamiento_iterativo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2