/*
 *----------------------------------------------------------------------
 *    micro T-Kernel
 *
 *    Copyright (C) 2006-2014 by Ken Sakamura.
 *    This software is distributed under the T-License 2.0.
 *----------------------------------------------------------------------
 *
 *    Version:   1.01.03
 *    Released by T-Engine Forum(http://www.t-engine.org/) at 2014/09/01.
 *
 *----------------------------------------------------------------------
 */

/*
 *  @(#) icrt0.S
 *
 *    Start up module
 */

#include "hwconfig.h"
#include "utk_config.h"

#include <machine.h>
#include <tk/asm.h>


	.section	.ftext,"ax"
	.code	32
	.align	2
	.globl	startup_common
startup_common:

#if USE_NOINIT
	ldr     r9, =__noinit_end   /* dst address */
#else
	/* .bss */
	ldr     r9, =__bss_start   /* dst address */
#endif
	ldr     r10, =__bss_end
	subs    r10, r10, r9       /* r10 := data_size */
	beq     bss_done           /* if __bss_start == __bss_end */
	mov     r0, #0

bss_loop:
	stmia   r9!, {r0}
	subs    r10, r10, #4
	bne     bss_loop           /* if data_size != 0 */

bss_done:

#if USE_IMALLOC
	ldr     r5, =SYSTEMAREA_TOP
	cmp	r9, r5			// _end or SYSTEMAREA_TOP
	movhi	r5, r9			// Either of High addresses
	ldr	ip, =knl_lowmem_top
	str	r5, [ip]		// knl_lowmem_top = _end or SYSTEMAREA_TOP
	ldr     r5, =SYSTEMAREA_END
	ldr	ip, =knl_lowmem_limit
	str	r5, [ip]		// knl_lowmem_limit = SYSTEMAREA_END
#endif

#if USE_PROTECT_MODE
	ldr     r1, =SF_BASE
	ldr     r2, =PMRKEY
	orr     r2, r2, #(1 << 5)
	str     r2, [r1, #SF_PMR]
#endif

init_stacks:
	ldr  r1, =EXCEPTION_STACK_TOP
#if ABT_STACK_SIZE != 0
	msr  cpsr, #(PSR_ABT|PSR_DI)
	mov  sp, r1
	sub  r1, r1, #ABT_STACK_SIZE
#endif
#if UND_STACK_SIZE != 0
	msr  cpsr, #(PSR_UND|PSR_DI)
	mov  sp, r1
	sub  r1, r1, #UND_STACK_SIZE
#endif
#if USR_STACK_SIZE != 0
	msr  cpsr, #(PSR_USR|PSR_DI)
	mov  sp, =APPLICATION_STACK_TOP
#endif
#if FIQ_STACK_SIZE != 0
	msr  cpsr, #(PSR_FIQ|PSR_DI)
	mov  sp, r1
	sub  r1, r1, #FIQ_STACK_SIZE
#endif
	msr  cpsr, #(PSR_IRQ|PSR_DI)
	mov  sp, r1
	sub  r1, r1, #IRQ_STACK_SIZE

	msr  cpsr, #(PSR_SVC|PSR_DI)
	mov  sp, r1

#if USE_TMONITOR
	/* TC0, TC1, TC2 clock enable */
	ldr    r1, =APMC_BASE
	mov    r2, #(7 << 6)
	str    r2, [r1, #APMC_PCER]

	/* initialize serial I/O */
	ldr     r0, =Csym(sio_init)
	mov     lr, pc
	bx      r0
#endif

kernel_start:
	ldr	ip, =Csym(main)
	mov	r0, #0
	mov	lr, pc
	bx	ip
l_end:
	b     l_end

	.pool

	.globl	swi_handler
swi_handler:
	str    lr, [sp, #-4]!
	str    ip, [sp, #-4]!
	mrs    ip, spsr
	str    ip, [sp, #-4]!

	ldr    ip, [lr, #-4]   /* load SWI No. */
	bic    ip, ip, #(0xff << 24)

	ldr    lr, =Csym(knl_intvec) /* exception vector table */
	add    ip, lr, ip, LSL #2 /* lr := lr + ip*4 = vecaddr */
	ldr    lr, [ip]
	bx     lr

	.pool
