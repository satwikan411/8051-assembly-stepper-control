; File: clockwise.asm
; Target: 8051 MCU
; Description: Rotates stepper motor clockwise using 2-phase excitation

ORG 3000H

; Initialize Control Word for Port A
MOV DPTR, #0FF03H
MOV A, #80H
MOVX @DPTR, A

START:
MOV DPTR, #0FF00H   ; Point to Port A
MOV A, #0AH         ; Step 1: 1010
MOVX @DPTR, A
ACALL DELAY

MOV A, #06H         ; Step 2: 0110
MOVX @DPTR, A
ACALL DELAY

MOV A, #05H         ; Step 3: 0101
MOVX @DPTR, A
ACALL DELAY

MOV A, #09H         ; Step 4: 1001
MOVX @DPTR, A
ACALL DELAY

SJMP START          ; Loop continuously

; Software Delay Subroutine
DELAY: 
MOV R7, #0FFH
DLY2: 
MOV R6, #0FFH
DLY: 
DJNZ R6, DLY
DJNZ R7, DLY2
RET
