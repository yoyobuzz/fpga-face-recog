`timescale 1ns / 1ps

module seq_mat_mul_fsm_1_tb;

    // Parameters
    parameter N = 512;
    parameter M = 5;

    // Inputs
    reg clk = 0;
    reg reset = 1; // Active Low
    reg [31:0] data_in;
    wire [0:M-1] maxpo;
    // Outputs
    //wire [31:0] linebuffer;

    // Instantiate the design under test (DUT)
    seq_mat_mul_fsm_1 #(.N(N), .M(M)) dut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .maxpo(maxpo)
    );

    // Clock generation
    always #0.1 clk = ~clk; // 10ns clock period
	integer i, file;
    // Test stimulus
    initial begin
        // Reset
        #0.25 reset = 0;

        // Apply test vectors
        // Example Test Vector 1
        /*data_in = 32'b00111111100000000000000000000000; // Input data //1
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
        data_in = 32'b01000000100000000000000000000000; // Input data //0
        #20;
        data_in = 32'b01000000010000000000000000000000; // Input data //3
        #20;
        data_in = 32'b01000000000000000000000000000000; // Input data //2
        #20;
        data_in = 32'b01000000010000000000000000000000; // Input data //3
        #20;
        data_in = 32'b01000000000000000000000000000000; // Input data //2
        #20;
*/         
//		file=$fopen("/home/lakshit/projects/data.txt","r");
		file=$fopen("E:/Vivado_projects/data_n512_m5.txt","r");

		for(i=0;i<N+M+N*M;i=i+1)
		begin
			@(posedge clk);
			$fscanf(file,"%b",data_in);
		end
        // Add more test vectors as needed
        $fclose(file);
        #600;
        
        // Finish simulation
        #1 $finish;
    end

    // Monitor
//    always @(posedge clk) begin
//        // Monitor linebuffer output
//        $display("linebuffer = %d", linebuffer);
//    end

endmodule
