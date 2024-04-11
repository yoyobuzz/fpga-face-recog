`timescale 1ns / 1ps

module Addition_Subtraction_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in nanoseconds

    // Signals
   
    reg [31:0] a_operand;
    reg [31:0] b_operand;
    reg AddBar_Sub;
    wire Exception;
    wire [31:0] result;

    // Instantiate the module
    Addition_Subtraction dut (
        
        .a_operand(a_operand),
        .b_operand(b_operand),
        .AddBar_Sub(AddBar_Sub),
        .Exception(Exception),
        .result(result)
    );

    // Clock generation
   

  

    // Test vectors
    initial begin
        // Test case 1: Addition
        a_operand = 32'b01000001100000000000000000000000; // +3.0
        b_operand = 32'b01000001110000000000000000000000; // +6.0
        AddBar_Sub = 0; // Addition
        #100; // Wait for some time for the result to stabilize
        // Expected result: 32'b01000010010000000000000000000000 (+9.0)
        // Add assertion here to check if result matches the expected value

        // Test case 2: Subtraction
        a_operand = 32'b11000001100000000000000000000000; // -3.0
        b_operand = 32'b01000001110000000000000000000000; // +6.0
        AddBar_Sub = 0; // Subtraction
        #100; // Wait for some time for the result to stabilize
        // Expected result: 32'b11000010010000000000000000000000 (-9.0)
        // Add assertion here to check if result matches the expected value

        // Add more test cases as needed
        $finish;
    end

    // Add assertions here to check if the output matches expected values

endmodule
