module alu(
    input [2:0] sel,
    input [15:0] arg1,
    input [15:0] arg2,
    input carry_in,
    output [15:0] result,
    output carry_out,
    output zero
);

    reg [16:0] add_result;

    if(sel == 3'b000) begin
        add_result <= (arg1 + arg2) + carry_in;
        result <= add_result[15:0];
        carry_out <= add_result[16];
        if(add_result == 17'd0) zero <= 1'b1;
        else zero <= 1'b0
    end else if(sel == 3'b001) begin
        result <= !(arg1 && arg2);
        carry_out <= carry_in;
        if(add_result == 17'd0) zero <= 1'b1;
        else zero <= 1'b0
    end

endmodule