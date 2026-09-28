`timescale 1ns/1ps

module tb_full_adder;

    reg a, b, cin;
    wire sum, cout;
    integer i;

    // Instantiate Unit Under Test (UUT)
    full_adder uut (
        .A(a),
        .B(b),
        .Cin(cin),
        .Sum(sum),
        .Cout(cout)
    );

    initial begin
        $display("------------------------------------------------");
        $display(" TIME | A B CIN | SUM COUT | STATUS");
        $display("------------------------------------------------");

        // Test all 8 possible input combinations
        for (i = 0; i < 8; i = i + 1) begin

            {a, b, cin} = i[2:0];

            #10;

            // Self-checking verification
            if ({cout, sum} == (a + b + cin))
                $display("%4t | %b %b  %b  |  %b    %b   | PASS",
                         $time, a, b, cin, sum, cout);
            else
                $display("%4t | %b %b  %b  |  %b    %b   | FAIL",
                         $time, a, b, cin, sum, cout);

        end

        $display("------------------------------------------------");
        $finish;
    end

endmodule
