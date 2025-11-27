// -----------------------------------------------------
// tb_fa_fault_detection.v ? Testbench
// Fault at XOR output X1
// -----------------------------------------------------

`timescale 1ns/1ps

module tb_fa_fault_detection;

reg A, B, Cin;
reg fault_enable, stuck_val;

wire Sum_g, Cout_g;
wire Sum_f, Cout_f;

wire fault_sum, fault_cout;

// Good Full Adder
full_adder FA_good(
    .A(A), .B(B), .Cin(Cin),
    .Sum(Sum_g), .Cout(Cout_g)
);

// Faulty Full Adder
faulty_full_adder FA_faulty(
    .A(A), .B(B), .Cin(Cin),
    .fault_enable(fault_enable),
    .stuck_val(stuck_val),
    .Sum_f(Sum_f), .Cout_f(Cout_f)
);

// Comparators
comparator cmp_sum(
    .good_out(Sum_g),
    .faulty_out(Sum_f),
    .fault_detected(fault_sum)
);

comparator cmp_cout(
    .good_out(Cout_g),
    .faulty_out(Cout_f),
    .fault_detected(fault_cout)
);

integer i;

initial begin
    $display("-------------------------------------------------------------");
    $display(" A B Cin | Sum_g Sum_f | Cout_g Cout_f | Fault(Sum) Fault(Cout)");
    $display("-------------------------------------------------------------");

    fault_enable = 1;    // Enable fault
    stuck_val = 0;       // Inject stuck-at-0 on XOR node X1

    for (i = 0; i < 8; i = i + 1) begin
        {A, B, Cin} = i;
        #10;
        $display(" %b %b  %b  |   %b      %b    |    %b        %b     |      %b          %b",
                A, B, Cin, Sum_g, Sum_f, Cout_g, Cout_f, fault_sum, fault_cout);
    end

    $display("-------------------------------------------------------------");
    $finish;
end

endmodule
