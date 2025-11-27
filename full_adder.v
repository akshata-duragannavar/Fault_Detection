// --------------------------------------------------
// full_adder.v - Good 1-bit Full Adder
// --------------------------------------------------

module full_adder(
    input A, B, Cin,
    output Sum, Cout
);

wire X1, X2, C1, C2;

// Internal signals
assign X1 = A ^ B;     // XOR1
assign Sum = X1 ^ Cin; // XOR2

assign C1 = A & B;
assign C2 = Cin & X1;
assign Cout = C1 | C2;

endmodule
