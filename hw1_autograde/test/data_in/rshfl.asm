       .ORIG x3000
	LEA R0, A
	LDW R0, R0, #0
	RSHFL R1, R0, #0
	RSHFL R2, R0, #3
	RSHFL R3, R0, #5
	RSHFL R4, R0, #8
	RSHFL R5, R0, #9
	RSHFL R6, R0, #13
	RSHFL R7, R0, #15
	HALT
A	.FILL xdefa	
	.END