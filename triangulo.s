@Miguel Angel Rodriguez Siachoque
@Con colaboración de mi compañero Carlos Amorocho.
.data
@main
disab:      .word       0x00000000          
disbc:      .word       0x00000000
disca:      .word       0x00000000
cosA:       .word       0x00000000
cosB:       .word       0x00000000
cosC:       .word       0x00000000

.text
.global _start

_start:
            VLDR        S0, xa             
            VLDR        S1, xb
            VLDR        S2, ya
            VLDR        S3, yb
            BL          dist
            LDR         R0, = disab
            VSTR        S0, [R0]

            VLDR        S0, xb             
            VLDR        S1, xc
            VLDR        S2, yb
            VLDR        S3, yc
            BL          dist
            LDR         R0, = disbc
            VSTR        S0, [R0]

            VLDR        S0, xc             
            VLDR        S1, xa
            VLDR        S2, yc
            VLDR        S3, ya
            BL          dist
            LDR         R0, = disca
            VSTR        S0, [R0]

            LDR         R0, = disbc          
            VLDR        S0, [R0]
            LDR         R0, = disca
            VLDR        S1, [R0]
            LDR         R0, = disab
            VLDR        S2, [R0]
            BL          cosang
            LDR         R0, = cosA
            VSTR        S0, [R0]

            LDR         R0, = disca          
            VLDR        S0, [R0]
            LDR         R0, = disab
            VLDR        S1, [R0]
            LDR         R0, = disbc
            VLDR        S2, [R0]
            BL          cosang
            LDR         R0, = cosB
            VSTR        S0, [R0]

            LDR         R0, = disab          
            VLDR        S0, [R0]
            LDR         R0, = disbc
            VLDR        S1, [R0]
            LDR         R0, = disca
            VLDR        S2, [R0]
            BL          cosang
            LDR         R0, = cosC
            VSTR        S0, [R0]

            @ LDR         R0, = disab          
            @ VLDR        S8, [R0]
            @ LDR         R0, = disbc          
            @ VLDR        S9, [R0]
            @ LDR         R0, = disca          
            @ VLDR        S10, [R0]
            @ LDR         R0, = cosA
            @ VLDR        S12, [R0]
            @ LDR         R0, = cosB
            @ VLDR        S13, [R0]
            @ LDR         R0, = cosC
            @ VLDR        S14, [R0]


            LDR         R0, = cosA
            VLDR        S1, [R0]
            VLDR        S2, one_neg
            VCMP.F32    S1, S2
            VMRS        APSR_nzcv, FPSCR
            BEQ         notri

            LDR         R0, = cosB
            VLDR        S1, [R0]
            VLDR        S2, one_neg
            VCMP.F32    S1, S2
            VMRS        APSR_nzcv, FPSCR
            BEQ         notri

            LDR         R0, = cosC
            VLDR        S1, [R0]
            VLDR        S2, one_neg
            VCMP.F32    S1, S2
            VMRS        APSR_nzcv, FPSCR
            BEQ         notri

            LDR         R0, = cosA
            VLDR        S1, [R0]
            VLDR        S2, zero
            VCMP.F32    S1, S2
            VMRS        APSR_nzcv, FPSCR
            BLT         obtu
            BEQ         rect

            LDR         R0, = cosB
            VLDR        S1, [R0]
            VLDR        S2, zero
            VCMP.F32    S1, S2
            VMRS        APSR_nzcv, FPSCR
            BLT         obtu
            BEQ         rect

            LDR         R0, = cosC
            VLDR        S1, [R0]
            VLDR        S2, zero
            VCMP.F32    S1, S2
            VMRS        APSR_nzcv, FPSCR
            BLT         obtu
            BEQ         rect

            B           acu

notri:      VLDR        S0, one_neg
            B           exit
obtu:       VLDR        S0, two            
            B           exit
rect:       VLDR        S0, three
            B           exit
acu:        VLDR        S0, one
            B           exit

exit:       MOV         R7, #1
            SVC         0


zero:       .word       0x00000000
one:        .word       0x3F800000
one_neg:    .word       0xBF800000
two:        .word       0x40000000
three:      .word       0x40400000
ten:        .word       0x41200000

xa:         .word       0x40000000
ya:         .word       0x40000000
xb:         .word       0x3F800000
yb:         .word       0x3F800000
xc:         .word       0x00000000
yc:         .word       0x00000000
            

@S0: x1
@S1: x2
@S2: y1
@S3: y2
dist:
            VSUB.F32    S4, S1, S0     
            VMUL.F32    S5, S4, S4

            VSUB.F32    S4, S3, S2   
            VMUL.F32    S6, S4, S4

            VADD.F32    S1, S5, S6  
            VSQRT.F32   S0, S1

            BX          lr


@S0: a
@S1: b
@S2: c
cosang:
            VMUL.F32    S3, S0, S0          
            VMUL.F32    S4, S1, S1          
            VMUL.F32    S5, S2, S2        

            VLDR        S6, costwo         
            VMUL.F32    S7, S1, S6
            VMUL.F32    S6, S7, S2

            VADD.F32    S8, S4, S5          
            VSUB.F32    S7, S8, S3
            VDIV.F32    S9, S7, S6

            VMOV        S0, S9

            bx          lr

costwo:     .word       0x40000000
