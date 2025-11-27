module comparator(
    input good_out,
    input faulty_out,
    output fault_detected
);

assign fault_detected = (good_out != faulty_out);

endmodule
