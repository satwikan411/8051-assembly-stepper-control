# 8051 Stepper Motor Interfacing (Bare-Metal Assembly)

## Project Overview
This project demonstrates low-level, register-based firmware development for the 8051 microcontroller (M51-02 Trainer Kit). The goal was to interface a 2-phase stepper motor and control its rotation using memory-mapped I/O. 

*Note: This project demonstrates bare-metal architecture without an RTOS, directly manipulating MCU registers and external memory.*

## Hardware & Software Used
*   **Microcontroller:** 8051 (M51-02 Trainer Kit)
*   **Actuator:** 2-Phase Stepper Motor
*   **Language:** 8051 Assembly Language
*   **Toolchain:** MCU 8051 IDE / Trainer Kit Assembler

## Technical Implementation
The stepper motor is driven using **2-phase excitation**. The switching sequence is:
`0x0A (1010) -> 0x06 (0110) -> 0x05 (0101) -> 0x09 (1001)`

**Memory-Mapped I/O:** 
Instead of standard GPIO pins, the 8051 interfaces with the motor driver via external memory. 
*   **Port A Address:** `0xFF00`
*   **Control Word Address:** `0xFF03`

The assembly code uses the `MOVX` (Move External) instruction and the `DPTR` (Data Pointer) register to write the switching sequence to the external hardware, a crucial technique in bare-metal firmware development.

## The Code
The repository contains two assembly programs:
1.  **[Clockwise Rotation](code/clockwise.asm):** Executes the sequence forwards in an infinite loop.
2.  **[Anticlockwise Rotation](code/anticlockwise.asm):** Executes the sequence in reverse.

*Key instructions used: `MOV`, `MOVX`, `ACALL` (for delay subroutines), and `DJNZ` (for loop control).*

## Procedure & Execution
1.  Initialize the assembler at memory location `ORG 3000H`.
2.  Input the assembly code.
3.  Connect the stepper motor to the trainer kit.
4.  Execute the code via the `G` (Go) command.

## Result
*(Upload the picture of the stepper motor from your PDF into the `images` folder, then link it here like this:)*
![Stepper Motor Result for Anti-clockwise](media/anticlockwise)
![Stepper Motor Result for Oscillation](media/oscillation)

Upon execution, the stepper motor successfully rotates in the programmed direction, demonstrating precise timing control via software delay loops (`DELAY: MOV R7,#0FFH`).
