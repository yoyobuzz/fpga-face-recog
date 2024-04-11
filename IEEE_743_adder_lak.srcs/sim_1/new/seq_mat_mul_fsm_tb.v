`timescale 1ns / 1ps

module seq_mat_mul_fsm_tb;

    // Parameters
    parameter N = 3;
    parameter M = 2;

    // Inputs
    reg clk = 0;
    reg reset = 1; // Active Low
    reg [31:0] data_in;

    // Outputs
    wire [1:0] maxpo;

    // Instantiate the design under test (DUT)
    seq_mat_mul_fsm_1 #(.N(N), .M(M)) dut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .maxpo(maxpo)
    );

    // Clock generation
    always #10 clk = ~clk; // 10ns clock period

    // Test stimulus
    initial begin
        // Reset
        #10 reset = 0;

        // Apply test vectors
        // Example Test Vector 1
        data_in = 32'b00111111100000000000000000000000; // Input data //1
        #20;
        data_in = 32'b10111111100000000000000000000000; // Input data //-1
        #20;
        data_in = 32'b01000000010000000000000000000000; // Input data //3
        #20;
        
        // Example Test Vector 2
        data_in = 32'b01000000100000000000000000000000; // Input data //4
        #20;
        data_in = 32'b01000000000000000000000000000000; // Input data //2
        #20;
        data_in = 32'b10111111100000000000000000000000; // Input data //-1
        #20;
        data_in = 32'b01000000100000000000000000000000; // Input data //4
        #20;
        data_in = 32'b01000000010000000000000000000000; // Input data //3
        #20;
        data_in = 32'b01000000000000000000000000000000; // Input data //2
        #20;
        data_in = 32'b01000000010000000000000000000000; // Input data //3
        #20;
        data_in = 32'b01000000000000000000000000000000; // Input data //2
        #20;

        // Add more test vectors as needed
        #600;
        // Finish simulation
        #10 $finish;
    end

    

endmodule
