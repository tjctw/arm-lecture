	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function
@int fib(int term, int val = 1, int prev = 0)
@{
@		if(term == 0) return prev;
@		if(term == 1) return val;
@		return fib(term - 1, val+prev, val);
@}

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}

	@ R4 = R0 - 0 (update flags)
	@ if(R0 <= 0) goto .L3 (which returns 0)
subs r4, r0, #0;
ble .L3;
	@ Compare R4 wtih 1
	@ If R4 == 1 goto .L4 (which returns 1)
cmp r4, #1;
beq .L4;
	@ R0 = R4 - 1
	@ Recursive call to fibonacci with R4 - 1 as parameter
add r0, r4, #0xFFFFFFFF
mov r3, r1
add r1, r1, r2
mov r2, r3
bl fibonacci;
	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, r1			@ R0 = R1
	pop {r3, r4, r5, pc}		@ EPILOG
	.size fibonacci, .-fibonacci
	.end
