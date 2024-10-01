module datamemory (addr, w_data, read, mem_write, mem_read, clock1);
    input wire [31:0] addr;
    input wire [31:0] w_data;
    input mem_write, mem_read;
    output reg [31:0] read;
    reg [31:0] mem1 [0:31];
    input clock1;

    always @(posedge clock1) begin 
        if (mem_write) begin
            mem1[addr]<= w_data;
        end
        if (mem_read) begin
            read <= mem1[addr];
        end
    end

endmodule