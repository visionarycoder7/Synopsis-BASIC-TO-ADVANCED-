
module sequence_detector (
    input  wire clk,
    input  wire rst,
    input  wire serial_in,
    output reg  detected
);

    reg [2:0] state;

    localparam S0 = 3'd0;  // No match
    localparam S1 = 3'd1;  // Matched 1
    localparam S2 = 3'd2;  // Matched 10
    localparam S3 = 3'd3;  // Matched 101
    localparam S4 = 3'd4;  // Matched 1011

    always @(posedge clk) begin
        if (rst) begin
            state    <= S0;
            detected <= 1'b0;
        end
        else begin
            detected <= 1'b0;

            case (state)
                S0: begin
                    if (serial_in)
                        state <= S1;
                    else
                        state <= S0;
                end

                S1: begin
                    if (serial_in)
                        state <= S1;
                    else
                        state <= S2;
                end

                S2: begin
                    if (serial_in)
                        state <= S3;
                    else
                        state <= S0;
                end

                S3: begin
                    if (serial_in) begin
                        state    <= S4;
                        detected <= 1'b1;
                    end
                    else
                        state <= S2;
                end

                S4: begin
                    if (serial_in)
                        state <= S1;
                    else
                        state <= S2;
                end

                default: begin
                    state    <= S0;
                    detected <= 1'b0;
                end
            endcase
        end
    end

endmodule
