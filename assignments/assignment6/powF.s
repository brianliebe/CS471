.file	"powF.c"
.text
.globl	powF
.type	powF, @function

powF:
.LFB0:
	.cfi_startproc
	pushq	%rbp				-- push rbp (return adr) to the stack
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp          -- move base pointer to start of new frame
	.cfi_def_cfa_register 6
	subq	$16, %rsp           -- move stack pointer to end of new frame
	movl	%edi, -4(%rbp)      -- move 'pow' argument to 4 bytes after rbp
	movl	%esi, -8(%rbp)      -- move 'base' argument to 8 bytes after rbp
	cmpl	$0, -4(%rbp)        -- compare 'pow' argument to 0
	jne	.L2
	movl	$1, %eax
	jmp	.L3
.L2:
	movl	-4(%rbp), %eax      -- move 'pow' argument to eax
	leal	-1(%rax), %edx      -- follow rax-1 and copy to edx
	movl	-8(%rbp), %eax      -- move 'base' argument to eax
	movl	%eax, %esi
	movl	%edx, %edi
	call	powF
	imull	-8(%rbp), %eax      -- multiply 'base' by eax and store to eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	powF, .-powF
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
