/*
 *	micro T-Kernel SVC interface library (lpc1114)
 */

#include <machine.h>
#include <tk/sysdef.h>
#include <sys/svc/tdfncd.h>
#include "utk_config.h"

	.code 16
	.syntax unified
	.thumb

#if USE_TRAP || (USE_DBGSPT && USE_HOOK_TRACE)
	.text
	.align 2
	.thumb_func
	.globl	Csym(td_cal_que)
	.type	Csym(td_cal_que), %function
Csym(td_cal_que):
	push	{r4,lr}
	ldr	ip, =TDFN_CAL_QUE
#if USE_TRAP
	svc	SVC_DEBUG_SUPPORT
#else
	bl	Csym(knl_call_dbgspt)
#endif
	pop	{r4,lr}
	bx	lr
#endif

