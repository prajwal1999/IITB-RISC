module hazard_detection_unit (
    input rst,
    input [3:0] op_decode, op_regread,
    input [2:0] src1_decode, src2_decode, dest_regread,
    output reg should_stall
);
    wire src1_depend, src2_depend;
    assign src1_depend = src1_decode^dest_regread;
    assign src2_depend = src2_decode^dest_regread;

    always @(*) begin
        if(rst == 1'b1) begin
            should_stall <= 1'b0;
        end else begin
            case (op_regread)
                0100:
                    should_stall <= (src1_depend | src2_depend);
                default: 
                    should_stall <= 1'b0;
            endcase
        end
    end

endmodule
