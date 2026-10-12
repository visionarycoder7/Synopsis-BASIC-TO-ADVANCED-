
module tb_siso_shift_register;

    reg clk;
    reg rst;
    reg serial_in;
    wire serial_out;

    siso_shift_register dut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        serial_in = 0;

        @(posedge clk);
        #1;
        if (serial_out !== 1'b0)
            $fatal(1, "Reset test failed");

        rst = 0;

        // Shift in 1, 0, 1, 1
        serial_in = 1;
        @(posedge clk); #1;
        serial_in = 0;
        @(posedge clk); #1;
        serial_in = 1;
        @(posedge clk); #1;
        serial_in = 1;
        @(posedge clk); #1;

        // After four shifts, the first input bit reaches the output.
        if (serial_out !== 1'b1)
            $fatal(1, "Serial output test failed");

        $display("PASS: SISO shift register test completed");
        $finish;
    end

endmodule
