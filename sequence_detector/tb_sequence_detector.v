
module tb_sequence_detector;

    reg clk;
    reg rst;
    reg serial_in;
    wire detected;

    integer detections;

    sequence_detector dut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .detected(detected)
    );

    always #5 clk = ~clk;

    task send_bit;
        input bit_value;
        begin
            @(negedge clk);
            serial_in = bit_value;

            @(posedge clk);
            #1;

            if (detected) begin
                detections = detections + 1;
                $display("Sequence detected at time %0t", $time);
            end
        end
    endtask

    initial begin
        clk        = 0;
        rst        = 1;
        serial_in  = 0;
        detections = 0;

        repeat (2) @(negedge clk);
        rst = 0;

        // Stream: 1 0 1 1 0 1 1
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1); // Detection 1
        send_bit(0);
        send_bit(1);
        send_bit(1); // Detection 2

        if (detections != 2)
            $fatal(1, "FAIL: Expected 2 detections, got %0d",
                   detections);

        $display("PASS: Sequence detector test completed");
        $finish;
    end

endmodule
