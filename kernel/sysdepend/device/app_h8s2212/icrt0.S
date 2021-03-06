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
 */

#include "utk_config.h"

#include <machine.h>
#include <tk/asm.h>

	.h8300s

#if USE_IMALLOC
	/* Low level memory manager information */
	.comm	Csym(knl_lowmem_top), 4	// Head of area (Low address)
	.comm	Csym(knl_lowmem_limit), 4	// End of area (High address)
#endif

#include "vector.S"

        .section .text
        .align     2
        .global    Csym(start)
Csym(start):
	mov.l   #RI_INTSTACK, er7

	ldc.b   #0xc0, ccr
	ldc.b	#0x07, exr

	mov.l   #__data_start, er2  /* dst address */
	mov.l   #__data_end, er3

	cmp.l   er2, er3
	ble     data_done           /* if __data_start >= __data_end */

	mov.l   #__data_org, er1    /* src address */

data_loop:
	mov.l   @er1+, er0
	mov.l   er0, @er2
	add.l   #4, er2

	cmp.l   er2, er3
        bgt     data_loop          /* if er2 < __data_end */

data_done:

#if USE_NOINIT
	mov.l   #__noinit_end, er2   /* dst address */
#else
	/* .bss */
	mov.l   #__bss_start, er2   /* dst address */
#endif
	mov.l   #__bss_end, er3

	cmp.l   er2, er3
	ble     bss_done           /* if __bss_start >= __bss_end */

	sub.l   er0, er0
bss_loop:
	mov.l	er0, @er2
	add     #4, er2
	cmp.l   er2, er3
	bgt     bss_loop           /* if er2 < __bss_end */

bss_done:

#if USE_IMALLOC
	mov.l   #SYSTEMAREA_TOP, er5
	cmp.l	er5, er3           /* _end or SYSTEMAREA_TOP */
	bge     no_mov             /* if er5 <= er3 */
	mov.l   er5, er3
no_mov:

	mov.l   er3, @Csym(knl_lowmem_top)	/* knl_lowmem_top = _end or SYSTEMAREA_TOP */
	mov.l   #SYSTEMAREA_END, er3
	mov.l   er3, @Csym(knl_lowmem_limit)	/* knl_lowmem_limit = SYSTEMAREA_END */
#endif

serial_init:
	jsr	@Csym(sio_init)		/* initialize serial I/O */

kernel_start:
	sub.l   er0, er0
	jsr     @Csym(main)
loop_trap:
	bra     loop_trap


