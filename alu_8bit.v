
module alu_8bit (
    input  wire [7:0] A,
    input  wire [7:0] B,
    input  wire [2:0] sel,
    output reg  [7:0] Y,
    output reg        carry,
    output wire       zero
);

always @(*) begin
    Y     = 8'b0;
    carry = 1'b0;

    case (sel)
        3'b000: {carry, Y} = {1'b0, A} + {1'b0, B};
        3'b001: Y = A - B;
        3'b010: Y = A & B;
        3'b011: Y = A | B;
        3'b100: Y = A ^ B;
        3'b101: Y = ~A;
        3'b110: Y = A << 1;
        3'b111: Y = A >> 1;
        default: Y = 8'b0;
    endcase
end

assign zero = (Y == 8'b0);

endmodule
