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
 *	cpu_init.c (H83052)
 *	CPU-Dependent Initialization/Finalization
 */

#include "kernel.h"
#include "task.h"
#include "cpu_insn.h"
#include "tkdev_conf.h"


EXPORT	INT	knl_taskindp = 0;

#if USE_DYNAMIC_INTHDR
Noinit(EXPORT	FP	knl_intvec[N_INTVEC]);
#endif /* USE_DYNAMIC_INTHDR */

EXPORT INT	knl_int_nest = 0;

Noinit(EXPORT	UB	knl_tmp_stack[TMP_STACK_SZ]);

/*
 * CPU-dependent initialization
 */
EXPORT ER knl_cpu_initialize( void )
{
	return E_OK;
}

#if USE_CLEANUP
/*
 * CPU-dependent finalization
 */
EXPORT void knl_cpu_shutdown( void )
{
}
#endif /* USE_CLEANUP */

/*----------------------------------------------------------------------*/
/*	offset data in TCB						*/
/*----------------------------------------------------------------------*/
EXPORT	const UW	TCB_tskid = offsetof(TCB, tskid);
EXPORT	const UW	TCB_state = offsetof(TCB, state);
EXPORT	const UW	CTXB_ssp = offsetof(TCB, tskctxb.ssp);
