module rom(
    input clk,
    input [15:0] PC,
    output [15:0] instr
);

    reg [15:0] romFile [2**15:0];

    assign instr = romFile[PC];

    // always @(posedge clk) begin
    //     regFile[wr_addr] <= wr_data;
    // end

endmodule

