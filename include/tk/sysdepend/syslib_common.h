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
 *	@(#)syslib_common.h (tk)
 *
 *	System Library
 */

#ifndef __TK_SYSLIB_COMMON_H__
#define __TK_SYSLIB_COMMON_H__

/*
 * CPU-dependent
 */
#if APP_LPC1114
#  include <tk/sysdepend/app_lpc1114/syslib_depend.h>
#endif

#if APP_LPC2138
#  include <tk/sysdepend/app_lpc2138/syslib_depend.h>
#endif

#if APP_LPC2388
#  include <tk/sysdepend/app_lpc2388/syslib_depend.h>
#endif

#if APP_AT91
#  include <tk/sysdepend/app_at91/syslib_depend.h>
#endif

#if APP_H83052
#  include <tk/sysdepend/app_h83052/syslib_depend.h>
#endif

#if APP_H83069
#  include <tk/sysdepend/app_h83069/syslib_depend.h>
#endif

#if APP_H8S2212
#  include <tk/sysdepend/app_h8s2212/syslib_depend.h>
#endif

#endif /* __TK_SYSLIB_COMMON_H__ */
