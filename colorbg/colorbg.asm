    processor 6502

    include "vcs.h"
    include "macro.h"

    seg code
    org $F000

START:
    ;CLEAN_START       ;Macro que limpa a memoria

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;     Aumenta o raio luminoso para a cor amarela 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    lda #$1E          ;Carrega a cor para o acumulador (1E é amarelo em NTSC)
    sta COLUBK        ;Armazena A no addr responsavel pelo registrador TIA de BG

    jmp START         ;Jump para o inicio do codigo 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    Segementa o tamanho da rom(codigo de saida) para exatamente 4Kb
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    org $FFFC         ; Define a origem para FFFC 
     .word START      ; Define o vetor de reset em FFFC
     .word START      ; Define o vetor de interrupção 
