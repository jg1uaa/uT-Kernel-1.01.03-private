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
#	Makefile for gmake
#	sysmain (system-dependent description)
#

# T-Engine type
MACHINE = at91
TETYPE	= app

# default rules
include ../../../../etc/makerules

# source files (system-dependent)
SRC	= power.c

# Manager and Driver objects (links to the kernel)
K_OBJ	=

# Start-up routines
TARGET_CRT0_RAM	= startup_ram.o
TARGET_CRT0_ROM	= startup_rom.o
TARGET_CRT0_COMMON	= icrt0.o vector.o

# include main makefile (common description)
include ../../src/Makefile.common
