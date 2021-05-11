module register_read (
    input [40:0] instr_in,
    output [40:0] instr_out,
    input [15:0] rd_data1, rd_data2,
    output [2:0] rd_addr1, rd_addr2
);

    always @(*) begin
        case (instr_in[40:37])
            0001:
                rd_addr1 <= instr_in[36:34];
                rd_addr2 <= instr_in[33:31];
                instr_out <= {instr_in[40:37], rd_data1, rd_data2, instr_in[30:26]};
            0000:
                rd_addr1 <= instr_in[36:34];
                instr_out <= {instr_in[40:37], rd_data1, instr_in[30:15], instr_in[33:31], 2'd0};
            0010:
                rd_addr1 <= instr_in[36:34];
                rd_addr2 <= instr_in[33:31];
                instr_out <= {instr_in[40:37], rd_data1, rd_data2, instr_in[30:26]};
            default:
                instr_out <= 41'd0;
        endcase
    end

endmodule

 
