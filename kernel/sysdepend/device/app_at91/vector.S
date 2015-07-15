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
 * Vector Table
 */
        .section .vector,"ax"
        .code 32
        .align 0
        .global __reset
__reset:
        b       start              /* reset */
        .global undef_vector
undef_vector:
        b       undef_vector       /* undefined operation */
        .global swi_vector
swi_vector:
        b       swi_handler        /* software interrupt */
        .global prefetch_vector
prefetch_vector:
        b       prefetch_vector     /* prefetch abort */
        .global data_abort_vector
data_abort_vector:
        b       data_abort_vector  /* data abort */
        .global reserved_vector
reserved_vector:
        b       reserved_vector    /* reserved */
        .global irq_vector
irq_vector:
        ldr pc, [pc, #-0xf20]      /* IRQ: AIC_IVR */
        .global fiq_vector
fiq_vector:
        ldr pc, [pc, #-0xf20]      /* FIQ: AIC_FVR */

