	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
	li	x11, 8
# was:	li	_divide_L_3_, 8
	li	x12, 4
# was:	li	_divide_R_4_, 4
	li	x10, 0
# was:	li	_let_a_2_, 0
	bne	x12, x10, l.falseLabel_5_
# was:	bne	_divide_R_4_, _let_a_2_, l.falseLabel_5_
	li	x10, 2
# was:	li	x10, 2
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.falseLabel_5_:
	div	x10, x11, x12
# was:	div	_let_a_2_, _divide_L_3_, _divide_R_4_
	li	x11, 1
# was:	li	_divide_L_7_, 1
	li	x12, 0
# was:	li	_divide_R_8_, 0
	li	x18, 0
# was:	li	_let_b_6_, 0
	bne	x12, x18, l.falseLabel_9_
# was:	bne	_divide_R_8_, _let_b_6_, l.falseLabel_9_
	li	x10, 3
# was:	li	x10, 3
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.falseLabel_9_:
	div	x18, x11, x12
# was:	div	_let_b_6_, _divide_L_7_, _divide_R_8_
# 	mv	_tmp_11_,_let_a_2_
# 	mv	_let_c_10_,_tmp_11_
# 	mv	x10,_let_c_10_
	jal	p.putint
# was:	jal	p.putint, x10
# 	mv	_tmp_12_,_let_b_6_
# 	mv	_mainres_1_,_tmp_12_
	mv	x10, x18
# was:	mv	x10, _mainres_1_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	x10, _mainres_1_
	addi	x2, x2, 8
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