module fetch (
    input [15:0] pc,
    output [40:0] instruction
);

    reg [15:0] temp_instr;
    rom rom_instance (.pc(pc), .instr(temp_instr) );

    always @(*) begin
        instruction <= {temp_instr, 25'd0};
    end

    
endmodule