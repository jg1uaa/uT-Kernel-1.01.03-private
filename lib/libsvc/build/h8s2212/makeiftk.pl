#! /usr/bin/perl
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
#	generate interface library for H8S
#

sub makelib
{
	print LIB <<EndOfIfLibBody;
#include <machine.h>
#include <tk/sysdef.h>
#include <sys/svc/$fn_h>
#include "utk_config.h"

	.h8300s

#if USE_TRAP || (USE_DBGSPT && USE_HOOK_TRACE)
	.text
	.balign	2
	.globl	Csym(${func})
Csym(${func}):
	mov.w	r0, \@-er7
	mov.w	#TFN_${Func}, r0
#if USE_TRAP
	trapa	#TRAP_SVC
#else
	jsr	Csym(knl_call_entry)
#endif
	inc.l	#2, er7
	rts
#endif

EndOfIfLibBody
}

1;
