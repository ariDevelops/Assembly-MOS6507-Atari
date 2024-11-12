;Your goal here is to just store some values into zero-page memory positions.
		processor 6502
		seg Code  ; Define a new segment named "Code"
		org $F000 ; Define the origin of the ROM code at memory address $F000
Start:
; TODO:
		; Load the A register with the hexadecimal value $A
		; Load the X register with the binary value %11111111
		; Store the value in the A register into memory address $80
		; Store the value in the X register into memory address $81

org $FFFC   ; End the ROM by adding required values to memory position $FFFC
.word Start ; Put 2 bytes with the reset address at memory position $FFFC
.word Start ; Put 2 bytes with the break address at memory position $FFFE
