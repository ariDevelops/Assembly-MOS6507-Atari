		processor 6502
		seg	Code
		org $1000	;define o codigo no addr 4096

Start:
		LDA #0		;Carrega o acumulador com 0 
		LDX #$ff    ;Carrega o Index X com 0xff
		STA	$ff		;armazena o valor do acumulador no addr 0xff
		
Clean_mem:
		STA $0,X	;armazena 0 no addr 0x00 + X("0xff")
		DEX			;decrementa X em 1 
		BNE Clean_mem
		
CartData:		
		LDA	#$0A	;carrega o acumulador com 0x0a
		TAX			;Transfere o valor do acumulador para X
		TAY			;Transfere o valor do acumulador para Y
		
		STA $80		;Guarda o Valor de a no addr 128
		STX	$81		;Guarda o Valor de a no addr 129
		STY	$82		;Guarda o Valor de a no addr 130	
	
		org $1FFC 	; define o codigo no addr 8188
		.word Start ; 0x1FFD ou 8189 
		.word Start ; 0x1FFE ou 8190
