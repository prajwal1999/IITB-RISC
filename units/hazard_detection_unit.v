module hazard_detection_unit (
    input [3:0] op_decode, op_regread,
    input [2:0] src1_decode, src2_decode, dest_regread,
    output should_stall
);
    
    assign wire src1_depend = src1_decode^dest_regread;
    assign wire src2_depend = src2_decode^dest_regread;

    always @(*) begin
        case (op_regread)
            0100:
                should_stall <= (src1_depend | src2_depend);
            default: 
                should_stall <= 1'b0;
        endcase
    end

endmodule
