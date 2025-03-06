// IntegerDivision.asm
// Computes the integer quotient (m) and remainder (q) of x / y.
// x is stored in R0, y is stored in R1.
// Stores the quotient m in R2 and the remainder q in R3.
// Sets R4 = 1 if the division is invalid (y = 0), otherwise R4 = 0.

@R1
D=M          // Load R1 (y) into D

@INVALID
D;JEQ        // If y = 0, jump to INVALID (division is invalid)

@R0
D=M          // Load R0 (x) into D

@R1
D=D&M        // Check if x and y have the same sign (D = x & y)

@SAME_SIGN
D;JGE        // If x and y have the same sign, jump to SAME_SIGN

// Handle case where x and y have opposite signs
@R0
D=M          // Reload R0 (x) into D

@R1
D=D+M        // Add y to x to adjust for sign difference

@QUOTIENT
0;JMP        // Jump to QUOTIENT

(SAME_SIGN)
@R0
D=M          // Reload R0 (x) into D

@R1
D=D-M        // Subtract y from x to adjust for sign difference

@QUOTIENT
0;JMP        // Jump to QUOTIENT

(QUOTIENT)
@R2
M=0          // Initialize quotient (m) to 0

@R0
D=M          // Reload R0 (x) into D

(LOOP)
@R1
D=D-M        // Subtract y from x

@END_LOOP
D;JLT        // If result is negative, jump to END_LOOP

@R2
M=M+1        // Increment quotient (m)

@LOOP
0;JMP        // Repeat loop

(END_LOOP)
@R1
D=D+M        // Add y back to get the remainder (q)

@R3
M=D          // Store remainder (q) in R3

@VALID
0;JMP        // Jump to VALID

(INVALID)
@R4
M=1          // Set R4 = 1 (division is invalid)

@END
0;JMP        // Jump to END

(VALID)
@R4
M=0          // Set R4 = 0 (division is valid)

(END)
@END
0;JMP        // Infinite loop to end program
