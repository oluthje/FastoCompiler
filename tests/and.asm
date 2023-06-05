	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function test1
f.test1:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
	and	x12, x0, x0
# was:	and	_cond_5_, x0, x0
	li	x11, 1
# was:	li	_eq_L_11_, 1
	li	x10, 1
# was:	li	_eq_R_12_, 1
	li	x13, 0
# was:	li	_cond_10_, 0
	bne	x11, x10, l.false_13_
# was:	bne	_eq_L_11_, _eq_R_12_, l.false_13_
	li	x13, 1
# was:	li	_cond_10_, 1
l.false_13_:
	bne	x13, x0, l.then_8_
# was:	bne	_cond_10_, x0, l.then_8_
	j	l.else_9_
l.then_8_:
	li	x10, 1
# was:	li	_eq_L_14_, 1
	li	x12, 1
# was:	li	_eq_R_15_, 1
	li	x11, 0
# was:	li	_and_L_6_, 0
	bne	x10, x12, l.false_16_
# was:	bne	_eq_L_14_, _eq_R_15_, l.false_16_
	li	x11, 1
# was:	li	_and_L_6_, 1
l.false_16_:
	li	x10, 1
# was:	li	_eq_L_17_, 1
	li	x13, 1
# was:	li	_eq_R_18_, 1
	li	x12, 0
# was:	li	_and_R_7_, 0
	bne	x10, x13, l.false_19_
# was:	bne	_eq_L_17_, _eq_R_18_, l.false_19_
	li	x12, 1
# was:	li	_and_R_7_, 1
l.false_19_:
	and	x12, x11, x12
# was:	and	_cond_5_, _and_L_6_, _and_R_7_
l.else_9_:
	bne	x12, x0, l.then_2_
# was:	bne	_cond_5_, x0, l.then_2_
	j	l.else_3_
l.then_2_:
	li	x18, 1
# was:	li	_tmp_20_, 1
# 	mv	_test1res_1_,_tmp_20_
	mv	x10, x18
# was:	mv	x10, _test1res_1_
	jal	p.putint
# was:	jal	p.putint, x10
	j	l.endif_4_
l.else_3_:
	li	x18, 0
# was:	li	_tmp_21_, 0
# 	mv	_test1res_1_,_tmp_21_
	mv	x10, x18
# was:	mv	x10, _test1res_1_
	jal	p.putint
# was:	jal	p.putint, x10
l.endif_4_:
	mv	x10, x18
# was:	mv	x10, _test1res_1_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function test2
f.test2:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
	and	x13, x0, x0
# was:	and	_cond_26_, x0, x0
	li	x11, 1
# was:	li	_eq_L_32_, 1
	li	x10, 0
# was:	li	_eq_R_33_, 0
	li	x12, 0
# was:	li	_cond_31_, 0
	bne	x11, x10, l.false_34_
# was:	bne	_eq_L_32_, _eq_R_33_, l.false_34_
	li	x12, 1
# was:	li	_cond_31_, 1
l.false_34_:
	bne	x12, x0, l.then_29_
# was:	bne	_cond_31_, x0, l.then_29_
	j	l.else_30_
l.then_29_:
	li	x11, 1
# was:	li	_eq_L_35_, 1
	li	x12, 0
# was:	li	_eq_R_36_, 0
	li	x10, 0
# was:	li	_and_L_27_, 0
	bne	x11, x12, l.false_37_
# was:	bne	_eq_L_35_, _eq_R_36_, l.false_37_
	li	x10, 1
# was:	li	_and_L_27_, 1
l.false_37_:
	li	x13, 1
# was:	li	_divide_L_40_, 1
	li	x12, 0
# was:	li	_divide_R_41_, 0
	li	x11, 0
# was:	li	_eq_L_38_, 0
	bne	x12, x11, l.falseLabel_42_
# was:	bne	_divide_R_41_, _eq_L_38_, l.falseLabel_42_
	li	x10, 5
# was:	li	x10, 5
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.falseLabel_42_:
	div	x11, x13, x12
# was:	div	_eq_L_38_, _divide_L_40_, _divide_R_41_
	li	x12, 1
# was:	li	_eq_R_39_, 1
	li	x13, 0
# was:	li	_and_R_28_, 0
	bne	x11, x12, l.false_43_
# was:	bne	_eq_L_38_, _eq_R_39_, l.false_43_
	li	x13, 1
# was:	li	_and_R_28_, 1
l.false_43_:
	and	x13, x10, x13
# was:	and	_cond_26_, _and_L_27_, _and_R_28_
l.else_30_:
	bne	x13, x0, l.then_23_
# was:	bne	_cond_26_, x0, l.then_23_
	j	l.else_24_
l.then_23_:
	li	x18, 22
# was:	li	_tmp_44_, 22
# 	mv	_test2res_22_,_tmp_44_
	mv	x10, x18
# was:	mv	x10, _test2res_22_
	jal	p.putint
# was:	jal	p.putint, x10
	j	l.endif_25_
l.else_24_:
	li	x18, 0
# was:	li	_tmp_45_, 0
# 	mv	_test2res_22_,_tmp_45_
	mv	x10, x18
# was:	mv	x10, _test2res_22_
	jal	p.putint
# was:	jal	p.putint, x10
l.endif_25_:
	mv	x10, x18
# was:	mv	x10, _test2res_22_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	jal	f.test1
# was:	jal	f.test1, 
# 	mv	_let_a_47_,x10
	jal	f.test2
# was:	jal	f.test2, 
# 	mv	_mainres_46_,x10
# 	mv	x10,_mainres_46_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
f.ord:
	mv	x10, x10
	jr	x1
f.chr:
	andi	x10, x10, 255
	jr	x1
p.putint:
	li	x17, 1
	ecall
	li	x17, 4
	la	x10, m.space
	ecall
	jr	x1
p.getint:
	li	x17, 5
	ecall
	jr	x1
p.putchar:
	li	x17, 11
	ecall
	li	x17, 4
	la	x10, m.space
	ecall
	jr	x1
p.getchar:
	li	x17, 12
	ecall
	jr	x1
p.putstring:
	lw	x7, 0(x10)
	addi	x6, x10, 4
	add	x7, x6, x7
	li	x17, 11
l.ps_begin:
	bge	x6, x7, l.ps_done
	lbu	x10, 0(x6)
	ecall
	addi	x6, x6, 1
	j	l.ps_begin
l.ps_done:
	jr	x1
p.RuntimeError:
	mv	x6, x10
	li	x17, 4
	la	x10, m.RunErr
	ecall
	li	x17, 1
	mv	x10, x6
	ecall
	li	x17, 4
	la	x10, m.colon_space
	ecall
	mv	x10, x11
	ecall
	la	x10, m.nl
	ecall
	j	l.stop
	.data	
# Fixed strings for runtime I/O
m.RunErr:
	.asciz	"Runtime error at line "
m.colon_space:
	.asciz	": "
m.nl:
	.asciz	"\n"
m.space:
	.asciz	" "
# Message strings for specific errors
m.BadSize:
	.asciz	"negative array size"
m.BadIndex:
	.asciz	"array index out of bounds"
m.DivZero:
	.asciz	"division by zero"
# String literals (including lengths) from program
	.align	2
s.true:
	.word	4
	.asciz	"true"
	.align	2
s.false:
	.word	5
	.asciz	"false"
	.align	2
# Space for Fasto heap
d.heap:
	.space	100000