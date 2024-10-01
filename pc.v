module pc (clk,in,pc1);
    input clk;            // Clock input
    input wire [31:0] in; // 
    output reg [31:0] pc1 ;  // 32-bit Program Counter output
    //input [31:0] branch

always @(posedge clk) begin
    pc1 <= in;
end

endmodule