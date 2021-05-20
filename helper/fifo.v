module fifo (
    input en, clk, rst,
    input [40:0] data_in,
    output reg [40:0] data_out
);

    always @(posedge clk) begin
        if(rst == 1'b1)
            data_out <= 41'd0;
        else begin
            if(en == 1'b1)
                data_out <= data_in;
            else
                data_out <= 41'd0; 
        end
    end
    
endmodule