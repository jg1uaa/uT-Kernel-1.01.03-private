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
#	makeifex.pl
#
#	generate extended SVC interface library for H8/300H
#

sub makelibex
{
	print LIB <<EndOfExtIfLibBody;
#include <machine.h>
#include <tk/sysdef.h>
#include <sys/svc/$fn_h>
#include "utk_config.h"

	.h8300h

	.text
	.balign	2
	.globl	Csym(${func})
	.type	Csym(${func}), \@function
Csym(${func}):
	mov.l	er1, \@-er7
	mov.l	er0, \@-er7
	mov.l	er7, er1
	mov.l	er2, \@-er7
	mov.w	\@fno, r0
	trapa	#TRAP_SVC
	add.l	#3*4, er7
	rts

	.balign	2
fno:	.word	${prefix}_${Func}_FN

EndOfExtIfLibBody
}

1;
