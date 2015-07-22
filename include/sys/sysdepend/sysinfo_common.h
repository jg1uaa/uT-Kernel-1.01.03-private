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
 *	@(#)sysinfo_common.h (sys)
 *
 *	System shared information
 */

#ifndef __SYS_SYSINFO_COMMON_H__
#define __SYS_SYSINFO_COMMON_H__

#ifdef APP_AT91
#  include <sys/sysdepend/app_at91/sysinfo_depend.h>
#endif

#ifdef APP_LPC1114
#  include <sys/sysdepend/app_lpc1114/sysinfo_depend.h>
#endif

#ifdef APP_LPC2138
#  include <sys/sysdepend/app_lpc2138/sysinfo_depend.h>
#endif

#ifdef APP_LPC2388
#  include <sys/sysdepend/app_lpc2388/sysinfo_depend.h>
#endif

#ifdef APP_H83052
#  include <sys/sysdepend/app_h83052/sysinfo_depend.h>
#endif

#ifdef APP_H83069
#  include <sys/sysdepend/app_h83069/sysinfo_depend.h>
#endif

#ifdef APP_H8S2212
#  include <sys/sysdepend/app_h8s2212/sysinfo_depend.h>
#endif

#endif /* __SYS_SYSINFO_COMMON_H__ */
