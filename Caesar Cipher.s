	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	cmpl	$2, -8(%rbp)
	je	LBB0_2
## %bb.1:
	callq	_print_usage
LBB0_2:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	leaq	L_.str(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB0_4
## %bb.3:
	callq	_encrypt
	jmp	LBB0_8
LBB0_4:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB0_6
## %bb.5:
	callq	_decrypt
	jmp	LBB0_7
LBB0_6:
	callq	_print_usage
LBB0_7:
	jmp	LBB0_8
LBB0_8:
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_encrypt                        ## -- Begin function encrypt
	.p2align	4, 0x90
_encrypt:                               ## @encrypt
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$560, %rsp                      ## imm = 0x230
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	leaq	L_.str.2(%rip), %rdi
	movb	$0, %al
	callq	_printf
	leaq	-272(%rbp), %rdi
	movq	___stdinp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdx
	movl	$256, %esi                      ## imm = 0x100
	callq	_fgets
	leaq	-272(%rbp), %rdi
	callq	_lowercaseString
	leaq	L_.str.3(%rip), %rdi
	movb	$0, %al
	callq	_printf
	leaq	-528(%rbp), %rdi
	movq	___stdinp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdx
	movl	$256, %esi                      ## imm = 0x100
	callq	_fgets
	leaq	-528(%rbp), %rdi
	leaq	L_.str.4(%rip), %rsi
	leaq	-532(%rbp), %rdx
	movb	$0, %al
	callq	_sscanf
	cmpl	$25, -532(%rbp)
	jg	LBB1_2
## %bb.1:
	cmpl	$0, -532(%rbp)
	jge	LBB1_3
LBB1_2:
	leaq	L_.str.5(%rip), %rdi
	xorl	%eax, %eax
                                        ## kill: def $al killed $al killed $eax
	callq	_printf
	movl	$1, %edi
	callq	_exit
LBB1_3:
	movl	-532(%rbp), %esi
	leaq	L_.str.6(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -536(%rbp)
LBB1_4:                                 ## =>This Inner Loop Header: Depth=1
	movslq	-536(%rbp), %rax
	movq	%rax, -552(%rbp)                ## 8-byte Spill
	leaq	-272(%rbp), %rdi
	callq	_strlen
	movq	%rax, %rcx
	movq	-552(%rbp), %rax                ## 8-byte Reload
	cmpq	%rcx, %rax
	jae	LBB1_15
## %bb.5:                               ##   in Loop: Header=BB1_4 Depth=1
	movslq	-536(%rbp), %rax
	movsbl	-272(%rbp,%rax), %eax
	subl	$97, %eax
                                        ## kill: def $al killed $al killed $eax
	movb	%al, -537(%rbp)
	movsbl	-537(%rbp), %eax
	cmpl	$25, %eax
	jg	LBB1_7
## %bb.6:                               ##   in Loop: Header=BB1_4 Depth=1
	movsbl	-537(%rbp), %eax
	cmpl	$0, %eax
	jge	LBB1_8
LBB1_7:                                 ##   in Loop: Header=BB1_4 Depth=1
	movslq	-536(%rbp), %rax
	movsbl	-272(%rbp,%rax), %esi
	leaq	L_.str.7(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB1_14
LBB1_8:                                 ##   in Loop: Header=BB1_4 Depth=1
	movsbl	-537(%rbp), %eax
	addl	-532(%rbp), %eax
	movl	$26, %ecx
	cltd
	idivl	%ecx
	movl	%edx, -544(%rbp)
	cmpl	$25, -544(%rbp)
	jle	LBB1_10
## %bb.9:                               ##   in Loop: Header=BB1_4 Depth=1
	movl	-544(%rbp), %eax
	subl	$26, %eax
	movl	%eax, -544(%rbp)
	jmp	LBB1_13
LBB1_10:                                ##   in Loop: Header=BB1_4 Depth=1
	cmpl	$0, -544(%rbp)
	jge	LBB1_12
## %bb.11:                              ##   in Loop: Header=BB1_4 Depth=1
	movl	-544(%rbp), %eax
	addl	$26, %eax
	movl	%eax, -544(%rbp)
LBB1_12:                                ##   in Loop: Header=BB1_4 Depth=1
	jmp	LBB1_13
LBB1_13:                                ##   in Loop: Header=BB1_4 Depth=1
	movl	-544(%rbp), %eax
	addl	$97, %eax
                                        ## kill: def $al killed $al killed $eax
	movb	%al, -537(%rbp)
	movsbl	-537(%rbp), %esi
	leaq	L_.str.7(%rip), %rdi
	movb	$0, %al
	callq	_printf
LBB1_14:                                ##   in Loop: Header=BB1_4 Depth=1
	movl	-536(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -536(%rbp)
	jmp	LBB1_4
LBB1_15:
	leaq	L_.str.8(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB1_17
## %bb.16:
	addq	$560, %rsp                      ## imm = 0x230
	popq	%rbp
	retq
LBB1_17:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_lowercaseString                ## -- Begin function lowercaseString
	.p2align	4, 0x90
_lowercaseString:                       ## @lowercaseString
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	$0, -12(%rbp)
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	movslq	-12(%rbp), %rax
	movq	%rax, -24(%rbp)                 ## 8-byte Spill
	movq	-8(%rbp), %rdi
	callq	_strlen
	movq	%rax, %rcx
	movq	-24(%rbp), %rax                 ## 8-byte Reload
	cmpq	%rcx, %rax
	je	LBB2_4
## %bb.2:                               ##   in Loop: Header=BB2_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movsbl	(%rax,%rcx), %edi
	callq	_tolower
	movb	%al, %dl
	movq	-8(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movb	%dl, (%rax,%rcx)
## %bb.3:                               ##   in Loop: Header=BB2_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB2_1
LBB2_4:
	movq	-8(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_decrypt                        ## -- Begin function decrypt
	.p2align	4, 0x90
_decrypt:                               ## @decrypt
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$304, %rsp                      ## imm = 0x130
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	leaq	L_.str.9(%rip), %rdi
	movb	$0, %al
	callq	_printf
	leaq	-272(%rbp), %rdi
	movq	___stdinp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdx
	movl	$256, %esi                      ## imm = 0x100
	callq	_fgets
	leaq	-272(%rbp), %rdi
	callq	_lowercaseString
	movl	$1, -276(%rbp)
LBB3_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB3_3 Depth 2
	cmpl	$26, -276(%rbp)
	je	LBB3_16
## %bb.2:                               ##   in Loop: Header=BB3_1 Depth=1
	movl	-276(%rbp), %esi
	leaq	L_.str.6(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -280(%rbp)
LBB3_3:                                 ##   Parent Loop BB3_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movslq	-280(%rbp), %rax
	movq	%rax, -296(%rbp)                ## 8-byte Spill
	leaq	-272(%rbp), %rdi
	callq	_strlen
	movq	%rax, %rcx
	movq	-296(%rbp), %rax                ## 8-byte Reload
	cmpq	%rcx, %rax
	jae	LBB3_14
## %bb.4:                               ##   in Loop: Header=BB3_3 Depth=2
	movslq	-280(%rbp), %rax
	movsbl	-272(%rbp,%rax), %eax
	subl	$97, %eax
                                        ## kill: def $al killed $al killed $eax
	movb	%al, -281(%rbp)
	movsbl	-281(%rbp), %eax
	cmpl	$25, %eax
	jg	LBB3_6
## %bb.5:                               ##   in Loop: Header=BB3_3 Depth=2
	movsbl	-281(%rbp), %eax
	cmpl	$0, %eax
	jge	LBB3_7
LBB3_6:                                 ##   in Loop: Header=BB3_3 Depth=2
	movslq	-280(%rbp), %rax
	movsbl	-272(%rbp,%rax), %esi
	leaq	L_.str.7(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB3_13
LBB3_7:                                 ##   in Loop: Header=BB3_3 Depth=2
	movsbl	-281(%rbp), %eax
	subl	-276(%rbp), %eax
	movl	$26, %ecx
	cltd
	idivl	%ecx
	movl	%edx, -288(%rbp)
	cmpl	$25, -288(%rbp)
	jle	LBB3_9
## %bb.8:                               ##   in Loop: Header=BB3_3 Depth=2
	movl	-288(%rbp), %eax
	subl	$26, %eax
	movl	%eax, -288(%rbp)
	jmp	LBB3_12
LBB3_9:                                 ##   in Loop: Header=BB3_3 Depth=2
	cmpl	$0, -288(%rbp)
	jge	LBB3_11
## %bb.10:                              ##   in Loop: Header=BB3_3 Depth=2
	movl	-288(%rbp), %eax
	addl	$26, %eax
	movl	%eax, -288(%rbp)
LBB3_11:                                ##   in Loop: Header=BB3_3 Depth=2
	jmp	LBB3_12
LBB3_12:                                ##   in Loop: Header=BB3_3 Depth=2
	movl	-288(%rbp), %eax
	addl	$97, %eax
                                        ## kill: def $al killed $al killed $eax
	movb	%al, -281(%rbp)
	movsbl	-281(%rbp), %esi
	leaq	L_.str.7(%rip), %rdi
	movb	$0, %al
	callq	_printf
LBB3_13:                                ##   in Loop: Header=BB3_3 Depth=2
	movl	-280(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -280(%rbp)
	jmp	LBB3_3
LBB3_14:                                ##   in Loop: Header=BB3_1 Depth=1
	jmp	LBB3_15
LBB3_15:                                ##   in Loop: Header=BB3_1 Depth=1
	movl	-276(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -276(%rbp)
	jmp	LBB3_1
LBB3_16:
	leaq	L_.str.8(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB3_18
## %bb.17:
	addq	$304, %rsp                      ## imm = 0x130
	popq	%rbp
	retq
LBB3_18:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_print_usage                    ## -- Begin function print_usage
	.p2align	4, 0x90
_print_usage:                           ## @print_usage
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	leaq	L_.str.10(%rip), %rdi
	xorl	%eax, %eax
                                        ## kill: def $al killed $al killed $eax
	movb	%al, -1(%rbp)                   ## 1-byte Spill
	callq	_printf
                                        ## kill: def $ecx killed $eax
	movb	-1(%rbp), %al                   ## 1-byte Reload
	leaq	L_.str.11(%rip), %rdi
	callq	_printf
	movl	$1, %edi
	callq	_exit
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"--encrypt"

L_.str.1:                               ## @.str.1
	.asciz	"--decrypt"

L_.str.2:                               ## @.str.2
	.asciz	"\nEnter the message you want to encrypt: "

L_.str.3:                               ## @.str.3
	.asciz	"Enter the desired shift value (integer between 1 and 25): "

L_.str.4:                               ## @.str.4
	.asciz	"%d"

L_.str.5:                               ## @.str.5
	.asciz	"Invalid shift value.\n\n"

L_.str.6:                               ## @.str.6
	.asciz	"%d. "

L_.str.7:                               ## @.str.7
	.asciz	"%c"

L_.str.8:                               ## @.str.8
	.asciz	"\n\n"

L_.str.9:                               ## @.str.9
	.asciz	"\nEnter the Caesar Cipher encoded text: "

L_.str.10:                              ## @.str.10
	.asciz	"\nIncorrect argument usage.\n"

L_.str.11:                              ## @.str.11
	.asciz	"Run either `./Caesar_Cipher --encrypt` or `./Caesar_Cipher --decrypt`.\n\n"

.subsections_via_symbols
