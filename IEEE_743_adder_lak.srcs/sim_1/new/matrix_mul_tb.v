`timescale 1ns/1ps

module matrix_mul_tb;

    // Parameters
    //parameter Bits = 32;
    parameter N = 3;
    parameter M = 2;
    
    // Signals
    reg [31:0] x_element [0:2];
    reg [31:0] x_weight [0:5];
    wire [31:0] x_int [0:5];
    wire [31:0] x_output [0:1];

    // Instantiate the module
    matrix_mul #(.N(N), .M(M)) dut (
        .x_element({x_element[0],x_element[1],x_element[2]}),
        .x_weight({x_weight[0],x_weight[1],x_weight[2],x_weight[3],x_weight[4],x_weight[5]}),
        .x_int({x_int[0],x_int[1],x_int[2],x_int[3],x_int[4],x_int[5]}),
        .x_output({x_output[0],x_output[1]})
    );

    // Test vectors
    initial begin
        // Initialize input arrays x_element and x_weight
        // You need to provide appropriate values for your test
        // For simplicity, random values are used here
        //$randomize; // Initialize random number generator
        
        x_element[0][31:0]=32'b01000001010000000000000000000000;
        x_element[1][31:0]=32'b11000000010000000000000000000000;
        x_element[2][31:0]=32'b01000000000000000000000000000000;
        
        x_weight[0][31:0]=32'b11000000100000000000000000000000;
        x_weight[1][31:0]=32'b01000000000000000000000000000000;
        x_weight[2][31:0]=32'b00111111100000000000000000000000;
        x_weight[3][31:0]=32'b00000000000000000000000000000000;
        x_weight[4][31:0]=32'b10111111100000000000000000000000;
        x_weight[5][31:0]=32'b00111111000000000000000000000000;
        
        // Wait for some time for the result to stabilize
        #100;

        // Print the inputs and outputs
        
        $finish;
    end
endmodule
