// SumArrayEntries.asm
// Computes the sum of all entries in an array.
// The memory address of the first entry is stored in R0.
// The number of elements in the array is stored in R1.
// The final result is stored in R2.
// If the number of elements is not positive, the sum is set to 0.

@R1
D=M          // Load R1 (number of elements) into D

@INVALID
D;JLE        // If number of elements <= 0, jump to INVALID

@R2
M=0          // Initialize sum (R2) to 0

@R0
D=M          // Load R0 (base address of array) into D

@R3
M=D          // Store base address in R3 (temporary pointer)

(LOOP)
@R3
A=M          // Load address stored in R3 into A
D=M          // Load value at address A into D

@R2
M=M+D        // Add value to sum (R2)

@R3
M=M+1        // Increment pointer (R3) to next array element

@R1
M=M-1        // Decrement number of elements (R1)

@R1
D=M          // Load updated number of elements into D

@LOOP
D;JGT        // If number of elements > 0, repeat loop

@END
0;JMP        // Jump to END

(INVALID)
@R2
M=0          // Set sum (R2) to 0

(END)
@END
0;JMP        // Infinite loop to end program
