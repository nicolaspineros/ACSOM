@Miguel Angel Rodriguez Siachoque.
@En colaboracion de mi compañero Carlos Amorocho.

.data
@ main
var:		.word	0
raiz:		.word	0
doublea:	.word	0

.text
.global _start

_start:
            LDR     R0, la
            CMP     R0, #0
            MOVEQ   R0, #-1  
            BEQ     exit

            LDR     R0, lb 
            MOV     R1, #0
            SUB     R2, R1, R0
            LDR     R1, = var
            STR     R2, [R1]

            LDR     R0, lb  
            MUL     R1, R0, R0
            MOV     R2, #4
            LDR     R3, la
            LDR     R4, lc
            MUL     R5, R2, R3
            MUL     R6, R5, R4
            SUB     R0, R1, R6
            BL      ecuaraiz
            LDR     R1, = raiz
            STR     R0, [R1]

            MOV     R0, #2  
            LDR     R1, la
            MUL     R2, R0, R1
            LDR     R3, = doublea
            STR     R2, [R3]

            LDR     R2, = var      
            LDR     R2, [R2]
            LDR     R3, = raiz
            LDR     R3, [R3]
            LDR     R4, = doublea
            LDR     R4, [R4]

            CMP     R3, #0  
            MOVLT   R0, #-1
            BLT     exit

            MOVEQ   R1, #-1   
            BEQ     posop  

            MOV     R5, R2   
            SUB     R5, R5, R3
            LDR     R6, k
            MUL     R7, R5, R6
            SDIV    R8, R7, R4
            MOV     R1, R8

posop:      MOV     R5, R2
            ADD     R5, R5, R3
            LDR     R6, k
            MUL     R7, R5, R6
            SDIV    R8, R7, R4
            MOV     R0, R8

exit:       MOV     R7, #1
            SVC     0

la:         .word   -2
lb:         .word   -3
lc:         .word   -1
k:          .word   100000


ecuaraiz:
            CMP     R0, #0   
            BLT     raizneg
            B       sqpos      

raizneg:    MOV     R0, #-1  
            B       resraiz

sqpos:      MOV     R2, #1             
            MOV     R3, #1
            LDR     R4, multa
            MUL     R1, R0, R4

            CMP     R0, #0 
            BEQ     resraiz

operraiz:   CMP     R3, R1              
            BGT     endoper
            ADD     R2, R2, #1
            MUL     R3, R2, R2
            B       operraiz

endoper:    SUB     R3, R2, #1
            LDR     R2, multb
            MUL     R0, R3, R2
resraiz:    bx      lr

multa:		.word   1
multb:      .word   1

.end