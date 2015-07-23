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
 *	cpu_calls.h (LPC2138)
 *	CPU-Dependent System Call
 */

#ifndef _CPU_CALLS_H_
#define _CPU_CALLS_H_

IMPORT void knl_get_reg( TCB *tcb, T_REGS *regs, T_EIT *eit, T_CREGS *cregs );
IMPORT void knl_set_reg( TCB *tcb, T_REGS *regs, T_EIT *eit, T_CREGS *cregs );

#endif
