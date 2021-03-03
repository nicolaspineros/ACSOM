.data
a:		.word	2
b:		.word	1
c:		.word	5
x:		.word	4
x2:		.word	0
ax2:	.word	0
bx:		.word	0
res:	.word	0

.text
main:	ldr r0,		=a
		ldr r1,		[r0]
		ldr r0,		=b
		ldr	r2,		[r0]
		ldr	r0,		=c
		ldr r3,		[r0]
		ldr r0,		=x
		ldr r4,		[r0]

		mul r0,		r4,	r4
		ldr	r5,		=x2
		str	r0,		[r5]

		mul r0,		r0,	r5
		ldr	r6,		=ax2
		str	r0,		[r6]

		mul	r0,		r2,	r4
		ldr	r7,		=bx
		str r0,		[r7]

		add	r0,		r6,	r7
		ldr r8,		=res
		str	r0,		[r8]

		add	r0,		r8,	r3
		ldr	r9,		=res
		str	r0,		[r9]
.end
