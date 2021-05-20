module fifo (
    input en, clk,
    input [40:0] data_in,
    output [40:0] data_out
);

reg [40:0] temp_data;
assign data_out = temp_data;

always @(posedge clk) begin
    if(en == 1'b1)
        temp_data <= data_in;
end
    
endmodule