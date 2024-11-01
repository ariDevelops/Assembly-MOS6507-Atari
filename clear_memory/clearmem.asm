	processor 6502 

	seg code  ; comece um novo segmento de codigo 
	org $F000 ; define a origem do codigo no addr $F000 (zero)

Start:
	sei	  ; Disable interrupts (desabilita instruções)	
	cld	  ; Disable the BCD decimal math mode (desliga modo decimal)
	ldx #$FF  ; carrega o registrador X com valor hex literal (0xFF)
	txs	  ; Transfere o Valor no reg X para o reg (S)tackPointer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Limpa a regiao da Page Zero ($00 ate $FF)
; OBS: Limpa toda a memoria RAM e também os registradores TIA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	lda #0	  ; A = 0
	ldx #$FF  ; X = #$FF
MemLoop:
	sta $0,X     ; Armazene o valor de A no endereco $0 + X	
	dex	     ; X-- (dex = decrement X)
	bne MemLoop  ; Loop ate X igual 0 (ate a flag zero ser limpa)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ocupa o tamanho da ROM para exatamente 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	org $FFFC    ; JUMP para addr $FFFC (Aonde começa o programa)
	.word Start  ; Reseta o vetor no addr $FFFC
	.word Start  ; Interrompe o vetor no addr $FFFE (sem uso no VCS)
