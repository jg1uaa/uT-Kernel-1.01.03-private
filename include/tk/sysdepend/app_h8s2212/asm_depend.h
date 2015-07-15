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
 *	@(#)asm_depend.h (tk/H8S2212)
 *
 *	Assembler Macro for H8S
 */

#ifndef __TK_ASM_DEPEND_H__
#define __TK_ASM_DEPEND_H__

/*
 * Exception/Interrupt entry common processing
 */
 .macro	INT_ENTRY vecno
	.global knl_inthdr_entry\vecno
knl_inthdr_entry\vecno:
	stm.l	(er0-er1), @-er7	// ER0, ER1 save

	mov.l	#\vecno, er0
	mov.l	#Csym(knl_intvec), er1
	mov.l	@(\vecno * 4, er1), er1
	jmp	@er1

 .endm


#endif /* __TK_ASM_DEPEND_H__ */
