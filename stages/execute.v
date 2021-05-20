module execute (
    input [40:0] instr_in,
    input C_in, Z_in,

    output C_out, Z_out
);
    reg [1:0] alu_op;
    reg [15:0] src1, src2, alu_result;
    alu alu_instance(.sel(alu_op), .arg1(), .arg2(), .result(), .carry_out(C_out),  .zero_out(Z_out));

    always @(*) begin
        case (instr_in[40:37])
            0001:
                alu_op <= 2'b00;
            default: 
                alu_op <= 2'b00;
        endcase
    end

endmodule