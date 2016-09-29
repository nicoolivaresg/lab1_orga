	.file	1 "testASM.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.rdata
	.align	2
$LC1:
	.ascii	"Tiempo de ejecuci\303\263n recursivo (time.h): %f s\012\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	sw	$4,48($fp)
	sw	$5,52($fp)
	lw	$2,%call16(clock)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,clock
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$2,%call16(clock)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,clock
1:	jalr	$25
	nop

	lw	$28,16($fp)
	mtc1	$2,$f0
	nop
	cvt.d.w	$f2,$f0
	lw	$2,24($fp)
	mtc1	$2,$f0
	nop
	cvt.d.w	$f0,$f0
	sub.d	$f2,$f2,$f0
	lui	$2,%hi($LC0)
	ldc1	$f0,%lo($LC0)($2)
	div.d	$f0,$f2,$f0
	sdc1	$f0,32($fp)
	lw	$6,32($fp)
	lw	$7,36($fp)
	lui	$2,%hi($LC1)
	addiu	$4,$2,%lo($LC1)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.rdata
	.align	3
$LC0:
	.word	0
	.word	1093567616
	.ident	"GCC: (Debian 5.3.1-5) 5.3.1 20160101"
