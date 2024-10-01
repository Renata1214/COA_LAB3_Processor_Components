module registerfile (read1, read2, write_reg, write_data, reg_write, data1, data2, clock);
    input [5:0] read1, read2, write_reg; //rs,rt,rd
    input [31:0] write_data; //the data that is to be written in rd
    input reg_write, clock; //control signal and clock
    output [31:0] data1, data2; //the infromation that is read from the registers
    reg[31:0] RF [0:31]; //32 registers- 32 bits long

    //read the values from the required registers
    assign data1= RF[read1]; ///rs
    assign data2 = RF[read2]; //rt

    always @(posedge clock) begin
        if (reg_write && write_reg) begin //make sure that write_reg is not the 0 register and that the write control signal is activated 
            RF[write_reg] <= write_data; //write data into the register
        end 
    end
endmodule 
     