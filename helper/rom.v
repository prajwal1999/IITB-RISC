module rom(
    input [15:0] pc,
    output [15:0] instr
);

    reg [15:0] romFile [2**15:0];

    assign instr = romFile[pc];

endmodule

