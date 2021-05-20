module controller (
    input clk, rst,
    input [1:0] new_psr,
    output reg curr_psr
);
    
    reg [1:0] psr; // C, Z

    always @(rst) begin
        psr = {2'b00};
    end

    always @(posedge clk) begin
        
    end
 
endmodule