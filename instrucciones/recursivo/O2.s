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
$L9:
	addu	$3,$5,$18
	move	$6,$18
	srl	$2,$3,31
	move	$16,$5
	addu	$2,$2,$3
	sra	$2,$2,1
	sll	$2,$2,2
	addu	$2,$17,$2
	lw	$7,0($2)
$L2:
	slt	$2,$6,$16
	bne	$2,$0,$L6
	sll	$2,$16,2

	addu	$8,$17,$2
	lw	$9,0($8)
	slt	$3,$9,$7
	beq	$3,$0,$L7
	addiu	$2,$2,4

	addu	$2,$17,$2
$L3:
	move	$8,$2
	addiu	$2,$2,4
	lw	$9,-4($2)
	slt	$3,$9,$7
	bne	$3,$0,$L3
	addiu	$16,$16,1

	sll	$2,$6,2
	addu	$3,$17,$2
	lw	$4,0($3)
	slt	$10,$7,$4
	beq	$10,$0,$L4
	addiu	$2,$2,-4

$L24:
	addu	$2,$17,$2
$L5:
	move	$3,$2
	addiu	$2,$2,-4
	lw	$4,4($2)
	slt	$10,$7,$4
	bne	$10,$0,$L5
	addiu	$6,$6,-1

	slt	$2,$6,$16
	beq	$2,$0,$L10
	nop

$L6:
	slt	$2,$5,$6
$L23:
	bne	$2,$0,$L19
	slt	$2,$16,$18

	beq	$2,$0,$L22
	lw	$31,36($sp)

	b	$L9
	move	$5,$16

$L4:
	slt	$2,$6,$16
	bne	$2,$0,$L23
	slt	$2,$5,$6

$L10:
	sw	$4,0($8)
$L21:
	addiu	$16,$16,1
	addiu	$6,$6,-1
	b	$L2
	sw	$9,0($3)

$L19:
	.option	pic0
	jal	ordenamiento_recursivo
	.option	pic2
	move	$4,$17

	slt	$2,$16,$18
	bne	$2,$0,$L9
	move	$5,$16

	lw	$31,36($sp)
$L22:
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	j	$31
	addiu	$sp,$sp,40

$L7:
	sll	$2,$6,2
	addu	$3,$17,$2
	lw	$4,0($3)
	slt	$10,$7,$4
	bne	$10,$0,$L24
	addiu	$2,$2,-4

	b	$L21
	sw	$4,0($8)

	.set	macro
	.set	reorder
	.end	ordenamiento_recursivo
	.size	ordenamiento_recursivo, .-ordenamiento_recursivo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2