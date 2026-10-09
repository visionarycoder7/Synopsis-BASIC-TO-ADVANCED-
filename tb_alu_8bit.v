
`timescale 1ns/1ps

module tb_alu_8bit;

    reg  [7:0] A, B;
    reg  [2:0] sel;
    wire [7:0] Y;
    wire carry, zero;

    integer i;
    integer errors;

    alu_8bit uut (
        .A(A),
        .B(B),
        .sel(sel),
        .Y(Y),
        .carry(carry),
        .zero(zero)
    );

    initial begin
        errors = 0;
        A = 8'd10;
        B = 8'd5;

        $display("8-bit ALU Verification");
        $display("A=%0d, B=%0d", A, B);

        for (i = 0; i < 8; i = i + 1) begin
            sel = i;
            #10;

            case (sel)
                3'b000: if ({carry, Y} !== 9'd15)
                            errors = errors + 1;
                3'b001: if (Y !== 8'd5)
                            errors = errors + 1;
                3'b010: if (Y !== 8'd0)
                            errors = errors + 1;
                3'b011: if (Y !== 8'd15)
                            errors = errors + 1;
                3'b100: if (Y !== 8'd15)
                            errors = errors + 1;
                3'b101: if (Y !== 8'hF5)
                            errors = errors + 1;
                3'b110: if (Y !== 8'd20)
                            errors = errors + 1;
                3'b111: if (Y !== 8'd5)
                            errors = errors + 1;
            endcase

            $display("sel=%b A=%0d B=%0d Y=%0d carry=%b zero=%b",
                     sel, A, B, Y, carry, zero);
        end

        if (errors == 0)
            $display("PASS: All 8 operation tests passed!");
        else
            $display("FAIL: %0d test(s) failed.", errors);

        $finish;
    end

endmodule
