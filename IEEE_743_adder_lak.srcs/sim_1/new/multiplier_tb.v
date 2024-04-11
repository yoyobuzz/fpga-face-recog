`timescale 1ns/1ps

module multiplier_tb;

    // Signals
    reg [31:0] A;
    reg [31:0] B;
    wire [31:0] O;

    // Instantiate the module
    multiplier dut (
        .A(A),
        .B(B),
        .O(O)
    );

    // Test vectors
    initial begin
        // Initialize input A and B
        A = 32'b01000000100000000000000000000000; // +2.0
        B = 32'b01000000110000000000000000000000; // +3.0

        // Wait for some time for the result to stabilize
        #100;

        // Print the inputs and output
        $display("Input A: %b", A);
        $display("Input B: %b", B);
        $display("Output O: %b", O);

        // Add assertion to check the output
        // Expected result: 32'b01000001010000000000000000000000 (+6.0)
        if (O !== 32'b01000001010000000000000000000000) begin
            $display("Test failed: Unexpected output!");
            $finish;
        end else begin
            $display("Test passed: Output matches expected result.");
        end

        // End the simulation
        $finish;
    end
endmodule
