
`timescale 1ns/1ps

module tb_mux4to1;

    reg  [3:0] d;
    reg  [1:0] sel;
    wire       y;

    integer i, j;
    integer tests;

    mux4to1 uut (
        .d(d),
        .sel(sel),
        .y(y)
    );

    initial begin
        tests = 0;

        $display("4-to-1 MUX Verification");
        $display("-----------------------");

        for (i = 0; i < 16; i = i + 1) begin
            d = i;

            for (j = 0; j < 4; j = j + 1) begin
                sel = j;
                #10;

                if (y !== d[sel]) begin
                    $display(
                        "FAIL: d=%b sel=%b y=%b",
                        d, sel, y
                    );
                    $fatal(1, "Test failed");
                end

                tests = tests + 1;
            end
        end

        $display("-----------------------");
        $display("All %0d tests passed!", tests);
        $finish;
    end

endmodule
