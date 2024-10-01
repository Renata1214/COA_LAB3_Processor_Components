`include "registerfile.v"  // Include the RegisterFile module
`timescale 1ns/1ns

module registerfile_tb();

    // Define testbench signals
    reg [5:0] read1, read2, write_reg;  // Register addresses for reading and writing (6-bit each)
    reg [31:0] write_data;              // Data to write to the register (32-bit)
    reg reg_write;                      // Register write enable signal
    reg clock;                          // Clock signal

    wire [31:0] data1, data2;           // Data read from the registers

    
    registerfile reg1 (
        .read1(read1), 
        .read2(read2), 
        .write_reg(write_reg), 
        .write_data(write_data), 
        .reg_write(reg_write), 
        .data1(data1), 
        .data2(data2), 
        .clock(clock)
    );

    // Generate clock signal (Toggle clock every 5 ns)
    always @* begin 
        #5 clock<= !clock; 
    end

    // Test sequence
    initial begin
        $dumpfile("registerfile.vcd");  // Dump file for waveform
        $dumpvars(0, registerfile_tb);     // Dump all variables for viewing in waveform

        // Initialize signals
        clock = 0;                         // Start clock at 0
        reg_write = 0;                     // Disable write operation
        write_data = 32'd0;                // Initialize write data to 0
        read1 = 6'd0;                      // Initialize read1 register address to 0
        read2 = 6'd0;                      // Initialize read2 register address to 0
        write_reg = 6'd0;                  // Initialize write_reg address to 0

        // Test Case 1: Write 100 to register 1 and read it back
        #10;                               
        write_reg = 6'd1;                  // Set write_reg to address 1
        write_data = 32'd100;              // Write data = 100
        reg_write = 1;                     // Enable write operation
        #10;                               // Wait for one clock cycle
        reg_write = 0;                     // Disable write operation
        read1 = 6'd1;                      // Set read1 to address 1
        #10;                               // Wait for 10 time units
       

        // Test Case 2: Write 200 to register 2 and read it back
        #10;                               
        write_reg = 6'd2;                  
        write_data = 32'd200;              
        reg_write = 1;                    
        #10;                               
        reg_write = 0;                     
        read1 = 6'd2;                      
        #10;                               
        

        // Test Case 3: Write 300 to register 3 and read it back
        #10;
        write_reg = 6'd3;                  
        write_data = 32'd300;              
        reg_write = 1;                     
        #10;                               
        reg_write = 0;                     
        read1 = 6'd3;                      
        #10;
        

        // Test Case 4: Read from register 0 (should be zero, as it is typically hardwired to 0)
        #10;
        read1 = 6'd0;                      // Set read1 to address 0
        #10;
        
        // Test Case 5: Simultaneously read from register 1 and register 2
        #10;
        read1 = 6'd1;                      // Set read1 to address 1
        read2 = 6'd2;                      // Set read2 to address 2
        #10;
        

        $finish;                           // End simulation
    end

endmodule
