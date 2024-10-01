`include "pc.v"
`timescale 1ns/1ns

module pc_tb();
    reg clk;    
    reg [31:0] in;
    wire [31:0] pc1;  

    
    pc pc2(clk,in,pc1);  

    always @* begin 
        #5 clk<= !clk; //every 10 nanoseconds, that is how long the cycle takes
        end
        
    
    initial begin
        $dumpfile("pc.vcd");  // Dump file for waveform
        $dumpvars(0, pc_tb);     // Dump all variables for viewing in waveform

        // Initialize signals
        clk = 0;                 // Start clock at 0
        in = 32'd0;              // Initialize input to 0

        // Apply input values and observe the Program Counter behavior
        #10;                     // Wait for 10 time units
        in = 32'd100;            // Set input to 100
        #10;                     
        
        in = 32'd200;            // Set input to 200
        #10;                     

        in = 32'd300;            // Set input to 300
        #10;                    

        in = 32'd400;            // Set input to 400 
        #10;                     

        in = 32'd500;            // Set input to 500
        #10;                     

        $finish;                 // End simulation
    end
endmodule