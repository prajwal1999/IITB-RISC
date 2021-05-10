module ram(
    input clk,
    input wr_en,
    input [15:0] rd_addr,
    input [15:0] wr_addr,
    input [15:0] wr_data,
    output [15:0] rd_data
);

    reg [15:0] ramFile [2**15:0];

    assign rd_data = ramFile[rd_addr];

    always @(posedge clk) begin
        if(wr_en == 1'b1) begin
            ramFile[wr_addr] <= wr_data;
        end
    end

endmodule

