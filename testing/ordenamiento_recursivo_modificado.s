	.file	1 "ordenamiento_recursivo_modificado.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
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
$LC0:
	.ascii	"ARGUMENTOS INSUFICIENTES\000"
	.align	2
$LC1:
	.ascii	"r\000"
	.align	2
$LC2:
	.ascii	"%d\012\000"
	.align	2
$LC3:
	.ascii	"ERROR DE LECTURA DE ARCHIVO\000"
	.align	2
$LC4:
	.ascii	"%d\000"
	.align	2
$LC6:
	.ascii	"Tiempo de ejecuci\303\263n recursivo (time.h): %f\012\000"
	.align	2
$LC7:
	.ascii	"w\000"
	.align	2
$LC8:
	.ascii	"ARCHIVO_SALIDA_RECURSIVO.txt\000"
	.align	2
$LC9:
	.ascii	"DEMACIADOS ARGUMENTOS\000"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,72,$31		# vars= 16, regs= 7/0, args= 16, gp= 8
	.mask	0x803f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-72
	addiu	$28,$28,%lo(__gnu_local_gp)
	li	$3,1			# 0x1
	sw	$31,68($sp)
	sw	$21,64($sp)
	sw	$20,60($sp)
	sw	$19,56($sp)
	sw	$18,52($sp)
	sw	$17,48($sp)
	sw	$16,44($sp)
	beq	$4,$3,$L22
	.cprestore	16

	li	$3,2			# 0x2
	beq	$4,$3,$L23
	move	$2,$5

	bne	$4,$0,$L34
	lw	$25,%call16(puts)($28)

	lui	$4,%hi($LC0)
	b	$L36
	addiu	$4,$4,%lo($LC0)

$L22:
	lui	$4,%hi($LC0)
	addiu	$4,$4,%lo($LC0)
$L38:
	lw	$25,%call16(puts)($28)
$L36:
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	li	$4,1			# 0x1
	lw	$28,16($sp)
$L37:
	lw	$25,%call16(exit)($28)
	.reloc	1f,R_MIPS_JALR,exit
1:	jalr	$25
	nop

$L23:
	lw	$25,%call16(fopen)($28)
	lui	$5,%hi($LC1)
	lw	$4,4($2)
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	addiu	$5,$5,%lo($LC1)

	lw	$28,16($sp)
	beq	$2,$0,$L25
	move	$17,$2

	lui	$16,%hi($LC2)
	lw	$25,%call16(__isoc99_fscanf)($28)
	addiu	$6,$sp,24
	addiu	$5,$16,%lo($LC2)
	.reloc	1f,R_MIPS_JALR,__isoc99_fscanf
1:	jalr	$25
	move	$4,$2

	li	$3,-1			# 0xffffffffffffffff
	bne	$2,$3,$L26
	lw	$28,16($sp)

$L25:
	lui	$4,%hi($LC3)
	b	$L38
	addiu	$4,$4,%lo($LC3)

$L26:
	lw	$4,24($sp)
	lui	$21,%hi($LC4)
	lw	$25,%call16(malloc)($28)
	addiu	$21,$21,%lo($LC4)
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	sll	$4,$4,2

	lw	$28,16($sp)
	move	$19,$2
	move	$18,$2
	move	$20,$2
$L27:
	lw	$25,%call16(feof)($28)
	.reloc	1f,R_MIPS_JALR,feof
1:	jalr	$25
	move	$4,$17

	bne	$2,$0,$L39
	lw	$28,16($sp)

	lw	$25,%call16(__isoc99_fscanf)($28)
	move	$6,$20
	move	$5,$21
	.reloc	1f,R_MIPS_JALR,__isoc99_fscanf
1:	jalr	$25
	move	$4,$17

	addiu	$20,$20,4
	b	$L27
	lw	$28,16($sp)

$L39:
	lw	$25,%call16(fclose)($28)
	move	$4,$17
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	addiu	$16,$16,%lo($LC2)

	lw	$28,16($sp)
	lw	$25,%call16(clock)($28)
	.reloc	1f,R_MIPS_JALR,clock
1:	jalr	$25
	nop

	move	$5,$0
	lw	$6,24($sp)
	move	$4,$19
	move	$17,$2
	.option	pic0
	jal	ordenamiento_recursivo
	.option	pic2
	addiu	$6,$6,-1

	lw	$28,16($sp)
	lw	$25,%call16(clock)($28)
	.reloc	1f,R_MIPS_JALR,clock
1:	jalr	$25
	nop

	lui	$4,%hi($LC6)
	mtc1	$2,$f0
	lui	$2,%hi($LC5)
	lw	$28,16($sp)
	addiu	$4,$4,%lo($LC6)
	lw	$25,%call16(printf)($28)
	cvt.d.w	$f2,$f0
	mtc1	$17,$f0
	move	$17,$0
	cvt.d.w	$f0,$f0
	sub.d	$f0,$f2,$f0
	ldc1	$f2,%lo($LC5)($2)
	div.d	$f0,$f0,$f2
	sdc1	$f0,32($sp)
	lw	$6,32($sp)
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	lw	$7,36($sp)

	lui	$5,%hi($LC7)
	lw	$28,16($sp)
	lui	$4,%hi($LC8)
	addiu	$5,$5,%lo($LC7)
	lw	$25,%call16(fopen)($28)
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	addiu	$4,$4,%lo($LC8)

	lw	$28,16($sp)
	move	$19,$2
$L29:
	lw	$2,24($sp)
	slt	$2,$17,$2
	beq	$2,$0,$L40
	lw	$25,%call16(fprintf)($28)

	move	$5,$16
	lw	$6,0($18)
	move	$4,$19
	addiu	$17,$17,1
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	addiu	$18,$18,4

	b	$L29
	lw	$28,16($sp)

$L40:
	lw	$25,%call16(fclose)($28)
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	move	$4,$19

	move	$4,$0
	b	$L37
	lw	$28,16($sp)

$L34:
	lui	$4,%hi($LC9)
	b	$L36
	addiu	$4,$4,%lo($LC9)

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
$LC5:
	.word	0
	.word	1093567616
	.ident	"GCC: (Debian 5.3.1-5) 5.3.1 20160101"
