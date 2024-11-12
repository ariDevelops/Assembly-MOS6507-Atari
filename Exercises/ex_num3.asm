		processor 6502
		seg Code
		org $F000
		
Start:
; TODO:
		LDA #15	; Load the A register with the literal decimal value 15
		TAX 	; Transfer the value from A to X
		TAY		; Transfer the value from A to Y
		
		TXA	; Transfer the value from X to A
		TYA	; Transfer the value from Y to A
		
		LDX #6	; Load X with the decimal value 6
		
		STX $80
		LDY $80		; Transfer the value from X to Y
		
		JMP Start
	
	org $FFFC
	.word Start
	.word Start
