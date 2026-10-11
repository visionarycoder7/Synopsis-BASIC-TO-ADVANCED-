
`timescale 1ns/1ps

module tb_up_down_counter;

    reg clk;
    reg rst;
    reg up_down;
    wire [3:0] count;

    integer errors;

    up_down_counter uut (
        .clk(clk),
        .rst(rst),
        .up_down(up_down),
        .count(count)
    );

    always #5 clk = ~clk;

    task check_count;
        input [3:0] expected;
        begin
            @(posedge clk);
            #1;
            if (count !== expected) begin
                $display("FAIL: Expected=%0d Got=%0d",
                         expected, count);
                errors = errors + 1;
            end
            else begin
                $display("PASS: count=%0d", count);
            end
        end
    endtask

    initial begin
        clk = 0;
        rst = 1;
        up_down = 1;
        errors = 0;

        check_count(4'd0);

        rst = 0;
        check_count(4'd1);
        check_count(4'd2);
        check_count(4'd3);

        // Count downward
        up_down = 0;
        check_count(4'd2);
        check_count(4'd1);
        check_count(4'd0);
        check_count(4'd15); // Underflow wraparound

        // Test synchronous reset
        rst = 1;
        check_count(4'd0);

        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("FAILED TESTS: %0d", errors);

        $finish;
    end

endmodule
