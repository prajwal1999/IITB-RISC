module alu(
    input [1:0] sel,
    input [15:0] arg1, arg2,
    output [15:0] result,
    output carry_out, zero_out
);

    reg [15:0] alu_result;
    assign result = alu_result;
    wire tmp = {1'b0, arg1} + {1'b0, arg2};
    assign carry_out = tmp[16];
    
    always @(*) begin
        case (sel)
            3'b00:
                alu_result = (arg1 + arg2);
            3'b01:
                alu_result <= !(arg1 && arg2);
            default: 
                alu_result = (arg1 + arg2);
        endcase

        if(alu_result == 16'd0) 
            zero_out = 1'b1;
        else
            zero_out = 1'b0;
         
    end

endmodule
