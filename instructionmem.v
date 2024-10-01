module instructionmem (address_instr,read_data,clk2);
    input wire [31:0] address_instr;
    output wire [31:0] read_data;
    reg [31:0] mem [0:255];
    input clk2;

    always @(posedge clk2) begin 
        mem[0] <= 32'b00100000000010000000000000000010; // addi $t0, $0, 2
        mem[1] <= 32'b00100000000010100000000000000010; // addi $t2, $0, 2
        mem[2] <= 32'b00000001000010100100000000100000; // add  $t0, $t0, $t2
        mem[3] <= 32'b00100000000010010000000000000001; // addi $t1, $0, 1
        mem[4] <= 32'b10101101001010000000000000000000; // sw   $t0, 0($t1)
        mem[5] <= 32'b10001101001010100000000000000000; // lw   $t2, 0($t1)
        // loop:
        mem[6] <= 32'b00000001000010010100000000100010; // sub  $t0, $t0, $t1
        mem[7] <= 32'b00010001000010010000000000000001; // beq  $t0, $t1, end
        mem[8] <= 32'b00001000000000000000000000000110; // j loop
        // end:
        mem[9] <= 32'b00001000000000000000000000001001; // j end
    end

assign read_data = mem[address_instr];

endmodule
