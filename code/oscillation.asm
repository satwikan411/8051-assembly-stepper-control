; File: oscillation.asm
; Target: 8051 MCU
; Description: Rotates stepper motor clockwise then anticlockwise repeatedly

ORG 3000H

; Initialize Control Word for Port A
MOV DPTR, #0FF03H
MOV A, #80H
MOVX @DPTR, A

START:
MOV DPTR, #0FF00H   ; Point to Port A

; --- Clockwise Sequence ---
MOV A, #0AH         ; Step 1
MOVX @DPTR, A
ACALL DELAY
MOV A, #06H         ; Step 2
MOVX @DPTR, A
ACALL DELAY
MOV A, #05H         ; Step 3
MOVX @DPTR, A
ACALL DELAY
MOV A, #09H         ; Step 4
MOVX @DPTR, A
ACALL DELAY

; --- Anticlockwise Sequence (Reverse) ---
MOV A, #05H         ; Step 3
MOVX @DPTR, A
ACALL DELAY
MOV A, #06H         ; Step 2
MOVX @DPTR, A
ACALL DELAY
; (The loop then jumps back to START, creating continuous oscillation)

SJMP START          

; Software Delay Subroutine
DELAY: 
MOV R7, #0FFH
DLY2: 
MOV R6, #0FFH
DLY: 
DJNZ R6, DLY
DJNZ R7, DLY2
RET
