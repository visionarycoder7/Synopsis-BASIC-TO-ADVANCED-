// 4-to-2 Priority Encoder
module priority_encoder_4to2 (
    input  wire [3:0] in,
    output reg  [1:0] code,
    output reg        valid
);

always @(*) begin
    valid = 1'b1;

    casez (in)
        4'b1???: code = 2'b11; // D3 highest priority
        4'b01??: code = 2'b10; // D2
        4'b001?: code = 2'b01; // D1
        4'b0001: code = 2'b00; // D0 lowest priority

        default: begin
            code  = 2'b00;
            valid = 1'b0;
        end
    endcase
end

endmodule
