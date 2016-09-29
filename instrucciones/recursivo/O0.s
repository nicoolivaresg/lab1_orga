.globl	ordenamiento_recursivo
	.set	nomips16
	.set	nomicromips
	.ent	ordenamiento_recursivo
	.type	ordenamiento_recursivo, @function
ordenamiento_recursivo:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	sw	$5,52($fp)
	sw	$6,56($fp)
	lw	$2,52($fp)
	sw	$2,24($fp)
	lw	$2,56($fp)
	sw	$2,28($fp)
	lw	$3,24($fp)
	lw	$2,28($fp)
	addu	$2,$3,$2
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	sll	$2,$2,2
	lw	$3,48($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,32($fp)
	b	$L2
	nop

$L4:
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L3:
	lw	$2,24($fp)
	sll	$2,$2,2
	lw	$3,48($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,32($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L4
	nop

	b	$L5
	nop

$L6:
	lw	$2,28($fp)
	addiu	$2,$2,-1
	sw	$2,28($fp)
$L5:
	lw	$2,28($fp)
	sll	$2,$2,2
	lw	$3,48($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,32($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L6
	nop

	lw	$3,24($fp)
	lw	$2,28($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L2
	nop

	lw	$2,24($fp)
	sll	$2,$2,2
	lw	$3,48($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,36($fp)
	lw	$2,24($fp)
	sll	$2,$2,2
	lw	$3,48($fp)
	addu	$2,$3,$2
	lw	$3,28($fp)
	sll	$3,$3,2
	lw	$4,48($fp)
	addu	$3,$4,$3
	lw	$3,0($3)
	sw	$3,0($2)
	lw	$2,28($fp)
	sll	$2,$2,2
	lw	$3,48($fp)
	addu	$2,$3,$2
	lw	$3,36($fp)
	sw	$3,0($2)
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
	lw	$2,28($fp)
	addiu	$2,$2,-1
	sw	$2,28($fp)
$L2:
	lw	$3,24($fp)
	lw	$2,28($fp)
	slt	$2,$2,$3
	beq	$2,$0,$L3
	nop

	lw	$3,52($fp)
	lw	$2,28($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L8
	nop

	lw	$6,28($fp)
	lw	$5,52($fp)
	lw	$4,48($fp)
	.option	pic0
	jal	ordenamiento_recursivo
	nop

	.option	pic2
$L8:
	lw	$3,56($fp)
	lw	$2,24($fp)
	slt	$2,$2,$3
	beq	$2,$0,$L10
	nop

	lw	$6,56($fp)
	lw	$5,24($fp)
	lw	$4,48($fp)
	.option	pic0
	jal	ordenamiento_recursivo
	nop

	.option	pic2
$L10:
	nop
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	ordenamiento_recursivo
	.size	ordenamiento_recursivo, .-ordenamiento_recursivo
	.rdata
	.align	2