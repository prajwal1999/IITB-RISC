module decode (
    input rst,
    input [40:0] instr_in,
    input should_stall,
    output reg [40:0] instr_out,
    output reg [2:0] hdu_src1, hdu_src2,
    output reg [3:0] temp
);

    always @(*) begin
        temp <= instr_in[40:37];
        case (instr_in[40:37])
            0010: begin
                instr_out <= {instr_in[40:28], instr_in[26], instr_in[25], 26'd0};
                hdu_src1 <= instr_in[36:34];
                hdu_src1 <= instr_in[33:31];
            end
            // 0001: begin
            //     instr_out <= {instr_in[40:28], instr_in[26], instr_in[25], 26'd0};
            //     hdu_src1 <= instr_in[36:34];
            //     hdu_src2 <= instr_in[33:31];
            // end
            // 0000: begin
            //     instr_out <= {instr_in[40: 31], 10'd0, instr_in[30: 25], 15'd0};
            //     hdu_src1 <= instr_in[36:34];
            // end
            // 0011:
            //     instr_out <= {instr_in[40:34], 7'd0, instr_in[8:0], 18'd0};
            // 0100:
            //     instr_out <= {instr_in[40:31], 10'd0, instr_in[30:25], 15'd0};
            // 0101:
            //     instr_out <= {instr_in[40:31], 10'd0, instr_in[30:25], 15'd0};
            // 1100:
            //     instr_out <= {instr_in[40:34], instr_in[32:25], 26'd0};
            // 1101:
            //     instr_out <= {instr_in[40:34], instr_in[32:25], 26'd0};
            // 1110:
            //     instr_out <= {instr_in[40:34], 34'd0};
            // 1111:
            //     instr_out <= {instr_in[40:34], 34'd0};
            // 1000:
            //     instr_out <= {instr_in[40:31], 10'd0, instr_in[30:25], 15'd0};
            // 1001:
            //     instr_out <= {instr_in[40:34], 7'd0, instr_in[8:0], 18'd0};
            // 1010:
            //     instr_out <= {instr_in[40:31], 31'd0};
            // 1011:
            //     instr_out <= {instr_in[40:34], 7'd0, instr_in[8:0], 18'd0};
            default:
                instr_out <= 41'd0;
        endcase
    end

endmodule