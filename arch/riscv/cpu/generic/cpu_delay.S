/**
 * Copyright (c) 2018 Anup Patel.
 * All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 * @file cpu_delay.S
 * @author Anup Patel (anup@brainfault.org)
 * @brief Low-level implementation of delay functions 
 */

#include <riscv_asm.h>

	/* 
	 * arch specific delay loop
	 */
	.globl arch_delay_loop
arch_delay_loop:
	addi	a0, a0, -1
	bgtz	a0, arch_delay_loop
	ret

	/*
	 * arch specific machine cycle count from delay loop count
	 */
	.globl arch_delay_loop_cycles
arch_delay_loop_cycles:
	addi	sp, sp, -(__SIZEOF_POINTER__)
	REG_S	a1, (sp)
	li	a1, 2
	mul	a0, a0, a1
	REG_L	a1, (sp)
	addi	sp, sp, __SIZEOF_POINTER__
	ret
