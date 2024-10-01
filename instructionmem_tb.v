`include "instructionmem.v"
`timescale 1ns/1ns

//always call cacl_tb
module instructionmem_tb();
    reg [31:0] address_instr;
    wire [31:0] read_data;
    reg clk_try;

//registers
instructionmem instructionmem1 (address_instr, read_data, clk_try); // MAP calc calc -> name instatiated stuff with small letters, Calc is teh data type, calc could have had a different name and it is instantiatoin 

always @* begin 
        #5 clk_try<= !clk_try; //every 10 nanoseconds, that is how long the cycle takes
    end

//instantiate and map the registers to the corresponding wires
initial begin
    $dumpfile("instructionmem.vcd"); // how to see data on graph. Data_Table. It will save all simulations result to be seen later. 
    $dumpvars(0, instructionmem_tb); // dump all the values. ) means everything. Dump all the states of the model into that file

    clk_try=0;
    // Test Case 1: Read instruction at address 0
        address_instr = 32'd0;     
        #10;                      
        

        // Test Case 2: Read instruction at address 1
        address_instr = 32'd1;     
        #10;                       
       
        // Test Case 3: Read instruction at address 2
        address_instr = 32'd2;    
        #10;                      
        

        // Test Case 4: Read instruction at address 6 (loop label)
        address_instr = 32'd6;     
        #10;                       
        

        // Test Case 5: Read instruction at address 9 (end label)
        address_instr = 32'd9;     
        #10;                      
        

        $finish;                   // End simulation
    end

endmodule