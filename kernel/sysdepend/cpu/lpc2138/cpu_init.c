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
 *	cpu_init.c (LPC2138)
 *	CPU-Dependent Initialization/Finalization
 */

#include "kernel.h"
#include "task.h"
#include "cpu_insn.h"
#include "tkdev_conf.h"


/* Temporal stack used when 'dispatch_to_schedtsk' is called */
Noinit(EXPORT	UB	knl_tmp_stack[TMP_STACK_SZ]);

/*
 * CPU-dependent initialization
 */
EXPORT ER knl_cpu_initialize( void )
{
#if USE_TRAP
IMPORT void knl_dispatch_entry( void );		/* Dispatcher call */
IMPORT void tk_ret_int_impl( void );		/* 'tk_ret_int()' only call */

	/* Register exception handler used on OS */
	knl_define_inthdr(SWI_RETINT,   tk_ret_int_impl);
	knl_define_inthdr(SWI_DISPATCH, knl_dispatch_entry);
#if USE_DBGSPT
IMPORT void knl_call_dbgspt( void );		/* Debugger support call */
	knl_define_inthdr(SWI_DEBUG,    knl_call_dbgspt);
#endif
#endif /* USE_TRAP */

#if USE_TRAP || CFN_MAX_SSYID > 0
IMPORT void knl_call_entry( void );			/* System call */
	knl_define_inthdr(SWI_SVC,      knl_call_entry);
#endif

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
