/*
 *	micro T-Kernel SVC interface library (h83069)
 */

#include <machine.h>
#include <tk/sysdef.h>
#include <sys/svc/tdfncd.h>
#include "utk_config.h"

	.h8300h

#if USE_TRAP || (USE_DBGSPT && USE_HOOK_TRACE)
	.text
	.balign	2
	.globl	Csym(td_rdy_que)
Csym(td_rdy_que):
	mov.w	r0, @-er7
	mov.w	#TDFN_RDY_QUE, r0
#if USE_TRAP
	trapa	#TRAP_DEBUG
#else
	jsr	Csym(knl_call_dbgspt)
#endif
	inc.l	#2, er7
	rts
#endif

