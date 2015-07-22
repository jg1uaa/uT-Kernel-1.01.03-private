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
 *      @(#)str_align_common.h (sys)
 *
 *	Bit alignment definitions for structure
 */

#ifndef __SYS_STR_ALIGN_COMMON_H__
#define __SYS_STR_ALIGN_COMMON_H__

#ifdef APP_AT91
#  include <sys/sysdepend/app_at91/str_align_depend.h>
#endif

#ifdef APP_LPC1114
#  include <sys/sysdepend/app_lpc1114/str_align_depend.h>
#endif

#ifdef APP_LPC2138
#  include <sys/sysdepend/app_lpc2138/str_align_depend.h>
#endif

#ifdef APP_LPC2388
#  include <sys/sysdepend/app_lpc2388/str_align_depend.h>
#endif

#ifdef APP_H83052
#  include <sys/sysdepend/app_h83052/str_align_depend.h>
#endif

#ifdef APP_H83069
#  include <sys/sysdepend/app_h83069/str_align_depend.h>
#endif

#ifdef APP_H8S2212
#  include <sys/sysdepend/app_h8s2212/str_align_depend.h>
#endif

#endif /* __SYS_STR_ALIGN_COMMON_H__ */
