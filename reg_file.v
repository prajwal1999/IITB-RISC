module reg_file(
    input clk,
    input [2:0] rd_addr1,
    input [2:0] rd_addr2,
    input [2:0] wr_addr,
    input [15:0] wr_data,
    input wr_en,
    output [15:0] rd_data1,
    output [15:0] rd_data2,
);

    reg [15:0] regFile [7:0];
    integer wr_int_addr;
    integer rd_int_addr1;
    integer rd_int_addr1;

    initial begin
        wr_int_addr = wr_addr;
    end

    assign rd_data1 = regFile[rd_addr1];
    assign rd_data2 = regFile[rd_addr2];

    always @(posedge clk) begin
        if(wr_en == 1'b1) begin
            regFile[wr_int_addr] <= wr_data;
        end
    end

endmodule

