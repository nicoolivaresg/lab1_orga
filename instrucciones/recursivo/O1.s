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
	sw	$31,36($sp)
	sw	$18,32($sp)
	sw	$17,28($sp)
	sw	$16,24($sp)
	move	$17,$4
	move	$18,$6
	addu	$3,$5,$6
	srl	$2,$3,31
	addu	$2,$2,$3
	sra	$2,$2,1
	sll	$2,$2,2
	addu	$2,$4,$2
	lw	$4,0($2)
	b	$L2
	move	$16,$5

$L3:
	move	$10,$2
	addiu	$2,$2,4
	lw	$7,-4($2)
	slt	$3,$7,$4
	bne	$3,$0,$L3
	addiu	$16,$16,1

	sll	$2,$6,2
	addu	$9,$17,$2
	lw	$3,0($9)
	slt	$8,$4,$3
	beq	$8,$0,$L4
	addiu	$2,$2,-4

$L19:
	addu	$2,$17,$2
$L5:
	move	$9,$2
	addiu	$2,$2,-4
	lw	$3,4($2)
	slt	$8,$4,$3
	bne	$8,$0,$L5
	addiu	$6,$6,-1

	slt	$2,$6,$16
	bne	$2,$0,$L16
	slt	$2,$5,$6

$L10:
	sw	$3,0($10)
$L17:
	sw	$7,0($9)
	addiu	$16,$16,1
	addiu	$6,$6,-1
$L2:
	slt	$2,$6,$16
	bne	$2,$0,$L6
	sll	$2,$16,2

	addu	$10,$17,$2
	lw	$7,0($10)
	slt	$3,$7,$4
	beq	$3,$0,$L7
	addiu	$2,$2,4

	b	$L3
	addu	$2,$17,$2

$L6:
	slt	$2,$5,$6
$L16:
	beq	$2,$0,$L18
	slt	$2,$16,$18

	move	$4,$17
	.option	pic0
	jal	ordenamiento_recursivo
	nop

	.option	pic2
	slt	$2,$16,$18
$L18:
	beq	$2,$0,$L1
	move	$6,$18

	move	$5,$16
	move	$4,$17
	.option	pic0
	jal	ordenamiento_recursivo
	nop

	.option	pic2
	b	$L15
	lw	$31,36($sp)

$L4:
	slt	$2,$6,$16
	beq	$2,$0,$L10
	slt	$2,$5,$6

	b	$L16
	nop

$L7:
	sll	$2,$6,2
	addu	$9,$17,$2
	lw	$3,0($9)
	slt	$8,$4,$3
	bne	$8,$0,$L19
	addiu	$2,$2,-4

	b	$L17
	sw	$3,0($10)

$L1:
	lw	$31,36($sp)
$L15:
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