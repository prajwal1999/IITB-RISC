module fetch (
    input [15:0] pc,
    output reg [40:0] instruction,
    output [15:0] npc
);

    wire [15:0] temp_instr;
    rom rom_instance (.pc(pc), .instr(temp_instr) );

    assign npc = pc + 1;

    always @(*) begin
        instruction <= {temp_instr, 25'd0};
    end

endmodule