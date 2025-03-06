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

@R2
M=0          // Initialize quotient (m) to 0

@R3
M=D          // Initialize remainder (q) to x

@R1
D=M          // Load R1 (y) into D

@ABS_Y
D;JGT        // If y > 0, jump to ABS_Y

@R1
M=-M         // Negate y (y = |y|)

(ABS_Y)
@R3
D=M          // Load R3 (q) into D

@ABS_X
D;JGT        // If q > 0, jump to ABS_X

@R3
M=-M         // Negate q (q = |q|)

(ABS_X)
(LOOP)
@R3
D=M          // Load R3 (q) into D

@R1
D=D-M        // Subtract y from q

@END_LOOP
D;JLT        // If q < y, jump to END_LOOP

@R2
M=M+1        // Increment quotient (m)

@R3
M=D          // Update remainder (q)

@LOOP
0;JMP        // Repeat loop

(END_LOOP)
@R0
D=M          // Load R0 (x) into D

@R1
D=D&M        // Check if x and y have the same sign (D = x & y)

@SAME_SIGN
D;JGE        // If x and y have the same sign, jump to SAME_SIGN

@R2
M=-M         // Negate quotient (m)

(SAME_SIGN)
@R0
D=M          // Load R0 (x) into D

@R3
D=D&M        // Check if x and q have the same sign (D = x & q)

@VALID
D;JGE        // If x and q have the same sign, jump to VALID

@R3
M=-M         // Negate remainder (q)

(VALID)
@R4
M=0          // Set R4 = 0 (division is valid)

@END
0;JMP        // Jump to END

(INVALID)
@R4
M=1          // Set R4 = 1 (division is invalid)

@R2
M=0          // Set quotient (m) to 0

@R3
M=0          // Set remainder (q) to 0

(END)
@END
0;JMP        // Infinite loop to end program
