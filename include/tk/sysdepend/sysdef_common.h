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
 *	@(#)sysdef_common.h (tk)
 *
 *	System dependencies definition.
 *	Included also from assembler program.
 */

#ifndef __TK_SYSDEF_COMMON_H__
#define __TK_SYSDEF_COMMON_H__

#if APP_LPC1114
#  include <tk/sysdepend/app_lpc1114/sysdef_depend.h>
#endif

#if APP_LPC2138
#  include <tk/sysdepend/app_lpc2138/sysdef_depend.h>
#endif

#if APP_LPC2388
#  include <tk/sysdepend/app_lpc2388/sysdef_depend.h>
#endif

#if APP_AT91
#  include <tk/sysdepend/app_at91/sysdef_depend.h>
#endif

#if APP_H83052
#  include <tk/sysdepend/app_h83052/sysdef_depend.h>
#endif

#if APP_H83069
#  include <tk/sysdepend/app_h83069/sysdef_depend.h>
#endif

#if APP_H8S2212
#  include <tk/sysdepend/app_h8s2212/sysdef_depend.h>
#endif

#endif /* __TK_SYSDEF_COMMON_H__ */
