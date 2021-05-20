module fifo (
    input en, clk, rst,
    input [40:0] data_in,
    output reg [40:0] data_out
);

reg [40:0] temp_data;
assign data_out = temp_data;

    always @(posedge clk) begin
        if(rst == 1'b1)
            temp_data <= 41'd0;
        else begin
            if(en == 1'b1)
                temp_data <= data_in;
            else
                temp_data <= 41'd0; 
        end
    end
    
endmodule