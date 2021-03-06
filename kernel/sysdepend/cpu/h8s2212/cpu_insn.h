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
 *	cpu_insn.h (H8S2212)
 *	H8S2212-Dependent Operation
 */

#ifndef _CPU_INSN_
#define _CPU_INSN_

#include <sys/sysinfo.h>



/* ------------------------------------------------------------------------ */
/*
 *	Control register operation
 */

/*
 * Get CCR
 */
Inline UINT knl_getCCR( void )
{
	UB	ccr;
	Asm("stc.b ccr, %0l\n" : "=r"(ccr));
	return ccr;
}

/*
 * Set interrupt handler
 */
Inline void knl_define_inthdr( INT vecno, FP inthdr )
{
	knl_intvec[vecno] = inthdr;
}

/*
 * If it is the task-independent part, TRUE
 */
Inline BOOL knl_isTaskIndependent( void )
{
	return ( knl_taskindp > 0 )? TRUE: FALSE;
}

/*
 * Move to/Restore task independent part
 */
Inline void knl_EnterTaskIndependent( void )
{
	knl_taskindp++;
}
Inline void knl_LeaveTaskIndependent( void )
{
	knl_taskindp--;
}

/* ------------------------------------------------------------------------ */

#endif /* _CPU_INSN_ */
