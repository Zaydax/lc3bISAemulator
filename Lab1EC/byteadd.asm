	.ORIG x3000
	LEA     R0, BYTEMASK    ; R0 has addr of MASK
	LDW	R1, R0, #0 	; R1 has x00FF
	LEA     R0, INPUT       ; R0 has addr of IN
	LDW	R2, R0, #0 	; R2 has x4000
        LDB	R3, R2, #0 	; R3 gets SEXT[x4000]
        AND     R3, R3, R1      ; Mask top byte of R3
	LDB     R4, R2, #1      ; R4 gets SEXT[x4001]
        AND     R4, R4, R1      ; Mask top byte of R4
        ADD     R5, R4, R3      ; R5 = Byte(R4) + Byte(R3)
	LEA     R6, OUTPUT      ; R6 has addr of OUT
	LDW     R7, R6, #0      ; R7 has value x4002
	STW     R5, R7, #0      ; Store R5 at x4002
	HALT

BYTEMASK .FILL   x00FF
INPUT    .FILL   x4000
OUTPUT   .FILL   x4002
	
	.END
