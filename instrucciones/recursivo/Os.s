.globl	ordenamiento_recursivo
	.set	nomips16
	.set	nomicromips
	.ent	ordenamiento_recursivo
	.type	ordenamiento_recursivo, @function
ordenamiento_recursivo:
	.frame	$sp,40,$31		# vars= 0, regs= 4/0, args= 16, gp= 8
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$18,32($sp)
	move	$18,$6
	sw	$17,28($sp)
	move	$17,$4
	sw	$31,36($sp)
	sw	$16,24($sp)
$L10:
	addu	$3,$5,$18
	move	$6,$18
	srl	$2,$3,31
	move	$16,$5
	addu	$2,$2,$3
	sra	$2,$2,1
	sll	$2,$2,2
	addu	$2,$17,$2
	lw	$3,0($2)
$L6:
	slt	$2,$6,$16
$L18:
	bne	$2,$0,$L7
	sll	$2,$16,2

	addu	$2,$17,$2
$L8:
	move	$7,$2
	addiu	$2,$2,4
	lw	$4,-4($2)
	slt	$8,$4,$3
	beql	$8,$0,$L15
	sll	$2,$6,2

	b	$L8
	addiu	$16,$16,1

$L15:
	addu	$2,$17,$2
$L4:
	move	$9,$2
	addiu	$2,$2,-4
	lw	$8,4($2)
	slt	$10,$3,$8
	beql	$10,$0,$L16
	slt	$2,$6,$16

	b	$L4
	addiu	$6,$6,-1

$L16:
	bne	$2,$0,$L18
	slt	$2,$6,$16

	sw	$8,0($7)
	addiu	$16,$16,1
	sw	$4,0($9)
	b	$L6
	addiu	$6,$6,-1

$L7:
	slt	$2,$5,$6
	beq	$2,$0,$L19
	slt	$2,$16,$18

	.option	pic0
	jal	ordenamiento_recursivo
	.option	pic2
	move	$4,$17

	slt	$2,$16,$18
$L19:
	bne	$2,$0,$L10
	move	$5,$16

	lw	$31,36($sp)
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	j	$31
	addiu	$sp,$sp,40

	.set	macro
	.set	reorder
	.end	ordenamiento_recursivo
	.size	ordenamiento_recursivo, .-ordenamiento_recursivo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2