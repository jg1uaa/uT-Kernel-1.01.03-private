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
 *	@(#)syscall_common.h (tk)
 *
 *	micro T-Kernel
 */

#ifndef __TK_SYSCALL_COMMON_H__
#define __TK_SYSCALL_COMMON_H__

#if APP_LPC1114
#  include <tk/sysdepend/app_lpc1114/cpuattr.h>
#  include <tk/sysdepend/app_lpc1114/cpudef.h>
#endif

#if APP_LPC2138
#  include <tk/sysdepend/app_lpc2138/cpuattr.h>
#  include <tk/sysdepend/app_lpc2138/cpudef.h>
#endif

#if APP_LPC2388
#  include <tk/sysdepend/app_lpc2388/cpuattr.h>
#  include <tk/sysdepend/app_lpc2388/cpudef.h>
#endif

#if APP_AT91
#  include <tk/sysdepend/app_at91/cpuattr.h>
#  include <tk/sysdepend/app_at91/cpudef.h>
#endif

#if APP_H83052
#  include <tk/sysdepend/app_h83052/cpuattr.h>
#  include <tk/sysdepend/app_h83052/cpudef.h>
#endif

#if APP_H83069
#  include <tk/sysdepend/app_h83069/cpuattr.h>
#  include <tk/sysdepend/app_h83069/cpudef.h>
#endif

#if APP_H8S2212
#  include <tk/sysdepend/app_h8s2212/cpuattr.h>
#  include <tk/sysdepend/app_h8s2212/cpudef.h>
#endif

#endif /* __TK_SYSCALL_COMMON_H__ */
