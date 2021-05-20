module processor (
    input clk, rst
);

    reg fetch_en, decode_en, reg_read_en, execute_en, memory_access_en, write_back_en;
    wire [15:0] pc_in_fetch, npc_from_fetch;
    wire [40:0] fetch_decode_in, fetch_decode_out;
    wire [40:0] decode_regread_in, decode_regread_out;
    wire [40:0] regread_exe_in, regread_exe_out;
    wire [40:0] exe_memaccess_in, exe_memaccess_out;
    wire [40:0] memaccess_wb_in, memaccess_wb_out;

    wire [2:0] decode_hdu_src1, decode_hdu_src2, regread_hdu_dest;
    wire should_decode_stall;

    wire [2:0] reg_file_addr1, reg_file_addr2;
    wire [15:0] reg_file_data1, reg_file_data2;


    fetch fetch_instance (.pc(pc_in_fetch), .instruction(fetch_decode_in), .npc(npc_from_fetch));

    fifo fetch_decode_fifo(.en(~should_decode_stall), .clk(clk), .data_in(fetch_decode_in), .data_out(fetch_decode_out));

    decode decode_instance(.instr_in(fetch_decode_out), .instr_out(decode_regread_in), .hdu_src1(decode_hdu_src1), .hdu_src2(decode_hdu_src2));

    fifo decode_regread_fifo(.en(~should_decode_stall), .clk(clk), .data_in(decode_regread_in), .data_out(decode_regread_out));

    register_read regread_instance(.instr_in(decode_regread_out), .instr_out(regread_exe_in),
        .rd_data1(reg_file_data1),.rd_data2(reg_file_data2),
        .rd_addr1(reg_file_addr1), .rd_addr2(reg_file_addr2));

    fifo regread_exe_fifo(.en(reg_read_en), .clk(clk), .data_in(regread_exe_in), .data_out(regread_exe_out));

    execute execute_instance();

    hazard_detection_unit hdu_instance(.op_decode(fetch_decode_out[25:22]), .op_regread(decode_regread_out[25:22]), 
        .src1_decode(decode_hdu_src1), .src2_decode(decode_hdu_src2), .dest_regread(regread_hdu_dest), .should_stall(should_decode_stall));

    reg_file reg_file_instance (.clk(clk), .rst(rst), .wr_en(), .pc_wr(~should_decode_stall),
        .rd_addr1(reg_file_addr1), .rd_addr2(reg_file_addr2),
        .wr_addr(), .wr_data(), .pc_next(npc_from_fetch), 
        .rd_data1(reg_file_data1), .rd_data2(reg_file_data2), .pc(pc_in_fetch));

    always @(clk, rst) begin
        
    end
    
endmodule