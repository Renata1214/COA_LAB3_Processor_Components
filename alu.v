module alu(a,b,c,op,zero);
    input wire  [3:0] op;
    input wire [31:0] a;
    input wire [31:0] b;
    output reg [31:0] c;
    output wire zero;

    always @* begin
        case (op)
            0 : c<= a+b;
            1 : c<=a-b;
            2 : c<= a*b;
            3 : c<= a/b;
            4 : c<= a & b;
            5 : c<= a | b;
            6 : c<= a ^ b; 
            default : c<=0;
        endcase
    end

    assign zero = (c==0);

endmodule
