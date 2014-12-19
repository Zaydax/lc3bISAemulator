        .ORIG x3000             ; Pratik Gangwani 9/1/14 ECE3056 Lab 1EC
        LEA     R0, BYTEMASK    ; R0 has addr of Mask
        LDW     R1, R0, #0      ; R1 has x00FF
        LEA     R0, INPUT       ; R0 has addr of INPUT
        LDW     R2, R0, #0      ; R2 has x4000
        LDB     R3, R2, #0      ; R3 gets SEXT[x4000]
        AND     R0, R0, #0      ; set R0 to 0
        AND     R4, R0, #0      ; set R4 to 0
        AND     R3, R3, R1      ; Mask top byte of R3
        BRz     STOP            ; stop if the first input is 0
        
        LDB     R2, R2, #1      ; R2 gets SEXT[x4001]
        AND     R2, R2, R1      ; Mask top byte of R2
        BRz     STOP            ; stop if the second input is 0
        
        ADD     R4, R3, #0      ; 0 + R3 in R4
        ADD     R2, R2, #-1     ; Subtract one from R2
        BRz     STOP            ; STOP if R2 is zero

LOOP    ADD     R4, R4, R3      ; R4 + R3
        ADD     R2, R2, #-1     ; Subtract one from R2
        BRp     LOOP            ; LOOP if R2 is still positive

STOP    LEA     R0, OUTPUT      ; R0 has address of OUTPUT
        LDW     R5, R0, #0      ; R5 has value 0
        STW     R4, R5, #0      ; store value in R4 into R5 address
        HALT

BYTEMASK .FILL x00FF
INPUT    .FILL x4000
OUTPUT   .FILL x4002

        .END




