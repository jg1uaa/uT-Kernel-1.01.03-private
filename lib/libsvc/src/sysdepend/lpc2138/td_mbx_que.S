/*
 *	micro T-Kernel SVC interface library (lpc2138)
 */

#include <machine.h>
#include <tk/sysdef.h>
#include <sys/svc/tdfncd.h>
#include "utk_config.h"

#if USE_TRAP || (USE_DBGSPT && USE_HOOK_TRACE)
	.text
	.balign	4
	.globl	Csym(td_mbx_que)
	.type	Csym(td_mbx_que), %function
Csym(td_mbx_que):
	stmfd	sp!, {lr}
	ldr	ip, =TDFN_MBX_QUE
#if USE_TRAP
	swi	SWI_DEBUG
#else
	bl	Csym(knl_call_dbgspt)
#endif
	ldmfd	sp!, {lr}
	bx	lr
#endif

