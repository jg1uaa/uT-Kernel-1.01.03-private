/*
 *	micro T-Kernel SVC interface library (lpc2388)
 */

#include <machine.h>
#include <tk/sysdef.h>
#include <sys/svc/tkfncd.h>
#include "utk_config.h"

#if USE_TRAP || (USE_DBGSPT && USE_HOOK_TRACE)
	.text
	.balign	4
	.globl	Csym(tk_rsm_tsk)
	.type	Csym(tk_rsm_tsk), %function
Csym(tk_rsm_tsk):
	stmfd	sp!, {r4}
	add	r4, sp, #4
	stmfd	sp!, {lr}
	ldr	ip, =TFN_RSM_TSK
#if USE_TRAP
	swi	SWI_SVC
#else
	bl	Csym(knl_call_entry)
#endif
	ldmfd	sp!, {lr}
	ldmfd	sp!, {r4}
	bx	lr
#endif

