# MPMC – Stepper Motor Interfacing

**Name:** Satwika   
**Subject:** MPMC Lab

## Objective
To interface a stepper motor with the M51-02 trainer kit and write 8051 assembly programs to rotate the motor clockwise, anticlockwise, and in oscillation mode.

## Apparatus
- M51-02 trainer kit
- Stepper motor
- Connecting wires
- Power supply

## Theory
For 2-phase excitation, the switching sequence is:

`0AH → 06H → 05H → 09H`

Clockwise rotation uses the sequence in this order. Anticlockwise rotation uses the reverse order.  
Port A address: `FF00H`  
Control word address: `FF03H`

## Files
- [Clockwise code](code/clockwise.asm)
- [Oscillation code](code/oscillation.asm)

## Procedure
1. Enter the assembly code using `ASM ORG 3000H`.
2. Connect the stepper motor to the M51-02 trainer kit.
3. Execute the program using `G` and the memory location.
4. Observe the motor rotation.

## Results
- [Anti-Clockwise rotation video]
- [Oscillation]

## Conclusion
The stepper motor was successfully interfaced with the 8051 trainer kit and rotated in clockwise and anticlockwise directions using assembly language programs.
