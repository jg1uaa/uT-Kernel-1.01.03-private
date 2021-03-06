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
 *	@(#)asm_depend.h (tk/H83052)
 *
 *	Assembler Macro for H8/300H
 */

#ifndef __TK_ASM_DEPEND_H__
#define __TK_ASM_DEPEND_H__

/*
 * Exception/Interrupt entry common processing
 */
 .macro	INT_ENTRY vecno
	.global knl_inthdr_entry\vecno
knl_inthdr_entry\vecno:
	push.l	er0
	push.l	er1

	sub.l	er0, er0
	mov.b	#\vecno, r0l
	mov.l	#Csym(knl_intvec), er1
	mov.l	@(\vecno * 4, er1), er1
	jmp	@er1

 .endm


#endif /* __TK_ASM_DEPEND_H__ */
