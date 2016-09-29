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
	li	$3,1			# 0x1
$L2:
	slt	$2,$3,$5
	beq	$2,$0,$L10
	move	$6,$0

	subu	$9,$5,$3
	move	$2,$4
$L6:
	slt	$7,$6,$9
	beql	$7,$0,$L2
	addiu	$3,$3,1

	lw	$7,0($2)
	lw	$8,4($2)
	slt	$10,$8,$7
	beq	$10,$0,$L9
	addiu	$6,$6,1

	sw	$8,0($2)
	sw	$7,4($2)
$L9:
	b	$L6
	addiu	$2,$2,4

$L10:
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	ordenamiento_iterativo
	.size	ordenamiento_iterativo, .-ordenamiento_iterativo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2