`timescale 1ns/1ps

module tb_priority_encoder_4to2;

    reg  [3:0] in;
    wire [1:0] code;
    wire       valid;

    priority_encoder_4to2 uut (
        .in(in),
        .code(code),
        .valid(valid)
    );

    initial begin
        $display("========================================");
        $display("   4-to-2 PRIORITY ENCODER TESTBENCH");
        $display("========================================");
        $display(" INPUT    CODE    VALID");

        in = 4'b0000; #10;
        $display(" %b      %b       %b", in, code, valid);

        in = 4'b0001; #10;
        $display(" %b      %b       %b", in, code, valid);

        in = 4'b0010; #10;
        $display(" %b      %b       %b", in, code, valid);

        in = 4'b0100; #10;
        $display(" %b      %b       %b", in, code, valid);

        in = 4'b1000; #10;
        $display(" %b      %b       %b", in, code, valid);

        // Multiple inputs active
        in = 4'b0011; #10;
        $display(" %b      %b       %b", in, code, valid);

        in = 4'b0111; #10;
        $display(" %b      %b       %b", in, code, valid);

        in = 4'b1111; #10;
        $display(" %b      %b       %b", in, code, valid);

        $display("========================================");
        $display("Simulation Completed");
        $finish;
    end

endmodule
