module top_counter(
    input clk, reset, up,
    output [7:0] leds,
    output [6:0] seg,
    output [7:0] an   // anode control for 8 digits
);
    wire tick;
    wire [7:0] q;
    reg [3:0] digit;
    reg [2:0] digit_sel;

    // slow clock pulse generator (1 Hz approx)
    clock_divider #(.DIV(100_000_000)) u_div (
        .clk(clk),
        .reset(reset),
        .tick(tick)
    );

    // up/down counter
    updown_counter_8bit u_cnt (
        .clk(tick),
        .reset(reset),
        .up(up),
        .en(1'b1),      // count only when tick=1
        .q(q)
    );

    assign leds = q;  // LEDs show binary count directly

    //--------------------------------
    // 7-segment multiplexing
    //--------------------------------
    // refresh clock ~1kHz for digit switching
    wire refresh_clk;
    clock_divider #(.DIV(100_000)) u_ref (
        .clk(clk),
        .reset(reset),
        .tick(refresh_clk)
    );

    always @(posedge refresh_clk or posedge reset) begin
        if (reset)
            digit_sel <= 0;
        else
            digit_sel <= digit_sel + 1;
    end

    // select which 4-bit to show
    always @(*) begin
        case(digit_sel)
            3'b000: digit = q[3:0];  // lower nibble
            3'b001: digit = q[7:4];  // upper nibble
            default: digit = 4'hF;   // blank
        endcase
    end

    // enable only the active digit anode
    assign an = (digit_sel == 3'b000) ? 8'b11111110 :
                (digit_sel == 3'b001) ? 8'b11111101 :
                                        8'b11111111;

    // hex decoder
    hex_to_7seg u_dec (
        .bin(digit),
        .seg(seg)
    );

endmodule
