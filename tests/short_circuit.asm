	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function no_way
f.no_way:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	jal	f.no_way
# was:	jal	f.no_way, 
# 	mv	_no_wayres_1_,x10
# 	mv	x10,_no_wayres_1_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -12
	li	x10, 0
# was:	li	_cond_10_, 0
	bne	x10, x0, l.then_7_
# was:	bne	_cond_10_, x0, l.then_7_
	j	l.else_8_
l.then_7_:
	li	x19, 0
# was:	li	_and_L_5_, 0
	jal	f.no_way
# was:	jal	f.no_way, 
# 	mv	_and_R_6_,x10
	and	x11, x19, x10
# was:	and	_tmp_4_, _and_L_5_, _and_R_6_
	j	l.endif_9_
l.else_8_:
	and	x11, x0, x0
# was:	and	_tmp_4_, x0, x0
l.endif_9_:
# 	mv	_let_a_3_,_tmp_4_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_11_
# was:	bne	_let_a_3_, x0, l.wBoolF_11_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_11_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x10, 1
# was:	li	_cond_19_, 1
	bne	x10, x0, l.then_16_
# was:	bne	_cond_19_, x0, l.then_16_
	j	l.else_17_
l.then_16_:
	ori	x11, x18, 1
# was:	ori	_tmp_13_, _or_L_14_, 1
	j	l.endif_18_
l.else_17_:
	li	x18, 1
# was:	li	_or_L_14_, 1
	jal	f.no_way
# was:	jal	f.no_way, 
# 	mv	_or_R_15_,x10
	or	x11, x18, x10
# was:	or	_tmp_13_, _or_L_14_, _or_R_15_
l.endif_18_:
# 	mv	_let_b_12_,_tmp_13_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x11, x0, l.wBoolF_20_
# was:	bne	_let_b_12_, x0, l.wBoolF_20_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_20_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x10, 1
# was:	li	_mainres_2_, 1
# 	mv	x10,_mainres_2_
	addi	x2, x2, 12
	lw	x19, -12(x2)
	lw	x18, -8(x2)
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