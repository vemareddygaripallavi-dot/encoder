// encoder_4to2.v
// Assumes at most one input bit is high (one-hot).
module encoder(
    input  wire [3:0] in,   // one-hot inputs: in[0] -> code 00, in[1] -> 01, ...
    output reg  [1:0] out,
    output wire       valid // high if any input is asserted
);
    assign valid = |in;

    always @(*) begin
        case (in)
            4'b0001: out = 2'b00;
            4'b0010: out = 2'b01;
            4'b0100: out = 2'b10;
            4'b1000: out = 2'b11;
            default: out = 2'b00; // default when no input or multiple inputs. Use with care.
        endcase
    end
endmodule
