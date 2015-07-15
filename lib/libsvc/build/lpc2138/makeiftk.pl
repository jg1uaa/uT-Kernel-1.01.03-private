#! /usr/bin/env perl
#
# ----------------------------------------------------------------------
#     micro T-Kernel
#
#     Copyright (C) 2006-2014 by Ken Sakamura.
#     This software is distributed under the T-License 2.0.
# ----------------------------------------------------------------------
#
#     Version:   1.01.03
#     Released by T-Engine Forum(http://www.t-engine.org/) at 2014/09/01.
#
# ----------------------------------------------------------------------
#

#
#	makeiftk.pl
#
#	generate interface library for ARM7TDMI
#

sub makelib
{
	print LIB <<EndOfIfLibBody;
#include <machine.h>
#include <tk/sysdef.h>
#include <sys/svc/$fn_h>
#include "utk_config.h"

#if USE_TRAP || (USE_DBGSPT && USE_HOOK_TRACE)
	.text
	.balign	4
	.globl	Csym(${func})
	.type	Csym(${func}), %function
Csym(${func}):
	stmfd	sp!, {r4}
	add	r4, sp, #4
	stmfd	sp!, {lr}
	ldr	ip, =TFN_${Func}
#if USE_TRAP
	swi	SWI_SVC
#else
	bl	Csym(knl_call_entry)
#endif
	ldmfd	sp!, {lr}
	ldmfd	sp!, {r4}
	bx	lr
#endif

EndOfIfLibBody
}

1;
