;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
main:
			mov.b #00000001b, R4
			clrc 							; C lfag = 0
			rla.b R4
			rla.b R4
			rla.b R4
			rla.b R4
			rla.b R4
			rla.b R4
			rla.b R4
			rla.b R4
			rla.b R4

			mov.b #10000000b, R5
			clrc 							; C lfag = 0
			rra.b R5
			rra.b R5
			rra.b R5
			rra.b R5
			rra.b R5
			rra.b R5
			rra.b R5
			rra.b R5
			rra.b R5

			mov.b #00000001b, R6
			clrc
			rlc.b R6
			rlc.b R6
			rlc.b R6
			rlc.b R6
			rlc.b R6
			rlc.b R6
			rlc.b R6
			rlc.b R6
			rlc.b R6

			mov.b #1000000b, R7
			clrc
			rrc.b R7
			rrc.b R7
			rrc.b R7
			rrc.b R7
			rrc.b R7
			rrc.b R7
			rrc.b R7
			rrc.b R7
			rrc.b R7

			mov.b #25, R8
			clrc
			rla.b R8
			rla.b R8
			rla.b R8
			rla.b R8

			mov.b #224, R9
			clrc
			rrc.b R9
			rrc.b R9
			rrc.b R9
			rrc.b R9
			rrc.b R9
			rrc.b R9
			rrc.b R9
			rrc.b R9



			jmp main
                                            

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
