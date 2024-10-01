`include "datamemory.v"
`timescale 1ns/1ns

//always call cacl_tb
module datamemory_tb();
    reg [31:0] addr;
    reg [31:0] w_data;
    reg mem_write, mem_read;
    wire [31:0] read;
    reg clock1;
 
//registers
// MAP calc calc -> name instatiated stuff with small letters, Calc is teh data type, calc could have had a different name and it is instantiatoin 
    datamemory DataMemory (
            .addr(addr), 
            .w_data(w_data), 
            .read(read_data), 
            .mem_write(mem_write), 
            .mem_read(mem_read), 
            .clock1(clock1)
        );

    always @* begin 
        #5 clock1<= !clock1; //every 10 nanoseconds, that is how long the cycle takes
    end

    //instantiate and map the registers to the corresponding wires
    initial begin
            $dumpfile("datamemory.vcd");  // Dump file for waveform
            $dumpvars(0, datamemory_tb);  
            // Initialize signals
            clock1 = 0;              // Start clock at 0
            mem_write = 0;           // Disable write operation
            mem_read = 0;            // Disable read operation
            addr = 0;                // Initialize address
            w_data = 0;              // Initialize write data          

            // Test Case 1: Write 165 (decimal) to address 0
            #10;                    
            addr = 0;               
            w_data = 165;            
            mem_write = 1;          
            #10;                     
            mem_write = 0;           

            // Test Case 2: Read from address 0
            #10;                    
            mem_read = 1;            
            #10;                     
            mem_read = 0;            

            // Test Case 3: Read from address 1
            #10;
            mem_read = 1;            
            #10;                     
            mem_read = 0;            

            $finish;                 // End simulation
    end
endmodule