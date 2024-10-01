`include "alu.v"
`timescale 1ns/1ns

module alu_tb();
reg [3:0] op;
reg [31:0] a;
reg [31:0] b;
wire [31:0] c;
wire zero;

alu alu1 (.a(a),
    .b(b),
    .c(c),
    .op(op),
    .zero(zero)
);

//instantiate and map the registers to the corresponding wires
initial begin
    $dumpfile("alu.vcd"); // how to see data on graph. Data_Table. It will save all simulations result to be seen later. 
    $dumpvars(0, alu_tb); // dump all the values. ) means everything. Dump all the states of the model into that file
// Initial values
    a = 32'h0;
    b = 32'h0;
    op = 4'b0000;  // Set initial operation (e.g., ADD)

    #10;  // Wait for 10ns
    a = 32'd10;
    b = 32'd5;
    op = 4'b0000;  // ADD operation (10 + 5)

    #10;
    op = 4'b0001;  // SUB operation (10 - 5)

    #10;
    op = 4'b0010;  // MUL operation (10 * 5)

    #10;
    op = 4'b0011;  // DIV operation (10 / 5)

    #10;
    op = 4'b0100;  // AND operation (10 & 5)

    #10;
    op = 4'b0101;  // OR operation (10 | 5)

    #10;
    op = 4'b0110;  // XOR operation (10 ^ 5)

    #10;
    op = 4'b1111;  // Invalid operation, should return 0

    #10;
    $finish;

end
endmodule
