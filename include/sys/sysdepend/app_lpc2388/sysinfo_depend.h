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
 *	@(#)sysinfo_depend.h (sys/LPC2388)
 *
 *	System common information  
 */

#ifndef __SYS_SYSINFO_DEPEND_H__
#define __SYS_SYSINFO_DEPEND_H__

#ifdef __cplusplus
extern "C" {
#endif

#ifndef _in_asm_source_

#define N_INTVEC	112

IMPORT	FP	knl_intvec[];
IMPORT	W	knl_taskindp;
IMPORT	UW	knl_taskmode;

#endif /* _in_asm_source_ */

#ifdef __cplusplus
}
#endif
#endif /* __SYS_SYSINFO_DEPEND_H__ */
