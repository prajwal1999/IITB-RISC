module decode (
    input [40:0] instr_in,
    input should_stall,
    output [40:0] instr_out,
    output [2:0] hdu_src1, hdu_src2
);

    always @(*) begin
        case (instr_in[40:37])
            0001:
                instr_out <= {instr_in[40:28], instr_in[26], instr_in[25], should_stall, 25'd0};
                hdu_src1 <= instr_in[36:34];
                hdu_src2 <= instr_in[33:31];
            0000:
                instr_out <= {instr_in[40: 31], 10'd0, instr_in[30: 25], 15'd0};
                hdu_src1 <= instr_in[36:34];
            0010:
                instr_out <= {instr_in[40:28], instr_in[26], instr_in[25], should_stall, 25'd0};
                hdu_src1 <= instr_in[36:34];
                hdu_src1 <= instr_in[33:31];
            default:
                instr_out <= 41'd0;
        endcase
    end

endmodule