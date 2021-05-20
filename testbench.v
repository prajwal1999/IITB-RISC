module testbench ();
    
    reg clk, rst;
    always #25 clk = ~clk;

    processor processor_instance(.clk(clk), .rst(rst));

    initial begin
        $dumpfile("proc.vcd");
        $dumpvars(0, testbench);

        #0 clk = 1'b0; rst = 1'b1;
        #30 rst = 1'b0;

        #500 $finish;
    end

endmodule