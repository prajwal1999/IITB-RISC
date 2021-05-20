module rom(
    input [15:0] pc,
    output [15:0] instr
);

    reg [15:0] romFile [0:2**15-1];

    assign instr = romFile[pc];

    initial begin
        romFile[0] <= {4'b0001, 3'b001, 3'b010, 3'b011, 1'b0, 2'b00};
        romFile[1] <= {4'b0001, 3'b001, 3'b010, 3'b011, 1'b0, 2'b10};
        romFile[2] <= {4'b0001, 3'b001, 3'b010, 3'b011, 1'b0, 2'b01};
        romFile[3] <= {4'b0001, 3'b001, 3'b010, 3'b011, 1'b0, 2'b11};
        romFile[4] <= {4'b0000, 3'b001, 3'b100, 6'h25};
        romFile[5] <= {4'b0010, 3'b001, 3'b010, 3'b011, 1'b0, 2'b00};
        romFile[6] <= {4'b0010, 3'b001, 3'b010, 3'b011, 1'b0, 2'b10};
        romFile[7] <= {4'b0010, 3'b001, 3'b010, 3'b011, 1'b0, 2'b01};
        romFile[8] <= {4'b0011, 3'b101, 9'h085};
        romFile[9] <= {4'b0100, 3'b011, 9'h005};
        romFile[10] <= {4'b0101, 3'b101, 3'b011, 6'h07};
        romFile[11] <= {4'b1100, 3'b010, 9'h045};
        romFile[12] <= {4'b1101, 3'b001, 9'h035};
        romFile[13] <= {4'b1110, 3'b001, 9'h0};
        romFile[14] <= {4'b1111, 3'b001, 9'h0};
        romFile[15] <= {4'b1000, 3'b011, 3'b100, 6'h13};
        romFile[16] <= {4'b1001, 3'b011, 9'h050};
        romFile[17] <= {4'b1010, 3'b010, 3'b001, 6'h30};
        romFile[18] <= {4'b1011, 3'b011, 9'h017};

    end

endmodule

