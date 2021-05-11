module fifo (
    input en, clk,
    input [40:0] data_in,
    output [40:0] data_out
);

always @(posedge clk) begin
    if(en == 1'b1)
        data_out <= data_in;
end
    
endmodule