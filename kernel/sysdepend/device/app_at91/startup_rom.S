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

/*
 * Start up routine
 */
	.section	.ftext,"ax"
	.code	32
	.align	0
	.global	start
start:
	msr     cpsr, #(PSR_SVC|PSR_DI)

flashrom_init:
	/* r0 := EBI_BASE(0xffe00000) */
	mov     r0, #(0xff << 24)
	orr     r0, r0, #(0xe0 << 16)
	/* r1 := EBI_CSR0(0x100020b1) */
	mov	r1, #(0x10 << 24)
	orr	r1, r1, #(0x20 << 8)
	orr	r1, r1, #(0xb1)
	str     r1, [r0, #0]

crystal_init:
	add     r9, pc, #(crystal_immediates - . - 8)
	ldmia	r9, {r0-r2}
	/*
		r0 = ENABLE_16MHz_CRYSTAL,
		r1 = APMC_BASE | APMC_CGMR,
		r2 = APMC_BASE | APMC_SR
	*/

	/* enable 16MHz crystal */
	str     r0, [r1]
wait_stabilized:
	ldr     r3, [r2]
	tst     r3, #APMC_MOSCS
	beq     wait_stabilized         /* if APMC_SR & APMC_SR_MOSCS == 0 */
	/* use 16MHz */
	orr     r0, r0, #(0x01 << 14)   /* Main Oscillator */
	str     r0, [r1]

	b       setup_ram_vectors

crystal_immediates:
	.long	ENABLE_16MHz_CRYSTAL
	.long	APMC_BASE | APMC_CGMR
	.long	APMC_BASE | APMC_SR

ram_vector_table:
	ldr pc, [pc, #0x18]        /* reset */
	ldr pc, [pc, #0x18]        /* undefined operation */
	ldr pc, [pc, #0x18]        /* software interrupt */
	ldr pc, [pc, #0x18]        /* prefetch abort */
	ldr pc, [pc, #0x18]        /* data abort */
	nop                        /* reserved */
	ldr pc, [pc, #-0xf20]      /* IRQ: AIC_IVR */
	ldr pc, [pc, #-0xf20]      /* FIQ: AIC_FVR */

ram_vector_address_table:
	.long   start
	.long   undef_vector
	.long   swi_vector
	.long   prefetch_vector
	.long   data_abort_vector

setup_ram_vectors:
	mov     r8, #INTERNAL_RAM_START_BEFORE_REMAP /* dst*/
	sub     r9, pc, #(8 + . - ram_vector_table)  /* src */
	ldmia   r9!, {r0-r7} /* read vector */
	stmia   r8!, {r0-r7} /* write vector */
	ldmia   r9!, {r0-r4} /* read jump table */
	stmia   r8!, {r0-r4} /* write jump table */

/*
 * chip select and remap
 */
	ldr     r12, =after_remap_start
	/* r1 = EBI_BASE(0xffe00000) */
	mov	r1, #(0xff << 24)
	orr	r1, r1, #(0xe0 << 16)
	/* Flash ROM 0x10000000- */
	mov     r2, #0x10000000
	orr	r2, r2, #(0x20 << 8)
	orr	r2, r2, #(0xb1)
	str     r2, [r1, #0x00]
	/* SRAM 0x20000000- */
	mov     r2, #0x20000000
	orr	r2, r2, #(0x30 << 8)
	orr	r2, r2, #(0xa9)
	str     r2, [r1, #0x04]
	/* Ethernet 0x40000000- */
	mov     r2, #0x40000000
	orr	r2, r2, #(0x20 << 8)
	orr	r2, r2, #(0x35)
	str     r2, [r1, #0x1c]
	/* remap */
	mov     r2, #1
	str     r2, [r1, #EBI_RCR]

	mov  pc, r12

/* -------- From here, address space after remap --------------------- */

	.section	.ftext,"ax"
	.code	32
	.align	2
after_remap_start:

	/* .data */
	ldr     r8, =__data_org   /* src address */
	ldr     r9, =__data_start /* dst address */
	ldr     r10, =__data_end
	subs    r10, r10, r9       /* r10 := data_size */
	beq     data_done          /* if __data_start == __data_end */

data_loop:
	ldmia   r8!, {r0}
	stmia   r9!, {r0}
	subs    r10, r10, #4
	bne     data_loop          /* if data_size != 0 */

data_done:
	b	startup_common

