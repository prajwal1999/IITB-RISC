module reg_file(
    input clk, rst,
    input [2:0] rd_addr1,
    input [2:0] rd_addr2,
    input [2:0] wr_addr,
    input [15:0] wr_data,
    input wr_en, pc_wr,
    input [15:0] pc_next,
    output [15:0] rd_data1,
    output [15:0] rd_data2,
    output [15:0] pc
);

    reg [15:0] regFile [7:0];

    assign rd_data1 = regFile[rd_addr1];
    assign rd_data2 = regFile[rd_addr2];
    assign pc = regFile[3'b111];

    integer i;

    always @(posedge clk) begin
        if(rst == 1'b1) begin
            for (i=0; i<8; i=i+1)
                regFile[i] = 16'd0;
        end else begin
            if(wr_en == 1'b1) begin
                regFile[wr_addr] <= wr_data;
            end
            if(pc_wr == 1'b1) begin
                regFile[3'b111] <= pc_next;
            end
        end
    end

endmodule
