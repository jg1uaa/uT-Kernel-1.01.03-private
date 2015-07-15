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

	b	startup_common
