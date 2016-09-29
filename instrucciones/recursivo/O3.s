.globl	ordenamiento_recursivo
	.set	nomips16
	.set	nomicromips
	.ent	ordenamiento_recursivo
	.type	ordenamiento_recursivo, @function
ordenamiento_recursivo:
	.frame	$sp,104,$31		# vars= 40, regs= 10/0, args= 16, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-104
	move	$2,$6
	sw	$19,76($sp)
	move	$19,$4
	sw	$31,100($sp)
	sw	$fp,96($sp)
	sw	$23,92($sp)
	sw	$22,88($sp)
	sw	$21,84($sp)
	sw	$20,80($sp)
	sw	$18,72($sp)
	sw	$17,68($sp)
	sw	$16,64($sp)
	sw	$6,112($sp)
$L9:
	addu	$3,$5,$2
	move	$14,$2
	srl	$2,$3,31
	addu	$2,$2,$3
	move	$3,$5
	sra	$2,$2,1
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$6,0($2)
$L2:
	slt	$2,$14,$3
	bne	$2,$0,$L6
	sll	$2,$3,2

	addu	$8,$19,$2
	lw	$9,0($8)
	slt	$4,$9,$6
	beq	$4,$0,$L7
	addiu	$2,$2,4

	addu	$2,$19,$2
$L3:
	move	$8,$2
	addiu	$2,$2,4
	lw	$9,-4($2)
	slt	$4,$9,$6
	bne	$4,$0,$L3
	addiu	$3,$3,1

	sll	$2,$14,2
	addu	$7,$19,$2
	lw	$4,0($7)
	slt	$10,$6,$4
	beq	$10,$0,$L151
	addiu	$2,$2,-4

$L172:
	addu	$2,$19,$2
$L5:
	move	$7,$2
	addiu	$2,$2,-4
	lw	$4,4($2)
	slt	$10,$6,$4
	bne	$10,$0,$L5
	addiu	$14,$14,-1

$L151:
	slt	$2,$14,$3
	beq	$2,$0,$L83
	nop

$L6:
	slt	$2,$5,$14
	bne	$2,$0,$L129
	sw	$3,24($sp)

$L19:
	lw	$2,112($sp)
	slt	$2,$3,$2
	beq	$2,$0,$L154
	move	$5,$3

	b	$L9
	lw	$2,112($sp)

$L7:
	sll	$2,$14,2
	addu	$7,$19,$2
	lw	$4,0($7)
	slt	$10,$6,$4
	bne	$10,$0,$L172
	addiu	$2,$2,-4

$L83:
	sw	$4,0($8)
	addiu	$3,$3,1
	addiu	$14,$14,-1
	b	$L2
	sw	$9,0($7)

$L154:
	lw	$31,100($sp)
	lw	$fp,96($sp)
	lw	$23,92($sp)
	lw	$22,88($sp)
	lw	$21,84($sp)
	lw	$20,80($sp)
	lw	$19,76($sp)
	lw	$18,72($sp)
	lw	$17,68($sp)
	lw	$16,64($sp)
	j	$31
	addiu	$sp,$sp,104

$L129:
	sw	$14,28($sp)
	move	$10,$14
$L18:
	addu	$2,$5,$10
	move	$13,$5
	move	$3,$2
	srl	$2,$2,31
	addu	$2,$2,$3
	sra	$2,$2,1
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$6,0($2)
$L11:
	slt	$2,$10,$13
	bne	$2,$0,$L15
	sll	$2,$13,2

	addu	$7,$19,$2
	lw	$8,0($7)
	slt	$3,$8,$6
	beq	$3,$0,$L16
	addiu	$2,$2,4

	addu	$2,$19,$2
$L12:
	move	$7,$2
	addiu	$2,$2,4
	lw	$8,-4($2)
	slt	$3,$8,$6
	bne	$3,$0,$L12
	addiu	$13,$13,1

	sll	$2,$10,2
	addu	$3,$19,$2
	lw	$4,0($3)
	slt	$9,$6,$4
	beq	$9,$0,$L13
	addiu	$2,$2,-4

$L174:
	addu	$2,$19,$2
$L14:
	move	$3,$2
	addiu	$2,$2,-4
	lw	$4,4($2)
	slt	$9,$6,$4
	bne	$9,$0,$L14
	addiu	$10,$10,-1

	slt	$2,$10,$13
	beq	$2,$0,$L84
	nop

$L15:
	slt	$2,$5,$10
$L195:
	bne	$2,$0,$L173
	addu	$2,$5,$10

$L28:
	lw	$2,28($sp)
	slt	$2,$13,$2
	beq	$2,$0,$L155
	lw	$10,28($sp)

	b	$L18
	move	$5,$13

$L16:
	sll	$2,$10,2
	addu	$3,$19,$2
	lw	$4,0($3)
	slt	$9,$6,$4
	bne	$9,$0,$L174
	addiu	$2,$2,-4

$L84:
	sw	$4,0($7)
$L171:
	addiu	$13,$13,1
	addiu	$10,$10,-1
	b	$L11
	sw	$8,0($3)

$L155:
	b	$L19
	lw	$3,24($sp)

$L156:
	addu	$4,$19,$2
	lw	$3,0($4)
	slt	$11,$6,$3
	beq	$11,$0,$L22
	addiu	$2,$2,-4

$L177:
	addu	$2,$19,$2
$L23:
	move	$4,$2
	addiu	$2,$2,-4
	lw	$3,4($2)
	slt	$11,$6,$3
	bne	$11,$0,$L23
	addiu	$9,$9,-1

	slt	$2,$9,$12
	beq	$2,$0,$L85
	nop

$L24:
	slt	$2,$5,$9
$L176:
	bne	$2,$0,$L175
	addu	$2,$5,$9

$L37:
	slt	$2,$12,$10
	beq	$2,$0,$L28
	addu	$2,$12,$10

	move	$5,$12
$L173:
	move	$9,$10
	move	$3,$2
	srl	$2,$2,31
	move	$12,$5
	addu	$2,$2,$3
	sra	$2,$2,1
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$6,0($2)
$L20:
	slt	$2,$9,$12
	bne	$2,$0,$L24
	sll	$2,$12,2

	addu	$7,$19,$2
	lw	$8,0($7)
	slt	$3,$8,$6
	beq	$3,$0,$L25
	addiu	$2,$2,4

	addu	$2,$19,$2
$L21:
	move	$7,$2
	addiu	$2,$2,4
	lw	$8,-4($2)
	slt	$3,$8,$6
	bne	$3,$0,$L21
	addiu	$12,$12,1

	b	$L156
	sll	$2,$9,2

$L22:
	slt	$2,$9,$12
	bne	$2,$0,$L176
	slt	$2,$5,$9

$L85:
	sw	$3,0($7)
$L164:
	addiu	$12,$12,1
	addiu	$9,$9,-1
	b	$L20
	sw	$8,0($4)

$L25:
	sll	$2,$9,2
	addu	$4,$19,$2
	lw	$3,0($4)
	slt	$11,$6,$3
	bne	$11,$0,$L177
	addiu	$2,$2,-4

	b	$L164
	sw	$3,0($7)

$L157:
	addu	$3,$19,$2
	lw	$4,0($3)
	slt	$15,$6,$4
	beq	$15,$0,$L31
	addiu	$2,$2,-4

$L180:
	addu	$2,$19,$2
$L32:
	move	$3,$2
	addiu	$2,$2,-4
	lw	$4,4($2)
	slt	$15,$6,$4
	bne	$15,$0,$L32
	addiu	$8,$8,-1

	slt	$2,$8,$11
	beq	$2,$0,$L86
	nop

$L33:
	slt	$2,$5,$8
$L179:
	bne	$2,$0,$L178
	addu	$2,$5,$8

$L46:
	slt	$2,$11,$9
	beq	$2,$0,$L37
	addu	$2,$11,$9

	move	$5,$11
$L175:
	move	$8,$9
	move	$3,$2
	srl	$2,$2,31
	move	$11,$5
	addu	$2,$2,$3
	sra	$2,$2,1
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$6,0($2)
$L29:
	slt	$2,$8,$11
	bne	$2,$0,$L33
	sll	$2,$11,2

	addu	$7,$19,$2
	lw	$14,0($7)
	slt	$3,$14,$6
	beq	$3,$0,$L34
	addiu	$2,$2,4

	addu	$2,$19,$2
$L30:
	move	$7,$2
	addiu	$2,$2,4
	lw	$14,-4($2)
	slt	$3,$14,$6
	bne	$3,$0,$L30
	addiu	$11,$11,1

	b	$L157
	sll	$2,$8,2

$L31:
	slt	$2,$8,$11
	bne	$2,$0,$L179
	slt	$2,$5,$8

$L86:
	sw	$4,0($7)
$L165:
	addiu	$11,$11,1
	addiu	$8,$8,-1
	b	$L29
	sw	$14,0($3)

$L34:
	sll	$2,$8,2
	addu	$3,$19,$2
	lw	$4,0($3)
	slt	$15,$6,$4
	bne	$15,$0,$L180
	addiu	$2,$2,-4

	b	$L165
	sw	$4,0($7)

$L158:
	addu	$3,$19,$2
	lw	$4,0($3)
	slt	$24,$6,$4
	beq	$24,$0,$L40
	addiu	$2,$2,-4

$L194:
	addu	$2,$19,$2
$L41:
	move	$3,$2
	addiu	$2,$2,-4
	lw	$4,4($2)
	slt	$24,$6,$4
	bne	$24,$0,$L41
	addiu	$fp,$fp,-1

	slt	$2,$fp,$7
	beq	$2,$0,$L87
	nop

$L42:
	slt	$2,$5,$fp
$L182:
	bne	$2,$0,$L181
	addu	$2,$5,$fp

$L55:
	slt	$2,$7,$8
	beq	$2,$0,$L46
	addu	$2,$7,$8

	move	$5,$7
$L178:
	move	$fp,$8
	move	$3,$2
	srl	$2,$2,31
	move	$7,$5
	addu	$2,$2,$3
	sra	$2,$2,1
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$6,0($2)
$L38:
	slt	$2,$fp,$7
	bne	$2,$0,$L42
	sll	$2,$7,2

	addu	$14,$19,$2
	lw	$15,0($14)
	slt	$3,$15,$6
	beq	$3,$0,$L43
	addiu	$2,$2,4

	addu	$2,$19,$2
$L39:
	move	$14,$2
	addiu	$2,$2,4
	lw	$15,-4($2)
	slt	$3,$15,$6
	bne	$3,$0,$L39
	addiu	$7,$7,1

	b	$L158
	sll	$2,$fp,2

$L40:
	slt	$2,$fp,$7
	bne	$2,$0,$L182
	slt	$2,$5,$fp

$L87:
	sw	$4,0($14)
$L170:
	addiu	$7,$7,1
	addiu	$fp,$fp,-1
	b	$L38
	sw	$15,0($3)

$L159:
	addu	$3,$19,$2
	lw	$4,0($3)
	slt	$24,$6,$4
	beq	$24,$0,$L49
	addiu	$2,$2,-4

$L193:
	addu	$2,$19,$2
$L50:
	move	$3,$2
	addiu	$2,$2,-4
	lw	$4,4($2)
	slt	$24,$6,$4
	bne	$24,$0,$L50
	addiu	$22,$22,-1

	slt	$2,$22,$23
	beq	$2,$0,$L88
	nop

$L51:
	slt	$2,$5,$22
$L189:
	bne	$2,$0,$L183
	addu	$2,$5,$22

$L64:
	slt	$2,$23,$fp
	beq	$2,$0,$L55
	addu	$2,$23,$fp

	move	$5,$23
$L181:
	move	$22,$fp
	move	$3,$2
	srl	$2,$2,31
	move	$23,$5
	addu	$2,$2,$3
	sra	$2,$2,1
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$6,0($2)
$L47:
	slt	$2,$22,$23
	bne	$2,$0,$L51
	sll	$2,$23,2

	addu	$14,$19,$2
	lw	$15,0($14)
	slt	$3,$15,$6
	beq	$3,$0,$L52
	addiu	$2,$2,4

	addu	$2,$19,$2
$L48:
	move	$14,$2
	addiu	$2,$2,4
	lw	$15,-4($2)
	slt	$3,$15,$6
	bne	$3,$0,$L48
	addiu	$23,$23,1

	b	$L159
	sll	$2,$22,2

$L160:
	addu	$3,$19,$2
	lw	$4,0($3)
	slt	$24,$6,$4
	beq	$24,$0,$L58
	addiu	$2,$2,-4

$L192:
	addu	$2,$19,$2
$L59:
	move	$3,$2
	addiu	$2,$2,-4
	lw	$4,4($2)
	slt	$24,$6,$4
	bne	$24,$0,$L59
	addiu	$20,$20,-1

	slt	$2,$20,$21
	beq	$2,$0,$L89
	nop

$L60:
	slt	$2,$5,$20
$L188:
	bne	$2,$0,$L184
	addu	$2,$5,$20

$L73:
	slt	$2,$21,$22
	beq	$2,$0,$L64
	addu	$2,$21,$22

	move	$5,$21
$L183:
	move	$20,$22
	move	$3,$2
	srl	$2,$2,31
	move	$21,$5
	addu	$2,$2,$3
	sra	$2,$2,1
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$6,0($2)
$L56:
	slt	$2,$20,$21
	bne	$2,$0,$L60
	sll	$2,$21,2

	addu	$14,$19,$2
	lw	$15,0($14)
	slt	$3,$15,$6
	beq	$3,$0,$L61
	addiu	$2,$2,4

	addu	$2,$19,$2
$L57:
	move	$14,$2
	addiu	$2,$2,4
	lw	$15,-4($2)
	slt	$3,$15,$6
	bne	$3,$0,$L57
	addiu	$21,$21,1

	b	$L160
	sll	$2,$20,2

$L161:
	addu	$3,$19,$2
	lw	$15,0($3)
	slt	$24,$4,$15
	beq	$24,$0,$L67
	addiu	$2,$2,-4

$L191:
	addu	$2,$19,$2
$L68:
	move	$3,$2
	addiu	$2,$2,-4
	lw	$15,4($2)
	slt	$24,$4,$15
	bne	$24,$0,$L68
	addiu	$17,$17,-1

	slt	$2,$17,$18
	beq	$2,$0,$L90
	nop

$L69:
	slt	$2,$5,$17
$L187:
	bne	$2,$0,$L185
	addu	$2,$5,$17

$L82:
	slt	$2,$18,$20
	beq	$2,$0,$L73
	addu	$2,$18,$20

	move	$5,$18
$L184:
	move	$17,$20
	move	$3,$2
	srl	$2,$2,31
	move	$18,$5
	addu	$2,$2,$3
	sra	$2,$2,1
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$4,0($2)
$L65:
	slt	$2,$17,$18
	bne	$2,$0,$L69
	sll	$2,$18,2

	addu	$6,$19,$2
	lw	$14,0($6)
	slt	$3,$14,$4
	beq	$3,$0,$L70
	addiu	$2,$2,4

	addu	$2,$19,$2
$L66:
	move	$6,$2
	addiu	$2,$2,4
	lw	$14,-4($2)
	slt	$3,$14,$4
	bne	$3,$0,$L66
	addiu	$18,$18,1

	b	$L161
	sll	$2,$17,2

$L163:
	addu	$15,$19,$2
	lw	$24,0($15)
	slt	$25,$3,$24
	beq	$25,$0,$L76
	addiu	$2,$2,-4

$L190:
	addu	$2,$19,$2
$L77:
	move	$15,$2
	addiu	$2,$2,-4
	lw	$24,4($2)
	slt	$25,$3,$24
	bne	$25,$0,$L77
	addiu	$6,$6,-1

	slt	$2,$6,$16
	beq	$2,$0,$L91
	nop

$L78:
	slt	$2,$5,$6
$L186:
	bne	$2,$0,$L162
	nop

$L80:
	slt	$2,$16,$17
	beq	$2,$0,$L82
	addu	$2,$16,$17

	move	$5,$16
$L185:
	move	$6,$17
	move	$3,$2
	srl	$2,$2,31
	move	$16,$5
	addu	$2,$2,$3
	sra	$2,$2,1
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$3,0($2)
$L74:
	slt	$2,$6,$16
	bne	$2,$0,$L78
	sll	$2,$16,2

	addu	$4,$19,$2
	lw	$14,0($4)
	slt	$15,$14,$3
	beq	$15,$0,$L79
	addiu	$2,$2,4

	addu	$2,$19,$2
$L75:
	move	$4,$2
	addiu	$2,$2,4
	lw	$14,-4($2)
	slt	$15,$14,$3
	bne	$15,$0,$L75
	addiu	$16,$16,1

	b	$L163
	sll	$2,$6,2

$L76:
	slt	$2,$6,$16
	bne	$2,$0,$L186
	slt	$2,$5,$6

$L91:
	sw	$24,0($4)
$L166:
	addiu	$16,$16,1
	addiu	$6,$6,-1
	b	$L74
	sw	$14,0($15)

$L67:
	slt	$2,$17,$18
	bne	$2,$0,$L187
	slt	$2,$5,$17

$L90:
	sw	$15,0($6)
$L167:
	addiu	$18,$18,1
	addiu	$17,$17,-1
	b	$L65
	sw	$14,0($3)

$L58:
	slt	$2,$20,$21
	bne	$2,$0,$L188
	slt	$2,$5,$20

$L89:
	sw	$4,0($14)
$L168:
	addiu	$21,$21,1
	addiu	$20,$20,-1
	b	$L56
	sw	$15,0($3)

$L49:
	slt	$2,$22,$23
	bne	$2,$0,$L189
	slt	$2,$5,$22

$L88:
	sw	$4,0($14)
$L169:
	addiu	$23,$23,1
	addiu	$22,$22,-1
	b	$L47
	sw	$15,0($3)

$L162:
	move	$4,$19
	sw	$7,56($sp)
	sw	$8,52($sp)
	sw	$11,48($sp)
	sw	$9,44($sp)
	sw	$12,40($sp)
	sw	$10,36($sp)
	.option	pic0
	jal	ordenamiento_recursivo
	.option	pic2
	sw	$13,32($sp)

	lw	$7,56($sp)
	lw	$8,52($sp)
	lw	$11,48($sp)
	lw	$9,44($sp)
	lw	$12,40($sp)
	lw	$10,36($sp)
	b	$L80
	lw	$13,32($sp)

$L79:
	sll	$2,$6,2
	addu	$15,$19,$2
	lw	$24,0($15)
	slt	$25,$3,$24
	bne	$25,$0,$L190
	addiu	$2,$2,-4

	b	$L166
	sw	$24,0($4)

$L70:
	sll	$2,$17,2
	addu	$3,$19,$2
	lw	$15,0($3)
	slt	$24,$4,$15
	bne	$24,$0,$L191
	addiu	$2,$2,-4

	b	$L167
	sw	$15,0($6)

$L61:
	sll	$2,$20,2
	addu	$3,$19,$2
	lw	$4,0($3)
	slt	$24,$6,$4
	bne	$24,$0,$L192
	addiu	$2,$2,-4

	b	$L168
	sw	$4,0($14)

$L52:
	sll	$2,$22,2
	addu	$3,$19,$2
	lw	$4,0($3)
	slt	$24,$6,$4
	bne	$24,$0,$L193
	addiu	$2,$2,-4

	b	$L169
	sw	$4,0($14)

$L43:
	sll	$2,$fp,2
	addu	$3,$19,$2
	lw	$4,0($3)
	slt	$24,$6,$4
	bne	$24,$0,$L194
	addiu	$2,$2,-4

	b	$L170
	sw	$4,0($14)

$L13:
	slt	$2,$10,$13
	bne	$2,$0,$L195
	slt	$2,$5,$10

	b	$L171
	sw	$4,0($7)

	.set	macro
	.set	reorder
	.end	ordenamiento_recursivo
	.size	ordenamiento_recursivo, .-ordenamiento_recursivo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2