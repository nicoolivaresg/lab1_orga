.globl	ordenamiento_iterativo
	.set	nomips16
	.set	nomicromips
	.ent	ordenamiento_iterativo
	.type	ordenamiento_iterativo, @function
ordenamiento_iterativo:
	.frame	$fp,32,$31		# vars= 16, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$fp,28($sp)
	move	$fp,$sp
	sw	$4,32($fp)
	sw	$5,36($fp)
	li	$2,1			# 0x1
	sw	$2,8($fp)
	b	$L2
	nop

$L6:
	sw	$0,12($fp)
	b	$L3
	nop

$L5:
	lw	$2,12($fp)
	sll	$2,$2,2
	lw	$3,32($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,12($fp)
	addiu	$2,$2,1
	sll	$2,$2,2
	lw	$4,32($fp)
	addu	$2,$4,$2
	lw	$2,0($2)
	slt	$2,$2,$3
	beq	$2,$0,$L4
	nop

	lw	$2,12($fp)
	sll	$2,$2,2
	lw	$3,32($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,16($fp)
	lw	$2,12($fp)
	sll	$2,$2,2
	lw	$3,32($fp)
	addu	$2,$3,$2
	lw	$3,12($fp)
	addiu	$3,$3,1
	sll	$3,$3,2
	lw	$4,32($fp)
	addu	$3,$4,$3
	lw	$3,0($3)
	sw	$3,0($2)
	lw	$2,12($fp)
	addiu	$2,$2,1
	sll	$2,$2,2
	lw	$3,32($fp)
	addu	$2,$3,$2
	lw	$3,16($fp)
	sw	$3,0($2)
$L4:
	lw	$2,12($fp)
	addiu	$2,$2,1
	sw	$2,12($fp)
$L3:
	lw	$3,36($fp)
	lw	$2,8($fp)
	subu	$3,$3,$2
	lw	$2,12($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L5
	nop

	lw	$2,8($fp)
	addiu	$2,$2,1
	sw	$2,8($fp)
$L2:
	lw	$3,8($fp)
	lw	$2,36($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L6
	nop

	nop
	move	$sp,$fp
	lw	$fp,28($sp)
	addiu	$sp,$sp,32
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	ordenamiento_iterativo
	.size	ordenamiento_iterativo, .-ordenamiento_iterativo
	.rdata
	.align	2