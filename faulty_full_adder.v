// --------------------------------------------------
// faulty_full_adder.v ? Faulty Full Adder
// Fault injected at internal node X1
// --------------------------------------------------

module faulty_full_adder(
    input A, B, Cin,
    input fault_enable,   // Enables fault
    input stuck_val,      // 0 or 1
    output Sum_f, Cout_f
);

wire X1, X1_faulty, X2, C1, C2;

// Original XOR
assign X1 = A ^ B;

// Fault injection mux
assign X1_faulty = (fault_enable) ? stuck_val : X1;

// Outputs using faulty signal
assign Sum_f = X1_faulty ^ Cin;

assign C1 = A & B;
assign C2 = Cin & X1_faulty;
assign Cout_f = C1 | C2;

endmodule
