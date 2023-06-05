	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function write_nl
f.write_nl:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_b_1_,x10
	mv	x18, x10
# was:	mv	_tmp_4_, _param_b_1_
# 	mv	_let_res_3_,_tmp_4_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x18, x0, l.wBoolF_5_
# was:	bne	_let_res_3_, x0, l.wBoolF_5_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_5_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_8_
# was:	la	_tmp_7_, s.X_8_
# s.X_8_: string "\n"
# 	mv	_let_tmp_6_,_tmp_7_
# 	mv	x10,_tmp_7_
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	_write_nlres_2_, _let_res_3_
# 	mv	x10,_write_nlres_2_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -16
	li	x11, 3
# was:	li	_divide_L_14_, 3
	li	x12, 2
# was:	li	_divide_R_15_, 2
	li	x10, 0
# was:	li	_eq_L_12_, 0
	bne	x12, x10, l.falseLabel_16_
# was:	bne	_divide_R_15_, _eq_L_12_, l.falseLabel_16_
	li	x10, 7
# was:	li	x10, 7
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.falseLabel_16_:
	div	x10, x11, x12
# was:	div	_eq_L_12_, _divide_L_14_, _divide_R_15_
	li	x11, 1
# was:	li	_eq_R_13_, 1
	li	x12, 0
# was:	li	_arg_11_, 0
	bne	x10, x11, l.false_17_
# was:	bne	_eq_L_12_, _eq_R_13_, l.false_17_
	li	x12, 1
# was:	li	_arg_11_, 1
l.false_17_:
	mv	x10, x12
# was:	mv	x10, _arg_11_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x20, x10
# was:	mv	_let_x0_10_, x10
	li	x10, 3
# was:	li	_divide_L_23_, 3
	li	x12, 2
# was:	li	_divide_R_24_, 2
	li	x11, 0
# was:	li	_negate_22_, 0
	bne	x12, x11, l.falseLabel_25_
# was:	bne	_divide_R_24_, _negate_22_, l.falseLabel_25_
	li	x10, 8
# was:	li	x10, 8
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.falseLabel_25_:
	div	x11, x10, x12
# was:	div	_negate_22_, _divide_L_23_, _divide_R_24_
	sub	x10, x0, x11
# was:	sub	_eq_L_20_, x0, _negate_22_
	li	x11, 2
# was:	li	_negate_26_, 2
	sub	x11, x0, x11
# was:	sub	_eq_R_21_, x0, _negate_26_
	li	x12, 0
# was:	li	_arg_19_, 0
	bne	x10, x11, l.false_27_
# was:	bne	_eq_L_20_, _eq_R_21_, l.false_27_
	li	x12, 1
# was:	li	_arg_19_, 1
l.false_27_:
	mv	x10, x12
# was:	mv	x10, _arg_19_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x19, x10
# was:	mv	_let_x1_18_, x10
	li	x11, 3
# was:	li	_divide_L_32_, 3
	li	x10, 2
# was:	li	_negate_34_, 2
	sub	x12, x0, x10
# was:	sub	_divide_R_33_, x0, _negate_34_
	li	x10, 0
# was:	li	_eq_L_30_, 0
	bne	x12, x10, l.falseLabel_35_
# was:	bne	_divide_R_33_, _eq_L_30_, l.falseLabel_35_
	li	x10, 9
# was:	li	x10, 9
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.falseLabel_35_:
	div	x10, x11, x12
# was:	div	_eq_L_30_, _divide_L_32_, _divide_R_33_
	li	x11, 2
# was:	li	_negate_36_, 2
	sub	x12, x0, x11
# was:	sub	_eq_R_31_, x0, _negate_36_
	li	x11, 0
# was:	li	_arg_29_, 0
	bne	x10, x12, l.false_37_
# was:	bne	_eq_L_30_, _eq_R_31_, l.false_37_
	li	x11, 1
# was:	li	_arg_29_, 1
l.false_37_:
	mv	x10, x11
# was:	mv	x10, _arg_29_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x18, x10
# was:	mv	_let_x2_28_, x10
	li	x11, 3
# was:	li	_divide_L_43_, 3
	li	x10, 2
# was:	li	_negate_45_, 2
	sub	x12, x0, x10
# was:	sub	_divide_R_44_, x0, _negate_45_
	li	x10, 0
# was:	li	_negate_42_, 0
	bne	x12, x10, l.falseLabel_46_
# was:	bne	_divide_R_44_, _negate_42_, l.falseLabel_46_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.falseLabel_46_:
	div	x10, x11, x12
# was:	div	_negate_42_, _divide_L_43_, _divide_R_44_
	sub	x12, x0, x10
# was:	sub	_eq_L_40_, x0, _negate_42_
	li	x10, 1
# was:	li	_eq_R_41_, 1
	li	x11, 0
# was:	li	_arg_39_, 0
	bne	x12, x10, l.false_47_
# was:	bne	_eq_L_40_, _eq_R_41_, l.false_47_
	li	x11, 1
# was:	li	_arg_39_, 1
l.false_47_:
	mv	x10, x11
# was:	mv	x10, _arg_39_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
# 	mv	_let_x3_38_,x10
	and	x11, x0, x0
# was:	and	_arg_48_, x0, x0
	and	x12, x0, x0
# was:	and	_cond_53_, x0, x0
	and	x13, x0, x0
# was:	and	_cond_58_, x0, x0
# 	mv	_cond_63_,_let_x0_10_
	bne	x20, x0, l.then_61_
# was:	bne	_cond_63_, x0, l.then_61_
	j	l.else_62_
l.then_61_:
# 	mv	_and_L_59_,_let_x0_10_
# 	mv	_not_64_,_let_x1_18_
	xori	x13, x19, 1
# was:	xori	_and_R_60_, _not_64_, 1
	and	x13, x20, x13
# was:	and	_cond_58_, _and_L_59_, _and_R_60_
l.else_62_:
	bne	x13, x0, l.then_56_
# was:	bne	_cond_58_, x0, l.then_56_
	j	l.else_57_
l.then_56_:
	and	x12, x0, x0
# was:	and	_and_L_54_, x0, x0
# 	mv	_cond_69_,_let_x0_10_
	bne	x20, x0, l.then_67_
# was:	bne	_cond_69_, x0, l.then_67_
	j	l.else_68_
l.then_67_:
# 	mv	_and_L_65_,_let_x0_10_
# 	mv	_not_70_,_let_x1_18_
	xori	x12, x19, 1
# was:	xori	_and_R_66_, _not_70_, 1
	and	x12, x20, x12
# was:	and	_and_L_54_, _and_L_65_, _and_R_66_
l.else_68_:
# 	mv	_not_71_,_let_x2_28_
	xori	x13, x18, 1
# was:	xori	_and_R_55_, _not_71_, 1
	and	x12, x12, x13
# was:	and	_cond_53_, _and_L_54_, _and_R_55_
l.else_57_:
	bne	x12, x0, l.then_51_
# was:	bne	_cond_53_, x0, l.then_51_
	j	l.else_52_
l.then_51_:
	and	x11, x0, x0
# was:	and	_and_L_49_, x0, x0
	and	x12, x0, x0
# was:	and	_cond_76_, x0, x0
# 	mv	_cond_81_,_let_x0_10_
	bne	x20, x0, l.then_79_
# was:	bne	_cond_81_, x0, l.then_79_
	j	l.else_80_
l.then_79_:
# 	mv	_and_L_77_,_let_x0_10_
# 	mv	_not_82_,_let_x1_18_
	xori	x12, x19, 1
# was:	xori	_and_R_78_, _not_82_, 1
	and	x12, x20, x12
# was:	and	_cond_76_, _and_L_77_, _and_R_78_
l.else_80_:
	bne	x12, x0, l.then_74_
# was:	bne	_cond_76_, x0, l.then_74_
	j	l.else_75_
l.then_74_:
	and	x11, x0, x0
# was:	and	_and_L_72_, x0, x0
# 	mv	_cond_87_,_let_x0_10_
	bne	x20, x0, l.then_85_
# was:	bne	_cond_87_, x0, l.then_85_
	j	l.else_86_
l.then_85_:
# 	mv	_and_L_83_,_let_x0_10_
# 	mv	_not_88_,_let_x1_18_
	xori	x11, x19, 1
# was:	xori	_and_R_84_, _not_88_, 1
	and	x11, x20, x11
# was:	and	_and_L_72_, _and_L_83_, _and_R_84_
l.else_86_:
# 	mv	_not_89_,_let_x2_28_
	xori	x12, x18, 1
# was:	xori	_and_R_73_, _not_89_, 1
	and	x11, x11, x12
# was:	and	_and_L_49_, _and_L_72_, _and_R_73_
l.else_75_:
# 	mv	_and_R_50_,_let_x3_38_
	and	x11, x11, x10
# was:	and	_arg_48_, _and_L_49_, _and_R_50_
l.else_52_:
	mv	x10, x11
# was:	mv	x10, _arg_48_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
# 	mv	_mainres_9_,x10
# 	mv	x10,_mainres_9_
	addi	x2, x2, 16
	lw	x20, -16(x2)
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
s.X_8_:
	.word	1
	.asciz	"\n"
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